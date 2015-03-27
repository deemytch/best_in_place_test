# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

Rails.application.config.assets.precompile += %w(
    sessions.css sessions.js
    mobile.css mobile.js
    app.js app.css
    devices.js devices.css
    home.js home.css
    orders.js orders.css
    restaurant.js restaurant.css
    tables.js tables.css
    users.js users.css
    dishes.js dishes.css
    sections.js sections.css
    restaurants.js restaurants.css
    tables_index.js
    orders_index.js
    app_home_index.js
    app_tables.js
    dish_index.js
    best_in_place.js
    )
