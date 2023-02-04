# require 'csv'

# namespace :csv_load do
    # task all: % i[counties trails]

    #task counties: :environment do
    # CSV.foreach('./db/data/locations.csv', headers: true) do |row|
    #   County.create!(row.to_hash)
    # end
    # ActiveRecord::Base.connection.reset_pk_sequence!('counties')
    #end

#   task trails: :environment do
#     CSV.foreach('./db/data/colorado_trails.csv', headers: true) do |row|
#       Trail.create!(row.to_hash)
#     end
#     ActiveRecord::Base.connection.reset_pk_sequence!('trails')
#   end
# end
