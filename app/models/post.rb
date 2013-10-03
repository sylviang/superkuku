class Post < ActiveRecord::Base
	validates :description, presence: true, length: { maximum: 300 }

	belongs_to :user
	validates :user_id, presence: true

	has_attached_file :image, styles: { thumb: "100x100>"}
	validates_attachment :image,
												content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'] },
												size: { less_than: 5.megabytes }

	def image_remote_url=(url_value)
		self.image = URI.parse(url_value) unless url_value.blank?
		super
		# super make sure that any functionality that already define also will happen
	end

	def self.search(search)
  if search
    where('description LIKE ?', "%#{search}%")
  else
    scoped
  end
end

end
