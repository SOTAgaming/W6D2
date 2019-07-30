require_relative 'db_connection'
require 'active_support/inflector'
require "byebug"
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    columns = DBConnection.execute2(<<-SQL)
      SELECT 
        *
      FROM
        #{self.table_name}
      LIMIT 
        0
  SQL
   columns.flatten.map!{ |column| column.to_sym}
  end

  def self.finalize!
    # @attributes = {}
      columns.each do |attribute|
      define_method(attribute) do 
        # debugger
        #  instance_variable_get("@#{attribute}")

        #  instance_variable_get(self.attributes["@#{attribute}"])
         self.attributes[attribute] 
        end
      define_method("#{attribute}=") do |arg|
      # debugger
      #    instance_variable_set("@#{attribute}", arg)
          self.attributes[attribute] = arg
      end  
    end 
  end

  
  def self.table_name=(table_name)
  end

  def self.table_name
    "#{self.to_s.downcase}s"
  end

  def self.all
    # ...
  end

  def self.parse_all(results)
    # ...
  end

  def self.find(id)
    # ...
  end

  def initialize(params = {})
  # raise "known attribute #{}"
  #   params.each do |k,v|
  #     raise "known attribute #{k}" if !self.columns.include?("#{k}")
  #     self.attributes["@#{k}"] = v
  #   end 
    self.attributes
  end

  
  def attributes
    @attributes ||= {}
    # self.instance_variables.each do |var|
    #   @attributes["#{var}"] = self.var
    # end 
    # @attributes
  end

  def attribute_values
    # ...
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
