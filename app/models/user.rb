class User < ApplicationRecord
	has_secure_password
	validates :first_name, :email, presence: true

	has_many :todos

	accepts_nested_attributes_for :todos, reject_if: proc { |attributes| attributes['description'].blank? }
end
