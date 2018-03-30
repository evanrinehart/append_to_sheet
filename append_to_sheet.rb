require_relative 'lib'

input = $stdin.read
stuff = JSON.parse input
raise "input not a json object" unless stuff.is_a? Hash
sheet_id = stuff['sheet_id']
row = stuff['row']
raise "sheet_id not provided" if sheet_id.nil?
raise "sheet_id not a string" unless sheet_id.is_a? String
raise "row not provided" if row.nil?
raise "row not an array" unless row.is_a? Array
append(sheet_id, row)
