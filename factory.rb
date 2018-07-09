class Factory
  def build(type) 
    dynamic_properties = { 'ptype' => type.to_s }
    class_instance = Object.const_set(type.to_s.capitalize, Class.new)
    class_instance.class_eval do
      define_method(:initialize) do
        dynamic_properties.each { |key, value| instance_variable_set("@#{key}", value) }
      end
      dynamic_properties.each do |key, value|
        attr_accessor key
      end  
    end
    instance_eval(type.to_s.capitalize+".new")
  end
end

megafactory = Factory.new

puts megafactory.build(:cube).class
puts megafactory.build(:bear).class
puts megafactory.build(:ball).class