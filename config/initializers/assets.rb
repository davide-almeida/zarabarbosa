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

# SITE
Rails.application.config.assets.precompile += %w( site/bootstrap.min.css )
Rails.application.config.assets.precompile += %w( site/application.css )
Rails.application.config.assets.precompile += %w( site/swiper.css )
Rails.application.config.assets.precompile += %w( site/style.css )
Rails.application.config.assets.precompile += %w( site/sumoselect.css )
Rails.application.config.assets.precompile += %w( site/flaticon.css )

Rails.application.config.assets.precompile += %w( site/bootstrap.min.js )
Rails.application.config.assets.precompile += %w( site/jquery.min.js )
Rails.application.config.assets.precompile += %w( site/swiper.jquery.min.js )
Rails.application.config.assets.precompile += %w( site/SmoothScroll.js )
Rails.application.config.assets.precompile += %w( site/jquery.sumoselect.min.js )
Rails.application.config.assets.precompile += %w( site/simple-lightbox.min.js )
Rails.application.config.assets.precompile += %w( site/global.js )
Rails.application.config.assets.precompile += %w( site/map.js )

#PAINEL
Rails.application.config.assets.precompile += %w( backoffice.css )

Rails.application.config.assets.precompile += %w( backoffice.js )
