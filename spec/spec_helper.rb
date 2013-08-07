require_relative '../lib/catie.rb'

dbconfig = YAML::load(File.open('db/database.yml'))
ActiveRecord::Base.establish_connection(dbconfig)
ActiveRecord::Migrator.up 'db/migrate'