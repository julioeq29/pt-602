class CreateTeachers < ActiveRecord::Migration[6.1]
  def change
    create_table :teachers do |t|
      t.string :github
      t.string :name
      t.string :avatar_url

      t.timestamps
    end
  end
end
