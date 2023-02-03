require 'csv'

namespace :csv_load do
  task trails: :environment do
    CSV.foreach('./db/data/colorado_trails.csv', headers: true) do |row|
      Trail.create!(row.to_hash)
    end
    ActiveRecord::Base.connection.reset_pk_sequence!('trails')
  end
end
