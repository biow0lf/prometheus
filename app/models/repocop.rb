# encoding: utf-8

require 'open-uri'

class Repocop < ActiveRecord::Base
  attr_accessible :arch, :message, :name, :release, :repository_id, :srcname, :srcrel, :srcversion, :status, :testname, :version

  belongs_to :repository

  validates :repository, presence: true
  validates :name, presence: true
  validates :version, presence: true
  validates :release, presence: true
  validates :arch, presence: true
  validates :srcname, presence: true
  validates :srcversion, presence: true
  validates :srcrel, presence: true
  validates :testname, presence: true

  def self.update_repocop
    ActiveRecord::Base.transaction do
      Repocop.delete_all

      url = "http://repocop.altlinux.org/pub/repocop/prometeus2/prometeus2.sql"
      file = open(URI.escape(url)).read

      file.each_line do |line|
        ActiveRecord::Base.connection.execute(line)
      end
    end
  end
end
