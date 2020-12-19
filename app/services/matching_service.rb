class MatchingService < BaseService

  def match_operation
    job_campaigns_info = JobCampaignsService.new.get_job_campaigns_info
    students_info = StudentsService.new.get_students_info
    delete_records
    matchs_info = match_students_to_campaigns job_campaigns_info, students_info
    add_records matchs_info
  end

  def match_students_to_campaigns job_campaigns_info, students_info
    matchs_info = []
    for job_entry in job_campaigns_info
      next if job_entry[10] == 1
      for student_entry in students_info
        if job_entry[4] == student_entry[4] # entry 4 = location
          point = 0
          if student_entry[1]
            point += 1 if job_entry[1] - 1 <= student_entry[1] && student_entry[1] <= job_entry[1] + 1 # salary
          end
          if student_entry[2]
            point += 1 if student_entry[2] >= job_entry[2] - 8 # work hours
          end
          if student_entry[3]
            if student_entry[3] >= job_entry[3] # GPA
              point += 0.75
            elsif student_entry[3] >= job_entry[3] - 1
              point += 0.5
            end
          end
          for cert in job_entry[5] # cert
            point += 1 if student_entry[5].include? cert
          end
          for language in job_entry[6] # language
            point += 0.75 if student_entry[6].include? language
          end
          i = 0
          for skill in job_entry[7]
            if student_entry[7].include? skill
              point += 1
              point += 1 if job_entry[8][i] == 2
              point += 0.5 if job_entry[8][i] == 1
              if job_entry[9][i] > student_entry[8][student_entry[7].index(skill)]
                point -= 0.25
              else
                point += 0.25
              end
            end
            i += 1
          end
          temp_match = []
          temp_match.append job_entry[0]
          temp_match.append student_entry[0]
          temp_match.append point
          matchs_info.append temp_match
        end
      end
    end
    matchs_info
  end

  def delete_records
    JobCampaignsStudent.delete_all
  end

  def add_records matchs_info
    for x in matchs_info
      JobCampaignsStudent.create(
        job_campaign_id: x[0],
        student_id: x[1],
        point: x[2],
        status: 'matched'                      
      )
    end
  end

end
