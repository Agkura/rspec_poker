class Hanoi
  attr_reader :towers

  def initialize(towers = nil)
    towers ||= [[3,2,1],[],[]]
    @towers = towers

  end

  def valid_move?(move)
    t1, t2 = move
    return false unless t1.between?(0,2) && t2.between?(0,2)
    return false if towers[t1].empty?
    return true if towers[t2].empty?
    return false if towers[t1].last > towers[t2].last
    true
  end

  def move(input)
    t1, t2 = input
    towers[t2] << towers[t1].pop
  end

  def won?
    p  towers[0].empty? && (towers[1].empty? || towers[2].empty?)
    towers[0].empty? && (towers[1].empty? || towers[2].empty?)
  end
end
