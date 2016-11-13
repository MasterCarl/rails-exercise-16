class CreatePapers < ActiveRecord::Migration
  def change
    create_table :papers do |t|
      t.string :title
      t.string :venue
      t.integer :year
      t.timestamps null: false
    end

    #add_index "papers", ["authors_id"], name: "index_papers_on_authors_id"
  end
end
