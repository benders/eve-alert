# From http://gist.github.com/244420

namespace :bundler do
  task :install, :roles => :app, :except => { :no_release => true }  do
    run("#{ruby} -S gem install bundler --source=http://gemcutter.org")
  end

  task :symlink_vendor, :roles => :app, :except => { :no_release => true } do
    shared_gems = File.join(shared_path, 'gems/ruby/1.8')
    release_gems = "#{release_path}/gems/ruby/1.8"
    # if you don't commit your cache, add cache to this list
    %w(gems specifications).each do |sub_dir|
      shared_sub_dir = File.join(shared_gems, sub_dir)
      run("mkdir -p #{shared_sub_dir} && mkdir -p #{release_gems} && ln -s #{shared_sub_dir} #{release_gems}/#{sub_dir}")
    end
  end

  task :bundle_new_release, :roles => :app, :except => { :no_release => true }  do
    # bundler.symlink_vendor
    # if you don't commit your cache, remove --cached from this line
    run("cd #{release_path} && #{ruby} -S gem bundle --only #{rails_env}")
  end
end

after 'deploy:update_code', 'bundler:bundle_new_release'