class MyQueue
  def initialize
    @line = []
  end

  def enqueue(val)
    line << val
  end

  def dequeue
    line.shift
  end

  def show
    line.dup
  end

  def peek
    line.first
  end

  def empty?
    line.empty?
  end

  private 

  attr_reader :line
end