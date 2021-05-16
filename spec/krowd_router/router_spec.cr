require "../spec_helper"

describe KrowdRouter::Router do
  describe "::HTTP_METHODS" do
    it "returns array GET, HEAD, POST, PUT, PATCH and DELETE strings" do
      KrowdRouter::Router::HTTP_METHODS.should eq ["GET", "HEAD", "POST", "PUT", "PATCH", "DELETE"]
    end
  end

  describe "#initialize" do
    it "initialize routes hash" do
      router = KrowdRouter::Router(Symbol).new
      KrowdRouter::Router::HTTP_METHODS.each do |http_method|
        router.routes[http_method].should eq [] of KrowdRouter::Route(Symbol)
      end
    end
  end

  describe "#add" do
    it "adds a new route to routes hash" do
      router = KrowdRouter::Router(Symbol).new
      router.add "GET", "/projects", :projects
      route = router.routes["GET"].first
      route.raw_path.should eq "/projects"
      route.http_method.should eq "GET"
      route.handler.should eq :projects
    end
  end

  describe "#match" do
    it "returns match result" do
      router = KrowdRouter::Router(Symbol).new
      router.add "GET", "/projects", :projects
      match = router.match("GET", "/projects")
      match.try(&.route).try(&.handler).should eq :projects
    end
  end
end
