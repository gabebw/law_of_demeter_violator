require "ostruct"

module LawOfDemeterViolator
  class Violator
    def initialize(class_to_be_violated)
      @class_to_be_violated = class_to_be_violated
    end

    def violate
      methods_to_violate.each do |original_method_name|
        unviolated_method_name = :"__unviolated_#{original_method_name}"
        @class_to_be_violated.class_eval do
          # First, save the unviolated method.
          alias_method(unviolated_method_name, original_method_name)

          # # Then, remove the unviolated method. It's still saved via the call to
          # alias_method.
          remove_method(original_method_name)

          # Now, define a new method with the same name. It returns an OpenStruct with one key,
          # the original method name. So obj.user is now obj.user.user.
          # Pretty sure |*args| is 1.9-only
          define_method(original_method_name) do |*args|
            original_value = __send__(unviolated_method_name, *args)
            OpenStruct.new(original_method_name => original_value)
          end
        end
      end
    end

    private

    def methods_to_violate
      @class_to_be_violated.instance_methods(false)
    end
  end
end
