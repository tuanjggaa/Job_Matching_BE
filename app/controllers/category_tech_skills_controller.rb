class CategoryTechSkillsController < ApplicationController
  before_action :find_category_tech_skill, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :edit, :destroy]

  def index
    @category_tech_skills = CategoryTechSkill.all
  end

  def show
  end

  def new
    @category_tech_skill = CategoryTechSkill.all.build
  end

  def edit
  end

  def create
    @category_tech_skill = CategoryTechSkill.all.build(category_tech_skill_params)

    if @category_tech_skill.save
      redirect_to category_tech_skills_path
    else
      render :new
    end
  end

  def update
    if @category_tech_skill.update(category_tech_skill_params)
      redirect_to category_tech_skills_path
    else
      render :edit
    end
  end

  def destroy
    @category_tech_skill.destroy
    redirect_to category_tech_skills_path
  end

  private

  def find_category_tech_skill
    @category_tech_skill = CategoryTechSkill.find(params[:id])
  end

  def category_tech_skill_params
    params.require(:category_tech_skill).permit(:name, :description)
  end

end
