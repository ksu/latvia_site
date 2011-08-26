require 'spec_helper'

describe Question do

  def reset_question(options = {})
    @valid_attributes = {
      :id => 1,
      :title => "RSpec is great for testing too"
    }

    @question.destroy! if @question
    @question = Question.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_question
  end

  context "validations" do
    
    it "rejects empty title" do
      Question.new(@valid_attributes.merge(:title => "")).should_not be_valid
    end

    it "rejects non unique title" do
      # as one gets created before each spec by reset_question
      Question.new(@valid_attributes).should_not be_valid
    end
    
  end

end