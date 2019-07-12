require 'faker'

User.create(first_name: "Sun", last_name: "Tzu", email: "SunTzu@example.com", password: "password", birthday: Time.at(rand * Time.now.to_i), username: "General")
User.create(first_name: "Sergeant", last_name: "Bough", email: "sb@example.com", password: "password", birthday: Time.at(rand * Time.now.to_i), username: "MarineSgt")

number_of_users = 12

(number_of_users - 2).times do
  first = Faker::Name.first_name
  last = Faker::Name.last_name
  User.create(first_name: first, last_name: last, email: Faker::Internet.email(first), password: "password", birthday: Time.at(rand * Time.now.to_i), username: Faker::Internet.user_name(first + ' ' + last , %w(. _ -)))
end

Post.create(quote: "The mighty lion toys with the mouse that crosses its path least any reaction mar its fierce reputatuion", author: "Robert Greene", user_id: 1)
Post.create(quote: "Eat the things of nature stay away from anything artificial. The body wasn't made to eat these things.", author: "Chris Bough", user_id: 2)

number_of_posts = number_of_users * 50

number_of_posts.times do
  Post.create(quote: Faker::Lorem.sentence, author: Faker::Name.name_with_middle, user_id: 1 + rand(number_of_users))
end

Tag.create(content: "physical training")
Tag.create(content: "combatmindset")
Tag.create(content: "honor")
Tag.create(content: "commitment")
Tag.create(content: "1shot1kill")
Tag.create(content: "adapt")
Tag.create(content: "courage")

number_of_tags = 7

Tagging.create(post_id: 1, tag_id: 1)
Tagging.create(post_id: 1, tag_id: 2)
Tagging.create(post_id: 2, tag_id: 1)
Tagging.create(post_id: 2, tag_id: 3)

(number_of_posts * 3).times do
  random_post_id = 1 + rand(number_of_posts)
  random_tag_id = 1 + rand(number_of_tags)
  if Tagging.find_by(post_id: random_post_id, tag_id: random_tag_id) == nil
    Tagging.create(post_id: random_post_id, tag_id: random_tag_id)
  end
end
