require "./spec_helper"

abstract class RequestHandler
  abstract def call
end

class MyRouter < KrowdRouter::Router(RequestHandler.class)
end

class ProjectsIndex < RequestHandler
  def call; end
end

class ProjectsCreate < RequestHandler
  def call; end
end

class ProjectsShow < RequestHandler
  def call; end
end

class TasksIndex < RequestHandler
  def call; end
end

my_router = MyRouter.new
my_router.add "GET", "/projects", ProjectsIndex
my_router.add "POST", "/projects", ProjectsCreate
my_router.add "GET", "/projects/:id", ProjectsShow
my_router.add "GET", "/projects/:id/tasks/:priority", TasksIndex

describe "Integrations tests" do
  it "finds route when route is registered" do
    match = my_router.match("GET", "/projects")
    handler = match.try(&.route).try(&.handler)
    handler.should eq ProjectsIndex
  end

  it "recognizes differents http methods" do
    match = my_router.match("POST", "/projects")
    handler = match.try(&.route).try(&.handler)
    handler.should eq ProjectsCreate
  end

  it "doesn't find route when route isn't registered" do
    match = my_router.match("GET", "/repositories")
    match.should be_nil
  end

  it "doesn't find route when http method doesn't match" do
    match = my_router.match("PUT", "/projects")
    match.should be_nil
  end

  it "recognizes named route params" do
    match = my_router.match("GET", "/projects/123/tasks/0")
    handler = match.try(&.route).try(&.handler)
    handler.should eq TasksIndex
  end

  context "when matches a route with named params" do
    it "returns filled route params" do
      match = my_router.match("GET", "/projects/123/tasks/0")
      match.try(&.params).should eq({ "id" => "123", "priority" => "0" })
    end
  end

  context "when matches a route without named params" do
    it "returns empty route params" do
      match = my_router.match("GET", "/projects")
      match.try(&.params).should eq({} of String => String)
    end
  end
end
