require_relative 'problem2'

def mean(array)
  return unless valid_array?(array)

  1.0 * array.reduce(:+) / array.size
end

def median(array)
  return unless valid_array?(array)

  array.sort!
  length = array.size
  if length.even?
    (array[length / 2 - 1] + array[length / 2]) / 2.0
  else
    array[length / 2]
  end
end

def mode(array)
  return unless valid_array?(array)

  histogram_sorted = histogram(array).sort_by { |_key, value| -value }
  modes = []
  repetitions = histogram_sorted[0][1]
  histogram_sorted.each do |e|
    return modes unless e[1] == repetitions

    modes << e[0]
  end
end

def mode_alt(array)
  return unless valid_array?(array)

  histogram = histogram(array)
  repetitions = histogram.max_by { |_key, value| value }[1]
  histogram.select! { |_key, value| value == repetitions }
  histogram.keys
end

# Validates that the argument is an array of numbers
def valid_array?(array)
  unless array.instance_of? Array
    puts 'Error: This method requires an array as its only argument'
    return false
  end

  unless array.all? { |e| e.is_a? Numeric }
    puts 'Error: This method requires an array of NUMBERS as its only argument'
    return false
  end

  true
end

puts mode([1, 2, 3, 3, 2, 1, 'a'])
puts mode(1)
p mode([1, 2, 3, 4, 3, 2, 1, 2])
p mode_alt([1, 2, 3, 4, 3, 2, 1, 2, 3])
