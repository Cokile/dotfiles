require('options')
require('mappings')
require('commands')
-- plugins comes after mappings
require('plugin')
-- theme comes to the end to prevent overwrite by other plugins
require('theme')
