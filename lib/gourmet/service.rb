module Gourmet
  class Service

    def self.call(*args)
      new.call(*args)
    end

    def call
      raise "You must override #call in class #{self.class.name}"
    end


    # Helper methods for instantiating Success/Failure result objects
    # inside Services
    #
    # Example:
    #
    #   class DoWork < Gourmet::Service
    #     def call(magic_number)
    #       if magic_number == 7
    #         Success(magic_number)
    #       else
    #         Failure()
    #       end
    #     end
    #   end
    #
    #   result = DoWork.call(7)
    #   result.success? # => true
    #   result.value    # => 7
    #
    #   result = DoWork.call(2)
    #   result.failure? # => true

    def Success(value = nil)
      Gourmet::Success.new(value)
    end

    def Failure(value = nil)
      Gourmet::Failure.new(value)
    end

  end
end
