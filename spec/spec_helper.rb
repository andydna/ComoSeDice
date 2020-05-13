require "bundler/setup"

require "comosedice"
require "pry"

require 'titlewave'

RSpec.configure do |config|
  config.example_status_persistence_file_path = ".rspec_status" # Enable flags like --only-failures and --next-failure
  config.disable_monkey_patching!  # Disable RSpec exposing methods globally on `Module` and `main`
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
