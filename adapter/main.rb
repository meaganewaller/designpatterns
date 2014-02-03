require './renderer'
require './text_object'
require './british_text_object'


# === Modify the BritishTextObject class === #
# Extend the BritishTextObject to include the 
# methods that the Renderer class requires

class BritishTextObjects
  def color
    return colour
  end

  def text
    return string
  end

  def size_inches
    return size_mm / 25.4
  end
end


# === Modify a Single Instance === #
#
bto = BritishTextObject.new('test', 25.4, :yellow)

class << bto
  def color
    colour
  end

  def text
    string
  end

  def size_inches
    return size_mm/25.4
  end
end


# === Another way to achieve modifying a single instace === #

def bto.color
  colour
end

def bto.text
  string
end

def bto.size_inches
  return size_mm/25.4
end



