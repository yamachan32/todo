# アプリケーション名	
『todo』（とど）

# アプリケーション概要
チーム所属スタッフのタスク管理

# URL
https://todo37653.herokuapp.com/

# テスト用アカウント

- test1
メールアドレス： aaa@aaa
パスワード： abc123
- test2
メールアドレス： bbb@bbb
パスワード： abc123

# 利用方法

##ログイン
1.登録済みの場合は、ログイン画面にメールアドレス・パスワードを入力しログインする
2.未登録の場合は、ログイン画面下部の新規登録リンクからユーザー登録をする

##チームの作成/メンバーの招待
1.ヘッダーのチーム作成から任意のチームを作成する
2.新たに作成されたチームのカードをクリックし、チーム画面へ遷移する
3.ヘッダーのメンバー追加から、チームに追加するメンバーを選択し、「Save」ボタンをクリックする

##個人のタスク作成
1.トップページから自身のアイコンをクリックする
2.ヘッダーの新規カードから任意のカードを作成する
3.必要事項を入力し、「作成」ボタンをクリックする
※タスクの追加は追加フォームでEnterを押下する

##個人のタスク管理
1.トップページから自身のアイコンをクリックする
2.該当の完了タスクのチェックボックスをクリックする

##チームメンバーのタスク確認
1.トップページから、任意のチームのカードをクリックする


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

1.ログイン機能
[![Image from Gyazo](https://i.gyazo.com/4bbb485d8f4cc5d69b0d71c17cb41732.png)](https://gyazo.com/4bbb485d8f4cc5d69b0d71c17cb41732)

2.チーム作成機能
[![Image from Gyazo](https://i.gyazo.com/7e95bebf6991af50676ca45d203714e7.png)](https://gyazo.com/7e95bebf6991af50676ca45d203714e7)

3.メンバー招待機能
[![Image from Gyazo](https://i.gyazo.com/86dab0d0435c40148ab424a3b8679cb3.png)](https://gyazo.com/86dab0d0435c40148ab424a3b8679cb3)

4.チームタスク表示機能
[![Image from Gyazo](https://i.gyazo.com/1f7adc938a6ae6a59313fcf91abd8fc8.gif)](https://gyazo.com/1f7adc938a6ae6a59313fcf91abd8fc8)

5.ユーザータスク表示機能
[![Image from Gyazo](https://i.gyazo.com/4dd81f6457f89a015ab47de76684894b.gif)](https://gyazo.com/4dd81f6457f89a015ab47de76684894b)

6.タスクカード作成機能
[![Image from Gyazo](https://i.gyazo.com/81d39a8dbae9d0b9f7f5178a54c07e05.gif)](https://gyazo.com/81d39a8dbae9d0b9f7f5178a54c07e05)

7.タスクカード編集機能
[![Image from Gyazo](https://i.gyazo.com/2206f8957ad8f1c8556fda99b4cec2f2.gif)](https://gyazo.com/2206f8957ad8f1c8556fda99b4cec2f2)

# 実装予定の機能
1.チーム削除機能
  自分がオーナーのチームをを削除できる機能

2.チームタスク色分け機能
  日にちボードの色分けができる機能（タスクの合計時間が５時間未満：白、タスクが５〜６時間：黄色、タスクが６時間以上：赤）

3.メンバー削除機能
  アイコンクリック > メニュー表示からメンバーを削除できる機能

4.タスクカード削除機能
  タスクカード付属の削除ボタンをクリックするとカードを削除することができる機能

5.タスクカード移動機能
  ドラック＆ドロップで任意の場所へタスクカードを移動させることができる機能

6.タスクカード色分け機能
  タスクカードの色分けされる機能（期限前：白、期限１日前：黄、期限日：オレンジ、期限越え：赤、完了：グレー）

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
Ruby/Ruby on rails/javascript/jQuery/MySQL/Github/Visual Studio 

# ローカルでの動作方法
ローカルでの動作方法
以下のコマンドを順に実行。

% git clone https://github.com/yamachan32/todo

% cd todo

% bundle install

% yarn install

# 工夫したポイント
1.シンプルな操作
  当アプリケーションは、業務で利用することを想定しているため、なるべく余分な操作がないように、シンプルな構成を目指した。特に、タスクカードを作成する機能については、アソシエーション関係のあるデータを扱っているので、カードデータ作成後にタスクを入力する手段が簡単に実装できると思うが、ここを一度の登録ですべて登録できるような仕様とした。

2.視覚的に状況を把握できるUI
  チーム全体のタスクを表示する際に、視覚的に状況を把握できる画面構成にした。各タスクカードには複数のタスクが登録されているが、全て表示すると情報量が多くなるため、詳細のタスクは非表示としてそれらの完了状況を視覚的に把握しやすくするためにプログレスバーを追加した。
  また、今後タスクの状況と期限の情報をもとにカード自体を色分けする、個人の持っているタスクカードの作業時間をもとにボードを色分けするという機能を追加して、個人の業務負荷も視覚的に把握できるようにする。

3.未学習の機能に挑戦
  実装したい機能を実現するには、bootstrap、jqueryを活用することがよいと考え、学習カリキュラムにない手段を自分で調べて実装した。扱ったことのない言語であり、構造や記述方法を学習しながらの実装で苦労の連続だったが、使用していくにつれ少しずつ理解できるようになった。
