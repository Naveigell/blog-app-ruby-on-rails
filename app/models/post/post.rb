class Post::Post < ApplicationRecord
    self.table_name = 'posts'

    belongs_to :user, :class_name => 'User::User', :foreign_key => 'users_id'
    has_one :image, :class_name => 'Post::Image', :foreign_key => 'posts_id'
end
