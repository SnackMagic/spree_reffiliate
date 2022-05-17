module SpreeReffiliate
  module Generators
    class InstallGenerator < Rails::Generators::Base

      class_option :auto_run_migrations, type: :boolean, default: false

      def add_javascripts
        # append_file 'vendor/assets/javascripts/spree/frontend/all.js', "//= require spree/frontend/spree_reffiliate\n"
      end

      def add_migrations
        run 'bundle exec rake railties:install:migrations FROM=spree_reffiliate'
      end

      def run_migrations
        run_migrations = options[:auto_run_migrations] || ['', 'y', 'Y'].include?(ask 'Would you like to run the migrations now? [Y/n]')
        if run_migrations
          run 'bundle exec rake db:migrate'
        else
          puts 'Skipping rake db:migrate, don\'t forget to run it!'
        end
      end

      def seed
        Spree::CommissionRule.find_or_create_by(name: Spree::CommissionRule::USER_REGISTRATION, fixed_commission: true)
        Spree::CommissionRule.find_or_create_by(name: Spree::CommissionRule::ORDER_PLACEMENT, fixed_commission: false)
      end
    end
  end
end
