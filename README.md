# README
## Model : tasks

* t.string "title"
* t.text "detail"
* t.string "user"
* t.string "status"
* t.string "priority"
* t.datetime "limit"
* t.datetime "created_at", null: false
* t.datetime "updated_at", null: false

## Model : labels

* t.string "label_title"
* t.integer "task_id"
* t.datetime "created_at", null: false
* t.datetime "updated_at", null: false


## Model : user

* t.string "name"
* t.string "email"
* t.string "password_digest"
* t.datetime "created_at", null: false
* t.datetime "updated_at", null: false
<<<<<<< HEAD

<!-- ------------------------------------------------------------------ -->
#Hou to Heroku Deploy
=======
<!-- -------------------------------------------------------------------- -->

#How to Heroku Deploy
>>>>>>> d45627e1b638b32b497e92a40b980116205073e9

* heroku create
* rails assets:precompile RAILS_ENV=production
* git add -A
* git commit -m "init"
* heroku buildpacks:set heroku/ruby
* heroku buildpacks:add --index 1 heroku/nodejs
<<<<<<< HEAD
* git push heroku master
=======
* it push heroku master
>>>>>>> d45627e1b638b32b497e92a40b980116205073e9
* heroku run rails db:migrate
