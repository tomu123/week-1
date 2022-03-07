# frozen_string_literal: true

def histogram(array)
  # Validates that the argument can only be an Array
  unless array.instance_of? Array
    puts 'Error: histogram method requires an array as its only argument'
    return
  end
  histogram = Hash.new(0)
  array.each do |e|
    histogram[e] += 1
  end
  histogram
end

p histogram([1, 2, 3, 1, 1, 3, 'x', :tomu, :tomu])
