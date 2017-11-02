class Transaction < ApplicationRecord
  belongs_to :startAcount, :class_name => 'Account'
  belongs_to :finalAcount, :class_name => 'Account'
end
