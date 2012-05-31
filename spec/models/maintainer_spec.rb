# encoding: utf-8

require 'spec_helper'

describe Maintainer do
  # describe 'Associations' do
  #   it { should have_one :leader }
  #   it { should have_many :teams }
  #   it { should have_many :gears }
  #   it { should have_many :ftbfs }
  #   it { should have_many :repocops }
  # end

  describe 'Validation' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
    it { should validate_presence_of :login }

    describe 'uniqueness of fields' do
      before(:all) { @maintainer = FactoryGirl.create(:maintainer_icesik) }

      it { should validate_uniqueness_of :email }
      it { should validate_uniqueness_of :login }

      after(:all) { @maintainer.destroy }
    end
  end

  it "should return Maintainer.login on .to_param" do
  	FactoryGirl.build(:maintainer_icesik).to_param.should == 'icesik'
  end

  describe 'deny change some attributes' do
      before(:all) { @maintainer = FactoryGirl.create(:maintainer_icesik) }

      it 'should deny change email' do
        @maintainer.email = 'ldv@altlinux.org'
        @maintainer.save.should be_false
      end

      it 'should deny change login' do
        @maintainer.login = 'ldv'
        @maintainer.save.should be_false
      end

      it 'should deny change name' do
        @maintainer.name = 'Dmitry V. Levin'
        @maintainer.save.should be_false
      end

      after(:all) { @maintainer.destroy }
  end

  describe '.login_exists?' do
      before(:all) { @maintainer = FactoryGirl.create(:maintainer_icesik) }

      it "should return true if Maintainer exists" do
        Maintainer.login_exists?('icesik').should be_true
      end

      it "should return false if Maintainer not exists" do
        Maintainer.login_exists?('ice').should be_false
      end

      it "should downcase login before checking for exists" do
        Maintainer.login_exists?('ICESIK').should be_true
      end

      after(:all) { @maintainer.destroy }
  end

  # # TODO: move Maintainer team info in MaintainerTeam model with all stuff
  # it "should return true if Maintainer team exists" do
  #   maintainer = Maintainer.create!(name: 'Ruby Maintainers Team',
  #                                   email: 'ruby@packages.altlinux.org',
  #                                   login: 'ruby',
  #                                   team: true)
  #   Maintainer.team_exists?('ruby').should be_true
  # end

  # # TODO: move Maintainer team info in MaintainerTeam model with all stuff
  # it "should return false if Maintainer team not exists" do
  #   Maintainer.team_exists?('non_exists_team').should be_false
  # end

  # it "should create one Maintainer" do
  #   expect{
  #     Maintainer.import('Igor Zubkov <icesik@altlinux.org>')
  #     }.to change{ Maintainer.where(team: false).count }.from(0).to(1)
  # end

  # it "should not create Maintainer if Maintainer already exists" do
  #   Maintainer.import('Igor Zubkov <icesik@altlinux.org>')
  #   expect{
  #     Maintainer.import('Igor Zubkov <icesik@altlinux.org>')
  #     }.to_not change{ Maintainer.where(team: false).count }.from(1).to(2)
  # end

  # # TODO: move Maintainer team info in MaintainerTeam model with all stuff
  # it "should create one Maintainer team" do
  #   expect{
  #     Maintainer.import('Ruby Maintainers Team <ruby@packages.altlinux.org>')
  #     }.to change{ Maintainer.where(team: true).count }.from(0).to(1)
  # end

  # # TODO: move Maintainer team info in MaintainerTeam model with all stuff
  # it "should create one Maintainer team" do
  #   Maintainer.import('Ruby Maintainers Team <ruby@packages.altlinux.org>')
  #   expect{
  #     Maintainer.import('Ruby Maintainers Team <ruby@packages.altlinux.org>')
  #     }.to_not change{ Maintainer.where(team: true).count }.from(1).to(2)
  # end
end
