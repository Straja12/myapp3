class Character < ApplicationRecord
	has_many :atributes, dependent: :destroy

	belongs_to :user
	
end
