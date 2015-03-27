module ApplicationHelper
  def faye_client
    @@client ||= Faye::Client.new("http://localhost:#{request.port}/quick")
  end
end
