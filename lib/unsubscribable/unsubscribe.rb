require 'active_record'

module Unsubscribable
  class Unsubscribe < ActiveRecord::Base
    belongs_to :unsubscribable, polymorphic: true

    validates :unsubscribable, presence: true
    validates :subscriber_id, presence: true
    validates :tag, presence: true, uniqueness: { scope: :subscriber_id }
  end
end