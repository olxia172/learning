module OpinionsHelper
  def opinion_author(opinion)
    if opinion.user
      opinion.user.email
    else
      opinion.author
    end
  end
end
