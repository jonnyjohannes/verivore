atom_feed do |feed|
  feed.title("Verivore Weblog")
  feed.updated(@posts.first.created_at)

  @posts.each do |post|
    feed.entry(post) do |entry|
      entry.title(post.title)
      entry.content(post.body, :type => 'html')
      entry.author { |author| author.name("Jonathan (Jonny) Johannes") }
    end
  end
end
