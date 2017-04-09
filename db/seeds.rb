# Add seed data here. Seed your database with `rake db:seed`
sophie = Owner.create(name: "Sophie")
Pet.create(name: "Maddy", owner: sophie)
Pet.create(name: "Nona", owner: sophie)

bob = Owner.create(name: "Bob")
Pet.create(name: "Frank", owner: bob)
Pet.create(name: "Celeste", owner: bob)
