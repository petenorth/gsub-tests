Given('I have a Rails project') do
  puts "Given...."
end

When('I write a Hello World Cucumber test') do
  visit "/"
end

Then('I should be able to run it and see {string} printed on screen') do |string|
  puts "Then...."
end
