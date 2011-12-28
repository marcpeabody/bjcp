class Style < ActiveRecord::Base

  def self.sample(n)
    # RANDOM() assumes postgres, otherwise, try RAND()
    Style.all(:limit => n, :order => 'RANDOM()')
  end

  %w{og fg ibu srm abv}.each do |v|
    define_method "#{v}_range" do
      range(eval("#{v}_low"), eval("#{v}_high"))
    end
  end

  private
  def range(low,high)
    "#{low}-#{high}"
  end
end
