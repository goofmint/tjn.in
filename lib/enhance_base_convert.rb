module Bulkitem
  module EnhanceBaseConvert
    CHARS = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9",
             "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m",
             "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z",
             "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M",
             "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "_", "-"]
 
    MAP   = {"0" => 0, "1" => 1, "2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6, "7" => 7, "8" => 8, "9" => 9,
             "a" => 10, "b" => 11, "c" => 12, "d" => 13, "e" => 14, "f" => 15, "g" => 16,
             "h" => 17, "i" => 18, "j" => 19, "k" => 20, "l" => 21, "m" => 22, "n" => 23,
             "o" => 24, "p" => 25, "q" => 26, "r" => 27, "s" => 28, "t" => 29, "u" => 30,
             "v" => 31, "w" => 32, "x" => 33, "y" => 34, "z" => 35,
             "A" => 36, "B" => 37, "C" => 38, "D" => 39, "E" => 40, "F" => 41, "G" => 42,
             "H" => 43, "I" => 44, "J" => 45, "K" => 46, "L" => 47, "M" => 48, "N" => 49,
             "O" => 50, "P" => 51, "Q" => 52, "R" => 53, "S" => 54, "T" => 55, "U" => 56,
             "V" => 57, "W" => 58, "X" => 59, "Y" => 60, "Z" => 61, "_" => 62, "-" => 63}
    def self.dec2b64(val)
      val = Integer(val)
      ret = []
      loop do
        break if val.zero?
        ret.unshift CHARS[val % 64]
        val = val / 64
      end
      ret.empty? ? "0" : ret.join
    end
    def self.b642dec(val)
      ret = 0
      chars = val.scan(/[0-9a-zA-Z_\-]/).reverse
      chars.each_with_index do |v, i|
        ret += (64 ** i) * MAP[v]
      end
      ret
    end
  end
end

class Fixnum
  alias :to_s_old :to_s
  def to_s(val=10)
    if val == 64
      Bulkitem::EnhanceBaseConvert.dec2b64(self)
    else
      self.to_s_old(val)
    end
  end
end

class Bignum
  alias :to_s_old :to_s
  def to_s(val=10)
    if val == 64
      Bulkitem::EnhanceBaseConvert.dec2b64(self)
    else
      self.to_s_old(val)
    end
  end
end

class String
  alias :to_i_old :to_i
  def to_i(val=10)
    if val == 64
      Bulkitem::EnhanceBaseConvert.b642dec(self)
    else
      self.to_i_old(val)
    end
  end
end
