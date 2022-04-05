# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# アプリケーション名

パーソナル食(Personal Food)

# アプリケーション概要

生活習慣病や健康の予防・改善をしたい方、食事療法をしている方向けのヘルスケアアプリです。
いつでも食の専門家である管理栄養士に直接食事相談や食生活の悩みなど相談できる機能があります。
また、自分の食生活やおすすめ商品、レシピなどを投稿して、同じ悩みがある人と繋がって情報交換をすることができます。

# 本番環境

## URL

https://personal-food.herokuapp.com/

## Basic認証

- ユーザー名：admin
- パスワード：5555

## テスト用アカウント

ユーザー1
- メールアドレス：user1@test.com
- パスワード：user01

ユーザー2
- メールアドレス：user2@test.com
- パスワード：user02

管理栄養士
- メールアドレス：eiyoushi@test.com
- パスワード：eiyou01


# 制作背景

私は管理栄養士として医療機関で主に患者さんに合った食事内容で病気を改善させるための栄養指導をしていました。
しかし、コロナ禍で医療機関に栄養相談に来る人が少なくなったため栄養指導件数も減っていました。
そのため、生活習慣病の発症や検査数値の悪化、食事療法の中断など食事について何かしら困っている人は多いのではないかと考えました。また、一人での食事療法は長期間続くことでストレスがかかったりモチベーションの低下に繋がるため、改善するキッカケが必要だと感じています。
そこでいつでも食事相談が簡単にでき、ユーザー同士の交流や情報収集ができるようなサービスで少しでも解決できたらと思いパーソナル食の作成に至りました。

# 機能一覧

- Basic認証
- ユーザー登録、ログイン機能
- 投稿一覧表示機能
- 投稿機能
- 詳細機能
- 編集機能
- 削除機能
- コメント機能
- 検索機能
- チャット機能

# DEMO
アプリの主な機能の特徴

## トップページ
[![Image from Gyazo](https://i.gyazo.com/21c39ce75bf46d89f7990222b470d3d3.gif)](https://gyazo.com/21c39ce75bf46d89f7990222b470d3d3)
パーソナル食のトップページです。<br>
トップページから新規登録やログインができます。

## ログイン後
[![Image from Gyazo](https://i.gyazo.com/49f6d5579f16e8a6ef66606fd1c514a1.gif)](https://gyazo.com/49f6d5579f16e8a6ef66606fd1c514a1)
ログイン後画面です。<br>
ヘッダーの右上のログイン・新規登録ボタンが、ログイン後はユーザー名とログアウトボタンに切り替わるようになっています。

## 投稿一覧表示機能
[![Image from Gyazo](https://i.gyazo.com/caa0a7be0f80749a9c77cc77f46e9a56.gif)](https://gyazo.com/caa0a7be0f80749a9c77cc77f46e9a56)
投稿一覧表示です。<br>
ヘッダーの右上のユーザー名から遷移します。また検索バーから文字列を入力し投稿を探すことができます。

## 投稿機能
[![Image from Gyazo](https://i.gyazo.com/02e08f8299e2e2bfa46a57f743841620.gif)](https://gyazo.com/02e08f8299e2e2bfa46a57f743841620)
投稿画面です。

## 記事詳細ページ
[![Image from Gyazo](https://i.gyazo.com/9fd15b27dfc08d3b5b961f6b4588a4f8.gif)](https://gyazo.com/9fd15b27dfc08d3b5b961f6b4588a4f8)
投稿の詳細ページです。<br>
投稿したユーザー名、カテゴリー、タイトル、画像、テキスト、コメント一覧が表示されます。<br>
投稿したユーザーであれば「編集」・「削除」ボタンが表示されます。

## チャット機能
[![Image from Gyazo](https://i.gyazo.com/34a8f736ff2ee592afbbf28205755be1.gif)](https://gyazo.com/34a8f736ff2ee592afbbf28205755be1)
チャット機能画面です。<br>
ヘッダー右上のユーザー名から食事相談をクリックするとチャット機能画面に遷移します。

## トークルームの作成
[![Image from Gyazo](https://i.gyazo.com/bc5f053eed406f47914a774d828c6b1d.gif)](https://gyazo.com/bc5f053eed406f47914a774d828c6b1d)
ルームを作成する画面です。
「ルームを作成する」からトークルーム名とチャットするメンバーを選択肢するとトークルームができます。

## トークルーム画面
[![Image from Gyazo](https://i.gyazo.com/dd384bce65828fbd31be8b7ed368ffa4.gif)](https://gyazo.com/dd384bce65828fbd31be8b7ed368ffa4)
トークルーム画面です。
トークルーム名をクリックするとトーク画面が表示され相談やメッセージを送ることができます。

# 使用技術(開発環境)

Ruby/Ruby on Rails/MySQL/RSpec/Github/AWS/Visual Studio Code

# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| date_of_birth      | data   | null: false               |

### Association

- has_many :posts
- has_many :room_users
- has_many :rooms, through: :room_users
- has_many :messages
- has_many :comments

## rooms テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association

- has_many :room_users
- has_many :users, through: :room_users
- has_many :messages

## room_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| room    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

## posts テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| title       | string     | null: false                    |
| category_id | integer    | null: false                    |
| text        | text       | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments

## comments テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| text   | text       | null: false                    |
| user   | references | null: false, foreign_key: true |
| post   | references | null: false, foreign_key: true |

### Association

- belongs_to :post
- belongs_to :user
