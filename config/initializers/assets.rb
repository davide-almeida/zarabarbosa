# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.

Rails.application.config.assets.paths << Rails.root.join('node_modules')
# Rails.application.config.assets.paths << Rails.root.join("app", "assets", "fonts")

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
#Rails.application.config.assets.precompile += %w( site/flaticon.css )
Rails.application.config.assets.precompile += %w( site/fonts/icons/font/flaticon.css )
Rails.application.config.assets.precompile += %w( site/shuffle.scss )
Rails.application.config.assets.precompile += %w( instagram_pages.scss )

Rails.application.config.assets.precompile += %w( site/bootstrap.min.js )
Rails.application.config.assets.precompile += %w( site/jquery.min.js )
Rails.application.config.assets.precompile += %w( site/swiper.jquery.min.js )
Rails.application.config.assets.precompile += %w( site/SmoothScroll.js )
Rails.application.config.assets.precompile += %w( site/jquery.sumoselect.min.js )
Rails.application.config.assets.precompile += %w( site/simple-lightbox.min.js )
Rails.application.config.assets.precompile += %w( site/global.js )
Rails.application.config.assets.precompile += %w( site/map.js )
Rails.application.config.assets.precompile += %w( site/site.js )
Rails.application.config.assets.precompile += %w( site/shuffle.js )
# Rails.application.config.assets.precompile += %w( site.js )

# PSI_TEST
Rails.application.config.assets.precompile += %w( tests/psi_test.css )
Rails.application.config.assets.precompile += %w( tests/style.css )
Rails.application.config.assets.precompile += %w( site/psi_test.js )
Rails.application.config.assets.precompile += %w( tests/application.scss )

# #PAINEL
Rails.application.config.assets.precompile += %w( backoffice.css )
# Rails.application.config.assets.precompile += %w( datatables.css )
# Rails.application.config.assets.precompile += %w( datatables.js )

Rails.application.config.assets.precompile += %w( backoffice.js )
# Rails.application.config.assets.precompile += %w( tinymce/langs/pt.js )



#Rails.application.config.assets.paths += Dir["#{Rails.root}/vendor/sbadmin2/*"].sort_by { |dir| -dir.size }
Rails.application.config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif *.svg)

# # site
# Rails.application.config.assets.precompile += %w( site/application.css )
# Rails.application.config.assets.precompile += %w( site/style.css )
# Rails.application.config.assets.precompile += %w( site.css )

# #backoffice (painel)
# Rails.application.config.assets.precompile += %w( backoffice.css )
# Rails.application.config.assets.precompile += %w( backoffice.js )