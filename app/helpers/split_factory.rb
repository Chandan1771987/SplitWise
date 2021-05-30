class SplitFactory
  def self.get_split(type:)
    if type == 'percent'
      SplitType.where(name: type)
    elsif type == 'equal'
      SplitType.where(name: type)
    elsif type == 'exact'
      SplitType.where(name: type)
    else
      nil
    end
  end
end