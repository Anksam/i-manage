class IncomeCategoriesController < ApplicationController
  before_action :set_income_category, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :check_user, only: [:edit, :update, :destroy]

  def index
    @income_categories = IncomeCategory.where(user: current_user)
  end

  def show
  end

  def new
    @income_category = IncomeCategory.new
  end

  def edit
  end

  def create
    @income_category = IncomeCategory.new(income_category_params)
    @income_category.user_id = current_user.id

    if @income_category.save
      redirect_to @income_category, notice: 'Income category was successfully created.'
    else
      render :new
    end
  end

  def update
    if @income_category.update(income_category_params)
      redirect_to @income_category, notice: 'Income category was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @income_category.destroy
    redirect_to income_categories_url, notice: 'Income category was successfully destroyed.'
  end

  private

    def set_income_category
      @income_category = IncomeCategory.find(params[:id])
    end

    def income_category_params
      params.require(:income_category).permit(:category_name, :description)
    end

    def check_user
      if @income_category.user_id != current_user.id
        redirect_to root_url, alert: "Sorry, you are not authorized."
      end
    end

end
