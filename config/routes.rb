Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "students#job_board"

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  scope "/admin" do
    resources :languages
    resources :certifications
    resources :category_tech_skills
    resources :tech_skills
    
    resources :users
    resources :students
    resources :companies
  end

  scope "/company" do
    resources :job_campaigns do
      member do
        get 'match_students'
        put 'reject_student/:student_id', to: 'job_campaigns#reject_student', as: :reject_student
      end
    end
    get ':id/edit_profile', to: 'companies#edit', as: 'company_edit_profile'
    get ':id/profile', to: 'companies#view_profile', as: 'company_profile'
  end
  # put 'reject_student/:id', to: 'job_campaigns_students#reject_student'

  scope "/student" do
    get ':id/my_cv', to: 'students#edit', as: 'student_cv'
    get ':id/preview_cv', to: 'students#preview_cv', as: 'preview_cv'
    get 'job_board', to: 'students#job_board', as: 'student_job_board'
    get 'matched_jobs', to: 'job_campaigns#match_job_campaigns', as: 'match_job_campaigns'
  end
  
  get 'admin/job_campaigns', to: 'job_campaigns#admin_manage', as: 'admin_manage_job_campaigns'
  get 'job_campaigns/:id/preview', to: 'job_campaigns#preview_campaign', as: 'preview_campaign'
end