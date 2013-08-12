module Nesta
  class App
    not_found do
      cache haml("404".to_sym)
    end
  end
end