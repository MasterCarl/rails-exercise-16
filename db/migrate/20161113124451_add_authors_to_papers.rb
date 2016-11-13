class AddAuthorsToPapers < ActiveRecord::Migration
  def change
    add_reference :papers, :authors, index: true, foreign_key: true
  end
end
