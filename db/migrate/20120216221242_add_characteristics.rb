class AddCharacteristics < ActiveRecord::Migration
  def up
    create_table :characteristics do |t|
      t.string :name
      t.string :descriptions
      t.string :appropriate_styles
      t.string :causes
      t.string :controls
    end
    CHARACTERISTICS.each do |c|
      Characteristic.create(:name => c[0],
                            :descriptions => c[1].join(', '),
                            :appropriate_styles => c[2],
                            :causes => c[3].join(', '),
                            :controls => c[4].join(', '))
    end
  end

  def down
    drop_table :characteristics
  end

CHARACTERISTICS = [["Acetaldehyde",["Green apples","Grassy"],"Light American Lagers",
  ["Premature removal from yeast", "Bacterial Spoilage","Oxidation"],
  ["Allow ferment to complete", "Practice good sanitation and beer handling to avoid O2 contact"]],

 ["Alcoholic",["Spicy","Vinous","Prickly mouthfeel"],"Strong Ales and Lagers",
  ["High amt of fermentables", "Under pitching", "Low O2 or FAN"],
  ["Pitch sufficient yeast quantity", "Aerate wort prepitching"]],

 ["Astringency", ["Mouthpuckering","Flavor","Mouthfeel"],nil,
  ["Extraction of tannins - over crushing or oversparging", "alkaline water", "Lengthy hop immersion times",
    "Polyphenols from acetobacter", "Oxidation", "Spices"],
  ["Don't over crush", "Keep sparge temp low", "Use acidified water in sparge",
    "Reduce hop immersion time", "Practice good sanitation", "Reduce spice additions"]],

 ["Bitterness", ["Mouthpuckering", "Bitter", "Aroma", "Flavor", "Mouthfeel"], "IPAs, Pale Ales, and English Bitters",
   ["High AAU hops", "Lengthy hop boil times"],
   ["Use hops with lower alpha acids", "Reduce hop boil times"]],

 ["Buttery", ["Butterscotch", "Diacetyl", "Aroma", "Flavor", "Mouthfeel"], "Scotch Ales, Bitters, Czech Pils, and Oktoberfest (very low levels)",
  ["Premature racking", "Low ferment temps", "Mutant yeast", "Lactic acid bacteria"],
  ["Reduced by yeast - allow complete fermentation", "Properly aerate wort prior to pitching",
   "Do a diacetyl rest \(2 days at the end of primary \@ 65F\)", "Use healthy pure yeast", "Practice good sanitation"]],

 ["Cardboard", ["Papery", "Stale", "Flavor", "Aroma"],nil,
  ["Aeration of hot wort", "Exposure of higher alcohols in finished beer to oxygen", "Old beer"],
  ["Avoid splashing hot wort", "Carefully package beer to avoid oxygen contact",
    "Serve beer in an appropriate amount of time"]],

 ["Cloudiness", ["Cloudy","Appearance"],"Wheat Beers, Lambic, and American Wheat",
  ["Chill Haze: Insufficient conversion time", "Permanent Haze: High Sparge temps",
    "Bacterial Haze: Poor Sanitation", "Powdery yeast"],
  ["Longer mash", "Use Protein rest", "Use finings", "Use filtration",
    "Reduce Sparge Temps", "Practice better sanitation", "Choose a less powdery yeast"]],

 ["Cooked Corn", ["DMS (dimethyl sulfide)","Vegetal","Aroma","Flavor",
                   "Precursor (dimethyl sulfoxide) occurs naturally in malt, turned into DMS with heat, evaporates"],
  "American Lagers, Cream Ales",
  ["Covered boil", "Zymomonas bacteria", "High level of adjuncts"],
  ["Use uncovered fullrolling boil", "Practice good sanitation", "Reduce adjuncts in mash"]],

 ["Fruitiness", ["Esters (Strawberries, Stone Fruits, etc)","Flavor","Aroma"],"Ales",
  ["Alcohols combining with acids at higher ferment temps (Ethyl acetate/Isoamyl acetate/Ethyl Hexanoate)"],
  ["Reduce fermentation temperatures", "Choose a different yeast strain"]],

 ["Light Body", ["Watery","Weak","Mouthfeel","Flavor"],"American Light Lagers, Lambics",
   ["Lack of dextrins", "Poor quality malt", "Large pct of sugar",
     "Over-long protein rest", "High mash temperature"],
   ["Use quality malt", "Keep percentage of sugar small", "Reduce length of protein rest",
     "Use dextrin/wheat malt/flaked wheat", "Lower mash temperature"]],

 ["Low Head Retention", ["Flat","Appearance","Mouthfeel"],"Lambics, High Alcohol Beers",
   ["Insufficient proteins in beer causes high surface tension",
     "Dirty/oily glasses", "Low protein grist"],
   ["Shorten protein rest", "Use clean well-rinsed glasses", "Use flaked wheat or barley",
     "Lower alcohol by lowering grist bill", "Use hops with high isoalpha acids"]],

 ["Phenolic", ["Band-aid","Medicinal","Clove-like","Plastic","Smoky","Aroma","Flavor"],
   "Some Belgian Ales, Smoke beers, Some Wheat beers",
   ["Wild yeasts", "Improper sanitation", "Some malt types", "Some yeast types"],
   ["Use pure yeast strains", "Practice good sanitation", "Use \"clean\" malt",
     "Use yeast less prone to phenol production"]],

 ["Sherry-like", ["Sherry","Vinous","Wine-like","Paper like","Old"],
   "Barleywines, English Old Ales",
   ["Oxidative yeasts acting on higher alcohol beers creates aldehydes (i.e. 2- trans-nonenal)"],
   ["Use a different yeast strain", "Create less alcohol by lowering grist bill",
     "Serve beer younger", "Ferment cooler"]],

 ["Sourness", ["Tart","Sour","Aroma","Flavor","Mouthfeel"],
   "Lambics, Flanders Ale, Berliner Weisse",
   ["Lactic Acid (from lactic acid bacteria)", "Acetobacter (from Acetic acid)"],
   ["Practice proper sanitation", "Don't employ overlengthy mash or low temp mash"]],

 ["Good Head Retention",[""],
   "",
   [],
   [], 2],
   
 ["Clarity in a Beer",[""],
  "",
  [],
  [], 2],

 ["A Proper Diactyl Level for Style"],[""],
  "",
  [],
  [], 2]]
#T3
 ["Body",[""],
  "",
  [],
  [], 3],

 ["Mouthfeel",[""],
  "",
  [],
  [], 3],
end


