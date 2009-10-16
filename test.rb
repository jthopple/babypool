require "lib/babypool"

pool = BabyPool.new(:thread_count => 10, :execution_limit => 20)

(0..20).each do |job|
  pool.work(job) do
    puts "Running job #{job}."
  end
end

pool.drain