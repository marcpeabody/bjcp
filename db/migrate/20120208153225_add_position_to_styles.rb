class AddPositionToStyles < ActiveRecord::Migration
  def up
    add_column :styles, :position, :integer
    Style.all.to_a.sort_by do |s|
      s.style_number.rjust(3, '0')
    end.each_with_index do |s, i|
      s.update_attribute(:position, i+1)
    end
  end

  def down
    remove_column :styles, :position
  end
end
