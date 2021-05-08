# user = User.first
# user.articles.delete_all
Article.delete_all

35.times do
  FactoryBot.create(:article)
end
