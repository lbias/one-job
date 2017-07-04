class Job < ApplicationRecord
  belongs_to :user

  scope :recent, -> { order('created_at DESC') }
  scope :published, -> { where(is_hidden: false) }  
end
