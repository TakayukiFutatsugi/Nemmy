class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :entries
  has_many :scouts
  has_many :rooms
  
  validates :familyName, presence: true
  validates :familyNameDetail, presence: true
  validates :lastName, presence: true
  validates :lastNameDetail, presence: true
  validates :gender, presence: true
  validates :birthdate, presence: true
  validates :prefecture, presence: true
  validates :certification, length: { maximum: 100 }
  validates :reason, length: { maximum: 100 }
  validates :strongPoint, length: { maximum: 100 }
  validates :weakPoint, length: { maximum: 100 }
  validates :goal, length: { maximum: 100 }
  validates :language, length: { maximum: 100 }
  validates :framework, length: { maximum: 100 }
  validates :product, length: { maximum: 100 }
  validates :introduction, length: { maximum: 1000 }
  
  enum gender: {
    男性:0,女性:1
  }
  
  enum prefecture: {
    北海道:0,青森県:1,岩手県:2,宮城県:3,秋田県:4,山形県:5,福島県:6,
    茨城県:7,栃木県:8,群馬県:9,埼玉県:10,千葉県:11,東京都:12,神奈川県:13,
    新潟県:14,富山県:15,石川県:16,福井県:17,山梨県:18,長野県:19,
    岐阜県:20,静岡県:21,愛知県:22,三重県:23,
    滋賀県:24,京都府:25,大阪府:26,兵庫県:27,奈良県:28,和歌山県:29,
    鳥取県:30,島根県:31,岡山県:32,広島県:33,山口県:34,
    徳島県:35,香川県:36,愛媛県:37,高知県:38,
    福岡県:39,佐賀県:40,長崎県:41,熊本県:42,大分県:43,宮崎県:44,鹿児島県:45,
    沖縄県:46
  }, _prefix: true
  
  enum workplace: {
    北海道:0,青森県:1,岩手県:2,宮城県:3,秋田県:4,山形県:5,福島県:6,
    茨城県:7,栃木県:8,群馬県:9,埼玉県:10,千葉県:11,東京都:12,神奈川県:13,
    新潟県:14,富山県:15,石川県:16,福井県:17,山梨県:18,長野県:19,
    岐阜県:20,静岡県:21,愛知県:22,三重県:23,
    滋賀県:24,京都府:25,大阪府:26,兵庫県:27,奈良県:28,和歌山県:29,
    鳥取県:30,島根県:31,岡山県:32,広島県:33,山口県:34,
    徳島県:35,香川県:36,愛媛県:37,高知県:38,
    福岡県:39,佐賀県:40,長崎県:41,熊本県:42,大分県:43,宮崎県:44,鹿児島県:45,
    沖縄県:46,リモート勤務可:47
  }, _prefix: true
end

class User::ParameterSanitizer < Devise::ParameterSanitizer
  def initialize(*)
    super
    permit(:sign_up, keys: [:familyName, :lastName, :familyNameDetail, :lastNameDetail, :gender, :birthdate, :prefecture])
    permit(:account_update, keys: [:familyName, :lastName, :familyNameDetail, :lastNameDetail, :gender, :birthdate, :prefecture, :firstEducation, :firstEducationDetail, :secondEducation, :secondEducationDetail, :thirdEducation, :thirdEducationDetail, :firstCareer, :firstCareerDetail, :secondCareer, :secondCareerDetail, :thirdCareer, :thirdCareerDetail, :certification, :reason, :duration, :strongPoint, :weakPoint, :goal, :learningResource, :informationResource, :language, :framework, :portfolio, :product, :introduction, :workplace, :salary, :startingDate])
  end
end