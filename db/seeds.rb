# encoding: UTF-8

require 'csv'

puts "Importing italian regions, provinces and comunes..."
file_path = ItalianCapCodes::Engine.root.join('db', 'seeds', 'seed_file.txt')

puts "Warning: this will reset the content of the following tables:"
puts " #{ ItalianCapCodes::Region.table_name}"
puts " #{ ItalianCapCodes::Province.table_name}"
puts " #{ ItalianCapCodes::Comune.table_name}"

print "Do you want to continue? (y/n) > "
response = STDIN.gets.chomp

exit unless response.downcase == "y"

ItalianCapCodes::Region.delete_all
ItalianCapCodes::Province.delete_all
ItalianCapCodes::Comune.delete_all

CSV.foreach(file_path, col_sep: ';') do |row|

  comune_istat_code   = row[0]
  comune_name         = row[1]
  province_short_name = row[2]
  province_full_name  = row[3]
  region_short_name   = row[4]
  region_full_name    = row[5]
  comune_phone_prefix = row[6]
  comune_cap          = row[7]
  comune_fiscal_code  = row[8]

	# Find or create the region containing the province and the comune
	region = ItalianCapCodes::Region.where(
    full_name: region_full_name
  ).first_or_create(
    full_name: region_full_name,
    short_name: region_short_name
  )

  # Find or create the province containing the comune
  province = region.provinces.where(
    full_name: province_full_name, 
  ).first_or_create(
    full_name: province_full_name, 
    short_name: province_short_name
  ) 

  # Create the comune
  comune = province.comunes.create(
    :post_code    => comune_cap,
    :fiscal_code  => comune_fiscal_code,
    :istat_code   => comune_istat_code,
    :name         => comune_name,
    :phone_prefix => comune_phone_prefix,
    :fiscal_code  => comune_fiscal_code
  )

  p "Comune #{comune.name} added to province #{province_short_name} and region #{region_short_name}"
end
puts "--> Done"


