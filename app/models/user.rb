class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :jobs
  has_many :resumes
  has_many :collections
  has_many :collected_jobs, :through => :collections, :source => :job

  def admin?
    is_admin
  end

  def website_admin?
    is_website_admin
  end

  # 加入收藏
  def add_collection!(job)
    collected_jobs << job
  end

  # 移除收藏
  def remove_collection!(job)
    collected_jobs.delete(job)
  end
end
