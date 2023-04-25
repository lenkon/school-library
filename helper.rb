class Getter
  def self.get(hash, key)
    hash.each do |el|
      return el if el.id == key
    end
  end
end
