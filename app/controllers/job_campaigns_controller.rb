class JobCampaignsController < ApplicationController
  before_action :find_job_campaign, only: [:preview_campaign, :match_students, :reject_student, :show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :edit, :destroy]

  def admin_manage
    @job_campaigns = JobCampaign.all.includes(:company)
    MatchingService.new.match_operation
  end

  def preview_campaign
    @languages = []

    @job_campaign.languages.each do |lang|
      @languages << lang.name
    end

    @certifications = @job_campaign.certifications_campaigns
    @tech_skills = @job_campaign.tech_skills_campaigns
  end

  def match_students
    students = []
    # MatchingService.new.match_operation
    JobCampaignsStudent.includes(:student).where(job_campaign_id: @job_campaign).matched.each { |jc| students << jc.student_id }
    @students = Student.includes(:user).limit(50).where(id: students).order("RAND()")
  end

  def match_job_campaigns
    job_campaigns = []
    # MatchingService.new.match_operation
    JobCampaignsStudent.includes(:job_campaign).where(student_id: current_user.student.id).each { |jc| job_campaigns << jc.job_campaign_id }
    @job_campaigns = JobCampaign.where(id: job_campaigns)
    # byebug
  end

  def reject_student
    JobCampaignsStudent.find_by(job_campaign_id: @job_campaign, student_id: params[:student_id]).rejected!
    redirect_to match_students_job_campaign_path(@job_campaign)
  end

  def index
    @job_campaigns = current_user.company.job_campaigns
  end

  def show
  end

  def new
    @job_campaign = current_user.company.job_campaigns.build
    @tech_skills = TechSkill.all
  end

  def edit
    @tech_skills = TechSkill.all
  end

  def create
    @job_campaign = current_user.company.job_campaigns.build(job_campaign_params)

    if @job_campaign.save
      redirect_to job_campaigns_path
    else
      render :new
    end
  end

  def update
    if @job_campaign.update(job_campaign_params)
      redirect_to job_campaigns_path
    else
      @tech_skills = TechSkill.all
      render :edit, collection: @tech_skills
    end
  end

  def destroy
    @job_campaign.destroy
    if current_user.admin?
      redirect_to admin_manage_job_campaigns_path
    else
      redirect_to job_campaigns_path
    end
  end

  private

  def find_job_campaign
    @job_campaign = JobCampaign.find(params[:id])
  end

  def job_campaign_params
    params.require(:job_campaign).permit(:title,
                                        :salary,
                                        :work_hour_per_week,
                                        :gpa,
                                        :is_open,
                                        :location,
                                        :quantity,
                                        :description,
                                        :min_intern_month,
                                        :skill_level,
                                        :company_id,
                                        { :language_ids => [] },
                                        { :certification_ids => [] },
                                        { :tech_skill_ids => [] },
                                        tech_skills_campaigns_attributes: [ :id, :tech_skill_id, :priority, :level, :_destroy ]
    )
  end
end
