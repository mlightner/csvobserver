require 'activerecord'

class ObservedCSV

  # The ActiveRecord database connection object
  attr_accessor :connection

  # The CSV file
  attr_accessor :csv_file

  # The columns in the csv file
  attr_accessor :columns

  def initialize(csvfile)
    @csv_file = csvfile
    @connection = nil
    yield(self) if block_given?
    raise "You must supply a valid database connection object." unless (@connection.connected? rescue false)
    raise "You must specify the columns of the CSV." unless (@columns.kind_of?(Array) && @columns.length > 0))
    update_database_if_needed
  end

  def last_version_path
    @csv_file + '.last_observed'
  end

  def update_needed?

  end

  def raw_difference
   `diff #{last_version_path} #{@csv_file}`
  end

  def update_database_if_needed
    return false unless update_needed?
  end

end
