class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users, {:id => false}  do |table|
      table.bigint :id, :unsigned => true, :auto_increment => true, :primary_key => true, :null => false
      table.string :name, :limit => 50, :null => false
      table.string :username, :limit => 40, :unique => true, :index => { unique: true }, :null => false
      table.string :email, :index => { unique: true }, :null => false
      table.string :password, :limit => 100, :null => false
      table.timestamps :null => true
    end
  end
end
