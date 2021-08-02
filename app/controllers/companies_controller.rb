class CompaniesController < ApplicationController
  before_action :set_company, only: [:edit, :update]

  def new
    @company = Company.new
    authorize(@company)
  end

  def create
    @company = Company.new(company_params)
    authorize(@company)

    respond_to do |format|
      if @company.save
        format.html { redirect_to(settings_path, success: 'Company was successfully created.') }
      else
        format.html { redirect_to(settings_path, flash: { error: 'Error creating company. Please try again.' }) }
      end
    end
  end

  def edit
    authorize(@company)
  end

  def update
    authorize(@company)

    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to(settings_path, notice: 'Company was successfully updated.') }
      else
        format.html { redirect_to(settings_path, flash: { error: 'Error updating company. Please try again.' }) }
      end
    end
  end

  private

  def set_company
    @company = Company.find_by(id: params[:id])
  end

  def company_params
    params.require(:company).permit(:name, :brand, :title, :welcome_page_heading, :welcome_page_subheading)
  end
end
