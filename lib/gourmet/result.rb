module Gourmet
  class Result
    attr_reader :value

    def success?
      is_a?(Success)
    end

    def failure?
      is_a?(Failure)
    end

    def initialize(value)
      @value = value
    end
  end


  class Success < Result; end
  class Failure < Result; end
end
