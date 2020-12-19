class CompaniesController < ApplicationController
  before_action :find_company, only: [:update, :view_profile]
  before_action :find_company_by_user, only: [:edit]

  def view_profile
  end

  def show
  end

  def edit
  end

  def update
    if @company.update(company_params)
      redirect_to company_profile_path(current_user.company)
    else
      render :edit
    end
  end

  private

  def find_company
    @company = Company.find(params[:id])
  end

  def find_company_by_user
    @company = User.find(params[:id]).company
  end

  def company_params
    params.require(:company).permit(:name,
                                    :logo,
                                    :headline,
                                    :expertise,
                                    :description,
                                    :address,
                                    :phone,
                                    :working_hour,
                                    :country,
                                    :benefit,
                                    :company_size,
                                    :tax_identification_number,
                                    :user_id
    )
  end
end
