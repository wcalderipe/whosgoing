require 'byebug'
module Facebook
  class Fetcher
    attr_accessor :event_fb_id

    attr_reader :metadata, :attending, :interested, :maybe, :declined

    def initialize(connection, fb_id)
      @connection = connection
      @event_fb_id = fb_id
    end

    def load
      request_metadata
      request_attending
      request_interested
      request_declined
      to_h
    end

    def to_h
      { metadata: @metadata, attending: @attending, interested: @interested,
        maybe: @maybe, declined: @declined }
    end

    private

      def request_metadata
        @metadata = Request::EventMetadata.new(@connection, @event_fb_id).request
      end

      def request_attending
        @attending = Request::AttendingPeople.new(@connection, @metadata).request
      end

      def request_interested
        @interested = Request::InterestedPeople.new(@connection, @metadata).request
      end

      def request_declined
        @declined = Request::DeclinedPeople.new(@connection, @metadata).request
      end
  end
end
