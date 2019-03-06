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

Borough.delete_all
Location.delete_all

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
  @bronx.sample(10).each do |library|
    Location.create(
      name: library["name"],
      address: library["housenum"] + " #{library["streetname"]}," + " Bronx," + " NY" + " #{library["zip"]}",
      borough_id: 1
    )
  end
end

def brooklynLocations
  @brooklyn.sample(10).each do |library|
    Location.create(
      name: library["name"],
      address: library["housenum"] + " #{library["streetname"]}," + " Brooklyn," + " NY" + " #{library["zip"]}",
      borough_id: 2
     )
  end
end


def manhattanLocations
  @manhattan.sample(10).each do |library|
    Location.create(
      name: library["name"],
      address: library["housenum"] + " #{library["streetname"]}," + " Manhattan," + " NY" + " #{library["zip"]}",
      borough_id: 3
     )
  end
end

def queensLocations
  @queens.sample(10).each do |library|
    Location.create(
      name: library["name"],
      address: library["housenum"] + " #{library["streetname"]}," + " #{library["city"]}," + " NY" + " #{library["zip"]}",
      borough_id: 4
     )
  end
end


def statenIslandLocations
  @staten_island.sample(10).each do |library|
    Location.create(
      name: library["name"],
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
