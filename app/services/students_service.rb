class StudentsService < BaseService

  def get_students_info
    i = 0
    students_info = []

    student_basic_info = []
    results = Student.select(:expected_salary, :day_per_week, :gpa, :location)
    for x in results
      temp = []
      temp.append x.expected_salary
      temp.append x.day_per_week * 8
      temp.append x.gpa
      temp.append x.location
      student_basic_info.append temp
    end

    student_ids = Student.ids

    student_certifications = []
    for x in student_ids
      temp = []
      results = CertificationsStudent.where(student_id: x).select(:certification_id)
      for cert in results
        temp.append cert.certification_id
      end
      student_certifications.append temp
    end

    student_languages = []
    for x in student_ids
      temp = []
      results = LanguagesStudent.where(student_id: x).select(:language_id)
      for lang in results
        temp.append lang.language_id
      end
      student_languages.append temp
    end

    student_tech_skills = []
    student_tech_skills_levels = []
    for x in student_ids
      temp_tech_skills = []
      temp_tech_skills_levels = []
      results = TechSkillsStudent.where(student_id: x).select(:tech_skill_id, :level)
      for ts in results
        temp_tech_skills.append ts.read_attribute_before_type_cast :tech_skill_id
        temp_tech_skills_levels.append ts.read_attribute_before_type_cast :level
      end
      student_tech_skills.append temp_tech_skills
      student_tech_skills_levels.append temp_tech_skills_levels
    end

    while i < student_ids.length
      temp = []
      temp.append student_ids[i]
      temp += student_basic_info[i]
      temp.append student_certifications[i]
      temp.append student_languages[i]
      temp.append student_tech_skills[i]
      temp.append student_tech_skills_levels[i]
      students_info.append temp
      i += 1
    end

    students_info
  end

end