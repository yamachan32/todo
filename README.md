# アプリケーション名	
『todo』（とど）

# アプリケーション概要
チーム所属スタッフのタスク管理

# URL
※	デプロイ済みのURLを記載。デプロイが済んでいない場合は、デプロイが完了次第記載すること。

# テスト用アカウント
User : AdminUser , Pass : P@ssw0rds

# 利用方法
このアプリケーションの利用方法を記載。説明が長い場合は、箇条書きでリスト化すること。

# アプリケーションを作成した背景
チーフなどのチームのタスク管理をする立場の者が、スタッフのタスク全体を把握しようと思うとき、スタッフの人数が多くなってくると、記憶だけでは把握しきれなくなってくることがある。そういった状況においては、

- チーム内のタスクの振り分けが、わかりづらく特定の人に偏ってしまう
- その結果、やることが多すぎて帰れない人とやることがなくてモチベーションが上がらない人が共存する状況になってしまう
- 在宅勤務が増えることで、どのメンバーがどの程度の負荷がかかっているのかが見えにくい
- 依頼していたタスクが、期限直近に完了していなかったことが判明する
- 付箋でのタスク管理も多忙であったりめんどくさかったりしてうまく運用できない

といった不具合があったため、簡単にタスク共有ができるアプリケーションを作成した。

# 洗い出した要件
[要件定義(todo)](https://docs.google.com/spreadsheets/d/1QbSojNZvgTINSV67ldhuCXS5cRLJx84D1jO1oEph7tY/edit?usp=sharing)

# 実装した機能についての画像やGIFおよびその説明
※	実装した機能について、それぞれどのような特徴があるのかを列挙する形で記載。画像はGyazoで、GIFはGyazoGIFで撮影すること。

# 実装予定の機能
洗い出した要件の中から、今後実装予定の機能がある場合は、その機能を記載。

# データベース設計

[![Image from Gyazo](https://i.gyazo.com/27cca2f6a8bac6f1d21fb3aa21a2b604.png)](https://gyazo.com/27cca2f6a8bac6f1d21fb3aa21a2b604)

# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| name               | string  | null: false               |
| email              | string  | null: false , unique:true |
| encrypted_password | string  | null: false               |
| section            | string  | null: false               |

### Association

- has_many :team_users
- has_many :cards
- has_many :comments
- has_one_attached :image

## teams テーブル

| Column           | Type       | Options                         |
| ---------------- | ---------- | ------------------------------- |
| team_name        | string     | null: false                     |
| team_explanation | string     | null: false                     |
| user             | references | null: false , foreign_key: true |

### Association

- has_many :team_users
- has_one_attached :image

## team_users テーブル

| Column  | Type       | Options                         |
| ------- | ---------- | ------------------------------- |
| team    | references | null: false , foreign_key: true |
| user    | references | null: false , foreign_key: true |

### Association

- belongs_to :user
- belongs_to :team

## cards テーブル

| Column        | Type       | Options                         |
| ------------- | ---------- | ------------------------------- |
| title         | string     | null: false                     |
| explanation   | text       |                                 |
| working_hours | integer    | null: false                     |
| limit_date    | date       |                                 |
| working_date  | date       |                                 |
| user          | references | null: false , foreign_key: true |
| owner_id      | references | null: false , foreign_key: true |

### Association

- belongs_to :user
- has_many :tasks
- has_many :comments

## tasks テーブル

| Column | Type       | Options                         |
| ------ | ---------- | ------------------------------- |
| matter | string     | null: false                     |
| finish | boolean    | default: false                  |
| card   | references | null: false , foreign_key: true |

### Association

- belongs_to :card

## comments テーブル

| Column  | Type       | Options                         |
| ------- | ---------- | ------------------------------- |
| content | text       | null: false                     |
| user    | references | null: false , foreign_key: true |
| card    | references | null: false , foreign_key: true |

### Association

- belongs_to :user
- belongs_to :card

# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/5ff7d4178084ece4b1b9bb1f1a65341a.png)](https://gyazo.com/5ff7d4178084ece4b1b9bb1f1a65341a)

# 開発環境
使用した言語・サービスを記載。

# ローカルでの動作方法
※	git cloneしてから、ローカルで動作をさせるまでに必要なコマンドを記載。

# 工夫したポイント
※	制作背景・使用技術・開発方法・タスク管理など、企業へＰＲしたい事柄を記載。