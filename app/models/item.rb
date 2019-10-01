class Item < ApplicationRecord
  belongs_to :user,optional: true
  has_many :images
  belongs_to :category,optional: true
end
