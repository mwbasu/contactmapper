class Contact < ApplicationRecord
	validates :name, presence: true, length: {minimum: 5}
	validates :number, presence: true
end
