class AddCityToStyles < ActiveRecord::Migration
  def up
    add_column :styles, :city, :string

    {"Bamberg" => "22A",
     "Berlin" => "17A",
     "Burton-On-Trent" => "8A,8B,8C",
     "Dublin" => "13A",
     "D\u00fcsseldorf".force_encoding("UTF-8") => "7C",
     "Edinburgh" => "9A,9B,9C,9E",
     "Einbeck" => "5B",
     "K\u00f6ln (Cologne)".force_encoding("UTF-8") => "6C",
     "Newcastle" => "11C",
     "San Francisco" => "7B",
     "Senne Valley" => "17D,17E,17F",
     "Vienna" => "3A"
    }.each do |city, styles|
      styles_for_city = Style.where('style_number in (?)', styles.split(','))
      styles_for_city.each{|s| s.update_attribute('city', city) }
    end
  end

  def down
    remove_column :styles, :city
  end
end
