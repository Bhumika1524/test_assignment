class CreateTenders < ActiveRecord::Migration[7.0]
  def change
    create_table :tenders do |t|
      t.string :title
      t.string :description
      t.string :status
      t.string :submission_date

      t.timestamps
    end
  end
end
