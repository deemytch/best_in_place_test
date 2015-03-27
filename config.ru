# This file is used by Rack-based servers to start the application.
require 'faye'
require ::File.expand_path('../config/environment', __FILE__)

redis_addr = {  host: '127.0.0.1', port: 6379 }

Faye::WebSocket.load_adapter('thin')
use Faye::RackAdapter, mount: '/quick', timeout: 25, engine: { type: Faye::Redis }.merge(redis_addr)
run Rails.application
