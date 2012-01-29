require "spec_helper"

describe LawOfDemeterViolator do
  it "violates the Law of Demeter hardcore" do
    define_class("ViolatedGreeter") do
      def hello
        "hello"
      end

      include LawOfDemeterViolator
    end

    # include_violator_in(Greeter)
    violated_instance = ViolatedGreeter.new

    violated_instance.hello.hello.should == "hello"
  end

  def include_violator_in(a_class)
    a_class.send(:include, LawOfDemeterViolator)
  end
end
