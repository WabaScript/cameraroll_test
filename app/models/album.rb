class Album < ApplicationRecord
    belongs_to :user
    has_many_attached :images
    validates :name, presence: true
    validates :images, presence: true, blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg'], size_range: 1..10.megabytes }

    def resize_image input
        return self.images[input].variant(resize: '500x500!').processed
    end
end

