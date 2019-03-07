# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require 'rest-client'
# require_relative "../lib/api_communicator.rb"
require 'rest-client'
require 'json'

# Borough.delete_all
# Location.delete_all

Borough.create(name: "Bronx")
Borough.create(name: "Brooklyn")
Borough.create(name: "Manhattan")
Borough.create(name: "Queens")
Borough.create(name: "Staten Island")

@manhattan = []
@brooklyn = []
@queens = []
@staten_island = []
@bronx = []

def get_library_from_api
  response_string = RestClient.get('https://data.cityofnewyork.us/resource/feuq-due4.json')
  response_hash = JSON.parse(response_string)
  response_hash.each do |library|
    if library["city"] == "New York"
      @manhattan.push(library)
    elsif library["city"] ==  "Brooklyn"
      @brooklyn.push(library)
    elsif library["borocode"] ==  "4"
      @queens.push(library)
    elsif library["city"] ==  "Staten Island"
      @staten_island.push(library)
    elsif library["city"] ==  "Bronx"
      @bronx.push(library)
    end
  end
end


def bronxLocations
  @bronx.first(10).each do |library|
    Location.create(
      name: library["name"] + " Library",
      address: library["housenum"] + " #{library["streetname"]}," + " Bronx," + " NY" + " #{library["zip"]}",
      borough_id: 1
    )
  end
end

def brooklynLocations
  @brooklyn.first(10).each do |library|
    Location.create(
      name: "#{library["name"]} Library",
      address: library["housenum"] + " #{library["streetname"]}," + " Brooklyn," + " NY" + " #{library["zip"]}",
      borough_id: 2
     )
  end
end


def manhattanLocations
  @manhattan.first(10).each do |library|
    Location.create(
      name: library["name"] + " Library",
      address: library["housenum"] + " #{library["streetname"]}," + " Manhattan," + " NY" + " #{library["zip"]}",
      borough_id: 3
     )
  end
end

def queensLocations
  @queens.first(10).each do |library|
    Location.create(
      name: library["name"] + " Library",
      address: library["housenum"] + " #{library["streetname"]}," + " #{library["city"]}," + " NY" + " #{library["zip"]}",
      borough_id: 4
     )
  end
end


def statenIslandLocations
  @staten_island.first(10).each do |library|
    Location.create(
      name: library["name"] + " Library",
      address: library["housenum"] + " #{library["streetname"]}," + " Staten Island," + " NY" + " #{library["zip"]}",
      borough_id: 5
     )
  end
end

get_library_from_api()
brooklynLocations()
bronxLocations()
statenIslandLocations()
queensLocations()
manhattanLocations()

@imageArr = ["https://www.bklynlibrary.org/sites/default/files/images/Arlington-5.jpg", "https://www.bklynlibrary.org/sites/default/files/images/Bay%20Ridge-9.jpg", "https://www.bklynlibrary.org/sites/default/files/images/Bedford_interior-1.jpg", "https://s3-media4.fl.yelpcdn.com/bphoto/5QdWhve0CY_ZxIugD9EUxg/o.jpg", "https://www.bklynlibrary.org/sites/default/files/images/Brighten%20Beach-7.jpg", "https://scontent-lga3-1.xx.fbcdn.net/v/t31.0-8/20017808_1210436485729108_3301818236586590376_o.jpg?_nc_cat=108&_nc_ht=scontent-lga3-1.xx&oh=0b986e6292a8ea975c5a291dfd4e4380&oe=5D1CC090", "https://www.bklynlibrary.org/sites/default/files/images/Brower%20Park-9.jpg", "https://www.bklynlibrary.org/sites/default/files/images/Brownsville-11.jpg", "https://www.bklynlibrary.org/sites/default/files/images/Bushwick-30.jpg", "https://scontent-lga3-1.xx.fbcdn.net/v/t31.0-8/29982840_581544052203407_6673149033808571441_o.jpg?_nc_cat=101&_nc_ht=scontent-lga3-1.xx&oh=722dae5d191b2fc3ffb6caf4f45e4fe6&oe=5CDBDBE7", "https://www.nypl.org/sites/default/files/images/locations/7/FullSizeRender23.jpg", "https://www.nypl.org/sites/default/files/images/locations/9/interior_baychester-5680_0.jpg", "https://www.nypl.org/sites/default/files/images/locations/10/interior_belmont-6468_0.jpg", "https://www.nypl.org/sites/default/files/images/locations/12/interior_blc-4408_0.jpg", "https://www.nypl.org/sites/default/files/images/locations/13/interior_castlehill-5826_0.jpg", "https://www.nypl.org/sites/default/files/images/locations/16/interior_cityisland-7097_0.jpg", "https://www.nypl.org/sites/default/files/images/locations/17/interior_clasonpoint-5869_0.jpg", "https://www.nypl.org/sites/default/files/images/locations/22/interior_eastchester-5644_0.jpg", "https://www.nypl.org/sites/default/files/images/locations/23/interior_edenwald-5611_0.jpg", "https://www.nypl.org/sites/default/files/images/locations/26/exterior_francismartin-6448.jpg", "https://www.nypl.org/sites/default/files/images/locations/20/interior_dongan_hills_7856.jpg", "https://www.nypl.org/sites/default/files/images/locations/29/exterior_great_kills__7983.jpg", "https://www.nypl.org/sites/default/files/images/locations/35/interior_hugenot-5208.jpg", "https://www.nypl.org/sites/default/files/images/locations/7892/interior_mariners_harbor_7294_0.jpg", "https://www.nypl.org/sites/default/files/images/locations/54/interior_newdorp-5297_0.jpg", "https://www.nypl.org/sites/default/files/images/locations/59/interior_portrichmond-5402_0.jpg", "https://www.nypl.org/sites/default/files/images/locations/60/interior_richmondtown-5234_0.jpg", "https://www.nypl.org/sites/default/files/images/locations/69/Branch%20Front%20Ren.jpg", "https://www.nypl.org/sites/default/files/images/locations/72/interior_stgeorge-5447_0.jpg", "https://www.nypl.org/sites/default/files/images/locations/73/interior_Stapleton_6248.jpg", "https://s3-media4.fl.yelpcdn.com/bphoto/hGlm-kwdv6Ii7msqWwlWgg/o.jpg", "https://scontent-lga3-1.xx.fbcdn.net/v/t1.0-0/c0.3.200.200a/p200x200/41113226_2038449612865769_3871748451377086464_n.jpg?_nc_cat=106&_nc_ht=scontent-lga3-1.xx&oh=9d60ca5ed59dd3aac68ce848c845c3e1&oe=5D1C3A1D", "https://s3-media2.fl.yelpcdn.com/bphoto/BKua705whwDgbYDl51M_PQ/o.jpg", "https://bluesyemre.files.wordpress.com/2017/08/baisley-park-library-queens-public-library-1970.jpg", "http://www.queenslibrary.org/sites/default/files/Bay_Terrace.jpg", "https://wplsite.com/wp-content/uploads/2017/07/bayside_4_940-400-1-750x450.jpg", "http://m.queenslibrary.org/sites/default/files/branch_images/bellerose.png", "https://s3-media1.fl.yelpcdn.com/bphoto/0IKaxAlBMk8q6QlaSptwaQ/ls.jpg", "https://s3-media1.fl.yelpcdn.com/bphoto/JJUHsir5O0TuRcIAdIhnnQ/o.jpg", "https://s3-media3.fl.yelpcdn.com/bphoto/e7Mw8-_WdunaU_GrYx7urg/180s.jpg", "https://www.nypl.org/sites/default/files/images/locations/1/interior_115-6949_0.jpg", "https://www.nypl.org/sites/default/files/images/locations/2/interior_125th_201410202.jpg", "https://www.nypl.org/sites/default/files/53rd_2016_06_24_interior-01578-320px.jpg", "https://www.nypl.org/sites/default/files/images/locations/3/exterior_58th-7253_0.jpg", "https://www.nypl.org/sites/default/files/images/locations/4/interior_67th-7224.jpg", "https://www.nypl.org/sites/default/files/images/locations/5/interior_96th-7171.jpg", "https://www.nypl.org/sites/default/files/images/locations/6/exterior_aguilar-7153.jpg", "https://www.nypl.org/sites/default/files/images/locations/8/exterior_andrew_heiskell-19.jpg", "https://www.nypl.org/sites/default/files/images/locations/2787/interior_batteryparkcity-7418.jpg", "https://www.nypl.org/sites/default/files/images/locations/11/interior_bloomingdale-7555_0.jpg"]


def updateLibraries
  findCounter = 1
  @imageArr.each do |url|
    if findCounter < 51
      Location.update(findCounter, :image => "#{url}")
    end
    findCounter += 1
  end
end

updateLibraries()
