class BookImage < ApplicationRecord
    attachment :image
	belongs_to :user
end
