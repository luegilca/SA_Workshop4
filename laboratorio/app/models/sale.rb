class Sale < ApplicationRecord
  belongs_to :Product
  belongs_to :User
end
