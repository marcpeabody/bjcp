class Initial < ActiveRecord::Migration
  def up
    create_table :styles do |t|
      t.string :category_number
      t.string :category_name

      t.string :style_number
      t.string :style_name
      t.text :aroma
      t.text :appearance
      t.text :flavor
      t.text :mouthfeel
      t.text :impression
      t.text :history
      t.text :comments
      t.text :ingredients
      t.text :examples

      t.string :og_low
      t.string :og_high
      t.string :fg_low
      t.string :fg_high
      t.string :ibu_low
      t.string :ibu_high
      t.string :srm_low
      t.string :srm_high
      t.string :abv_low
      t.string :abv_high
    end
  end

  def down
    drop_table :styles
  end
end
