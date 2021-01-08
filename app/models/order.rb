class Order < ApplicationRecord
  belongs_to :user
  belongs_to :giveback
    
  has_one :payment
  has_one :project, through: :giveback

end
