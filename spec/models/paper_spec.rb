require 'rails_helper'

RSpec.describe Paper, type: :model do
  it "shouldn't save if no year is given" do
    @paper = FactoryGirl.build(:paper)
    @paper.year = nil
    expect { @paper.save! }.to raise_error ActiveRecord::RecordInvalid
  end

  it "shouldn't save if no year is given" do
    @paper = FactoryGirl.build(:paper)
    @paper.year = "This Year"
    expect { @paper.save! }.to raise_error ActiveRecord::RecordInvalid
  end
end
