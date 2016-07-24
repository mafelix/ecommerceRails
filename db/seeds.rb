# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# products = 4.times do
#   counter = 0
#   Product.create([{name: 'test', picture: 'http://imgur.com/gallery/PpTqFdG', description: 'test+ #{counter+=1}', price: 15.99}, {name: 'test', picture: 'http://imgur.com/gallery/PpTqFdG', description: 'this is a test#{counter+=1}', price: 30.00}])
# end

OrderStatus.create([{status:"Payment Pending"}, {status: "Payment Received"}, {status: "Process Shipment"}, {status: "Shipped"}])
