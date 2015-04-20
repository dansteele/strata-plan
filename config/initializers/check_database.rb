# def parse file_path
#   data = SmarterCSV.process(file_path)
#   data.each do |d|
#     Airport.create(d)
#   end
# end

# def migrated?
#   Object.const_get(:Airport).is_a?(Class) rescue false 
# end

# if migrated? && Airport.count < 3
#   parse "lib/data/airports.csv"
# end