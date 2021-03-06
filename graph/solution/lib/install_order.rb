def install_order(arr)
  max = 0
  vertices = {}
  arr.each do |tuple|
    # create the graph
    vertices[tuple[0]] = Vertex.new(tuple[0]) unless vertices[tuple[0]]
    vertices[tuple[1]] = Vertex.new(tuple[1]) unless vertices[tuple[1]]
    Edge.new(vertices[tuple[1]], vertices[tuple[0]])

    #reset max if needed
    max = tuple.max if tuple.max > max
  end


  # find the missing packages
  independent = []
  (1..max).each do |i|
    independent << i unless vertices[i]
  end

  # sort the vertices of the graph and add the missing packages
  independent + topological_sort(vertices.values).map { |v| v.value } 
end



def install_order2(arr)
  max_id = arr.reduce(&:+).max
  vertices = (1..max_id).to_a.map { |e| Vertex.new(e) }
  arr.each do |tuple|
    Edge.new(vertices[tuple[1] - 1], vertices[tuple[0] - 1])
  end
  # p topological_sort(vertices.values).map(&:value)
  topological_sort(vertices).map(&:value)
end