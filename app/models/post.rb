class Post < ApplicationRecord
	
	validates :user_id, presence: true
	belongs_to :user
	validates :image, presence: true
	has_many :comments, dependent: :destroy
	has_attached_file :image, styles: { :medium => "640px" }
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
	validates :caption, length: { minimum: 2, maximum: 300 }	
end
