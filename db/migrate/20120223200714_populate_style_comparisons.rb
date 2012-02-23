class PopulateStyleComparisons < ActiveRecord::Migration
  def up
    comparisons = ["10B,10A,7B", "10B,10C,10A", "10B,10A,7B", "19C,19A,9E", "10C,10A,7B", "10C,11A,11C", "10C,11A,11B", "14B,14A,14C", "10A,16B,8C", "10A,19B,9E", "13E,13A,13D", "13E,13A,13C", "13E,13A,12B", "13E,13A,13B", "13E,13D,13C", "13E,13D,12B", "13E,13D,13B", "6D,17D,15A", "6D,15A,15D", "12C,18E,13F", "18A,18B,18C", "18A,18D,18C", "17A,17B,17D", "16D,7B,7A", "2B,2C,2A", "2B,2A,1C", "2B,2A,1B", "12A,13A,12B", "12A,11A,11B", "12A,4B,11C", "12A,4B,4C", "12A,4B,11B", "7B,9D,3B", "6A,6C,1D", "4A,4B,4C", "5C,5D,5A", "5C,5D,5B", "5C,5A,5B", "1E,2A,1D", "13A,13D,13B", "13A,12B,4C", "7C,9D,7A", "7C,7A,3B", "7C,3B,8B", "5D,5A,5B", "19B,19A,9E", "13D,12B,13B", "9D,7A,3B", "11A,9A,8A", "7A,3B,8B", "9B,9C,9E", "9A,9C,9E", "9A,9B,9E", "8A,8B,8C", "17D,15A,16A"]
    comparisons.each{|c| StyleComparison.create!(:style_numbers => c)}
  end

  def down
    StyleComparison.destroy_all
  end
end
