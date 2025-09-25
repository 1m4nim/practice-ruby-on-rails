require_relative "boot"

require "rails/all"

# Bundlerを使って、Gemfileに記載されたGemを読み込みます。
# 環境によって設定が異なるため、config/application.rbでrequireされています。
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
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # タイムゾーン設定の追加/修正部分
    
    # ユーザーインターフェースやログなどで表示されるタイムゾーンを日本時間（JST）に設定
    config.time_zone = "Tokyo"
    
    # Active Record（データベースとのやり取り）で、時間データをUTC（協定世界時）として保存するように設定
    # Railsの推奨設定であり、世界中どのサーバーで動かしても時間が狂わないようにするために重要です。
    config.active_record.default_timezone = :utc 

  end
end