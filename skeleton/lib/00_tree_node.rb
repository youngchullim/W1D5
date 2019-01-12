require_relative "my_queue.rb"
require 'byebug'

class PolyTreeNode
  attr_reader :value, :children, :parent

  def initialize(value)
    @parent = nil
    @children = []
    @value = value
  end

  def parent=(parent_x)
    prev_parent = self.parent
    if prev_parent
      prev_parent.children.delete(self)
      parent_x == nil ? @parent = nil : @parent = parent_x
    else
      parent_x == nil ?  @parent = nil : @parent = parent_x
    end

    unless parent_x == nil
      parent_x.children << self unless parent_x.children.include?(self)
    end
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    raise "Not a child" unless self.children.include?(child_node)
    child_node.parent = nil 
  end

  def dfs(target)
    return self if self.value == target
      self.children.each do |child|
        node = child.dfs(target)
        return node if node 
      end
    nil
  end

  def bfs(target)
    q = MyQueue.new
    q.enqueue(self)

    until q.empty?
      current = q.dequeue
      return current if current.value == target
      current.children.each do |child|
        q.enqueue(child)
      end
    end
    nil
  end
end

