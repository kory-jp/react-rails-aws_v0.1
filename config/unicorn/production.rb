#ワーカーの数
$worker  = 2
#ワーカーの削除時間
  $timeout = 30
#自分のアプリケーションディレクトリ(例)
  $app_dir = "/var/www/react-rails-aws_v0.1/current"
#sockのディレクトリ
  $listen  = File.expand_path 'tmp/unicorn.sock', $app_dir
#PIDのディレクトリ
  $pid     = File.expand_path 'tmp/unicorn.pid', $app_dir
#エラーログ
  $std_log = File.expand_path 'log/unicorn.log', $app_dir

  worker_processes  $worker
  working_directory $app_dir
  stderr_path $std_log
  stdout_path $std_log
  timeout $timeout
  listen  $listen
  pid $pid

#fork前
  before_fork do |server, worker|
    defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!
    old_pid = "#{server.config[:pid]}.oldbin"
    if old_pid != server.pid
      begin
        Process.kill "QUIT", File.read(old_pid).to_i
      rescue Errno::ENOENT, Errno::ESRCH
      end
    end
  end

#fork後
  after_fork do |server, worker|
    defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
  end
