class StyleComparison < ActiveRecord::Base
  def styles
    Style.find_all_by_style_number(self.style_numbers.split(','))
  end
end
