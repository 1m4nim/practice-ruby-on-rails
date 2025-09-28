require_relative "boot"

require "rails/all"

# Bundlerを使って、Gemfileに記載されたGemを読み込みます。
# You require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MyBlogApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `migrations`, and `generators`.
    config.autoload_lib(ignore: %w(assets tasks))

    # Configuration for the application, engines, and railties goes here.
    
    # ユーザーインターフェースやログなどで表示されるタイムゾーンを日本時間（JST）に設定
    config.time_zone = "Tokyo"
    
    # Active Record（データベースとのやり取り）で、時間データをUTC（協定世界時）として保存するように設定
    config.active_record.default_timezone = :utc 

    # ===============================================================
    # 【最終修正】Deviseエラー回避のため、ロード完了後に設定を強制実行
    # config/initializers/devise.rb や config/environments/development.rb 
    # からの設定をすべてここに移動しました。
    # ===============================================================
    config.after_initialize do
      # Devise Gemがロードされていることを確認してから設定を実行
      if defined?(Devise)
        Devise.setup do |config|
          # ==> Mailer Configuration
          # Configure the e-mail address which will be shown in Devise::Mailer.
          config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'

          # ==> Configuration for the Rails env
          # In this file you can configure for a specific environment.
          # For example:
          # config.confirm_within = 7.days

          # ==> Controller Configuration
          # Configure the parent class to use for controllers.
          # config.parent_controller = 'ApplicationController'

          # ==> ORM configuration
          # Configure an ORM.
          require 'devise/orm/active_record'

          # ==> Configuration for :database_authenticatable
          # For bcrypt
          # config.stretches = Rails.env.test? ? 1 : 12

          # ==> Configuration for :rememberable
          # config.remember_for = 2.weeks
          # config.extend_remember_period = false
          # config.expire_all_remember_me_on_sign_out = true

          # ==> Configuration for :validatable
          # config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
          
        end
      end
    end
    
  end
end