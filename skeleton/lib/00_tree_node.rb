class PolyTreeNode

    attr_reader :parent, :children, :value

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(node)
        if self.parent == nil && node != nil
            node.children << self
        elsif self.parent != nil && node != nil
            self.parent.children.reject!{|child|child == self}
            node.children << self
        elsif self.parent != nil && node == nil
            self.parent.children.reject!{|child|child == self}
        end
        @parent = node
    end

    def add_child(child_node)
        child_node.parent = self
    end

    def remove_child(child_node)
        if child_node == nil || child_node.parent == nil
            raise "node has no parent."
        else
            child_node.parent = nil
        end
    end

    def dfs(target_value)
        return self if self.value == target_value
        children.each do |child|
            child_val = child.dfs(target_value)
            return child_val if child_val != nil
        end
        nil
    end

    def bfs(target_value)
        
    end
end