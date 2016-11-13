class AddAuthorsToPapers < ActiveRecord::Migration
  def change
    add_column :papers, :authors, :reference
  end
end
