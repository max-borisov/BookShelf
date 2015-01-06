# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Book.destroy_all

Book.create!([
  {
      title: 'Ruby',
      author: 'Ruby author',
      pub_date: '12/12/2014',
      description: 'Cool book',
      price: 12.12,
      rating: 4,
      isbn: 111223331,
      amazon_id: '1941222196',
  },
  {
      title: 'PHP',
      author: 'PHP author',
      pub_date: '12/12/2014',
      description: 'Cool book',
      price: 12.12,
      rating: 4,
      isbn: 111223331,
      amazon_id: '1617291692',
  },
  {
      title: 'NodeJS',
      author: 'NodeJS author',
      pub_date: '12/12/2014',
      description: 'Cool book',
      price: 12.12,
      rating: 4,
      isbn: 111223331,
      amazon_id: '0321944275',
  },
])

puts("#{Book.count} book(s) have been created.")