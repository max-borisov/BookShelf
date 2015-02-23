Review.create!([
    {
        text: "Stop reading whatever book you were reading and get this book ASAP. It is the most comprehensive book with a lot of topics, a lot of code snippets that explain the theory in hand very well and in fact they also show best practices when writing JS code! I've tried two other books and some video courses, but none of them come even close to this book. Remember to practice as much of the code examples, only skip them when you are certain you know what's going on. Best of luck!",
        user_id: 1,
        book_id: 1,
    },
    {
        text: "I am an intermediate coder, mainly fluent in Java and PHP. A couple years ago, in order to step up my game, I started teaching myself Javascript and learning about Node. After exhausting so many resources online and quickly tiring of clicking link after link, I recently started to search for a book with everything I need to further my Node knowledge in one place and in a discernible order. Practical Node.js is that book.",
        user_id: 1,
        book_id: 1,
    },
    {
        text: "After going through many books I finally found the best and comprehensive resource to learn the node.js software development. Azat has really done a great work and compiled a great book which really help you in getting complete knowledge about the exciting technology. I read this book and really found it amazing without any doubt. Due to this book my concepts got improved and I started finding the way towards production level software programming. It would have been impossible without the help of this book and that is the reason I am thankful to the author and research team.",
        user_id: 2,
        book_id: 1,
    },
    {
        text: 'NodeJS book review',
        user_id: 2,
        book_id: 1,
    },
    {
        text: "After going through many books I finally found the best and comprehensive resource to learn the node.js software development. Azat has really done a great work and compiled a great book which really help you in getting complete knowledge about the exciting technology. I read this book and really found it amazing without any doubt. Due to this book my concepts got improved and I started finding the way towards production level software programming. It would have been impossible without the help of this book and that is the reason I am thankful to the author and research team.",
        user_id: 5,
        book_id: 2,
    },
    {
        text: "After going through many books I finally found the best and comprehensive resource to learn the node.js software development. Azat has really done a great work and compiled a great book which really help you in getting complete knowledge about the exciting technology. I read this book and really found it amazing without any doubt. Due to this book my concepts got improved and I started finding the way towards production level software programming. It would have been impossible without the help of this book and that is the reason I am thankful to the author and research team.",
        user_id: 5,
        book_id: 3,
    },
    {
        text: "After going through many books I finally found the best and comprehensive resource to learn the node.js software development. Azat has really done a great work and compiled a great book which really help you in getting complete knowledge about the exciting technology. I read this book and really found it amazing without any doubt. Due to this book my concepts got improved and I started finding the way towards production level software programming. It would have been impossible without the help of this book and that is the reason I am thankful to the author and research team.",
        user_id: 8,
        book_id: 3,
    },
])
puts("#{Review.count} reviews(s) have been created.")
