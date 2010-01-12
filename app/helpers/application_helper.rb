# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def toggle_wait_box
    link_to_function("OK", nil, :id => "OK", :class => "padded button") do |page|
      page[:wait_box].toggle
    end
  end
  
  def dynamic_title
    case
    when params[:controller] == "welcome"
      return "<title>UC San Diego, Department of Bioengineering | NSF Research Experience for Undergraduates (NSFREU)</title>"
    when params[:controller] == "projects"
      return "<title>UCSD NSF Research Experience for Undergraduates ::: Projects</title>"
    when params[:controller] == "users" || params[:controller] == "academic_records" || params[:controller] == "extras" || params[:controller] == "recommenders" 
      return "<title>UCSD NSF Research Experience for Undergraduates ::: Application</title>"    
    end
  end
  
  def check_admin
    current_user.id == 1
  end
  
  def check_academic_records
    result = true if current_user && check_academic_record && check_transcript
  end

  def check_academic_record
    result = true if current_user && current_user.academic_record
  end
  
  def check_transcript
    result = true if current_user && current_user.transcript && current_user.transcript.valid?
  end
  
  def check_pdf
    unless current_user.transcript.content_type == "application/pdf" || current_user.transcript.content_type == "application/octet-stream"
      "<p><strong>Your transcript does not appear to be in the PDF format. Please double check your file or perhaps try a different browser and/or computer.</strong></p>"
    else
      nil
    end
  end

  def check_recommender
    result = true if current_user && current_user.recommender
  end

  def check_recommendation
    result = true if current_user && current_user.recommendation
  end

  def check_extras
    result = true if current_user && current_user.extra
  end

  def check_all
    result = true if current_user && check_academic_records && check_recommender && check_extras
  end

  def gpa_range
    gpa_range = ["2.0"]
    float = 2.0
    gpa_range << sprintf("%.1f", float += 0.1) while float < 9.9
    return gpa_range
  end

end
