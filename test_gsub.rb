def camel_case(str)
  puts str
  puts str.gsub(/_([a-z])/) { Regexp.last_match(1).upcase }
end

camel_case(:mac.to_s)
