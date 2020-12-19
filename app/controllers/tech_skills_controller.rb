class TechSkillsController < ApplicationController
  before_action :find_tech_skill, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :edit, :destroy]

  def index
    @tech_skills = TechSkill.all
  end

  def show
  end

  def new
    @tech_skill = TechSkill.all.build
  end

  def edit
  end

  def create
    @tech_skill = TechSkill.all.build(tech_skill_params)

    if @tech_skill.save
      redirect_to tech_skills_path
    else
      render :new
    end
  end

  def update
    if @tech_skill.update(tech_skill_params)
      redirect_to tech_skills_path
    else
      render :edit
    end
  end

  def destroy
    @tech_skill.destroy
    redirect_to tech_skills_path
  end

  private

  def find_tech_skill
    @tech_skill = TechSkill.find(params[:id])
  end

  def tech_skill_params
    params.require(:tech_skill).permit(:name,
                                      :description,
                                      :category_tech_skill_id
    )
  end

end
