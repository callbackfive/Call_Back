class Giveback < ApplicationRecord
  belongs_to :project, :inverse_of => :givebacks
end
