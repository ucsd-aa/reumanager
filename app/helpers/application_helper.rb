# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def check_academic_records
    result = true if current_user && check_academic_record && check_transcript
  end

  def check_academic_record
    result = true if current_user && current_user.academic_record
  end
  
  def check_transcript
    result = true if current_user && current_user.transcript
  end

  def check_recommendor
    result = true if current_user && current_user.recommender
  end

  def check_recommendation
    result = true if current_user && current_user.recommendation
  end

  def check_extras
    result = true if current_user && current_user.extra
  end

  def check_all
    result = true if current_user && check_academic_records && check_transcript && check_recommendor && check_recommendation && check_extras
  end

  def gpa_range
    gpa_range = ["2.5"]
    float = 2.5
    gpa_range << sprintf("%.1f", float += 0.1) while float < 9.9
    return gpa_range
  end
  
end
