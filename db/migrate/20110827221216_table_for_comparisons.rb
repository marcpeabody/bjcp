class TableForComparisons < ActiveRecord::Migration
  def up
    create_table :style_comparisons do |t|
      t.string :style_numbers
      t.string :notes
    end
  end

  def down
    drop_table :style_comparisons
  end
end
