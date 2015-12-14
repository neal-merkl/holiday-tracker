h1 = Holiday.create(name: "h1", date: "25-12-2015", country: 'DE')
h2 = Holiday.create(name: "h2", date: "25-12-2015", country: 'BR')
h3 = Holiday.create(name: "h3", date: "01-01-2013", country: 'US')
h4 = Holiday.create(name: "h4", date: "01-01-2014", country: 'CA')
h5 = Holiday.create(name: "h5", date: "1-12-2016", country: 'BR')
h6 = Holiday.create(name: "Christmas", date: "01-08-1996", country: 'US')

def rand_country(num)
  case num
  when 0
    "BE"
  when 1
    "BR"
  when 2
    "CA"
  when 3
    "CZ"
  when 4
    "DE"
  when 5
    "FR"
  when 6
    "GB"
  when 7
    "NO"
  when 8
    "PL"
  when 9
    "SK"
  when 10
    "SL"
  when 11
    "US"
  end
end

25.times do |i|
  Holiday.create(name: "h#{i+6}", date: "#{1 + rand(28)}-#{1 + rand(12)}-#{1 + rand(3000)}",
                 country: "#{rand_country(i)}")
end
