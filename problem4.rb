File.open('./strings.txt') do |f|
  # Given the paragraph, clear all the extra spaces between the words:
  #- The result should be the paragraph with correct spacing(this is, just one space between the words)
  #- The line breaks should be the same as input (Only when they are next to a period (.))
  result = f.gets(nil).split.join(' ').gsub!(/\s?\.\s?/, ".\n")

  #- Times when the word `dis` is at the start of a word
  dis = result.scan(/\sdis/).size

  #- Times when `ing` is at the end of a word
  ing = result.scan(/ing[\s.]/).size

  puts result
  puts "- There are #{dis} Times when the word `dis` is at the start of a word"
  puts "- There are #{ing} Times when `ing` is at the end of a word"
end
