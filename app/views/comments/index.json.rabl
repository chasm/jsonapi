object false

child @comments, object_root: false do
  attributes :id, :content, :created_at
  
  node :href do |comment|
    comment_url(comment)
  end
  
  node :links do |comment|
    {
      user: user_url(comment.user),
      article: article_url(comment.article)
    }
  end
end

node :linked do
  {
    comments: comments_url,
    comments: comments_url,
    users: users_url
  }
end