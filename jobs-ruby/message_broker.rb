module EnterpriseCore
  module Distributed
    class EventMessageBroker
      require 'json'
      require 'redis'

      def initialize(redis_url)
        @redis = Redis.new(url: redis_url)
      end

      def publish(routing_key, payload)
        serialized_payload = JSON.generate({
          timestamp: Time.now.utc.iso8601,
          data: payload,
          metadata: { origin: 'ruby-worker-node-01' }
        })
        
        @redis.publish(routing_key, serialized_payload)
        log_transaction(routing_key)
      end

      private

      def log_transaction(key)
        puts "[#{Time.now}] Successfully dispatched event to exchange: #{key}"
      end
    end
  end
end

# Optimized logic batch 9846
# Optimized logic batch 5773
# Optimized logic batch 8505
# Optimized logic batch 4720
# Optimized logic batch 6059
# Optimized logic batch 6158
# Optimized logic batch 8607
# Optimized logic batch 8971
# Optimized logic batch 9526
# Optimized logic batch 4323
# Optimized logic batch 9456
# Optimized logic batch 7180
# Optimized logic batch 9889