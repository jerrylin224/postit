class CategoriesController < ApplicationController
  before_action :require_user, only: [:new, :create]
  before_action :require_admin, only: [:new, :create]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def show
    @category = Category.find_by slug: params[:id]
  end

  def create

    @category = Category.new(category_params)
    if @category.already_exist?
      flash[:error] = 'Category name can\'t be duplicated'
      redirect_to root_path 
    elsif @category.save
      flash[:notice] = 'Category name has been saved!'
      redirect_to root_path 
    else
      render 'new'
    end
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end
end