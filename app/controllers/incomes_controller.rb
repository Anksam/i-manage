class IncomesController < ApplicationController
  before_action :set_income, only: [:edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :check_user, only: [:edit, :update, :destroy]

  def index
    if params[:income_category].blank?
     @incomes = Income.where(user: current_user).order("date DESC")
   else
     @category_id = IncomeCategory.find_by(user: current_user, category_name: params[:income_category]).id
     @incomes = Income.where(user: current_user, category_id: @category_id).order("date DESC")
   end
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
      @income.tasks.create!(user_id: current_user.id, amount: @income.amount, date: @income.date)
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
