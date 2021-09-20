class CreateStaffs < ActiveRecord::Migration[6.1]
  def change
    create_table :staffs do |t|
      t.string :name
      t.string :avatar_url

      t.timestamps
    end
  end
end
