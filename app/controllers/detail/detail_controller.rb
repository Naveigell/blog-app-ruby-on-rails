class Detail::DetailController < ApplicationController
    def index
        render :plain => params[:slug]

        # render('detail/detail')
    end
end
