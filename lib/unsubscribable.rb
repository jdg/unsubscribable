require "unsubscribable/version"
require "unsubscribable/subscriber"
require "unsubscribable/unsubscribe"

module Unsubscribable

  def self.unsubscribe!(signature)
    verifier = ActiveSupport::MessageVerifier.new(Rails.application.secrets.secret_key_base)

    opts = verifier.verify(signature)
    unsubscribe_id, unsubscribe_class, subscriber_id, tag = opts.split('|')
    obj = unsubscribe_class.classify.constantize.find(unsubscribe_id)

    Unsubscribable::Unsubscribe.create!(unsubscribable: obj, subscriber_id: subscriber_id, tag: tag)
  end
end