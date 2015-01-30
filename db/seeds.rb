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
      id: 1,
      title: 'Ruby',
      author: 'Ruby author',
      pub_date: '12/12/2014',
      description: 'Cool book',
      price: 12.12,
      isbn: 111223331,
      amazon_id: '1941222196',
      publisher: 'Pragmatic Bookshelf',
  },
  {
      id: 2,
      title: 'PHP',
      author: 'PHP author',
      pub_date: '12/12/2014',
      description: 'Cool book',
      price: 12.12,
      isbn: 111223331,
      amazon_id: '1449392776',
      publisher: 'Addison-Wesley Professional',
  },
  {
      id: 3,
      title: 'NodeJS',
      author: 'NodeJS author',
      pub_date: '12/12/2014',
      description: 'Cool book',
      price: 12.12,
      isbn: 111223331,
      amazon_id: '1449333605',
      publisher: 'Manning Publications',
  },
])
puts("#{Book.count} book(s) have been created.")

User.destroy(4) if User.exists?(4)
User.destroy(5) if User.exists?(5)
User.create!([
    {
        id: 4,
        name: 'Tom',
        email: 'tom@gmail.com',
        password: '111111',
        password_confirmation: '111111',
    },
    {
        id: 5,
        name: 'Jack',
        email: 'jack@gmail.com',
        password: '111111',
        password_confirmation: '111111',
    }
])
puts("#{User.count} user(s) have been created.")

Review.destroy_all
Review.create!([
    {
        text: "Stop reading whatever book you were reading and get this book ASAP. It is the most comprehensive book with a lot of topics, a lot of code snippets that explain the theory in hand very well and in fact they also show best practices when writing JS code! I've tried two other books and some video courses, but none of them come even close to this book. Remember to practice as much of the code examples, only skip them when you are certain you know what's going on. Best of luck!",
        user_id: 3,
        book_id: 1,
    },
    {
        text: "I am an intermediate coder, mainly fluent in Java and PHP. A couple years ago, in order to step up my game, I started teaching myself Javascript and learning about Node. After exhausting so many resources online and quickly tiring of clicking link after link, I recently started to search for a book with everything I need to further my Node knowledge in one place and in a discernible order. Practical Node.js is that book.",
        user_id: 3,
        book_id: 2,
    },
    {
        text: "After going through many books I finally found the best and comprehensive resource to learn the node.js software development. Azat has really done a great work and compiled a great book which really help you in getting complete knowledge about the exciting technology. I read this book and really found it amazing without any doubt. Due to this book my concepts got improved and I started finding the way towards production level software programming. It would have been impossible without the help of this book and that is the reason I am thankful to the author and research team.",
        user_id: 4,
        book_id: 3,
    },
    {
        text: 'NodeJS book review',
        user_id: 5,
        book_id: 1,
    }
])
puts("#{Review.count} reviews(s) have been created.")
