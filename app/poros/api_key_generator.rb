class ApiKeyGenerator
  def key
    SecureRandom.hex(16)
  end
end
