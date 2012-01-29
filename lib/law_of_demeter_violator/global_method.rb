def Violate(object)
  violator = LawOfDemeterViolator::Violator.new(object)
  violator.violate
end
