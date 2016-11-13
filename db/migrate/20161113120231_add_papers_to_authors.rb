class AddPapersToAuthors < ActiveRecord::Migration
  def change
    add_column :authors, :papers, :reference
  end
end
