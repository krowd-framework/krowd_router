class KrowdRouter::Matcher(T)
  def find(raw_path : String, routes : Array(Route)) : KrowdRouter::RouteMatch(T)?
    route_path = KrowdRouter::RoutePath.new(raw_path)

    routes.each do |route|
      match = match(route, route_path)

      return match if match
    end

    nil
  end

  private def match(route : KrowdRouter::Route, other : KrowdRouter::RoutePath) : KrowdRouter::RouteMatch(T)?
    route_match = KrowdRouter::RouteMatch.new(route)

    return if route.path.segments.size != other.segments.size

    route.path.segments.each_with_index do |segment, index|
      other_segment = other.segments[index]
      if segment.type.static?
        return if other_segment.value != segment.value
      elsif segment.type.named?
        return if other_segment.nil?

        route_match.params[segment.name] = other_segment.value
      end
    end

    route_match
  end
end
