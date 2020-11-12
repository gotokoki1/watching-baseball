# テーブル設計

## users テーブル

| Column       | Type    | Option      |
| ------------ | ------- | ----------- |
| nickname     | string  | null: false |
| email        | string  | null: false |
| password     | string  | null: false |
| like_team_id | integer | null: false |

### Association

- has_many :baseballs
- has_many :comments

## baseballs テーブル

| Column       | Type       | Option                         |
| ------------ | ---------- | ------------------------------ |
| title        | string     | null: false                    |
| content      | text       | null: false                    |
| like_team_id | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments

## comments テーブル

| Column   | Type       | Option                         |
| -------- | ---------- | ------------------------------ |
| text     | text       | null: false                    |
| user     | references | null: false, foreign_key: true |
| baseball | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :baseball