class CategoriesController < ApplicationController
    before_action :require_login, only: [:new, :create]
    before_action :get_category, only: :show

    def index
        @categories = Category.order(:name)
    end

    def show
        @activities = @category.activities.order(:name)
    end

    def new
        @category = Category.new
    end

    def create
        @category = Category.create(strong_cat_params)

        if @category.valid?
            redirect_to category_path(@category)
        else
            render :new
        end
    end

    private

    def get_category
        @category = Category.find(params[:id])
    end

    def strong_cat_params
        params.require(:category).permit(:name)
    end


end
