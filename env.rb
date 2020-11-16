# IMPORTANT: This file is generated by cucumber-rails - edit at your own peril.
# It is recommended to regenerate this file in the future when you upgrade to a
# newer version of cucumber-rails. Consider adding your own code to a new file
# instead of editing this one. Cucumber will automatically load all features/**/*.rb
# files.

require 'cucumber/rails'
require 'selenium/webdriver'
require 'capybara-screenshot/cucumber'
require 'cucumber/rspec/doubles'

# Capybara defaults to CSS3 selectors rather than XPath.
# If you'd prefer to use XPath, just uncomment this line and adjust any
# selectors in your step definitions to use the XPath syntax.
# Capybara.default_selector = :xpath

# By default, any exception happening in your Rails application will bubble up
# to Cucumber so that your scenario will fail. This is a different from how
# your application behaves in the production environment, where an error page will
# be rendered instead.
#
# Sometimes we want to override this default behaviour and allow Rails to rescue
# exceptions and display an error page (just like when the app is running in production).
# Typical scenarios where you want to do this is when you test your error pages.
# There are two ways to allow Rails to rescue exceptions:
#
# 1) Tag your scenario (or feature) with @allow-rescue
#
# 2) Set the value below to true. Beware that doing this globally is not
# recommended as it will mask a lot of errors for you!
#
ActionController::Base.allow_rescue = false

# You may also want to configure DatabaseCleaner to use different strategies for certain features and scenarios.
# See the DatabaseCleaner documentation for details. Example:
#
#   Before('@no-txn,@selenium,@culerity,@celerity,@javascript') do
#     # { except: [:widgets] } may not do what you expect here
#     # as Cucumber::Rails::Database.javascript_strategy overrides
#     # this setting.
#     DatabaseCleaner.strategy = :truncation
#   end
#
#   Before('not @no-txn', 'not @selenium', 'not @culerity', 'not @celerity', 'not @javascript') do
#     DatabaseCleaner.strategy = :transaction
#   end
#

# Possible values are :truncation and :transaction
# The :transaction strategy is faster, but might give you threading problems.
# See https://github.com/cucumber/cucumber-rails/blob/master/features/choose_javascript_database_strategy.feature

# Browser configuration

Capybara.server = :puma, { Silent: true }

if ENV['APP_URL'].present?
  Capybara.app_host = ENV['APP_URL'].to_s
  Capybara.run_server = false
end

if ENV['ChromeWebDriver'].present?
  Selenium::WebDriver::Chrome.driver_path = "#{ENV['ChromeWebDriver']}/chromedriver.exe"
end

if ENV['GeckoWebDriver'].present?
  Selenium::WebDriver::Firefox.driver_path = "#{ENV['GeckoWebDriver']}/geckodriver.exe"
end

if ENV['IEWebDriver'].present?
  Selenium::WebDriver::IE.driver_path = "#{ENV['IEWebDriver']}/IEDriverServer.exe"
end

Capybara.register_driver :chrome do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    chromeOptions: { args: %w[disable-gpu] }
  )

  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    desired_capabilities: capabilities
  )
end

Capybara.register_driver :chrome_headless do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.headless!

  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    options: options
  )
end

Capybara.register_driver :firefox do |app|
  Capybara::Selenium::Driver.new(app, browser: :firefox)
end

Capybara.register_driver :firefox_headless do |app|
  options = Selenium::WebDriver::Firefox::Options.new(args: %w[--headless])

  Capybara::Selenium::Driver.new(
    app,
    browser: :firefox,
    options: options
  )
end

Capybara.register_driver :ie do |app|
  options = Selenium::WebDriver::IE::Options.new
  options.require_window_focus = true
  options.ignore_protected_mode_settings = true
  Capybara::Selenium::Driver.new(app, browser: :internet_explorer, options: options)
end

Capybara.register_driver :safari do |app|
  Capybara::Selenium::Driver.new(app, browser: :safari)
end

if (driver = ENV['CUC_DRIVER']) && driver.present?
  Capybara.default_driver = driver.to_sym
else
  Capybara.use_default_driver
end

js_driver = ENV['CUC_JAVASCRIPT_DRIVER']
Capybara.javascript_driver = js_driver.present? ? js_driver.to_sym : :chrome_headless

if ENV['SELENIUM_HUB_HOSTNAME'].present?
  capabilities = ENV.fetch('CUC_DRIVER') { 'chrome' }

  Capybara.run_server = false
  Capybara.register_driver :selenium_remote do |app|
    Capybara::Selenium::Driver.new(app,
        browser: :remote,
        url: "http://#{ENV['SELENIUM_HUB_HOSTNAME']}:4444/wd/hub",
        desired_capabilities: capabilities.to_sym)
  end
  Capybara.javascript_driver = :selenium_remote
  Capybara.default_driver = :selenium_remote
end
