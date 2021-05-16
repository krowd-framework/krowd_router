# Krowd Router

A router made with Crystal.

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     krowd_router:
       github: krowd-framework/krowd_router
   ```

2. Run `shards install`

## Usage

```crystal
require "krowd_router"
```


Basic usage:
```crystal
my_router = KrowdRouter::Router(Symbol).new
my_router.add "GET", "/projects", :projects

result = my_route.match("GET", "/projects")
result.route.handler # => :projects

result = my_route.match("GET", "/foo")
result # => nil
```

Route params:
```crystal
my_router = KrowdRouter::Router(Symbol).new
my_router.add "GET", "/projects/:id", :projects

result = my_route.match("GET", "/projects/123")
result.route_params # => { "id" => "123" }
```


## Contributing

1. Fork it (<https://github.com/krowd-framework/krowd_router/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [stephannv](https://github.com/stephannv) - creator and maintainer
