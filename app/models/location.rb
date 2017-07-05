class Location < ApplicationRecord
  has_many :jobs

  validates :name, presence: { message: "请输入工作地点" }

  scope :published, -> { where(is_hidden: false) }
  scope :sortA, -> { order('sort ASC') }
  scope :sortD, -> { order('sort DESC') }  
end
