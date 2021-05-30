class UserLegderBalance < ApplicationRecord
  belongs_to :ower, class_name: 'User', foreign_key: 'ower_id'
  belongs_to :owee, class_name: 'User', foreign_key: 'owee_id'


end
