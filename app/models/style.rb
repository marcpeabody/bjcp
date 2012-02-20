class Style < ActiveRecord::Base

  default_scope :order => 'position'
  scope :under_1040, lambda { where('og_high < ?', '1.040') }

  def self.with_cities
    where('city IN (?)', cities.to_a.sample(3)).group_by(&:city)
  end

  def self.sample(n)
    # RANDOM() assumes postgres, otherwise, try RAND()
    Style.unscoped.where(:on_exam => true).all(:limit => n, :order => 'RANDOM()')
  end

  def self.all_names
    @@all_names = self.connection.execute("SELECT DISTINCT style_name from styles").values.map(&:first).sort
  end

  %w{og fg ibu srm abv}.each do |v|
    define_method "#{v}_range" do
      range(eval("#{v}_low"), eval("#{v}_high"))
    end
  end

  def as_json(*args)
    hash = super(*args)
    hash.merge!({:example => examples.split(',').sample })
  end

  private
  def range(low,high)
    "#{low}-#{high}"
  end

  def self.cities
    @@cities = self.connection.execute("SELECT DISTINCT city from styles where city IS NOT NULL").values.map(&:first)
  end
end
