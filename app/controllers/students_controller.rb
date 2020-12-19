class StudentsController < ApplicationController
  before_action :find_student, only: [:update]
  before_action :find_student_by_user, only: [:edit, :preview_cv]

  def preview_cv
    @languages = []

    @student.languages.each do |stud|
      @languages << stud.name
    end

    @certifications = @student.certifications_students
    @tech_skills = @student.tech_skills_students
  end

  def job_board
    @open_job_campaigns = JobCampaign.includes(:company).yes.order('created_at DESC')
  end

  def show
  end

  def edit
    @languages = @student.languages
    @certifications = @student.certifications
    @tech_skills = TechSkill.all
  end

  def update
    if @student.update(student_params)
      redirect_to student_job_board_path
    else
      # @tech_skills = TechSkill.all
      # render :edit, collection: @tech_skills
      redirect_to student_cv_path(@student)
    end
  end

  private

  def find_student
    @student = Student.find(params[:id])
  end

  def find_student_by_user
    @student = User.find(params[:id]).student
  end

  def student_params
    params.require(:student).permit(:name,
                                    :avatar,
                                    :school,
                                    :information,
                                    :soft_skill_description,
                                    :gpa,
                                    :location,
                                    :expected_salary,
                                    :working_experience,
                                    :school_year,
                                    :is_open,
                                    :day_per_week,
                                    :user_id,
                                    { :language_ids => [] },
                                    { :certification_ids => [] },
                                    { :tech_skills_ids => [] },
                                    tech_skills_students_attributes: [ :id, :tech_skill_id, :level, :_destroy ]
    )
  end
end
