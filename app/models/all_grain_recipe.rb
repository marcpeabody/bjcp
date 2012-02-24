class AllGrainRecipe < ActiveRecord::Base
  has_one :style, :foreign_key => :style_number, :primary_key => :style_number
  [:aroma, :appearance, :flavor, :mouthfeel].each do |m|
    delegate m, :to => :style
  end

  def self.sample
    # RANDOM() assumes postgres, otherwise, try RAND()
    self.all(:limit => 1, :order => 'RANDOM()')
  end

  def as_json(options={})
    super(:methods => [:aroma, :appearance, :flavor, :mouthfeel])
  end
end

