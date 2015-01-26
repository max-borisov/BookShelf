# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

CartItem.destroy_all
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
      publisher: 'Pragmatic Bookshelf',
  },
  {
      title: 'PHP',
      author: 'PHP author',
      pub_date: '12/12/2014',
      description: 'Cool book',
      price: 12.12,
      rating: 4,
      isbn: 111223331,
      amazon_id: '1449392776',
      publisher: 'Addison-Wesley Professional',
  },
  {
      title: 'NodeJS',
      author: 'NodeJS author',
      pub_date: '12/12/2014',
      description: 'Cool book',
      price: 12.12,
      rating: nil,
      isbn: 111223331,
      amazon_id: '1449333605',
      publisher: 'Manning Publications',
  },
])

puts("#{Book.count} book(s) have been created.")