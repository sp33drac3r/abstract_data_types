require_relative 'graph'

class UndirectedGraph < Graph

  def add_node(value, edges=[])
    super
    edges.each { |edge| add_edge(edge, node.id) }
    self
  end

  def delete_node(node_id)
    all_edges = @nodes[node_id].edges
    all_edges.each { |edge| delete_edge(node_id, edge) }
    super
  end

  #works
  def add_edge(node_id, edge)
    super
    @nodes[edge].edges << node_id
  end

  def delete_edge(node_id, edge)
    # "2 -- [5, 6, 0] -- 5"
    # "5 -- [2] -- 2"
    # "2 -- [6, 0] -- 0"
    # "0 -- [1, 2] -- 2"
    p "#{node_id} -- #{@nodes[node_id].edges} -- #{edge}"
    p "#{edge} -- #{@nodes[edge].edges} -- #{node_id}"
    @nodes[node_id].edges.delete(edge)
    @nodes[edge].edges.delete(node_id)
    # edges_to_delete.each { |edge| @nodes[node_id].edges.delete(edge) }
    # edges_to_delete.each { |edge| @nodes[edge].edges.delete(node_id) }
    # super
  end
end
