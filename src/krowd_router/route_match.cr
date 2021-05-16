class KrowdRouter::RouteMatch(T)
  property route : KrowdRouter::Route(T)
  property params = {} of String => String

  def initialize(@route : KrowdRouter::Route(T), @params = {} of String => String)
  end
end
