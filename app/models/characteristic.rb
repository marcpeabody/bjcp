class Characteristic < ActiveRecord::Base
  def ever_appropriate?
    appropriate_styles.present?
  end
end

