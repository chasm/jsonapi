Article.destroy_all
User.destroy_all

users = User.create([
  { name: "Bob" },
  { name: "Ted" },
  { name: "Carol" },
  { name: "Alice" }
])

articles = Article.create([
  {
    title: "Bob's BS",
    content: "Vivamus magna justo, lacinia eget consectetur sed.",
    user: users[0]
  },
  {
    title: "More of Bob's BS",
    content: "Pellentesque in ipsum id orci porta dapibus.",
    user: users[0]
  },
  {
    title: "Ted's Wisdom",
    content: "Cras ultricies ligula sed magna dictum porta.",
    user: users[1]
  },
  {
    title: "Go Ask Alice",
    content: "I think she'll know.",
    user: users[3]
  },
  {
    title: "Alice in Wonderland",
    content: "Sed porttitor lectus nibh.",
    user: users[3]
  },
  {
    title: "Through the Looking Glass",
    content: "Praesent sapien massa, convallis a pellentesque nec.",
    user: users[3]
  }
])

Comment.create([
  {
    content: "Proin eget tortor risus.",
    user: users[2],
    article: articles[0]
  },
  {
    content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
    user: users[3],
    article: articles[1]
  },
  {
    content: "Vestibulum ante ipsum primis in faucibus orci.",
    user: users[1],
    article: articles[1]
  },
  {
    content: "Quisque velit nisi, pretium ut lacinia in.",
    user: users[2],
    article: articles[1]
  },
  {
    content: "Cras ultricies ligula sed magna dictum porta.",
    user: users[0],
    article: articles[5]
  },
  {
    content: "Curabitur aliquet quam id dui posuere blandit.",
    user: users[2],
    article: articles[4]
  },
  {
    content: "Nulla quis lorem ut libero malesuada feugiat.",
    user: users[0],
    article: articles[4]
  },
  {
    content: "Donec rutrum congue leo eget malesuada.",
    user: users[2],
    article: articles[3]
  },
  {
    content: "Nulla quis lorem ut libero malesuada feugiat.",
    user: users[1],
    article: articles[2]
  },
  {
    content: "Donec sollicitudin molestie malesuada.",
    user: users[3],
    article: articles[2]
  },
])
