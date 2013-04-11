module HomeScreenHelper

  def current_user
    FakeCurrentUser.new
  end

  class FakeCurrentUser

    def name
      "Bob"
    end

    def id
      8
    end

    def photo_src
      "http://www.foreverboho.com/wp-content/gallery/misturadas/bob-marley.jpg"
    end

  end

end
