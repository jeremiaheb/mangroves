# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

Animal.delete_all
Animal.connection.execute( 'ALTER SEQUENCE animals_id_seq RESTART WITH 1' )
open("#{Rails.root}/db/SupportData/SpeciesList.csv") do |animals|
  animals.read.each_line do |animal|
    SppCode, ScientificName, CommonName = animal.chomp.split(",")
    Animal.create( :spp_code => SppCode, :scientific_name => ScientificName, :common_name => CommonName )
  end
end

ReferenceSite.delete_all
ReferenceSite.connection.execute( 'ALTER SEQUENCE reference_sites_id_seq RESTART WITH 1' )
open("#{Rails.root}/db/SupportData/refSites.csv") do |animals|
  animals.read.each_line do |animal|
    Name, Lat, Lon, Strata = animal.chomp.split(",")
    ReferenceSite.create( :name => Name, :latitude => Lat, :longitude => Lon, :strata => Strata )
  end
end

BottomType.delete_all
BottomType.connection.execute( 'ALTER SEQUENCE reference_sites_id_seq RESTART WITH 1' )
open("#{Rails.root}/db/SupportData/BottomTypes.csv") do |types|
  types.read.each_line do |type|
    Name, Desc = type.chomp.split(",")
    BottomType.create( :name => Name, :description => Desc )
  end
end
