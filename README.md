# テーブル設計

## user テーブル

| Column       | Type    | Option      |
| ------------ | ------- | ----------- |
| nickname     | string  | null: false |
| email        | string  | null: false |
| password     | string  | null: false |
| like_team_id | integer | null: false |

### Association

- has_many :baseballs
- has_many :comments
- has_many :messages
- has_many :entries
- has_many :likes

## baseball テーブル

| Column       | Type       | Option                         |
| ------------ | ---------- | ------------------------------ |
| title        | string     | null: false                    |
| content      | text       | null: false                    |
| like_team_id | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_many :likes

## comment テーブル

| Column   | Type       | Option                         |
| -------- | ---------- | ------------------------------ |
| text     | text       | null: false                    |
| user     | references | null: false, foreign_key: true |
| baseball | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :baseball

## room テーブル

| Column | Type | option |
| ------ | ---- | ------ |

### Association

- has_many :messages
- has_many :entryies

## entry テーブル

| Column | Type       | Option                         |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :room

## message テーブル

| Column  | Type       | Option                         |
| ------- | ---------- | ------------------------------ |
| message | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :room

## like テーブル

| Column   | Type       | Option                         |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| baseball | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :baseball