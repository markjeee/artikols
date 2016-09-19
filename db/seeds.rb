# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


seed = [ ]

seed << {
  name: 'matz',
  fullname: 'Mateusz Kubis',
  articles: [
    {  name: 'Macbook Pro 13',
       price: '$1500',
       description: 'Latest model macbook pro' },
    {  name: 'iPhone 6s',
       price: '$700',
       description: 'Latest model smartphone' },
    {  name: 'Kindle White',
       price: '$400',
       description: 'First kindle with paper white screen' },
    {  name: 'Sennheiser HD201',
       price: '$400',
       description: 'Basic over-ear headphones' }
  ]
}


seed << {
  name: 'alex',
  fullname: 'Alexander Small',
  articles: [
    {  name: 'iMac 27',
       price: '$1800',
       description: 'Latest model iMac with 27-inch screen' },
    {  name: 'iPhone 7',
       price: '$800',
       description: 'Newest on pre-order smartphone' },
    {  name: 'Airpods',
       price: '$200',
       description: 'Wireless headphones from Apple' }
  ]
}

seed << {
  name: 'jonas',
  fullname: 'Jonas Chelbat',
  articles: [
    {  name: 'Mac Pro',
       price: '$2500',
       description: 'Super serious rig for working' },
    {  name: 'Nexus 7',
       price: '$600',
       description: "Google's endless attempt to compete with iPhone" },
    {  name: 'Beats',
       price: '$50',
       description: 'Looks cool, but not so good sound quality' }
  ]
}

seed.each do |oinfo|
  owner = Owner.create!({ name: oinfo[:name], fullname: oinfo[:fullname] })

  oinfo[:articles].each do |ainfo|
    owner.articles.create(ainfo)
  end
end
