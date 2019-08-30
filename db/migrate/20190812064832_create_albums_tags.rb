class CreateAlbumsTags < ActiveRecord::Migration[5.2]
  def change
    create_table :albums_tags do |t|
      t.references :album, foreign_key: true
      t.references :tag, foreign_key: true
    end
  end
end
