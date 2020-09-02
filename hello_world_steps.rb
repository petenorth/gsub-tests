Given("I am on a/the {string} page") do |string|
  path_for(string).tap do |p|
    visit(p)
    expect(page.current_path).to eql(p)
  end
end

Given('I have a Rails project') do
  puts "Given...."
end

When('I write a Hello World Cucumber test') do
  visit "/"
end

Then('I should be able to run it and see {string} printed on screen') do |string|
  puts "Then...."
end
