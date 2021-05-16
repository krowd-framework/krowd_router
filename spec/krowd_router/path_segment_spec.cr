require "../spec_helper"

describe KrowdRouter::PathSegment do
  describe "#initialize" do
    context "with value starting with `:`" do
      it "assigns named type" do
        segment = KrowdRouter::PathSegment.new(":id")
        segment.type.named?.should be_true
      end

      it "assigns value without `:` to name" do
        segment = KrowdRouter::PathSegment.new(":id")
        segment.name.should eq "id"
      end
    end

    context "with value not starting with `:`" do
      it "assigns static type" do
        segment = KrowdRouter::PathSegment.new("projects")
        segment.type.static?.should be_true
      end

      it "assigns blank string to name" do
        segment = KrowdRouter::PathSegment.new("projects")
        segment.name.should eq ""
      end
    end
  end
end
