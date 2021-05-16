class KrowdRouter::RoutePath
  getter raw_path = String
  getter segments : Array(KrowdRouter::PathSegment)

  def initialize(@raw_path : String)
    @segments = raw_path.split('/').reject(&.blank?).map do |s|
      KrowdRouter::PathSegment.new(s)
    end
  end

  def_equals @raw_path, @segments
end
