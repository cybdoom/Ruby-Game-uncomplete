module Initializer
  def init_with_hash hash
    hash.each { |key, value| self.instance_variable_set("@#{key}", value) }
    self
  end
end
