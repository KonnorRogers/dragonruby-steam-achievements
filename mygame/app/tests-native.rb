require "app/shared_tests.rb"
GTK.dlopen("steam_stats")

# Tests run with native defined Steam::ClientStats
class NativeSteamClientStatsTests
  include SharedTestsModule
end
