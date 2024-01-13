class ArticlesController < ApplicationController

    def show 
        @article = Article.find(params[:id])
        #debugger
    end
end