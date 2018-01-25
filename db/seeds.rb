# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
V1::Property.delete_all

property = V1::Property.create!(title: 'example', description: "alkdjlajdjlka adf asdf adsf asfd", post_code: '3073', street_address: "adsfadsfasfd", state: 'adafdadf', user_id: 1)
property.save


property = V1::Property.create!(title: 'example', description: "alkdjlajdjlka adf asdf adsf asfd", post_code: '3073', street_address: "adsfadsfasfd", state: 'adafdadf', user_id: 2)
property.save
