class CreateAdmins < ActiveRecord::Migration[6.0]
  def change
    create_table :admins do |t|
      t.string :adname
      t.string :admail

      t.timestamps
    end
  end
end
