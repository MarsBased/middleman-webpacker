require 'middleman-core'

Middleman::Extensions.register(:webpack) do
  require 'middleman-webpacker/extension'
  MiddlemanWebpacker::Extension
end
