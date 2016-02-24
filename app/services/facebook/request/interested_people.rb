module Facebook
  module Request
    class InterestedPeople < PeopleRequester
      def request
        return [] if limit == 0
        @people = @connection.graph.get_object("#{event_fb_id}/interested?limit=#{limit}")
      end

      protected

        def limit
          @event_metadata[:interested_count]
        end
    end
  end
end
