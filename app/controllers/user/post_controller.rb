class User::PostController < ApplicationController
    def show
        @post = Post::Post.includes(:image).where(:slug => params[:slug]).first
        # render :plain => params[:slug]

        # render('detail/detail')
    end
end
