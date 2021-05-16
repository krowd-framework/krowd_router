class KrowdRouter::Route(T)
  getter http_method : String
  getter raw_path : String
  getter handler : T
  getter path : KrowdRouter::RoutePath

  def initialize(@http_method : String, @raw_path : String, @handler : T)
    @path = KrowdRouter::RoutePath.new(raw_path)
  end
end
