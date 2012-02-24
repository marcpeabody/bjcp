# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20120224145328) do

  create_table "all_grain_recipes", :force => true do |t|
    t.string "style_number"
    t.string "name"
    t.string "og"
    t.string "fg"
    t.string "ibu"
    t.string "srm"
    t.string "grain_bill"
    t.string "hop_variety"
    t.string "bittering_amt"
    t.string "flavor_amt"
    t.string "aroma_amt"
    t.string "yeast"
    t.string "mash_type"
    t.string "ale_lager"
  end

  create_table "characteristics", :force => true do |t|
    t.string "name"
    t.string "descriptions"
    t.string "appropriate_styles"
    t.string "causes"
    t.string "controls"
  end

  create_table "style_comparisons", :force => true do |t|
    t.string "style_numbers"
    t.string "notes"
  end

  create_table "styles", :force => true do |t|
    t.string  "category_number"
    t.string  "category_name"
    t.string  "style_number"
    t.string  "style_name"
    t.text    "aroma"
    t.text    "appearance"
    t.text    "flavor"
    t.text    "mouthfeel"
    t.text    "impression"
    t.text    "history"
    t.text    "comments"
    t.text    "ingredients"
    t.text    "examples"
    t.string  "og_low"
    t.string  "og_high"
    t.string  "fg_low"
    t.string  "fg_high"
    t.string  "ibu_low"
    t.string  "ibu_high"
    t.string  "srm_low"
    t.string  "srm_high"
    t.string  "abv_low"
    t.string  "abv_high"
    t.boolean "on_exam",         :default => true
    t.integer "position"
    t.string  "city"
  end

  add_index "styles", ["on_exam"], :name => "index_styles_on_on_exam"

end
