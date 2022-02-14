class CreateUsersTenders < ActiveRecord::Migration[7.0]
  def change
    create_table :users_tenders do |t|
      t.references :user, null: false, foreign_key: true
      t.references :tender, null: false, foreign_key: true

      t.timestamps
    end
  end
end
