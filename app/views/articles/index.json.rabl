object false

child @articles, object_root: false do
  attributes :id, :title, :content, :created_at
  
  node :href do |article|
    article_url(article)
  end
  
  node :links do |article|
    {
      user: user_url(article.user),
      comments: @comments ? @comments.map {|c| c.id} : article_comments_url(article)
    }
  end
end

node :linked do
  {
    articles: articles_url,
    comments: comments_url,
    users: users_url
  }
end

if @comments
  child @comments, object_root: false do
    attributes :id, :content, :created_at
  end
end
