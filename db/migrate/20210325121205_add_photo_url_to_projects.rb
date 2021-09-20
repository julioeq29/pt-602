class AddPhotoUrlToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :photo_url, :string
  end
end
