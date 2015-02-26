admin = User.find_by_email("strongtie.vn@gmail.com")
unless admin
  admin = User.create(
    email: "strongtie.vn@gmail.com",
    first_name: "strongtie",
    last_name: "vn",
    password: "password",
    password_confirmation: "password",
    admin: true
  )
end

user = User.find_by_email("user@user.com")
unless user
  user = User.create(
    email: "user@user.com",
    first_name: "user",
    last_name: "vn",
    password: "password",
    password_confirmation: "password",
    admin: false
  )
end

State.create(name: "New") unless State.find_by_name("New")
State.create(name: "In Progress") unless State.find_by_name("In Progress")
State.create(name: "Completed") unless State.find_by_name("Completed")