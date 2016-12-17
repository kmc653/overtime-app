@user = User.create(email: "test@gmail.com", password: "asdfasdf",
                    password_confirmation: "asdfasdf", first_name: "kevin", last_name: "Chang")

100.times do |post|
  Post.create(date: Date.today, rationale: "#{post} rationale content", user_id: @user.id)
end

puts "100 Posts have been created"
