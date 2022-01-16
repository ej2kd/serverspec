require 'spec_helper'

# ポート開放の確認
describe port(22) do
  it { should be_listening }
end

describe port(80) do
  it { should be_listening }
end

# gitのインストール確認
describe package('git') do
  it { should be_installed }
end

# nodejsのインストール確認
describe package('nodejs') do
  it { should be_installed }
end

# mysqlのインストール確認
describe package('mysql') do
  it { should be_installed }
end

# Rubyのインストールに必要な各種パッケージのインストール確認
pkg_list = %w{gcc-c++ openssl-devel readline-devel zlib-devel yarn mysql-devel}
pkg_list.each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end

# Rubyのバージョン確認
describe command('ruby -v') do
  let(:disable_sudo) { true }
  its(:stdout) { should match /ruby 2\.6\.8/ }
end

# Railsのバージョン確認
describe command('rails -v') do
  let(:disable_sudo) { true }
  its(:stdout) { should match /Rails 6\.1\.4\.1/ }
end

# Nginxのインストール確認
describe package('nginx') do
  it { should be_installed }
end

# Nginxの起動確認
describe service('nginx') do
  it { should be_enabled }
  it { should be_running }
end

# 設定ファイルの存在確認
describe file('/etc/nginx/conf.d/rails.conf') do
  it { should exist }
end

# ソケット通信の確認
describe file('/var/www/rails/my-rails-shop-app/tmp/sockets/puma.sock') do
  it { should be_socket }
end
