require "deploy/code"
require "deploy/code/modules/laravel/version"

module Deploy
  module Code
    module Modules
      module Laravel
        # Your code goes here...
      end
    end
  end
end

Deploy::Code.within_capistrano do

  namespace :laravel do
    task :fix_storage do
      run "chmod -R 777 #{deploy_to}/current/app/storage; true"
    end
  end

  after :deploy, 'laravel:fix_storage'

end

