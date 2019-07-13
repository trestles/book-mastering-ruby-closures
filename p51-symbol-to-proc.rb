class Symbol
  def to_proc
    # top of p51
    lambda { |obj| obj.send(self) }
    # bottom of p51
    lambda { |obj| obj.send(self) }
end
end