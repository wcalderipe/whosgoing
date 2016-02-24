module Facebook
  module Request
    class DeclinedPeople < PeopleRequester
      def request
        return [] if limit == 0
        @people = @connection.graph.get_object("#{event_fb_id}/declined?limit=#{limit}")
      end

      protected

        def limit
          @event_metadata[:declined_count]
        end
    end
  end
end
