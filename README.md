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

生活習慣病や健康予防・改善をしたい、食事療法をしている方向けのヘルスケアアプリです。
これは自分の食生活やおすすめ商品などを投稿したり、同じ悩みがある人と繋がって情報交換をすることができ、
レシピ紹介や食の情報交換だけではなく、管理栄養士に直接栄養相談ができる機能が備わっています。

# 本番環境

## URL

https://personal-food.herokuapp.com/

## Basic認証

- ユーザー名：
- パスワード：

## テスト用アカウント

- メールアドレス：
- パスワード：

# 制作背景

前職で私は管理栄養士として病院で主に栄養指導をしていました。
栄養指導とは患者さんの病態に合わせて食事内容を改善して病気を治すようにすることです。
月に約30件は患者さんの食事の相談を受けていました。
しかし、現在コロナ禍で病院に栄養相談に来る患者さんが少なくなったため、栄養指導件数も１割程度とかなり減っていると聞きました。
そのため、生活習慣病の発症や検査数値の悪化、食事療法の中断など食事について何かしら困っている人は多いのではないかと考えました。
また、一人での食事療法は長期間続くことでストレスがかかったりモチベーションの低下に繋がるため、改善するキッカケが必要だと感じています。
そこでその人個人に合った食事相談が簡単にでき情報収集ができるアプリケーションで少しでも解決できたらと思い作成しました。

# 機能一覧

- Basic認証
- ユーザー登録、ログイン機能
- 投稿機能
- 投稿一覧表示機能
- 詳細機能
- 編集機能
- 削除機能
- チャット機能
- 検索機能

# DEMO

## トップページ
[![Image from Gyazo]
  (https://i.gyazo.com/118d652d64878e5eb50ec06cdaba08f6.gif)]
  (https://gyazo.com/118d652d64878e5eb50ec06cdaba08f6)
パーソナル食のトップページです。<br>
トップページから新規登録やログインができます。

## 新規登録
[![Image from Gyazo]
  (https://i.gyazo.com/b252c635435fe6f57418a830c7117dea.gif)]
  (https://gyazo.com/b252c635435fe6f57418a830c7117dea)
  新規登録画面です。

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
