module CheckinsHelper

  def format_time(datetime)
    datetime.strftime " %m.%d.%y "
  end
end
