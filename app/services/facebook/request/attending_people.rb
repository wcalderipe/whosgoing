module Facebook
  module Request
    class AttendingPeople < PeopleRequester
      def request
        return [] if limit == 0
        @people = @connection.graph.get_object("#{event_fb_id}/attending?limit=#{limit}")
      end

      protected

        def limit
          @event_metadata[:attending_count]
        end
    end
  end
end
