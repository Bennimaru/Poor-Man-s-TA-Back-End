# require 'rest-client'
# require 'json'
# # require 'pry'
# @nyc = []
# @brooklyn = []
# @queens = []
# @staten_island = []
# @bronx = []
#
# def get_library_from_api
#   response_string = RestClient.get('https://data.cityofnewyork.us/resource/feuq-due4.json')
#   response_hash = JSON.parse(response_string)
#   response_hash.each do |library|
#     if library["city"] == "New York"
#       @nyc.push(library)
#     elsif library["city"] ==  "Brooklyn"
#       @brooklyn.push(library)
#     elsif library["borocode"] ==  "4"
#       @queens.push(library)
#     elsif library["city"] ==  "Staten Island"
#       @staten_island.push(library)
#     elsif library["city"] ==  "Bronx"
#       @bronx.push(library)
#     end
#   end
# puts @queens.length
# puts @brooklyn.length
# puts @nyc.length
# puts @bronx.length
# puts @staten_island.length
# end
#
# def test_location
#   library = @brooklyn[0]
#   x = Location.create(name: location["name"] )
#   puts x
# end
#
# def brooklynLocations
#   # puts @brooklyn.sample(2)
#   # x = @brooklyn[0]
#   # y = x["housenum"] + " #{x["streetname"]}," + " Brooklyn," + " NY" + " #{x["zip"]}"
#   # puts y
#   @brooklyn.sample(10).each do |library|
#     Location.create(
#       name: library["name"],
#       address: library["housenum"] + " #{library["streetname"]}," + " Brooklyn," + " NY" + " #{library["zip"]}",
#       borough_id: 2
#      )
#   end
# end
#
#
# get_library_from_api()
# brooklynLocations()
