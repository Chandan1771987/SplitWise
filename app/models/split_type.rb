class SplitType < ApplicationRecord

  PERCENT = 'percent'
  EXACT = 'exact'
  EQUAL = 'equal'
  TYPE_MAPPING = {1 => PERCENT, 2 => EQUAL, 3 => EXACT}.with_indifferent_access
  def type
    name.downcase
  end
end