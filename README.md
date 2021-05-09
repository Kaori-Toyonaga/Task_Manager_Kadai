# README

Model : tasks

t.string "title"
t.text "detail"
t.string "user"
t.string "status"
t.string "priority"
t.datetime "limit"
t.datetime "created_at", null: false
t.datetime "updated_at", null: false

Model : labels

t.string "label_title"
t.integer "task_id"
t.datetime "created_at", null: false
t.datetime "updated_at", null: false


Model : user

t.string "name"
t.string "email"
t.string "password_digest"
t.datetime "created_at", null: false
t.datetime "updated_at", null: false
