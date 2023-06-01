class ErrorSerializer
  def initialize(error)
    @error = error
  end

  def serialize
    { errors: [{ status: 400, title: @error.message }] }
  end
end