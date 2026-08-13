# README
このプロジェクトは、Rails 8 アプリケーション（HbRails）です。
アプリケーションを立ち上げるための手順や構成は以下の通りです。

## 必要要件
* Ruby version: 3.4.5 (rbenvで管理)
* System dependencies:
  * Node.js / npm
  * MySQL / MariaDB クライアントライブラリ(libmysqlclient-dev)

## セットアップ手順（開発環境構築）
### 1. 依存関係のインストール
```bash
bundle install
```

### 2.データベースの作成とマイグレーションの実行
```bash
bin/rails db:migrate
```

## テストの実行
```bash
bin/rails test
```

## サービス・ツール
Webサーバー: Puma
アセット管理: Tailwind CSS (bin/dev でビルド)

## デプロイ
Kamal を使用したデプロイ用に構成されています (config/deploy.yml)。

## アプリケーションの起動
Dockerコンテナ内で起動する場合は、以下を実行してください。
```bash
bin/dev -b 0.0.0.0
```

### bin/dev を使用する理由
このコマンドは `Procfile.dev` を読み込み、RailsのWebサーバープロセスと、Tailwind CSSなどのアセットビルド（監視モード）プロセスを同時に立ち上げます。これにより、開発中にCSSやJSを修正した際、ブラウザをリロードするだけで変更が即座に反映されます。

### なぜ bin/rails s ではなく bin/dev なのか？
* **bin/rails s**: RailsのWebサーバーだけを起動します。そのため、別途CSSのビルドプロセスを立ち上げないと、CSSの変更が反映されません。
* **bin/dev**: `Foreman` というツールを使用して、Webサーバーとビルドプロセスの両方を並行して動かしてくれます。開発時はこのコマンドを一つ叩くだけで準備が完了するため非常に便利です。