# frozen_string_literal: true

class ExpensesController < ApplicationController
  before_action :find_group, :set_user

  def new
    @expense = Expense.new
  end

  def create
    unless @group.author == @user
      return redirect_to groups_path, notice: 'You can only create expenses from your categories'
    end

    if expense_params[:group_ids].length == 1
      return redirect_to new_group_expense_path(@group), alert: 'Category is mandatory'
    end

    @expense = Expense.new(expense_params)
    @expense.author = @user

    if @expense.save
      flash[:notice] = 'Transaction created successfully'
      @redirect_group = Group.find(expense_params[:group_ids].at(1))
      redirect_to @redirect_group
    else
      flash[:alert] = @expense.errors.full_messages.first if @expense.errors.any?
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = current_user
  end

  def expense_params
    params.require(:expense).permit(:name, :amount, group_ids: [])
  end

  def find_group
    @group = Group.find(params[:group_id])
  end
end
