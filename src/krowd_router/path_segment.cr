class KrowdRouter::PathSegment
  enum Type
    Static
    Named
  end

  getter value : String
  getter type : KrowdRouter::PathSegment::Type
  getter name : String

  def initialize(@value : String)
    if value.starts_with?(':')
      @type = Type::Named
      @name = value.gsub(":", "")
    else
      @type = Type::Static
      @name = ""
    end
  end

  def_equals @value, @type, @name
end
