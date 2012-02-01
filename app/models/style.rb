class Style < ActiveRecord::Base

  def self.sample(n)
    # RANDOM() assumes postgres, otherwise, try RAND()
    Style.where(:on_exam => true).all(:limit => n, :order => 'RANDOM()')
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
end
