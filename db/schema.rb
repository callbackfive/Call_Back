# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_01_23_131835) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "title"
    t.integer "status", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "project_id", null: false
    t.integer "parent_id"
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_comments_on_deleted_at"
    t.index ["project_id"], name: "index_comments_on_project_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "dialogboxes", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["project_id"], name: "index_dialogboxes_on_project_id"
    t.index ["user_id"], name: "index_dialogboxes_on_user_id"
  end

  create_table "fav_projects", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "project_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_fav_projects_on_project_id"
    t.index ["user_id"], name: "index_fav_projects_on_user_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "givebacks", force: :cascade do |t|
    t.string "title"
    t.integer "price"
    t.text "description"
    t.date "deliver_time"
    t.integer "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "project_id"
    t.string "image"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_givebacks_on_deleted_at"
    t.index ["project_id"], name: "index_givebacks_on_project_id"
  end

  create_table "identities", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "provider"
    t.string "uid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_identities_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id", null: false
    t.bigint "dialogbox_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dialogbox_id"], name: "index_messages_on_dialogbox_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "recipient_type", null: false
    t.bigint "recipient_id", null: false
    t.string "type", null: false
    t.jsonb "params"
    t.datetime "read_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["read_at"], name: "index_notifications_on_read_at"
    t.index ["recipient_type", "recipient_id"], name: "index_notifications_on_recipient_type_and_recipient_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "giveback_id"
    t.string "project_title"
    t.datetime "issue_date"
    t.integer "status", default: 0, null: false
    t.string "giveback_title"
    t.integer "giveback_price"
    t.integer "quantity"
    t.string "merchant_order_no"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "full_name"
    t.string "delivery_country"
    t.string "zip"
    t.string "address"
    t.string "phone"
    t.string "email"
    t.string "merchantOrderNo"
    t.string "card_4no"
    t.index ["giveback_id"], name: "index_orders_on_giveback_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "order_id"
    t.string "merchant_order_no"
    t.integer "end_price"
    t.integer "status", default: 0, null: false
    t.datetime "paid_date"
    t.string "payment_type"
    t.string "inst"
    t.string "inst_first"
    t.string "inst_each"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "trade_no"
    t.string "card_4no"
    t.index ["order_id"], name: "index_payments_on_order_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "title"
    t.string "summary"
    t.string "content"
    t.integer "target_amount"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image"
    t.datetime "deleted_at"
    t.integer "status", default: 0
    t.datetime "due_date"
    t.bigint "category_id"
    t.index ["category_id"], name: "index_projects_on_category_id"
    t.index ["deleted_at"], name: "index_projects_on_deleted_at"
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.datetime "birthday"
    t.string "fb_uid"
    t.string "fb_token"
    t.string "image"
    t.datetime "deleted_at"
    t.integer "role", default: 0
    t.string "slug"
    t.index ["deleted_at"], name: "index_users_on_deleted_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["fb_uid"], name: "index_users_on_fb_uid"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["slug"], name: "index_users_on_slug", unique: true
  end

  add_foreign_key "comments", "projects"
  add_foreign_key "comments", "users"
  add_foreign_key "dialogboxes", "projects"
  add_foreign_key "dialogboxes", "users"
  add_foreign_key "fav_projects", "projects"
  add_foreign_key "fav_projects", "users"
  add_foreign_key "givebacks", "projects"
  add_foreign_key "identities", "users"
  add_foreign_key "messages", "dialogboxes"
  add_foreign_key "messages", "users"
  add_foreign_key "projects", "categories"
  add_foreign_key "projects", "users"
end
