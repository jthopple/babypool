require 'test/test_helper'
 
class TestBabypool < Test::Unit::TestCase  
  should "setup a pool and do some work" do
    pool = Babypool.new(:thread_count => 10, :execution_limit => 2)

    completed = 0
    20.times do |job|
      pool.work(job) do
        completed += 1
      end
    end

    pool.drain    
    
    assert_equal completed, 20
  end
  
  should "only finish jobs that take less than 2 seconds" do
    pool = Babypool.new(:thread_count => 10, :execution_limit => 1)

    completed = 0
    
    # Try 20 jobs, but even jobs should timeout because they take longer than 2 seconds.  10 should complete
    20.times do |job|
      pool.work(job) do
        sleep(2) if job % 2 == 0
        completed += 1
      end
    end

    pool.drain    
    
    assert_equal completed, 10
  end
  
  should "have been busy while work was being done" do
    pool = Babypool.new(:thread_count => 10)
    completed = 0
    was_busy = false
    
    # Do 10 jobs, each should sleep for a few seconds allowing busy? to return true
    10.times{ |job| pool.work(job){ sleep(1) } }
    
    was_busy = pool.busy?
    pool.drain    
    assert was_busy
  end
  
  should "have been done by the time we checked if it was busy" do
    pool = Babypool.new(:thread_count => 10)
    completed = 0
    was_busy = false
    
    # Do 10 jobs, each should sleep for a few seconds allowing busy? to return true
    10.times{ |job| pool.work(job){ completed += 1 } }
    
    # Sleep for a second to let the jobs finish
    sleep(1)
    was_busy = pool.busy?
    
    pool.drain    
    assert !was_busy
  end
end