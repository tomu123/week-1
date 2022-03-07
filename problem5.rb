require 'csv'
require 'time'

ENV['TZ'] = 'UTC'

line = 0
est_csv_array = []

# make sure invalid_events.csv file doesnt exist
`rm ./invalid_events.csv`

CSV.foreach('./events.csv') do |row|
  line += 1
  begin
    # parse dates of events in events.csv file using UTC timezone and then transform dates if valid to EST timezone
    row[1] = Time.at(Time.parse(row[1]), in: '-05:00').to_s
    est_csv_array << row
  rescue StandardError
    # if a date in events.csv is invalid then print line number and row content to console and write to invalid_events.csv file
    puts "#{line} => #{row.to_csv}"
    File.open('./invalid_events.csv', mode: 'a') { |f| f.puts(row.prepend(line).to_csv) }
  end
end

# sort est_csv_array of events by date
est_csv_array.sort_by! { |row| Time.parse(row[1]) }

# generate csv from est_csv_array and save it in est_csv
est_csv = CSV.generate do |csv|
  est_csv_array.each { |row| csv << row }
end

# write our new csv of sorted by date events whose dates have been validated and transformed to EST timezome
File.open('./EST_events.csv', mode: 'w') { |f| f.puts(est_csv) }
