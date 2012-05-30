class Repository < ActiveRecord::Base
  attr_accessible :distribution, :download_path, :name, :order_id, :short_url, :vendor

  # e.g. 'Sisyphus' or 'Fedora 17'
  validates :name, presence: true

  # e.g. 'sisyphus' or 'f17'
  # used in urls
  validates :short_url, presence: true

  # e.g. 'ALT Linux Team' or 'Fedora Project'
  validates :vendor, presence: true

  # e.g. 'ALT Linux' or 'Fedora Project'
  validates :distribution, presence: true

  # e.g. '/Sisyphus'
  validates :download_path, presence: true

  # e.g. 0, 1.
  # order of repositories
  validates :order_id, presence: true


#   has_many :srpms
#   has_many :packages
#   has_many :groups
#   has_many :leaders
#   has_many :teams
#   has_many :mirrors
#   has_many :patches
#   has_many :ftbfs, class_name: "Ftbfs"
#   has_many :repocops
#   has_many :repocop_patches

  def to_param
    name
  end
end
