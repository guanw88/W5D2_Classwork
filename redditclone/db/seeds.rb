# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create(username: "user1", password:"password")
user2 = User.create(username: "user2", password:"password")

sub1 = Sub.create(title: "Cats", description: "Lots of cats", moderator_id: user1.id)
sub2 = Sub.create(title: "Dogs", description: "Lots of dogs", moderator_id: user2.id)

post1 = Post.create(title: "It's a dog!", url: "dogs.com", content: "yay dogs", sub_id: sub2.id, author_id: user1.id)
post2 = Post.create(title: "It's dog 2!", url: "dogs.com/2", content: "yay more dogs", sub_id: sub2.id, author_id: user1.id)
