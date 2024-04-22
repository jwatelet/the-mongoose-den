# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "@fortawesome/fontawesome-free", to: "@fortawesome--fontawesome-free.js" # @6.5.2
pin "@fortawesome/fontawesome-svg-core", to: "@fortawesome--fontawesome-svg-core.js" # @6.5.2
pin "@fortawesome/free-brands-svg-icons", to: "@fortawesome--free-brands-svg-icons.js" # @6.5.2
pin "@fortawesome/free-regular-svg-icons", to: "@fortawesome--free-regular-svg-icons.js" # @6.5.2
pin "@fortawesome/free-solid-svg-icons", to: "@fortawesome--free-solid-svg-icons.js" # @6.5.2
