class Array
  def accumulate(&operation)
    response = []
    each do |element|
      response << operation.(element)
    end
    response
  end
end
