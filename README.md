Hanaguri Silver Softball Club
====

![hanagurisilver_top](https://user-images.githubusercontent.com/17737460/38777285-5bd9a650-40e0-11e8-986e-a84c887a8bb7.png)

## Description
[masarusan24](https://github.com/masarusan24) が所属しているソフトボールチーム「花栗シルバーソフト」のWebサイトです。
ソフトボールの試合する時に、リアルタイムでスコアを付けることが出来ます。

## Requirement
- Ruby 2.4.1
- Rails 5.1.5
- PostgreSQL 10.1

## Authorization
権限周りの機能は ```banken gem``` を使用しています。
- チーム・選手・管理者ユーザのCRUD処理
  - Administrator権限のみ
- 試合のスコアCRUD処理
  - 一般管理者権限以上

## Usage
このアプリケーションを動かす場合は、まずはリポジトリを手元にクローンしてください。

```
$ git clone git@github.com:masarusan24/hanaguri-silver.git
```

次に、以下のコマンドで必要になる Ruby Gems をインストールします。

```
$ bundle install
```

その後、データベースへのマイグレーションを実行します。

```
$ rails db:migrate
```

これで、Railsサーバーを立ち上げる準備が整っているはずです。

```
$ rails server
```

## Licence

[MIT](https://github.com/tcnksm/tool/blob/master/LICENCE)

## Author

[masarusan24](https://github.com/masarusan24)
