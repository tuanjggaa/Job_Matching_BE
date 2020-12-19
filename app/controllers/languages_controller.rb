class LanguagesController < ApplicationController
  before_action :find_language, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :edit, :destroy]

  def index
    @languages = Language.all
  end

  def show
  end

  def new
    @language = Language.all.build
  end

  def edit
  end

  def create
    @language = Language.all.build(language_params)

    if @language.save
      redirect_to languages_path
    else
      render :new
    end
  end

  def update
    if @language.update(language_params)
      redirect_to languages_path
    else
      render :edit
    end
  end

  def destroy
    @language.destroy
    redirect_to languages_path
  end

  private

  def find_language
    @language = Language.find(params[:id])
  end

  def language_params
    params.require(:language).permit(:name, :code)
  end
end
