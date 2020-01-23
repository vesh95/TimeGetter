class App
  def call(env)
    [
      200,
      { 'Content-Type' => 'text/plain' },
      ["Stub"]
    ]
  end

  def time

  end
end
