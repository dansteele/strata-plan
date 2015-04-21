# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
def parse file_path
  data = SmarterCSV.process(file_path)
  data.each do |d|
    Airport.create(d)
  end
end

Airport.transaction do
  parse "lib/data/airports.csv"
end