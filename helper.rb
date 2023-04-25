class Getter
  def self.find(hash, key)
    hash.each do |el|
      return el if el.id == key
    end
  end
end
