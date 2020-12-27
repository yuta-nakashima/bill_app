class CompaniesController < ApplicationController
  before_action :user_signed_in?

  def index
  end

  def show
  end

  def new
    @company = Company.new
    @companies = Company.all
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to new_company_path
    else
      render :new
    end
  end

  private

  def company_params
    params.require(:company).permit(:company_name)
  end

end
