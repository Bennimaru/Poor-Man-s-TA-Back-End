# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Borough.create(name: "Bronx")
Borough.create(name: "Brooklyn")
Borough.create(name: "Manhattan")
Borough.create(name: "Queens")
Borough.create(name: "Staten Island")

Location.delete_all

hikingJson = ActiveSupport::JSON.decode(File.read('nycOpenData/dprHiking001.json'))

hikingJson.map do|attribute|
  Location.create!
  ({name: "attribute.name",
   address: "attribute.location",
   description: "attribute.other_details"})
end
