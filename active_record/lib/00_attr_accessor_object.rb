class AttrAccessorObject
  
  def self.my_attr_accessor(*names)
    names.each do |name|
      define_method(name.to_sym) do 
        # p "@#{name}"
        instance_variable_get("@#{name}")
      end
      define_method("#{name}=") do |arg|
        instance_variable_set("@#{name}", arg)
      end 
    end 
  end

  # def self.my_attr_writer(name, arg)

  # end 

  # @something=()

  # # my_attr_accessor :x, :y
  # # # my_attr_writer :x, :y
end



# $ PRINT_QUERIES=true rspec spec/01_sql_object_spec.rb
