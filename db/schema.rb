# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120601151707) do

  create_table "bugs", :force => true do |t|
    t.integer  "bug_id",       :null => false
    t.string   "bug_status"
    t.string   "resolution"
    t.string   "bug_severity"
    t.string   "product"
    t.string   "component"
    t.string   "assigned_to"
    t.string   "reporter"
    t.string   "short_desc"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "bugs", ["assigned_to"], :name => "index_bugs_on_assigned_to"
  add_index "bugs", ["bug_status"], :name => "index_bugs_on_bug_status"
  add_index "bugs", ["product"], :name => "index_bugs_on_product"

  create_table "ftbfs", :force => true do |t|
    t.string   "name",          :null => false
    t.string   "epoch"
    t.string   "version",       :null => false
    t.string   "release",       :null => false
    t.integer  "weeks",         :null => false
    t.string   "arch",          :null => false
    t.integer  "repository_id", :null => false
    t.integer  "maintainer_id", :null => false
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "ftbfs", ["maintainer_id"], :name => "index_ftbfs_on_maintainer_id"
  add_index "ftbfs", ["repository_id"], :name => "index_ftbfs_on_repository_id"

  create_table "maintainers", :force => true do |t|
    t.string   "name",                          :null => false
    t.string   "email",                         :null => false
    t.string   "login",                         :null => false
    t.string   "time_zone",  :default => "UTC"
    t.string   "jabber",     :default => ""
    t.text     "info",       :default => ""
    t.string   "website",    :default => ""
    t.string   "location",   :default => ""
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "repocops", :force => true do |t|
    t.integer  "repository_id", :null => false
    t.string   "name",          :null => false
    t.string   "version",       :null => false
    t.string   "release",       :null => false
    t.string   "arch",          :null => false
    t.string   "srcname",       :null => false
    t.string   "srcversion",    :null => false
    t.string   "srcrel",        :null => false
    t.string   "testname",      :null => false
    t.string   "status"
    t.text     "message"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "repocops", ["srcname"], :name => "index_repocops_on_srcname"
  add_index "repocops", ["srcrel"], :name => "index_repocops_on_srcrel"
  add_index "repocops", ["srcversion"], :name => "index_repocops_on_srcversion"

  create_table "repositories", :force => true do |t|
    t.string   "name",          :null => false
    t.string   "short_url",     :null => false
    t.string   "vendor",        :null => false
    t.string   "distribution",  :null => false
    t.string   "download_path", :null => false
    t.integer  "order_id",      :null => false
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

end
