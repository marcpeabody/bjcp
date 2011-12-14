class Style < ActiveRecord::Base

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
