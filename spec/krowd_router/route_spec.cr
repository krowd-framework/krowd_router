require "../spec_helper"

describe KrowdRouter::Route do
  describe "#initialize" do
    it "builds path using raw path" do
      raw_path = "/projects/:id"
      path = KrowdRouter::RoutePath.new(raw_path)
      route = KrowdRouter::Route(Symbol).new("GET", raw_path, :project)
      route.path.should eq path
    end
  end
end
