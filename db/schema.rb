ActiveRecord::Schema.define(version: 2021_05_09_114905) do

  enable_extension "plpgsql"

  create_table "tasks", force: :cascade do |t|
    t.string "title", null: false
    t.text "detail", null: false
    t.datetime "created_at"
  end

end
