class LikeTeam < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '読売ジャイアンツ' },
    { id: 3, name: '阪神タイガース' },
    { id: 4, name: 'ヤクルトスワローズ' },
    { id: 5, name: '中日ドラゴンズ' },
    { id: 6, name: '横浜DNAベースターズ' },
    { id: 7, name: '広島東洋カープ' },
    { id: 8, name: '埼玉西武ライオンズ' },
    { id: 9, name: '福岡ソフトバンクホークス' },
    { id: 10, name: '東北楽天イーグルス' },
    { id: 11, name: '千葉ロッテマリーンズ' },
    { id: 12, name: '北海道日本ハムファイターズ' },
    { id: 13, name: 'オリックス・バファローズ' }
  ]

  include ActiveHash::Associations
  has_many :users
end
