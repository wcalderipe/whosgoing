module Facebook
  module Request
    class DeclinedPeople
      attr_reader :people

      def initialize(connection, event_metadata)
        @connection = connection
        @event_metadata = event_metadata
      end

      def request
        return [] if limit == 0
        @people = @connection.graph.get_object("#{event_fb_id}/declined?limit=#{limit}")
      end

      def to_h
        { people: @people }
      end

      private

        def limit
          @event_metadata[:declined_count]
        end

        def event_fb_id
          @event_metadata[:id]
        end
    end
  end
end

