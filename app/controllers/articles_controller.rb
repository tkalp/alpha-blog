# articles_controller.rb

class ArticlesController < ApplicationController
    before_action :set_article, only: [:edit, :update, :show, :destroy]

    def show 
        
    end

    def index
        @articles = Article.all
    end 

    def new
        @article = Article.new
    end

    def edit 
        
    end

    def create
        @article = Article.new(params.require(:article).permit(:title, :description))
        if @article.save
            flash[:notice] = "Article was created successfully."
            redirect_to @article 
        else
            if @article.errors.any?
                puts @article.errors.full_messages
            end
            render 'new'
        end
    end

    def update 
        if @article.update(article_params)
            flash[:notice] = "Article was updated successfully."
            redirect_to @article
        else
            flash[:notice] = "Article has errors"
            render "edit"
        end
    end

    def destroy
        @article.destroy
        flash[:notice] = "Article has been deleted."
        redirect_to articles_path
    end

    private 

    def set_article
        @article = Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title, :description)
    end
end