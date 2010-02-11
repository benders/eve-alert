require 'digest/sha1'

# DO NOT MODIFY THIS FILE

module Bundler
  module SharedHelpers

    def reverse_rubygems_kernel_mixin
      require "rubygems"

      # Disable rubygems' gem activation system
      ::Kernel.class_eval do
        if private_method_defined?(:gem_original_require)
          alias rubygems_require require
          alias require gem_original_require
        end

        undef gem
      end
    end

    def default_gemfile
      gemfile = find_gemfile
      gemfile or raise GemfileNotFound, "The default Gemfile was not found"
      Pathname.new(gemfile)
    end

    def in_bundle?
      find_gemfile
    end

  private

    def find_gemfile
      return ENV['BUNDLE_GEMFILE'] if ENV['BUNDLE_GEMFILE']

      previous = nil
      current  = File.expand_path(Dir.pwd)

      until !File.directory?(current) || current == previous
        filename = File.join(current, 'Gemfile')
        return filename if File.file?(filename)
        current, previous = File.expand_path("#{current}/.."), current
      end
    end

    extend self
  end
end

module Bundler
  extend SharedHelpers

  reverse_rubygems_kernel_mixin

  FINGERPRINT = "5ec021dce341c9260293e8304da32fff549ecc86"
  LOAD_PATHS = ["/Users/xac/swx/eve-alert.rails_3/gems/gems/packet-0.1.15/lib", "/Users/xac/swx/eve-alert.rails_3/gems/gems/text-hyphen-1.0.0/lib", "/Users/xac/swx/eve-alert.rails_3/gems/gems/hpricot-0.8.2/lib", "/Users/xac/swx/eve-alert.rails_3/gems/gems/builder-2.1.2/lib", "/Users/xac/swx/eve-alert.rails_3/gems/gems/json_pure-1.2.0/lib", "/Users/xac/swx/eve-alert.rails_3/gems/gems/i18n-0.3.3/lib", "/Users/xac/swx/eve-alert.rails_3/gems/gems/bundler-0.9.4/lib", "/Users/xac/swx/eve-alert.rails_3/gems/gems/arel-0.2.1/lib", "/Users/xac/swx/eve-alert.rails_3/gems/gems/json-1.2.0/ext/json/ext", "/Users/xac/swx/eve-alert.rails_3/gems/gems/json-1.2.0/ext", "/Users/xac/swx/eve-alert.rails_3/gems/gems/json-1.2.0/lib", "/Users/xac/swx/eve-alert.rails_3/gems/bundler/gems/reve-3cf6435111a646ecc0cd7466f1a789847c6edca3-3a8f586e500a21cadcf7151101b4f9c971aa6a5d/lib", "/Users/xac/swx/eve-alert.rails_3/gems/gems/activemodel-3.0.0.beta/lib", "/Users/xac/swx/eve-alert.rails_3/gems/gems/rubyforge-2.0.3/lib", "/Users/xac/swx/eve-alert.rails_3/gems/gems/crack-0.1.6/lib", "/Users/xac/swx/eve-alert.rails_3/gems/gems/ruby-hmac-0.4.0/lib", "/Users/xac/swx/eve-alert.rails_3/gems/gems/mime-types-1.16/lib", "/Users/xac/swx/eve-alert.rails_3/gems/gems/mail-2.1.2/lib", "/Users/xac/swx/eve-alert.rails_3/gems/gems/abstract-1.0.0/lib", "/Users/xac/swx/eve-alert.rails_3/gems/gems/erubis-2.6.5/lib", "/Users/xac/swx/eve-alert.rails_3/gems/gems/hashie-0.1.8/lib", "/Users/xac/swx/eve-alert.rails_3/gems/gems/oauth-0.3.6/lib", "/Users/xac/swx/eve-alert.rails_3/gems/gems/thor-0.13.0/lib", "/Users/xac/swx/eve-alert.rails_3/gems/gems/ezcrypto-0.7.2/lib", "/Users/xac/swx/eve-alert.rails_3/gems/gems/mysql-2.8.1/lib", "/Users/xac/swx/eve-alert.rails_3/gems/gems/mysql-2.8.1/ext", "/Users/xac/swx/eve-alert.rails_3/gems/gems/twitter-auth-0.1.22/lib", "/Users/xac/swx/eve-alert.rails_3/gems/gems/sqlite3-ruby-1.2.5/lib", "/Users/xac/swx/eve-alert.rails_3/gems/gems/sqlite3-ruby-1.2.5/ext", "/Users/xac/swx/eve-alert.rails_3/gems/gems/rake-0.8.7/lib", "/Users/xac/swx/eve-alert.rails_3/gems/gems/gemcutter-0.3.0/lib", "/Users/xac/swx/eve-alert.rails_3/gems/gems/hoe-2.5.0/lib", "/Users/xac/swx/eve-alert.rails_3/gems/gems/chronic-0.2.3/lib", "/Users/xac/swx/eve-alert.rails_3/gems/gems/railties-3.0.0.beta/lib", "/Users/xac/swx/eve-alert.rails_3/gems/gems/memcache-client-1.7.8/lib", "/Users/xac/swx/eve-alert.rails_3/gems/gems/rack-1.1.0/lib", "/Users/xac/swx/eve-alert.rails_3/gems/gems/rack-test-0.5.3/lib", "/Users/xac/swx/eve-alert.rails_3/gems/gems/rack-mount-0.4.7/lib", "/Users/xac/swx/eve-alert.rails_3/gems/gems/actionpack-3.0.0.beta/lib", "/Users/xac/swx/eve-alert.rails_3/gems/gems/text-format-1.0.0/lib", "/Users/xac/swx/eve-alert.rails_3/gems/gems/actionmailer-3.0.0.beta/lib", "/Users/xac/swx/eve-alert.rails_3/gems/gems/activerecord-3.0.0.beta/lib", "/Users/xac/swx/eve-alert.rails_3/gems/gems/httparty-0.4.5/lib", "/Users/xac/swx/eve-alert.rails_3/gems/gems/twitter-0.8.3/lib", "/Users/xac/swx/eve-alert.rails_3/gems/gems/tzinfo-0.3.16/lib", "/Users/xac/swx/eve-alert.rails_3/gems/gems/activesupport-3.0.0.beta/lib", "/Users/xac/swx/eve-alert.rails_3/gems/gems/activeresource-3.0.0.beta/lib", "/Users/xac/swx/eve-alert.rails_3/gems/gems/rails-3.0.0.beta/"]
  AUTOREQUIRES = {:default=>["rails", "reve", "sqlite3-ruby", "twitter-auth", "json", "chronic", "packet", "twitter", "mysql"]}

  def self.match_fingerprint
    print = Digest::SHA1.hexdigest(File.read(File.expand_path('../../Gemfile', __FILE__)))
    unless print == FINGERPRINT
      abort 'Gemfile changed since you last locked. Please `bundle lock` to relock.'
    end
  end

  def self.setup(*groups)
    match_fingerprint
    LOAD_PATHS.each { |path| $LOAD_PATH.unshift path }
  end

  def self.require(*groups)
    groups = [:default] if groups.empty?
    groups.each do |group|
      (AUTOREQUIRES[group] || []).each { |file| Kernel.require file }
    end
  end

  # Setup bundle when it's required.
  setup
end
