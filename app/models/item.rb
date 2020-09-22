class Item < ApplicationRecord
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :region
  has_one_attached :image
  enum quality:{"新品、未使用": 1, "未使用に近い": 2, "目立った傷や汚れなし": 3, "やや傷や汚れあり": 4, "全体的に状態が悪い": 5}
  enum delivery_cost:{"送料込み (出品者負担)": 1, "着払い (購入者負担)": 2}
  enum delivery_day:{"1〜2日で発送": 1, "2〜3日で発送": 2, "4〜7日で発送": 3}
  enum category:{"レディース": 1, "メンズ":2, "ベビー・キッズ": 3, "家電": 4, "インテリア": 5, "本・音楽・ゲーム": 6, "おもちゃ・ホビー・グッズ": 7, "コスメ・香水・美容": 8, "家電・スマホ・カメラ": 9, "スポーツ・レジャー": 10, "ハンドメイド": 11, "チケット": 12, "自転車・オートバイ": 13, "その他": 14}
  validates :price, :numericality => { greater_than_or_equal_to: 300, less_than: 10000000 }
  validates :name, length: { maximum: 40 }

  with_options presence: true do
    validates :name
    validates :detail
    validates :category
    validates :quality
    validates :delivery_cost
    validates :delivery_day
    validates :price
    validates :image
    validates :region_id
    validates :user_id
  end

end
