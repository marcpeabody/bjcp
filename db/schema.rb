# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110817125850) do

  create_table "styles", :force => true do |t|
    t.string "category_number"
    t.string "category_name"
    t.string "style_number"
    t.string "style_name"
    t.text   "aroma"
    t.text   "appearance"
    t.text   "flavor"
    t.text   "mouthfeel"
    t.text   "impression"
    t.text   "history"
    t.text   "comments"
    t.text   "ingredients"
    t.text   "examples"
    t.string "og_low"
    t.string "og_high"
    t.string "fg_low"
    t.string "fg_high"
    t.string "ibu_low"
    t.string "ibu_high"
    t.string "srm_low"
    t.string "srm_high"
    t.string "abv_low"
    t.string "abv_high"
  end

end
