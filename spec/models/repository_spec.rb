# encoding: utf-8

require 'spec_helper'

describe Repository do
  describe 'Validation' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :short_url }
    it { should validate_presence_of :vendor }
    it { should validate_presence_of :distribution }
    it { should validate_presence_of :download_path }
    it { should validate_presence_of :order_id }
  end

  describe 'Associations' do
  #   it { should have_many :srpms }
  #   it { should have_many :packages }
  #   it { should have_many :groups }
  #   it { should have_many :leaders }
  #   it { should have_many :teams }
  #   it { should have_many :mirrors }
  #   it { should have_many :patches }
    it { should have_many :ftbfs }
    it { should have_many :repocops }
  #   it { should have_many :repocop_patches }
  end

  it "should return Repository.name on .to_param" do
    repository = FactoryGirl.build(:sisyphus_repository)
    repository.to_param.should == 'Sisyphus'
  end
end
