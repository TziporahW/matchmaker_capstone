class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :gender, presence: true
  validates :birthday, presence: true

  has_many :girl_matches, class_name: "Match", foreign_key: "boy_id"
  has_many :girls, through: :girl_matches, source: :girl

  has_many :boy_matches, class_name: "Match", foreign_key: "girl_id"
  has_many :boys, through: :boy_matches, source: :boy
end
