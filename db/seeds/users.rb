User.create!([
    {
        id: 1,
        name: 'Tom',
        email: 'tom@gmail.com',
        password: '111111',
        password_confirmation: '111111',
        activated: true,
        activated_at: Time.zone.now,
        admin: false
    },
    {
        id: 2,
        name: 'Jack',
        email: 'jack@gmail.com',
        password: '111111',
        password_confirmation: '111111',
        activated: true,
        activated_at: Time.zone.now,
        admin: false
    },
    {
        id: 3,
        name: 'Matt',
        email: 'matt@gmail.com',
        password: '111111',
        password_confirmation: '111111',
        activated: true,
        activated_at: Time.zone.now,
        admin: true
    },
    {
        id: 4,
        name: 'Nick',
        email: 'nick@gmail.com',
        password: '111111',
        password_confirmation: '111111',
        activated: true,
        activated_at: Time.zone.now,
        admin: false
    },
    {
        id: 5,
        name: 'Jeff',
        email: 'jeff@gmail.com',
        password: '111111',
        password_confirmation: '111111',
        activated: true,
        activated_at: Time.zone.now,
        admin: false
    },
    {
        id: 6,
        name: 'Ophra',
        email: 'ophra@gmail.com',
        password: '111111',
        password_confirmation: '111111',
        activated: true,
        activated_at: Time.zone.now,
        admin: false
    },
    {
        id: 7,
        name: 'Ketty',
        email: 'ketty@gmail.com',
        password: '111111',
        password_confirmation: '111111',
        activated: true,
        activated_at: Time.zone.now,
        admin: false
    },
    {
        id: 8,
        name: 'Kim',
        email: 'kim@gmail.com',
        password: '111111',
        password_confirmation: '111111',
        activated: true,
        activated_at: Time.zone.now,
        admin: false
    },
    {
        id: 9,
        name: 'Th',
        email: 'th@gmail.com',
        password: '111111',
        password_confirmation: '111111',
        activated: true,
        activated_at: Time.zone.now,
        admin: false
    },
    {
        id: 10,
        name: 'Dan',
        email: 'dan@gmail.com',
        password: '111111',
        password_confirmation: '111111',
        activated: true,
        activated_at: Time.zone.now,
        admin: false
    }
])
puts("#{User.count} user(s) have been created.")
