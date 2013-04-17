module UsersHelper
  require "net/http"

  def current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    else
      false
    end
  end

  def obtain_auth_code
    url = URI.parse( ["https://accounts.google.com/o/oauth2/auth?",
      "response_type=code&",
      "client_id=184834102114.apps.googleusercontent.com&",
      "redirect_uri=http://localhost:3000/codecallback&",
      "scope=https://www.googleapis.com/auth/userinfo.profile"].join()
      )
    Net::HTTP::Get.new(url.path)
  end

  def obtain_access_token
    uri = URI.parse ("https://accounts.google.com/o/oauth2/token")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    req = Net::HTTP::Post.new(uri.path)
    req.set_form_data(post_params(params[:code]))
    res = http.request(req).body
    access_token = JSON.parse(res)["access_token"]
    api_call(access_token)
  end

  def api_call(access_token)
    uri = URI("https://www.googleapis.com/oauth2/v1/userinfo?access_token=#{access_token}")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE # You should use VERIFY_PEER in production
    request = Net::HTTP::Get.new(uri.request_uri)
    res = http.request(request)
    user_info = JSON.parse(res.body)
    create_user(user_info)
  end

  def create_user(user_info)
    user = User.new name:      user_info["name"],
                    photo_src: user_info["picture"]
    if user.save!
      authenticate(user)
      redirect_to '/'
    else
      #handle errors
    end
  end

  def authenticate(user)
    session[:user_id]   = user.id
    session[:user_name] = user.name
    session[:photo_src] = user.photo_src
  end

  def post_params(auth_code)
    { "code" => auth_code,
      "client_id" => "184834102114.apps.googleusercontent.com",
      "client_secret" => "YJg8t7S_yDSCJsvnPnsS0U3k",
      "redirect_uri" => "http://localhost:3000/codecallback",
      "grant_type" => "authorization_code"
    }
  end

end
