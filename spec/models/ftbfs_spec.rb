# encoding: utf-8

require 'spec_helper'

describe Ftbfs do
  describe 'Associations' do
    it { should belong_to :repository }
    it { should belong_to :maintainer }
  end

  describe 'Validation' do
    it { should validate_presence_of :repository }
    it { should validate_presence_of :maintainer }

    it { should validate_presence_of :name }
    it { should validate_presence_of :version }
    it { should validate_presence_of :release }
    it { should validate_presence_of :weeks }
    it { should validate_presence_of :arch }
  end

  it { should have_db_index :repository_id }
  it { should have_db_index :maintainer_id }
end
