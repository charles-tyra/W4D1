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

    


end