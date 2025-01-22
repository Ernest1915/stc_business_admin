class Business < ApplicationRecord
  belongs_to :admin
  validates :name, :location, :description, presence: true
end
