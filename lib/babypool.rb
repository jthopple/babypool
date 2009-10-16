require "thread"
require "timeout"

# Babypool implements a simple thread pool.
# 
# == Options
# * :thread_count - The number of threads in the pool.  Each thread has its own worker listening for jobs.
# * :execution_limit - This specifies how long the worker should attempt to complete its job.  The job is terminated when it reaches this limt

class Babypool
  attr_reader :queue, :busy_threads, :execution_limit

  # Constructs a Babypool object and initializes the pool of workers
  def initialize(options={})
    @draining = false
    @queue = Queue.new
    @busy_threads = Queue.new
    @execution_limit = options[:execution_limit] || 120
    @thread_count = options[:thread_count] || 10
    @verbose = options[:verbose] || false
  
    @threads = Array.new(@thread_count){ Thread.new{ Worker.new(self) } }
  end

  # Accepts work items, or jobs, as blocks and adds them to the queue.
  def work(*args,&block)
    if (@draining)
      raise "Pool is shutting down and not accepting more work"
    end
  
    @queue << [ args, block ]
  end

  # Returns true if the pool is still busy handling items, false otherwise.
  def busy?
    puts "Busy Check (items in queue: #{@queue.size}, busy threads: #{@busy_threads.size})" if @verbose
    !@queue.empty? || !@busy_threads.empty?
  end

  # Sends a message to each thread telling it to exit, puts the pool in "draining" mode so that it does not accept any more work, and 
  # then waits for each thread to complete.
  def drain
    puts "Draining the pool..." if @verbose
    @threads.each{ work{ Thread.exit } }
    @draining = true
    @threads.each{ |t| t.join }
    puts "Pool Drained." if @verbose
  end

  # Implements a worker object that listens for work until it is told to exit.
  class Worker
    
    # Initializes a worker for a given pool.
    def initialize(pool)
      puts "#{self.to_s} Initialized" if @verbose
      loop do
        # Listen for work on the pool's queue. If the queue is empty, the calling thread is suspended until data is pushed onto the queue.
        args,block = pool.queue.deq
        
        # Punch in - add a marker to the busy_thread queue indicating that we're working
        pool.busy_threads.push(:marker) 
        
        # Do the work by calling the block.
        begin
          Timeout::timeout(pool.execution_limit){ block.call(*args) }
        rescue Timeout::Error => e
          puts "#{self.to_s} - Worker timed out." if @verbose
        end
        
        # Punch out - Remove our marker indicating we're finished and idle. Do not suspend if busy_threads queue is empty (the "true" passed in).
        pool.busy_threads.pop(true)
      end
    end
  end
end