require "spec_helper"

describe LawOfDemeterViolator::Violator do
  it "violates methods that don't take arguments" do
    define_class("Something") do
      def hello
        "hello"
      end
    end

    violator = LawOfDemeterViolator::Violator.new(Something)
    violator.violate

    Something.new.hello.hello.should == "hello"
  end

  it "violates methods that take arguments" do
    define_class("ClassWithMethodWithArguments") do
      def name_plus(extra_argument)
        "Bob #{extra_argument}"
      end
    end

    violator = LawOfDemeterViolator::Violator.new(ClassWithMethodWithArguments)
    violator.violate

    violated_instance = ClassWithMethodWithArguments.new
    violated_instance.name_plus("Viola").name_plus.should == "Bob Viola"
  end

  it "does not violate methods from parent classes" do
    define_class("Parent") do
      def parent_method
        "parent"
      end
    end

    define_class("Child", Parent)

    violator = LawOfDemeterViolator::Violator.new(Child)
    violator.violate

    Child.new.parent_method.should == "parent"
  end
end
