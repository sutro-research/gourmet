# Gourmet

Service Objects for Rails, useful for extracting business logic out of your controller actions.
Credit goes to [Philippe Creux](https://twitter.com/pcreux) for his original description of 'Gourmet Service Objects' in
[this blog post](http://brewhouse.io/blog/2014/04/30/gourmet-service-objects.html).


## Installation

Add this line to your application's Gemfile:

    gem 'gourmet'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gourmet



## Usage

Services are defined by subclassing `Gourmet::Service` and implementing a `#call` method. That's it! Service are an extremely thin wrapper over
plain old Ruby objects, which make them easy to reason about and test in isolation. For example:

```ruby
# app/services/create_and_track_signup.rb
class CreateAndTrackSignup < Gourmet::Service
  def call(name, email)
    User.create!(name: name, email: email)
    UserMailer.welcome_message(email).deliver
    mixpanel.track(email, 'signed up')
  end
end

# app/controllers/users_controller.rb
def create
  CreateAndTrackSignup.call(params[:name], params[:email])
  redirect_to dashboard_path
end
```


### Handling complex return values

Gourmet ships with a built-in helper class `Gourmet::Result` for handling actions that may or may not succeed.
`Result` has two subclasses `Success` and `Failure` (similar to Scala's Option pattern, or the [Possibly](https://github.com/rap1ds/ruby-possibly) gem in Ruby),
which are instantiated using helper methods of the same name. Result objects implement `#success?` and `#failure?` query methods, and can also act as a wrapper
for some value. To demonstrate:

```ruby
class DoWork < Gourmet::Service
  def call(magic_number)
    if magic_number == 7
      Success(magic_number)
    else
      Failure()
    end
  end
end

result = DoWork.call(7)
result.success? # => true
result.value    # => 7

result = DoWork.call(2)
result.failure? # => true
```

Note that the use of the `Result` class and methods is completely optional - you're free to substitute your own mechanism for handling complex results,
or forego it entirely.


## Contributing

1. Fork it ( http://github.com/andrewberls/gourmet/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
