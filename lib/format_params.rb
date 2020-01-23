class FormatParams
  def self.parse(query)
    query.split('=')[-1].split('%2C')
  end
end
