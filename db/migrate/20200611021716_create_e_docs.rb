class CreateEDocs < ActiveRecord::Migration[6.0]
  def change
    create_table :e_docs do |t|
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.string :docname
      t.string :description

      t.timestamps
    end
  end
end
