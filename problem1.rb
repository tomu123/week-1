# frozen_string_literal: true

def iterate_strings(init_string, end_string)
  return unless alphabetic_strings?(init_string, end_string)

  # Initial String Smaller Validation
  if init_string > end_string
    puts 'Error: Final String can not be bigger than Initial String!'
  else
    while init_string < end_string
      print "#{init_string}, "
      init_string = init_string.next
    end
    puts end_string
  end
end

# Only Alphabetic Strings Validation
def alphabetic_strings?(init_string, end_string)
  unless /^[[:alpha:]]+$/ === init_string && /^[[:alpha:]]+$/ === end_string # rubocop:disable Style/CaseEquality
    puts 'Error: Valid Strings cans only contain alphabetic characters!'
    return false
  end
  true
end

puts 'Type Initial String'
init_string = gets.chomp
puts 'Type Final String'
end_string = gets.chomp
puts ''
iterate_strings(init_string, end_string)
