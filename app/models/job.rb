class Job < ActiveRecord::Base

	validates :title, presence: true
	validates :company, presence: true
	validates :company_url, presence: true
	validates :job_url, presence: true
	validates :job_email, presence: true
	validates :description, presence: true
	validates :approved, presence: true

	belongs_to :user

	scope :published, -> { where(approved: true) }
end
