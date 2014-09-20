module Unsubscribable
  def self.included(klass)
    klass.instance_eval { has_many :unsubscribes, as: :unsubscribable, dependent: :delete_all }

    klass.class_eval do
      include InstanceMethods
    end
  end

  module InstanceMethods
    def subscribed_to?(tag, subscriber_id = id)
      !Unsubscribable::Unsubscribe.exists?(unsubscribable: self, subscriber_id: subscriber_id, tag: tag)
    end

    def unsubscribe!(tag, subscriber_id = id)
      Unsubscribable::Unsubscribe.create!(unsubscribable: self, subscriber_id: subscriber_id, tag: tag)
    end

    def subscribe!(tag, subscriber_id = id)
      if subscription = Unsubscribable::Unsubscribe.where(unsubscribable: self, subscriber_id: subscriber_id, tag: tag).first
        subscription.destroy!
      end
    end

    def unsubscribes(subscriber_id = id)
      Unsubscribable::Unsubscribe.where(unsubscribable: self)
    end

    def unsubscribe_token_for(tag, subscriber_id = id)
      verifier = ActiveSupport::MessageVerifier.new(Rails.application.secrets.secret_key_base)
      verifier.generate("#{self.id}|#{self.class.name}|#{subscriber_id}|#{tag}")
    end
  end
end