module Facebook
  module Request
    class EventMetadata
      attr_reader :id, :attending_count, :declined_count, :interested_count,
        :name

      def initialize(connection, event_fb_id)
        @connection = connection
        @id = event_fb_id
      end

      def request
        data = @connection.graph.get_object("#{@id}?fields=attending_count,"\
          "declined_count,interested_count,name")
        set_vars(data)
      end

      def to_h
        { attending_count: @attending_count, declined_count: @declined_count,
          interested_count: @interested_count, id: @id, name: @name }
      end

      private

        def set_vars(data)
          @attending_count = data['attending_count']
          @declined_count = data['declined_count']
          @interested_count = data['interested_count']
          @name = data['name']
          to_h
        end
    end
  end
end
