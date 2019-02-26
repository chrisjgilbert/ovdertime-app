@user = User.create(
  email: 'test@test.com',
  password: 'asdfasdf',
  password_confirmation: 'asdfasdf',
  first_name: 'Jon',
  last_name: 'Doe'
)

100.times do |post|
  Post.create(
    date: Date.today,
    rationale: "#{post} rationale content",
    user_id: @user.id
  )
end
puts '100 posts created...'
