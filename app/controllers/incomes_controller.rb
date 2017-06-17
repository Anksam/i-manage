class IncomesController < ApplicationController
  before_action :set_income, only: [:edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :check_user, only: [:edit, :update, :destroy]

  def index
    @incomes = Income.where(user: current_user)
  end

  def new
    @income = Income.new
  end

  def edit
  end

  def create
    @income = Income.new(income_params)
    @income.user_id = current_user.id

    if @income.save
      redirect_to incomes_path, notice: 'Income was successfully created.'
    else
      render :new
    end
  end

  def update
    if @income.update(income_params)
      redirect_to incomes_path, notice: 'Income was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @income.destroy
    redirect_to incomes_path, notice: 'Income was successfully destroyed.'
  end

  private

    def set_income
      @income = Income.find(params[:id])
    end

    def income_params
      params.require(:income).permit(:amount, :category_id, :date)
    end

    def check_user
      if @income.user_id != current_user.id
        redirect_to root_url, alert: "Sorry, you are not authorized."
      end
    end

end
