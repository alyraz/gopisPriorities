class UsersController < ApplicationController

  def new
    url = ["https://accounts.google.com/o/oauth2/auth?",
      "response_type=code&",
      "client_id=184834102114.apps.googleusercontent.com&",
      "redirect_uri=http://localhost:3000/codecallback&",
      "scope=https://www.googleapis.com/auth/userinfo.profile"
      ].join()
    puts "!!!!!!!!!!!!#{url}"
    redirect_to url
  end

  def codecallback
    obtain_access_token
  end

  def logout
    reset_session
    redirect_to root_path
  end
end
