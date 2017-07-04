class Resume < ApplicationRecord
  belongs_to :job
  belongs_to :user

  mount_uploader :attachment, AttachmentUploader

  validates :content, presence: { message: "请填写简历描述" }
  validates :attachment, presence: { message: "请选择简历文档" }

  scope :recent, -> { order('created_at DESC') } 
end
