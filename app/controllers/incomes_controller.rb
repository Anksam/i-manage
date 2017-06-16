class IncomesController < ApplicationController
  before_action :set_income, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @incomes = Income.all
  end

  def show
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
      redirect_to @income, notice: 'Income was successfully created.'
    else
      render :new
    end
  end

  def update
    if @income.update(income_params)
      redirect_to @income, notice: 'Income was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @income.destroy
    redirect_to incomes_url, notice: 'Income was successfully destroyed.'
  end

  private

    def set_income
      @income = Income.find(params[:id])
    end

    def income_params
      params.require(:income).permit(:amount)
    end

end
