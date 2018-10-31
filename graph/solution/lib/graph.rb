class Vertex
  attr_reader :value
  attr_accessor :in_edges, :out_edges
  
  def initialize(value)
    @value = value
    @in_edges, @out_edges = [], []
  end
end

class Edge
  attr_reader :cost, :from_vertex, :to_vertex

  def initialize(from_vertex, to_vertex, cost = 1)
    @from_vertex, @to_vertex, @cost = from_vertex, to_vertex, cost
    from_vertex.out_edges << self
    to_vertex.in_edges << self
  end

  def destroy!
    from_vertex.out_edges.delete(self)
    to_vertex.in_edges.delete(self)
    @from_vertex = @to_vertex = nil
  end
end