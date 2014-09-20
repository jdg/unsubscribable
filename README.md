# Unsubscribable

Retention is king.

Unsubscribable is the easiest way to manage notification settings, unsubscribe links and muting of any outbound communication. Each unsubscribable object has a unique tag. Your users are able to unsubscribe from specific emails -- not just blindly unsubscribe from all incoming emails!

## Installation

Add this line to your application's Gemfile:

    gem 'unsubscribable'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install unsubscribable

And then run "rails generator unsubscribable:install"

## Usage

Make sure "secret\_key\_base" is defined in your secrets.yml

    secret_key_base: asdfSpookySecretGoesHere

Add the following to your routes.rb:

    get '/unsubscribe/:signature' => 'users#unsubscribe', as: 'unsubscribe'

Add an unsubscribe action to a controller:

    Unsubscribable::unsubscribe!(params[:signature])

Add unsubscribe links to your outbound emails:

    <%= link_to "Unsubscribe", unsubscribe_url(@user.unsubscribe_token_for(:tag_name)) %>

In the models you'd like to allow users to unsubscribe from:

    include Unsubscribable

## TODO

1. Specs
2. ActionMailer mixin - log when we reject outbound emails, automatically create a before_action to check prior to delivery.
3. Add an internal list of tags, so we can effectively manage and render a list of unsubscribable tags for the user.
4. Convert to Concerns?

## Contributing

1. Fork it ( http://github.com/jdg/unsubscribable/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request