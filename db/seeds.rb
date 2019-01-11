# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

SubventionRequest.destroy_all
Subvention.destroy_all

Subvention.create!({
    name: 'Subvention des activités sportives',
    start_date: '1/10/2018',
    end_date: '31/12/2018',
    amount: 9000,
    photo: "https://vignette.wikia.nocookie.net/phobia/images/a/ab/Sports2.jpg"
  })

Subvention.create!({
    name: 'Subvention des activités culturelles',
    start_date: '1/09/2018',
    end_date: '31/12/2018',
    amount: 12000,
    photo: "http://www.ile-perrot.qc.ca/wp-content/uploads/2015/10/Culture3-e1466096429335.jpg"
  })

Subvention.create!( {
    name: 'Subvention rentrée scolaire',
    start_date: '15/08/2018',
    end_date: '30/09/2018',
    amount: 6000,
    photo: "http://www.beuzeville.fr/wp-content/uploads/2018/06/allocation-rentree-scolaire-prime-caf-23.jpg"
  })

Subvention.create!({
    name: 'Subvention des affaires de toilettes pour chat et chien',
    start_date: '15/10/2018',
    end_date: '15/02/2019',
    amount: 1700,
    photo: "http://www.architectes-garin-keller-fourmies.fr/image/cache/data/category_53/peignoir-de-bain-pour-chat-chien-absorption-de-l-eau-serviette-de-toilette-a-sechag-6922-500x500_0.jpg"
  })

Subvention.create!({
    name: 'Subvention père noël',
    start_date: '10/12/2018',
    end_date: '23/12/2019',
    amount: 18000,
    photo: "https://www.enfant.com/assets/posts/0000/276-age-ou-l-enfant-croit-au-pere-noel.jpg"
  })
