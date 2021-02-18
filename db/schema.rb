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

ActiveRecord::Schema.define(version: 20210218222121) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["slug"], name: "index_categories_on_slug", unique: true
  end

  create_table "category_courses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "check_advantages", force: :cascade do |t|
    t.string "video"
    t.string "e_book"
    t.string "work_book"
    t.string "meditation"
    t.string "conference"
    t.string "member"
    t.string "access_life"
    t.string "assurance"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_check_advantages_on_course_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "price"
    t.string "link_sale"
    t.string "title"
    t.text "description"
    t.text "link_video"
    t.bigint "category_course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "introduction_image_file_name"
    t.string "introduction_image_content_type"
    t.integer "introduction_image_file_size"
    t.datetime "introduction_image_updated_at"
    t.string "firstbutton"
    t.string "secondbutton"
    t.string "title_detail"
    t.string "title_advantage"
    t.text "detail_body"
    t.string "slug"
    t.string "is_active"
    t.integer "order_course"
    t.index ["category_course_id"], name: "index_courses_on_category_course_id"
    t.index ["slug"], name: "index_courses_on_slug", unique: true
  end

  create_table "diaries", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "phone"
    t.string "week"
    t.time "start_time"
    t.time "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "download_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "downloads", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.bigint "download_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "is_active"
    t.integer "order_download"
    t.string "picture_file_name"
    t.string "picture_content_type"
    t.integer "picture_file_size"
    t.datetime "picture_updated_at"
    t.string "slug"
    t.text "lead_frame"
    t.string "first_button"
    t.index ["download_category_id"], name: "index_downloads_on_download_category_id"
  end

  create_table "flags", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "picture_file_name"
    t.string "picture_content_type"
    t.integer "picture_file_size"
    t.datetime "picture_updated_at"
    t.string "link_flag"
    t.string "target_link"
    t.string "link_name"
    t.string "is_active"
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

  create_table "health_insurances", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "picture_file_name"
    t.string "picture_content_type"
    t.integer "picture_file_size"
    t.datetime "picture_updated_at"
  end

  create_table "instagram_links", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "link"
    t.bigint "instagram_page_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["instagram_page_id"], name: "index_instagram_links_on_instagram_page_id"
  end

  create_table "instagram_pages", force: :cascade do |t|
    t.string "title"
    t.string "footer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.date "post_date"
    t.bigint "admin_id"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "picture_file_name"
    t.string "picture_content_type"
    t.integer "picture_file_size"
    t.datetime "picture_updated_at"
    t.string "slug"
    t.index ["admin_id"], name: "index_posts_on_admin_id"
    t.index ["category_id"], name: "index_posts_on_category_id"
    t.index ["slug"], name: "index_posts_on_slug", unique: true
  end

  create_table "professionals", force: :cascade do |t|
    t.string "name"
    t.text "title"
    t.string "number"
    t.text "description"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "picture_file_name"
    t.string "picture_content_type"
    t.integer "picture_file_size"
    t.datetime "picture_updated_at"
  end

  create_table "projects", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "psi_tests", force: :cascade do |t|
    t.string "title"
    t.integer "is_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "picture_file_name"
    t.string "picture_content_type"
    t.integer "picture_file_size"
    t.datetime "picture_updated_at"
    t.text "description"
    t.string "slug"
    t.index ["slug"], name: "index_psi_tests_on_slug", unique: true
  end

  create_table "question_courses", force: :cascade do |t|
    t.string "query"
    t.string "answer"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_question_courses_on_course_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "doubt"
    t.text "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "services", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "picture_file_name"
    t.string "picture_content_type"
    t.integer "picture_file_size"
    t.datetime "picture_updated_at"
  end

  create_table "settings", force: :cascade do |t|
    t.string "email"
    t.string "phone"
    t.string "facebook"
    t.string "instagram"
    t.string "twitter"
    t.string "linkedin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "picture_file_name"
    t.string "picture_content_type"
    t.integer "picture_file_size"
    t.datetime "picture_updated_at"
    t.string "picture_footer_file_name"
    t.string "picture_footer_content_type"
    t.integer "picture_footer_file_size"
    t.datetime "picture_footer_updated_at"
    t.text "privacy_policy"
    t.text "terms_use"
    t.string "youtube"
    t.text "header"
    t.integer "cookie_active"
    t.text "cookie_modal_text"
    t.text "cookie_policy"
  end

  create_table "site_storages", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "annex_file_name"
    t.string "annex_content_type"
    t.integer "annex_file_size"
    t.datetime "annex_updated_at"
  end

  create_table "test_alternatives", force: :cascade do |t|
    t.string "title"
    t.float "rank_point"
    t.bigint "test_question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["test_question_id"], name: "index_test_alternatives_on_test_question_id"
  end

  create_table "test_emails", force: :cascade do |t|
    t.string "email"
    t.bigint "psi_test_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "rank_point"
    t.index ["psi_test_id"], name: "index_test_emails_on_psi_test_id"
  end

  create_table "test_questions", force: :cascade do |t|
    t.string "title"
    t.bigint "psi_test_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["psi_test_id"], name: "index_test_questions_on_psi_test_id"
  end

  create_table "test_results", force: :cascade do |t|
    t.string "condition"
    t.float "rank_point_limit"
    t.text "description"
    t.bigint "psi_test_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["psi_test_id"], name: "index_test_results_on_psi_test_id"
  end

  create_table "testimonials", force: :cascade do |t|
    t.string "name"
    t.text "body"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_testimonials_on_course_id"
  end

  create_table "works", force: :cascade do |t|
    t.string "company"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "check_advantages", "courses"
  add_foreign_key "courses", "category_courses"
  add_foreign_key "downloads", "download_categories"
  add_foreign_key "instagram_links", "instagram_pages"
  add_foreign_key "posts", "admins"
  add_foreign_key "posts", "categories"
  add_foreign_key "question_courses", "courses"
  add_foreign_key "test_alternatives", "test_questions"
  add_foreign_key "test_emails", "psi_tests"
  add_foreign_key "test_questions", "psi_tests"
  add_foreign_key "test_results", "psi_tests"
  add_foreign_key "testimonials", "courses"
end
