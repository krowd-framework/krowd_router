require "../spec_helper"

describe KrowdRouter::Matcher do
  describe "#find" do
    context "when path doesn't exist in routes" do
      it "returns nil" do
        route = KrowdRouter::Route(Symbol).new("GET", "/tags/:category/:name", :tags)
        match = KrowdRouter::Matcher(Symbol).new.find("/tags", [route])

        match.should be_nil
      end
    end

    context "when path doesn't fill named params" do
      it "returns nil" do
        route = KrowdRouter::Route(Symbol).new("GET", "/tags/:category/:name", :tags)
        match = KrowdRouter::Matcher(Symbol).new.find("/tags/games", [route])

        match.should be_nil
      end
    end

    context "when path exists in routes" do
      it "returns route match" do
        route = KrowdRouter::Route(Symbol).new("GET", "/projects", :projects)
        match = KrowdRouter::Matcher(Symbol).new.find("/projects", [route])

        match.try(&.route).should eq route
      end
    end

    context "when path fill named params" do
      it "returns route match with filled params" do
        route = KrowdRouter::Route(Symbol).new("GET", "/tags/:category/:name", :tags)
        match = KrowdRouter::Matcher(Symbol).new.find("/tags/games/zelda", [route])

        match.try(&.route).should eq route
        match.try(&.params).should eq({ "category" => "games", "name" => "zelda" })
      end
    end
  end
end
