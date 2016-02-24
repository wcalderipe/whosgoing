module Facebook
  module Request
    class PeopleRequester
      attr_reader :people

      def initialize(connection, event_metadata)
        @connection = connection
        @event_metadata = event_metadata
      end

      def request

      end

      def to_h
        { people: @people }
      end

      protected

        def limit
          1500
        end

        def event_fb_id
          @event_metadata[:id]
        end
    end
  end
end
