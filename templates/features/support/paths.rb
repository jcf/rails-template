module PathHelpers
  def path_to(page_name)
    case page_name
    when /home ?page$/
      root_path

    else
      path_from_path_like_name(page_name)
    end
  end

  private

  def path_from_path_like_name(page_name)
    page_name =~ /(.*) page/
    send($1.split(/\s+/).push('path').join('_').to_sym)
  rescue => e
    raise "Can't find path for #{page_name.inspect}"
  end
end

World(PathHelpers)
