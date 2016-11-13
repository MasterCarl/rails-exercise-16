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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161113140508) do

  create_table :authors do |t|
    t.string :first_name
    t.string :last_name
    t.string :homepage
    t.integer :paper_id
    t.timestamps null: false
  end

  create_table :papers do |t|
    t.string :title
    t.string :venue
    t.integer :year
    t.timestamps null: false
  end

  create_table "authors_papers", force: :cascade do |t|
    t.integer "author_id"
    t.integer "paper_id"
  end
  add_index "authors_papers", ["author_id"], name: "index_authors_papers_on_author_id"
  add_index "authors_papers", ["paper_id"], name: "index_authors_papers_on_paper_id"
end
