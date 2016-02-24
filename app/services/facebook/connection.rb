module Facebook
  class Connection
    attr_reader :graph

    def initialize
      establish({
        id: FACEBOOK_CONFIG['app_id'],
        secret: FACEBOOK_CONFIG['app_secret']
      })
    end

    private

      def establish(opts)
        @graph ||= Koala::Facebook::API.new(
          Koala::Facebook::OAuth.new(opts[:id], opts[:secret]).get_app_access_token)
      end
  end
end
