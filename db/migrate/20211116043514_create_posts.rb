class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts, {:id => false} do |table|
      table.bigint :id, :unsigned => true, :auto_increment => true, :primary_key => true
      table.belongs_to :users, index: true, foreign_key: true, unsigned: true
      table.string :title, :null => false
      table.text :content, :null => false
      table.string :slug, :null => false, :index => { unique: true }
      table.timestamps :null => true
    end
  end
end
