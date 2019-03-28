# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create({email:'1alsdfjkdja@lsadfjdsl.com'})
user2 = User.create({email:'2alssdkfjkdja@lsasdkfjdsl.com'})
user3 = User.create({email:'3alsfja@lsadsdsl.com'})

ShortenedUrl.create_shortened_url!(user1, 'https://open.appacademy.io/learn/full-stack-in-person-sql/60353147-39e3-44d3-baf7-38622f014d1d')
ShortenedUrl.create_shortened_url!(user2, 'https://apidock.com/rails/ActiveRecord/ConnectionAdapters/SchemaStatements/add_index')
ShortenedUrl.create_shortened_url!(user3, 'https://stackoverflow.com/questions/9869870/how-to-get-a-single-columns-values-into-an-array')
ShortenedUrl.create_shortened_url!(user3, 'https://apidock.com/rails/ActiveRecord/Base/exists%3F/class')
