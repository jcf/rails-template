module PathHelpers
  def path_to(page_name)
    case page_name
    when /home ?page$/
      root_path

    when /^#{capture_model}(?:'s)? page$/
      path_to_pickle $1

    when /^#{capture_model}(?:'s)? #{capture_model}(?:'s)? page$/
      path_to_pickle $1, $2

    when /^#{capture_model}(?:'s)? #{capture_model}'s (.+?) page$/
      path_to_pickle $1, $2, extra: $3

    when /^#{capture_model}(?:'s)? (.+?) page$/
      path_to_pickle $1, extra: $2

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
