class Home::HomeController < ApplicationController
    def index
        @posts = Post::Post.includes(:user, :image).limit(10)

        render('home/home')
    end
end
