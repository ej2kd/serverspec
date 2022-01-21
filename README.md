# Serverspec
Railsアプリのインフラテストを行う
# Usage
## インストール
```bash
$ gem install serverspec
$ bundle init
```
## `Gemfile`に以下を追記
```ruby
gem "serverspec"
gem "rake"
```
## インストールの実行
```bash
$ bundle install
```
## 初期フォルダの作成
```bash
$ serverspec-init
```
## テストの実行
```bash
$ bundle exec rake spec
```

# テスト項目
    * ポート開放の確認： SSH, HTTP
    * パッケージのインストール
    * Nginxの起動状況確認
    * アプリとの通信を確認