# Set up gems listed in the Gemfile.
ENV["BUNDLE_GEMFILE"] ||= File.expand_path("../../Gemfile", __dir__)

require "bundler/setup"
begin
  # 環境変数で BOOTSNAP_SKIP=1 が設定されている場合、Bootsnapをスキップします。
  # そうでない場合は、Bootsnapを通常通りロードします。
  require "bootsnap/setup" unless ENV["BOOTSNAP_SKIP"]
rescue LoadError => e
  # ここで、Bootsnapが見つからなかった場合（LoadError）にのみ、エラーを出力します。
  raise unless e.message.include?("bootsnap/setup")
end
