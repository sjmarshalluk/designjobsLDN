class Job < ActiveRecord::Base

	validates :title, presence: true
	validates :company, presence: true
	validates :company_url, presence: true
	validates :description, presence: true, length: {minimum: 10}
	validates :how_to_apply, presence: true
	validates :salary, presence: true
	validates :area_of_london, presence: true

	belongs_to :user

	scope :published, -> { where(approved: true) }
end
