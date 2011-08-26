class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :find_all_questions
  
  protected

    def find_all_questions
      @questions = Question.order('position ASC')
    end
  
end
