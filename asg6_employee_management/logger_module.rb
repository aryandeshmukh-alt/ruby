module LoggerModule
  def log(message)
    time = Time.now.strftime("%H:%M:%S")
    puts "[LOG] #{time} - #{message}"
  end
end
