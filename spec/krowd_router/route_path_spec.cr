require "../spec_helper"

describe KrowdRouter::RoutePath do
  describe "#initialize" do
    it "builds path segments using raw path" do
      raw_path = "/projects/:id"
      segments = [KrowdRouter::PathSegment.new("projects"), KrowdRouter::PathSegment.new(":id")]
      route_path = KrowdRouter::RoutePath.new(raw_path)
      route_path.segments.each_with_index do |segment, index|
        segment.should eq segments[index]
      end
    end
  end
end
