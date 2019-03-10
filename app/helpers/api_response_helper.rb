module ApiResponseHelper

  def render_404(object_name='object')
    render :json => {message: "#{object_name} not found"}, status: 404
  end

  def render_400(errors = nil)
    render :json => {message: errors}, status: 400
  end

  def render_422(errors = nil)
    render :json => {message: errors}, status: 422
  end

  def render_401(message = nil)
    render :json => {message: message}, status: 401
  end

  def render_403(message = nil)
    render :json => {message: message}, status: 403
  end

end