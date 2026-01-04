begin
  # Do nothing. Defined by native extensions.
  Object.const_get("Steam::ClientStats")
rescue
  # Stub it.
  module Steam
    module ClientStats
      def self.app_id
        nil
      end

      def self.initialized?
        false
      end

      def self.set_stat(name, int)
        false
      end

      def self.unlock_achievement(name)
        false
      end

      def self.clear_achievement(name)
        false
      end

      def self.reset_all_stats
        false
      end

      def self.reset_all_stats_and_achievements
        false
      end

      def self.achievement_status(name)
        # This returns -1, 0, 1
        # -1 means unable to retrieve status, 0 means "not completed", 1 means "completed"
        -1
      end

      def self.store_stats
        false
      end

      def self.indicate_achievement_progress(name, current_progress, max_progress)
        false
      end
    end
  end
end

module Steam
  module ClientStats
    def self.load_path
      file = File.join(File.dirname(__FILE__))

      if file.start_with?("./")
        file = file.sub("./", "")
      end

      file
    end

    def self.to_load_path(file)
      file = File.join(self.load_path, file)

      if file.start_with?("./")
        file = file.sub("./", "")
      end

      file
    end

    def self.version
      if !@version
        version_file = to_load_path("VERSION.txt")
        @@version = GTK.read_file(version_file)
        if @@version
          @@version = @@version.split("\n")[0]
        end
      end

      @@version
    end
  end
end
