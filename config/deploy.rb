# capistranoのバージョン
lock '3.16.0'

# アプリケーション名
set :application, 'react-rails-aws_v0.1'

# gitリポジトリ
set :repo_url, 'git@github.com:kory-jp/react-rails-aws_v0.1.git'

# deployするブランチ
set :branch, 'main'

# deploy先のディレクトリ(例)。
set :deploy_to, '/var/www/react-rails-aws_v0.1'

# シンボリックリンクファイル。
# set :linked_files, fetch(:linked_files, []).push('config/application.yml')

# シンボリックリンクフォルダ。
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# 保持するバージョン数
set :keep_releases, 5

# rubyのバージョン(例)
set :rbenv_ruby, '3.0.0'

#出力するログのレベル。
set :log_level, :debug

# コネクション継続
set :ssh_options, :keepalive => true

# Deployタスク
namespace :deploy do
  desc 'Restart application'
  task :restart do
    invoke 'unicorn:restart'
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
    end
  end
end