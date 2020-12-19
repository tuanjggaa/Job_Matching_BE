class CertificationsController < ApplicationController
  before_action :find_certification, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :edit, :destroy]

  def index
    @certifications = Certification.all
  end

  def show
  end

  def new
    @certification = Certification.all.build
  end

  def edit
  end

  def create
    @certification = Certification.all.build(certification_params)

    if @certification.save
      redirect_to certifications_path
    else
      render :new
    end
  end

  def update
    if @certification.update(certification_params)
      redirect_to certifications_path
    else
      render :edit
    end
  end

  def destroy
    @certification.destroy
    redirect_to certifications_path
  end

  private

  def find_certification
    @certification = Certification.find(params[:id])
  end

  def certification_params
    params.require(:certification).permit(:name, :description, :vendor)
  end

end