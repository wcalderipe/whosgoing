module Facebook
  module Request
    class AttendingPeople
      attr_reader :people

      def initialize(connection, event_metadata)
        @connection = connection
        @event_metadata = event_metadata
      end

      def request
        return [] if limit == 0
        @people = @connection.graph.get_object("#{event_fb_id}/attending?limit=#{limit}")
      end

      def to_h
        { people: @people }
      end

      private

        def limit
          @event_metadata[:attending_count]
        end

        def event_fb_id
          @event_metadata[:id]
        end
    end
  end
end
