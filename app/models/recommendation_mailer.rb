class RecommendationMailer < ActionMailer::Base

  def rec_request(remail, id, token, firstname, middlename, lastname, phone, email, citizenship, college, college_start, college_end, college_level, major, gpa, gpa_range, awards, research_experience, gpa_comments, personal_statement)
    @subject    = 'NSF REU Request'
    @recipients = remail
#    @bcc        = 'kristingrevichart@gmail.com'
    @from       = 'nsfreu@bioeng.ucsd.edu'
    @sent_on    = Time.now
    @headers    = {}

    part(
      :content_type => "text/html", 
      :body => render_message("rec_request", 
                              :id => id,
                              :token => token,
                              :firstname => firstname, 
                              :middlename => middlename, 
                              :lastname => lastname, 
                              :phone  => phone, 
                              :email => email,
                              :citizenship => citizenship, 
                              :college => college, 
                              :college_start => college_start, 
                              :college_end => college_end, 
                              :college_level => college_level, 
                              :major => major, 
                              :gpa => gpa, 
                              :gpa_range => gpa_range, 
                              :awards => awards,
                              :research_experience => research_experience,
                              :gpa_comments => gpa_comments,
                              :personal_statement =>personal_statement )
      )
    attachment :content_type => "application/pdf", :filename => "#{id.to_s}_#{lastname}.pdf", :body => File.read("#{RAILS_ROOT}/public/pdf/#{id.to_s}_#{lastname}.pdf")
  end
end