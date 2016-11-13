require 'rails_helper'

RSpec.describe Author, type: :model do
  before(:each) do
    @author = FactoryGirl.build(:author)
  end
  it "should have an empty list of papers by default" do
    expect(@author.papers).to be_empty
  end
end
