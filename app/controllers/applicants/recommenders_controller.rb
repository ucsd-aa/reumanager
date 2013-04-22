class Applicants::RecommendersController < ApplicationController
  before_filter :authenticate_applicant!
  before_filter :instantiate_applicant
  
  def edit
    if @applicant.recommenders.count == 0
      @applicant.recommenders.build
    end
    
    render :edit
  end

  def update
    # check to see if recommender_attribs correlates to an existing recommender(s)    
    recommender_data = Recommender.remove_exisitng_recommenders_from_params(params[:applicant][:recommenders_attributes])
   
    
    # add existing recommenders to applicant
    unless recommender_data[0].empty?
      recommender_data[0].map do |r| 
        @applicant.recommenders << r unless @applicant.recommenders.include?(r)
      end
    end
    if recommender_data[1]
      params[:applicant][:recommenders_attributes] = recommender_data[1]
      if @applicant.update_attributes(params[:applicant])
        redirect_to applicants_recommenders_url
      else
        render :edit
      end
    else
      redirect_to applicants_recommenders_url
    end
  end
  
  private
  
  def instantiate_applicant
    @applicant = current_applicant
  end

end