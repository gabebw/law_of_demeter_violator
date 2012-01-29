require 'spec_helper'

describe "the global Violate method" do
  it "violates the given class" do
    define_class("Greeter") do
      def hello
        "hello"
      end
    end

    Violate(Greeter)
    violated_instance = Greeter.new

    violated_instance.hello.hello.should == "hello"
  end
end
