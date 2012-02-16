class StyleComparison < ActiveRecord::Base
  scope :not_in, lambda { |ex| where('id not in (?)', ex) }

  def styles
    Style.find_all_by_style_number(self.style_numbers.split(','))
  end

  def self.sample(n, excluding=[])
    # RANDOM() assumes postgres, otherwise, try RAND()
    if excluding.present?
      self.unscoped.not_in(excluding).all(:limit => n, :order => 'RANDOM()')
    else
      self.unscoped.all(:limit => n, :order => 'RANDOM()')
    end
  end
end
