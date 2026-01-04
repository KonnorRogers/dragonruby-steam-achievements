require "app/shared_tests.rb"

# Test class for Steam::ClientStats C extension
# These tests verify the interface works correctly even without Steam available
class NoNativeSteamClientStatsTests
  include SharedTestsModule

  def initialize
    require "steam_stats.rb"
  end
end
