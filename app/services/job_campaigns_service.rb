class JobCampaignsService < BaseService

  def get_job_campaigns_info
    i = 0
    job_campaigns_info = []
    
    job_basic_info = []
    results = JobCampaign.select(:salary, :work_hour_per_week, :gpa, :location)
    for x in results
      temp = []
      temp.append x.salary
      temp.append x.work_hour_per_week
      temp.append x.gpa
      temp.append x.location
      job_basic_info.append temp
    end

    job_ids = JobCampaign.ids

    job_is_opens = []
    results = []
    JobCampaign.select(:is_open).each do |jc|
      results << jc.is_open == 'yes' ? 0 : 1
    end
    for x in results
      job_is_opens.append(x == 'yes' ? 0 : 1) 
    end

    job_certifications = []
    for x in job_ids
      temp = []
      results = CertificationsCampaign.where(job_campaign_id: x).select(:certification_id)
      for cert in results
        temp.append cert.certification_id
      end
      job_certifications.append temp
    end

    job_languages = []
    for x in job_ids
      temp = []
      results = LanguagesCampaign.where(job_campaign_id: x).select(:language_id)
      for lang in results
        temp.append lang.language_id
      end
      job_languages.append temp
    end

    job_tech_skills = []
    job_tech_skills_priorities = []
    job_tech_skills_levels = []
    for x in job_ids
      temp_tech_skills = []
      temp_tech_skills_priorities = []
      temp_tech_skills_levels = []
      results = TechSkillsCampaign.where(job_campaign_id: x).select(:tech_skill_id, :priority, :level)
      for ts in results
        temp_tech_skills.append ts.read_attribute_before_type_cast :tech_skill_id
        temp_tech_skills_priorities.append ts.read_attribute_before_type_cast :priority
        temp_tech_skills_levels.append ts.read_attribute_before_type_cast :level
      end
      job_tech_skills.append temp_tech_skills
      job_tech_skills_priorities.append temp_tech_skills_priorities
      job_tech_skills_levels.append temp_tech_skills_levels
    end

    while i < job_ids.length
      temp = []
      temp.append job_ids[i]
      temp += job_basic_info[i]
      temp.append job_certifications[i]
      temp.append job_languages[i]
      temp.append job_tech_skills[i]
      temp.append job_tech_skills_priorities[i]
      temp.append job_tech_skills_levels[i]
      temp.append job_is_opens[i]
      job_campaigns_info.append temp
      i += 1
    end

    job_campaigns_info 
  end
  
end