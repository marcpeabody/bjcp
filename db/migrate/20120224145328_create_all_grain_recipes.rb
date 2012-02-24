class CreateAllGrainRecipes < ActiveRecord::Migration
  def up
    create_table :all_grain_recipes do |t|
      t.string :style_number
      t.string :name
      t.string :og
      t.string :fg
      t.string :ibu
      t.string :srm
      t.string :grain_bill
      t.string :hop_variety
      t.string :bittering_amt
      t.string :flavor_amt
      t.string :aroma_amt
      t.string :yeast
      t.string :mash_type
      t.string :ale_lager
    end

    ALL_GRAIN_RECIPES.each do |agr|
      AllGrainRecipe.create!(:style_number => agr[0],
                             :name         => agr[1],
                             :og           => agr[2],
                             :fg           => agr[3],
                             :ibu          => agr[4],
                             :srm          => agr[5],
                             :grain_bill   => agr[6],
                             :hop_variety  => agr[7],
                             :bittering_amt=> agr[8],
                             :flavor_amt   => agr[9],
                             :aroma_amt    => agr[10],
                             :yeast        => agr[11],
                             :mash_type    => agr[12],
                             :ale_lager    => agr[13])
    end
  end

  def down
    drop_table :all_grain_recipes
  end
end


# style_number, name, OG, FG, IBU, SRM,
# Grist,
# Hops Variety, Bittering amt, Flavor amt, Aroma amt,
# Yeast, Classic Mash Type, Ale/Lager
ALL_GRAIN_RECIPES = [
["14B", "American IPA", "1.075", "1.010", "40", "6",
   "12lbs 2-Row (80%), 2.25lbs Crystal 20L (15%), 0.75lbs Crystal 60L (5%)",
   "choose Centennial, Chinook, or Cascade", "2oz", "1oz", "1oz",
   "American Ale", "Multi-Step", "Ale"],
["18C", "Belgian Tripel", "1.075", "1.010", "25", "6",
   "12lbs Pilsner Malt, 2lbs Candi Sugar",
   "Styrian Golding", "1oz", "1oz", nil,
   "Trappist High Gravity", "Multi-Step", "Ale"],
["5C", "Doppelbock", "1.075", "1.016", "25", "6",
   "11.25lbs Munich 75%, 3.75lbs Vienna 25%",
   "choose Hallertauer, Spalt, or Tettnanger", "1oz", "0.5oz", nil,
   "Bavarian Lager", "Decoction", "Lager"],
["2B", "Bohemian Pilsner", "1.050", "1.016", "40", "6",
   "10lbs Moravian Pilsner",
   "Saaz", "2oz", "1oz", nil,
   "Budjevoice Lager", "Decoction", "Lager"],
["12B", "Robust Porter", "1.050", "1.016", "40", "25",
   "8.5lbs Maris Otter (85%), 0.5lbs Roast (5%), 0.5lbs Black (5%), 0.5lbs Chocolate (5%)",
   "choose East Kent Goldings or Fuggles", "2oz", "1oz", nil,
   "London Ale III", "Single Infusion", "Ale"],
["3B", "Oktoberfest", "1.050", "1.016", "25", "7",
   "4.5lbs Pils (45%), 3lbs Munich (30%), 1lbs Vienna (10%), 0.5lbs Crystal 15L 5%",
   "choose Hallertauer, Spalt, Tettnanger", "1oz", "1oz", nil,
   "Munich Lager", "Decoction", "Lager"],
["13A", "Dry Stout", "1.050", "1.010", "40", "25",
   "6.5lbs Maris Otter (65%), 2lbs Flaked Unmalted Barley 20%, 12oz Roast Unmalted Barley (7.5%), 12oz Black Patent (7.5%)",
   "choose East Kent Goldings or Fuggles", "2oz", "1oz", "1oz",
   "Irish Ale", "Single Infusion", "Ale"],
["2A", "German Pilsner", "1.050", "1.010", "40", "5",
   "10lbs Pilsner",
   "choose Hallertauer, Spalt, or Tettnanger", "2oz", "1oz", "1oz",
   "German Lager", "Decoction", "Lager"],
["2C", "Classic American Pilsner", "1.050", "1.010", "40", "6",
   "7lbs 6-Row (70%), 3lbs Flaked Maize (30%)",
   "choose Cluster, Styrian Goldings, or whatever - this one is open to interpretation", "2oz", "1oz", nil,
   "Budjevoice Lager", "Double-Mash (Cereal)", "Lager"],
["8C", "English Pale Ale", "1.050", "1.010", "40", "6",
   "9lbs Maris Otter (90%), 1lb Crystal 60L (10%)",
   "choose East Kent Goldings or Fuggles", "2oz", "1oz", "1oz",
   "London Ale", "Multi-Step", "Ale"],
["15A", "Weizen/Weissbier", "1.050", "1.010", "10", "6",
   "7lbs Wheat (70%), 3lbs Pilsner (30%)",
   "choose Hallertauer, Spalt, or Tettnanger", "0.5oz", nil, nil,
   "Weihenstephan Ale", "Decoction", "Ale"]
]
