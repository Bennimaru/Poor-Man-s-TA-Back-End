# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Location.delete_all
Borough.delete_all

Borough.create(name: "Bronx")
Borough.create(name: "Brooklyn")
Borough.create(name: "Manhattan")
Borough.create(name: "Queens")
Borough.create(name: "Staten Island")

hikingJson = ActiveSupport::JSON.decode(File.read('/Users/flatironschool/Poor-Man-s-TA-Back-End/db/nyc_open_data/DPR_Hiking_001.json'))

hikingJson.map do|attribute|
  Location.create({
   name: attribute["Name"],
   address: attribute["Location"],
   description: attribute["Other_Details"]
   })
end
