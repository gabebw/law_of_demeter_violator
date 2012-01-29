require "law_of_demeter_violator/violator"
require "law_of_demeter_violator/global_method"
require "law_of_demeter_violator/version"

module LawOfDemeterViolator
  def self.included(base)
    violator = Violator.new(base)
    violator.violate
  end
end
