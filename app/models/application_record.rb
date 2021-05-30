class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def web_json
    self.attributes
  end
end
