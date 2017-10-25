module GoGamification
  class Engine < ::Rails::Engine
    initializer :append_migrations do |app|
      # This prevents migrations from being loaded twice from the inside of the
      # gem itself (dummy test app)
      if app.root.to_s !~ /#{root}/
        config.paths['db/migrate'].expanded.each do |migration_path|
          app.config.paths['db/migrate'] << migration_path
        end
      end
    end

    config.assets.precompile += ['*.js', '*.css', '**/*.js', '**/*.css', '*.jpg',
                                                   '*.png', '*.ico', '*.gif', '*.woff2', '*.eot',
                                                   '*.woff', '*.ttf', '*.svg']

  end
end
