class Settlement < ApplicationRecord
  belongs_to :expense
  belongs_to :paid_by, class_name: 'User', foreign_key: 'payer_id'

end
