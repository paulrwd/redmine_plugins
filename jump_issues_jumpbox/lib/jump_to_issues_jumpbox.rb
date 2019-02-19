require 'pathname'

module JumpToIssues
    def self.root
        @root ||=Pathname.new File.expand_path('..', File.dirname(__FILE__))
    end
end

module JumpToIssuesJumpbox
    def self.root
        @root ||=Pathname.new File.expand_path('..', File.dirname(__FILE__))
    end
end


Rails.configuration.to_prepare do
    Dir[JumpToIssues.root.join('app/patches/**/*_patch.rb')].each {|f| require_dependency f }
end

Rails.configuration.to_prepare do
    Dir[JumpToIssuesJumpbox.root.join('app/patches/**/*_patch.rb')].each {|f| require_dependency f }
end