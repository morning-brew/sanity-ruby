# frozen_string_literal: true

require "forwardable"

module Sanity
  module Http
    module Query
      class << self
        def included(base)
          base.extend(ClassMethods)
          base.extend(Forwardable)
          base.def_delegators(:"Sanity.config", :project_id, :api_version, :dataset, :token)
        end
      end

      module ClassMethods

        def call(**args)
          new(**args).call
        end
      end

      attr_reader :resource_klass

      # @todo Add query support
      def initialize(**args)
        @resource_klass = args.delete(:resource_klass)
      end

      # @todo Add query support
      def call
        true
      end

      private

      def base_url
        raise NotImplementedError, "base_url must be defined"
      end
    end
  end
end
