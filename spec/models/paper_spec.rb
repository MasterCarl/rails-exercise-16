require 'rails_helper'

RSpec.describe Paper, type: :model do

  before(:each) do
    @paper = FactoryGirl.build(:paper)
  end
  it "shouldn't save if no year is given" do
    @paper.year = nil
    expect { @paper.save! }.to raise_error ActiveRecord::RecordInvalid
  end

  it "shouldn't save if no year is given" do
    @paper.year = "This Year"
    expect { @paper.save! }.to raise_error ActiveRecord::RecordInvalid
  end

  it "should have an empty list of authors by default" do
    expect(@paper.authors).to be_empty
  end
end
