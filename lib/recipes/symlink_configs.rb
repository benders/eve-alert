after "deploy:finalize_update", "deploy:symlink_configs"

namespace(:deploy) do  
  task :symlink_configs, :roles => :app, :except => {:no_symlink => true} do
    run <<-CMD
      ln -nfs #{shared_path}/config/database.yml #{latest_release}/config/database.yml &&
      ln -nfs #{shared_path}/config/twitter_auth.yml #{latest_release}/config/twitter_auth.yml &&
      ln -nfs #{shared_path}/config/initializers/twitter_account.rb #{latest_release}/config/initializers/twitter_account.rb &&
      ln -nfs #{shared_path}/db/production.sqlite3 #{latest_release}/db/production.sqlite3 &&
      echo
    CMD
  end
end
