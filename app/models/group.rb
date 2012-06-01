# encoding: utf-8

class Group < ActiveRecord::Base
  attr_accessible :name, :repository_id, :parent_id, :lft, :rgt

  acts_as_nested_set
  # translates :name

  belongs_to :repository

  validates :repository, :presence => true
  validates :name, :presence => true

  # has_many :srpms
  # has_many :packages

  def full_name
    full = self.name
    parent = self.parent
    while parent
      full = "#{parent.name}/#{full}"
      parent = parent.parent
    end
    full
  end

  # def self.find_groups_in_sisyphus
  #   find_by_sql("SELECT COUNT(srpms.name) AS counter, groups.name
  #                FROM srpms, groups, branches
  #                WHERE groups.branch_id = branches.id
  #                AND branches.name = 'Sisyphus'
  #                AND branches.vendor = 'ALT Linux'
  #                AND srpms.group_id = groups.id
  #                AND srpms.branch_id = branches.id
  #                GROUP BY groups.name
  #                ORDER BY groups.name")
  # end

  def self.import(repository, full_group)
    prev_id = nil
    full_group.split('/').each_with_index  do |item, index|
      group = Group.where(:repository_id => repository.id, :parent_id => prev_id, :name => item).first
      unless group
        group = Group.create(:repository_id => repository.id, :name => item, :parent_id => prev_id)
      end
      prev_id = group.id
    end
  end

  def self.in_repository(repository, full_group)
    prev_id = nil
    group = nil
    full_group.split('/').each  do |item|
      group = Group.where(:repository_id => repository.id, :parent_id => prev_id, :name => item).first
      prev_id = group.id
    end
    group
  end
end
