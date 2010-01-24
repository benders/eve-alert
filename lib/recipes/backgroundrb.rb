before "deploy:stop", "backgroundrb:stop"
after "deploy:start", "backgroundrb:start"
after "deploy:restart", "backgroundrb:restart"

namespace(:backgroundrb) do
  task :start, :roles => :app do
     run <<-CMD
       cd #{current_path} &&
       RAILS_ENV=#{rails_env} #{ruby} ./script/backgroundrb start
     CMD
  end

  task :stop, :roles => :app do
     run <<-CMD
       cd #{current_path} &&
       RAILS_ENV=#{rails_env} #{ruby} ./script/backgroundrb stop
     CMD
  end

  task :restart, :roles => :app do
    stop
    sleep 5
    start
  end
end
