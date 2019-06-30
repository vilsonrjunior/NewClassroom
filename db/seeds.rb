# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
USERS = [
  "Peter",
  "Ashwin",
  "Janna",
  "George",
  "Charles",
  "Lorenzo",
  "John",
  "Kane",
  "Yejin",
  "Romain",
  "Joao",
  "Maria",
  "Paulo",
  "Jose",
  "Marina",
  "Mauro",
  "Paula",
  "Elo",
  "Catarina",
  "Dario",
  "Andre",
  "Max",
  "Leticia",
  "Monique",
  "Ester"
]



GRADE = [
"Beginner",
"Pre Intermediate",
"Intermediate",
"Upper Intermediate",
"Advanced"
]

TEACHER = [
"Caio",
  "Sonia",
  "Guido",
  "Eli",
  "Prima"
  ]

# PLACE_PHOTOS = [
  #   "https://cdn.thebalibible.com/uploads/galleries/IMG_1216-lr_1521529204.jpg",

#   "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCOuS2MJ9wepjXwEoCTxsEDimjz7Wxf23a8Ir9b5DKwYeW3lxYKg",
#   "https://static.asiawebdirect.com/m/bangkok/portals/bali-indonesia-com/homepage/magazine/milk-and-madu-cafe/pagePropertiesImage/milk-and-madu.jpg",
#   "https://lonelyplanetwp.imgix.net/2018/10/Nude_03-2f12614ffc35.jpg?fit=min&q=40&sharp=10&vib=20&w=1470",
#   "https://flightstofancy.com/wp-content/uploads/2018/05/The-Loft-Canggu-Shake.png",
#   "https://media-cdn.tripadvisor.com/media/photo-s/0e/96/3d/54/local.jpg",
#   "https://lh3.googleusercontent.com/GRLUFlVaDejJkz9q-F_e4l9YbHrneuscEt0dld5jhNUDpETnbwIeK5f_4SzdY3luc4rYd26E=w1080-h608-p-no-v0",
#   "https://media-cdn.tripadvisor.com/media/photo-s/10/ce/ac/52/the-marathon-breakfast.jpg",
#   "https://cdn.thebalibible.com/uploads/galleries/18801204475879f85e4b57a_Zibiru_Bottega-Italiana_Bali_28.jpg",
#   "https://images.unsplash.com/photo-1485182708500-e8f1f318ba72?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1100&q=60.png",
#   "https://media-cdn.tripadvisor.com/media/photo-s/06/ba/c2/6e/avocado-cafe.jpg"
# ]

p 'deleting previous seeds'

Teacher.delete_all
Student.delete_all
Course.delete_all

p 'deleted seeds'

p '_________________________________'

p 'creating levels'


5.times do |x|
grade = Grade.new(
  name: GRADE[x],
  description: "Sample sample sample"
  )
grade.save!
x += 1
end

p '_______________________________'

p 'creating parents'

x = 0
20.times do
  parent = Parent.new(
        name: Faker::Name.first_name,
        dob: Faker::Date.birthday(25, 50),
        phone: Faker::PhoneNumber.cell_phone_with_country_code,
        email: Faker::Internet.email,
        password: "123456",
        address: Faker::Address.city,
        lat: -28.6775,
        long: -49.36972,
        gender: Faker::Gender.binary_type,
        image: "https://randomuser.me/api/portraits/#{['wo',''].sample}men/#{(0..99).to_a.sample}.jpg"
        # username: Faker::Internet.username,
        # level: LEVEL.sample,
        # course: Course.all.sample,

      )
  # teacher.remote_photo_url = teacher.picture
  parent.save!
  x += 1
end

# create_table "parents", force: :cascade do |t|
#     t.string "email", default: "", null: false
#     t.string "encrypted_password", default: "", null: false
#     t.string "reset_password_token"
#     t.datetime "reset_password_sent_at"
#     t.datetime "remember_created_at"
#     t.integer "sign_in_count", default: 0, null: false
#     t.datetime "current_sign_in_at"
#     t.datetime "last_sign_in_at"
#     t.string "current_sign_in_ip"
#     t.string "last_sign_in_ip"
#     t.string "name"
#     t.date "dob"
#     t.string "phone"
#     t.text "address"
#     t.float "lat"
#     t.float "long"
#     t.string "last_login_ip", default: "127.0.0.1"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.string "gender"
#     t.string "image"
#     t.index ["email"], name: "index_parents_on_email", unique: true
#     t.index ["reset_password_token"], name: "index_parents_on_reset_password_token", unique: true

p '_________________________________'

p 'creating 5 teachers'

x = 0
5.times do
  teacher = Teacher.new(
        name: TEACHER[x],
        dob: Faker::Date.birthday(18, 65),
        image: "https://randomuser.me/api/portraits/#{['wo',''].sample}men/#{(0..99).to_a.sample}.jpg",
        # username: Faker::Internet.username,
        gender: Faker::Gender.binary_type,
        phone: Faker::PhoneNumber.cell_phone_with_country_code,
        email: "#{TEACHER[x]}@test.com",
        password: "123456"
      )
  # teacher.remote_photo_url = teacher.picture
  teacher.save!
  x += 1
end

p '________________________'

p 'creating 20 students'

x = 0
20.times do
  student = Student.new(
        name: USERS[x],
        dob: Faker::Date.birthday(6, 12),
        phone: Faker::PhoneNumber.cell_phone_with_country_code,
        email: "#{USERS[x]}@test.com",
        password: "123456",
        address: Faker::Address.city,
        lat: -28.6775,
        long: -49.36972,
        gender: Faker::Gender.binary_type,
        parent: Parent.all.sample,
        image: "https://randomuser.me/api/portraits/#{['wo',''].sample}men/#{(0..99).to_a.sample}.jpg"
        # username: Faker::Internet.username,
        # level: LEVEL.sample,
        # course: Course.all.sample,

      )
  # teacher.remote_photo_url = teacher.picture
  student.save!
  x += 1
end


# create_table "students", force: :cascade do |t|
#     t.string "email", default: "", null: false
#     t.string "encrypted_password", default: "", null: false
#     t.string "reset_password_token"
#     t.datetime "reset_password_sent_at"
#     t.datetime "remember_created_at"
#     t.integer "sign_in_count", default: 0, null: false
#     t.datetime "current_sign_in_at"
#     t.datetime "last_sign_in_at"
#     t.string "current_sign_in_ip"
#     t.string "last_sign_in_ip"
#     t.string "name"
#     t.date "dob"
#     t.string "phone"
#     t.text "address"
#     t.float "lat"
#     t.float "long"
#     t.string "last_login_ip"
#     t.integer "parent_id"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.string "gender"
#     t.string "image"
#     t.index ["email"], name: "index_students_on_email", unique: true
#     t.index ["parent_id"], name: "index_students_on_parent_id"
#     t.index ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true

p '_________________________'


#

p 'creating 1 admin'

admin = User.new(
        name: "Vilson",
        image: "https://randomuser.me/api/portraits/#{['wo',''].sample}men/#{(0..99).to_a.sample}.jpg",
        # username: Faker::Internet.username,
        # admin: true,
        # language: "English",
        phone: Faker::PhoneNumber.cell_phone_with_country_code,
        email: "vilson@test.com",
        password: "123456"
  )
  admin.save!

  p '____________________'

# create_table "courses", force: :cascade do |t|
#     t.string "name"
#     t.text "description"
#     t.integer "grade_id"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.index ["grade_id"], name: "index_courses_on_grade_id"
#   end

    p 'creating courses'


  x = 0
5.times do
  course = Course.new(
        name: Faker::Book.title,
        # picture: "https://randomuser.me/api/portraits/#{['wo',''].sample}men/#{(0..99).to_a.sample}.jpg",
        # username: Faker::Internet.username,
        description: Faker::Movies::BackToTheFuture.quote,
        grade: Grade.all.sample
        # teacher: Teacher.all.sample,
        # students: Student.all.sample(4)
        # email: "#{USERS[x]}@test.com",
        # password: "123456"
      )
  # teacher.remote_photo_url = teacher.picture
  course.save!
  x += 1
end

p '_________________________'

p 'DONE!'
