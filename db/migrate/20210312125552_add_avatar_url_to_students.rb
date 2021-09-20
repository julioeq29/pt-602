class AddAvatarUrlToStudents < ActiveRecord::Migration[6.1]
  def change
    add_column :students, :avatar_url, :string
  end
end
