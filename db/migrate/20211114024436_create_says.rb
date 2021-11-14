class CreateSays < ActiveRecord::Migration[6.1]
  def change
    create_table :says do |t|
      t.string :quote, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
