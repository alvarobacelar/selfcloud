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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170621152016) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clouds", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "api_key"
    t.string   "cloud_type"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "access_key_id"
    t.string   "secret_access_key"
  end

  create_table "servers", force: :cascade do |t|
    t.string   "label"
    t.integer  "datacenterid"
    t.integer  "planid"
    t.integer  "paymentterm"
    t.string   "lpm_displaygroup"
    t.integer  "cloud_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "distributionvendor"
    t.integer  "linodeid"
    t.integer  "totalhd"
    t.integer  "backupweeklyday"
    t.integer  "backupwindow"
    t.integer  "totalram"
    t.integer  "status"
    t.integer  "backupenabled"
    t.string   "ipaddress_public"
    t.integer  "ipaddress_private"
    t.string   "rdns_name"
    t.integer  "watchdog"
    t.integer  "alert_bwquota_enabled"
    t.integer  "alert_diskio_threshold"
    t.integer  "alert_bwout_enabled"
    t.integer  "alert_bwout_threshold"
    t.integer  "alert_bwin_threshold"
    t.integer  "alert_bwquota_threshold"
    t.integer  "alert_cpu_enabled"
    t.integer  "alert_cpu_threshold"
    t.integer  "alert_diskio_enabled"
    t.integer  "alert_bwin_enabled"
    t.integer  "isxen"
    t.integer  "iskvm"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "nome"
    t.string   "perfil"
    t.boolean  "ativo"
    t.index ["email"], name: "index_usuarios_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true, using: :btree
  end

end
