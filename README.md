Hanaguri Silver Softball Club
====
https://hanaguri-silver.herokuapp.com/

![hanagurisilver_top](https://user-images.githubusercontent.com/17737460/38777285-5bd9a650-40e0-11e8-986e-a84c887a8bb7.png)

## Description
[masarusan24](https://github.com/masarusan24) が所属しているソフトボールチーム「花栗シルバーソフト」のWebサイトです。  
ソフトボールの試合をしながら、スマホやタブレットでリアルタイムにスコアを付けることが出来ます。

## Requirement
- Ruby 2.4.1
- Rails 5.1.5
- PostgreSQL 10.1
- Bootstrap 3

## Function
- チームのCRUD処理
- 管理者ユーザのCRUD処理
- 選手のCRUD処理
- 試合結果のCRUD処理
- 試合結果をチーム成績へ自動集計
- ロール管理機能
- お問い合わせ機能

## Comming Soon
- スタメン登録
- 打撃成績のCRUD機能
- 投手成績のCRUD機能
- 選手の個人成績自動反映

## Authorization
権限周りの機能は ```banken gem``` を使用しています。
- チーム・選手・管理者ユーザのCRUD処理
  - Administrator権限のみ
- 試合のスコアCRUD処理
  - 一般管理者権限以上

## ER Diagram
![er](https://user-images.githubusercontent.com/17737460/39313493-17b472ea-49ad-11e8-8a02-1c53dede3dfc.png)

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
