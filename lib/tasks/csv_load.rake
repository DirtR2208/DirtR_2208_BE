require 'csv'

namespace :csv_load do
  task all: %i[counties trails users]

  task counties: :environment do
    CSV.foreach('./db/data/counties.csv', headers: true) do |row|
      County.find_or_create_by(row.to_hash)
    end
    ActiveRecord::Base.connection.reset_pk_sequence!('counties')
  end

  task trails: :environment do
    CSV.foreach('./db/data/colorado_trails.csv', headers: true) do |row|
      Trail.find_or_create_by(row.to_hash)
    end
    ActiveRecord::Base.connection.reset_pk_sequence!('trails')
  end

  task users: :environment do
    CSV.foreach('./db/data/users.csv', headers: true) do |row|
      User.find_or_create_by(row.to_hash)
    end
    ActiveRecord::Base.connection.reset_pk_sequence!('users')
  end
end
