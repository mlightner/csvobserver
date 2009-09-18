#!/usr/bin/env ruby

require 'csvobserver'

csv = ObservedCSV.new(require File.dirname(__FILE__) + '/test/data/zip_codes.csv') do |c|
  c.database( ActiveRecord::Base.establish_connection("adapter" => "sqlite", "database"  => File.dirname(__FILE__) + '/test/data/zip_codes.db'  )
  c.columns(*%w{ zip latitude longitude city state county zip_class })
end

