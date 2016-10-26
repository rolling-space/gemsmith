# frozen_string_literal: true

module Gemsmith
  module Skeletons
    # Configures default gem support.
    class GemSkeleton < BaseSkeleton
      def create
        cli.template "%gem_name%/bin/setup.tt", configuration.to_h
        cli.template "%gem_name%/Gemfile.tt", configuration.to_h
        cli.template "%gem_name%/%gem_name%.gemspec.tt", configuration.to_h
        cli.template "#{lib_gem_root}.rb.tt", configuration.to_h
        cli.template "#{lib_gem_root}/identity.rb.tt", configuration.to_h
        cli.chmod "#{configuration.gem_name}/bin/setup", 0o755
      end
    end
  end
end
