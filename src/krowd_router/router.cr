class KrowdRouter::Router(T)
  HTTP_METHODS = ["GET", "HEAD", "POST", "PUT", "PATCH", "DELETE"]

  getter routes : Hash(String, Array(Route(T)))
  getter matcher : KrowdRouter::Matcher(T)

  def initialize
    @routes = {} of String => Array(Route(T))
    HTTP_METHODS.each do |http_method|
      routes[http_method] = [] of KrowdRouter::Route(T)
    end
    @matcher = KrowdRouter::Matcher(T).new
  end

  def add(http_method : String, raw_path : String, handler : T)
    routes[http_method] << KrowdRouter::Route(T).new(http_method, raw_path, handler)
  end

  def match(http_method : String, path : String) : KrowdRouter::RouteMatch(T)?
    matcher.find(path, routes[http_method])
  end
end
