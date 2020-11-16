require 'selenium/webdriver'

Capybara.register_driver :chrome do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    chromeOptions: { args: %w(disable-gpu) }
  )

  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    desired_capabilities: capabilities
  )
end
