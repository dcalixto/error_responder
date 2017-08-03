[![Gem Version](https://badge.fury.io/rb/error_responder.svg)](https://badge.fury.io/rb/error_responder)

### Error responder for Rails API 
#### Generator of standard HTTP responses and error serializer for models.

### Getting Started

Add it to your Gemfile:

```ruby
gem 'error_responder'
```

#### 1) Generate standard HTTP responses

```ruby
err_respond(err_code, key: nil, message: nil)
```


#### 2) Generate responce with model validation errors

```ruby
serialize_errors(errors, options = {})
```

#### Usage example

##### 1) Generate standard HTTP responses

```ruby
err_respond 404
```

Will be generated:

```json
{
    "status": "404",
    "info": "Not Found",
    "errors": {}
}
```

You can pass a custom error message:
```ruby
err_respond 404, key: 'user', message: 'Not present in database.'
```

Will be generated:

```json
{
    "status": "404",
    "info": "Not Found",
    "errors": {
        "user": "Not present in database."
    }
}
```

##### 2) Generate responce with model validation errors

```ruby
@user = User.new(user_params)
if @user.save
  # ...
else
  serialize_errors(@user.errors)
end
```

Will be generated (model errors):

```json
{
    "status": 409,
    "info": "Conflict",
    "errors": {
        "username": "Username can't be blank.",
        "first_name": "First name can't be blank.",
        "last_name": "Last name can't be blank."
    }
}
```

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
