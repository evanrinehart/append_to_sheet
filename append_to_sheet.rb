require 'lib'

input = $stdin.read
stuff = JSON.parse input
raise "input not a json object" unless stuff.is_a? Hash
sheet_id = stuff['sheet_id']
rows = stuff['rows']
raise "sheet_id not provided" if sheet_id.nil?
raise "sheet_id not a string" unless sheet_id.is_a? String
raise "rows not provided" if rows.nil?
raise "rows not an array" unless rows.is_a? Array
append(sheet_id, rows)
