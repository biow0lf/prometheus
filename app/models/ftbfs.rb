# encoding: utf-8

class Ftbfs < ActiveRecord::Base
  attr_accessible :arch, :epoch, :maintainer_id, :name, :release, :version, :weeks, :repository_id

  belongs_to :repository
  belongs_to :maintainer

  validates :repository, presence: true
  validates :maintainer, presence: true

  validates :name, presence: true
  validates :version, presence: true
  validates :release, presence: true
  validates :weeks, presence: true
  validates :arch, presence: true

  # def self.update_ftbfs(vendor_name, branch_name, url, arch)
  #   branch = Branch.where(vendor: vendor_name, name: branch_name).first
  #   file = open(URI.escape(url)).read
  #   file.each_line do |line|
  #     name = line.split[0]
  #     evr = line.split[1]
  #     weeks = line.split[2]
  #     if evr[/:/]
  #       epoch = evr.split(':')[0] if evr[/:/]
  #       version, release = evr.split(':')[1].split('-')
  #     else
  #       epoch = nil
  #       version, release = evr.split('-')
  #     end
  #     acls = line.split[3]
  #     acls.split(',').each do |acl|
  #       team = if acl[0] == '@'
  #         true
  #       else
  #         false
  #       end
  #       acl = 'php-coder' if acl == 'php_coder'
  #       maintainer = Maintainer.where(login: acl, team: team).first
  #       Ftbfs.create!(name: name, epoch: epoch, version: version,
  #                     release: release, weeks: weeks, branch: branch,
  #                     arch: arch, maintainer: maintainer) if maintainer
  #     end
  #   end
  # end
end
