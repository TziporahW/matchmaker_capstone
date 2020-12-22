
  enable_extension "plpgsql"

  create_table "matches", force: :cascade do |t|
    t.integer "girl_id"
    t.integer "boy_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.string "gender"
    t.string "birthday"
    t.string "address"
    t.string "phone_number"
    t.string "currently_doing"
    t.text "education"
    t.text "references"
    t.text "additional_info"
    t.boolean "admin", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
