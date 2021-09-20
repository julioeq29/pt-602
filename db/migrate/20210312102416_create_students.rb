class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :github
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
