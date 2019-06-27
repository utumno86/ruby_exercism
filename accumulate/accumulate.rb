class Array
  def accumulate(&operation)
    response = []
    each do |element|
      response << operation.call(element)
    end
    response
  end
end
