class CreatePostImages < ActiveRecord::Migration[6.0]
    def change
        create_table :post_images, {:id => false} do |table|
          table.bigint :id, :unsigned => true, :auto_increment => true, :primary_key => true, :null => false
          table.belongs_to :posts, index: true, foreign_key: true, unsigned: true
          table.string :name, :null => false
          table.timestamps :null => true
        end
    end
end
