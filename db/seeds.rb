# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: "Chicago" }, { name: "Copenhagen" }])
#   Mayor.create(name: "Emanuel", city: cities.first)

# Seed the RottenPotatoes DB with some movies.

#Movie.send(:attr_accessible, :title, :rating, :release_date)

g    = Rating.create! label: 'G'
pg   = Rating.create! label: 'PG'
pg13 = Rating.create! label: 'PG-13'
r    = Rating.create! label: 'R'
Rating.create! label: 'NC-17'

[{title:        'Aladdin',
  rating:       g,
  release_date: '25-Nov-1992'},

 {title:        'When Harry Met Sally',
  rating:       r,
  release_date: '21-Jul-1989'},

 {title:        'The Help',
  rating:       pg13,
  release_date: '10-Aug-2011'},

 {title:        'Raiders of the Lost Ark',
  rating:       pg,
  release_date: '12-Jun-1981'},

 {title:        'Inception',
  rating:       pg,
  release_date: '16-July-2010'}]
.each { |params|
  Movie.create! params
}
