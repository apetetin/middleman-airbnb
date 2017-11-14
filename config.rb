activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

activate :sprockets

page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :asset_hash
  activate :relative_assets
  set :relative_links, true
end

activate :deploy do |deploy|
  deploy.build_before = true
  deploy.deploy_method = :git
end

# data.users.each do |user|
#   proxy "/flats/#{user.github_nickname}.html", "/flats/show.html", locals: { owner: user.github_nickname }, ignore: true
# end

data.offers.each do |name, offer|
  proxy "/offers/#{name}.html", "/offers/show.html", locals: { coach: name }, ignore: true
end
