class Array

  def my_uniq
    new_arr = []
    self.each do |ele|
      new_arr << ele unless new_arr.include? ele
    end
    new_arr
  end

  def two_sum
    array = []
    (0..length-2).each do |idx1|
      (idx1+1..length-1).each do |idx2|
        array << [idx1, idx2] if self[idx1] + self[idx2] == 0
      end
    end
    array
  end

  def my_transpose
    array = []
    (0...self[0].length).each do |i|
      col = []
      each do |row|
        col << row[i]
      end
      array << col
    end
    array
  end
end

def stock_picker(array)
  best = []
  profit = nil
  (0..array.length-2).each do |idx1|
    (idx1+1..array.length-1).each do |idx2|
      diff = array[idx2] - array[idx1]
      if profit.nil? || diff > profit
        profit = diff
        best = [idx1, idx2]
      end
    end
  end
  best
end
