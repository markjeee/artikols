module MyArrayMap
  def my_map
    inject([ ]) { |a,v| a << yield(v) }
  end

  def my_crude_map
    new_a = [ ]; each { |v| new_a << yield(v) }; new_a
  end

  def self.setup
    ::Array.send(:include, self)
  end
end
