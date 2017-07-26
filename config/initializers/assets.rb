# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )

Rails.application.config.assets.precompile += %w( ajax-loader.gif )
Rails.application.config.assets.precompile += %w( aos/aos.css )
Rails.application.config.assets.precompile += %w( aos/aos.js )
Rails.application.config.assets.precompile += %w( pages.js )
Rails.application.config.assets.precompile += %w( clothing_lines.js )
Rails.application.config.assets.precompile += %w( items.js )
Rails.application.config.assets.precompile += %w( team_members.js )
Rails.application.config.assets.precompile += %w( order_items.js )
Rails.application.config.assets.precompile += %w( pages.scss )
Rails.application.config.assets.precompile += %w( clothing_lines.scss )
Rails.application.config.assets.precompile += %w( items.scss )
Rails.application.config.assets.precompile += %w( team_members.scss )
Rails.application.config.assets.precompile += %w( order_items.scss )
