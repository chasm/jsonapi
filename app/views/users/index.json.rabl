object false

child @users, object_root: false do
  attributes :id, :name
  
  node :href do |user|
    user_url(user)
  end
  
  node :links do |user|
    {
      articles: user_articles_url(user),
      comments: user_comments_url(user)
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