require 'middleman-core'

Middleman::Extensions.register(:webpack) do
  require 'middleman-webpack/extension'
  MiddlemanWebpack::Extension
end
