resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'

ui_page 'html/index.html'

files {
  'html/index.html',
  'html/index.css',
  'html/fonts/SignPainter.ttf',
  'html/item-quantity-dropdown.min.js',

}

client_scripts {
	"config.lua",
	"client.lua"
}

server_scripts {
	"config.lua",
	"server.lua"
}