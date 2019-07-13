module Twitter
  module REST
    module Client
      attr_accessor :customer_key, :consumer_secret, :access_token, :access_token_secret

      def initialize(options = {}, &block)
        options.each { |k,v| send("#{k}=", v)}
        instance_eval(&block) if block_given?
      end
    end
  end
end

client = Twitter::RESt::Client({consumer_key: 'YOUR_CONSUMER_KEY'}) do 
    consumer_secret = "YOUR_CONSUMER_SECRET"
    access_token = "YOUR_ACCESS_TOKEN"
    access_token_secret = "YOUR_ACCESS_SECRET"
end

p client.consumer_key # => YOUR_CONSUMER_KEY
p client.access_token # => YOUR_ACCESS_TOKEN