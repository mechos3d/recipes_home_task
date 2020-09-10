# Recipe list challenge
A simple list of recipes data kept on Contenful CDN.

## Running application example
[Example of this app running on Heroku](https://recipe-list-test.herokuapp.com/)
It's 'sleeping' on a free dyno, so the first cold start will be slow, it's not an application's fault :)          
Note: The number of recipes in the list is set to 3 now because there are only 4 recipes in the Contentful storage -
just to show the pagination working

To authenticate calls to Contentful CDN the application needs a token and space id.         
Please provide them in ENV-variables: `CONTENTFUL_DELIVERY_API_TOKEN`, `CONTENTFUL_DELIVERY_API_SPACE`           
(for local development one can set them in `/config/settings.local.yml` which is ignored by git)

## Running locally
```
git clone https://github.com/mechos3d/recipes_home_task
cd ./recipes_home_task
bundle install 
rm -f ./config/credentials.yml.enc
bundle exec rails credentials:edit
docker build -t recipe_list_challenge_image .
docker run --rm -e CONTENTFUL_DELIVERY_API_TOKEN='zzz' \
-e CONTENTFUL_DELIVERY_API_SPACE='yyy' \
-e RAILS_ENV=production \
-p 3000:3000 --name=recipes_challenge recipe_list_challenge_image
```

## TODOS:
(What I would have done next)

- Better and more interesting frontend :) It's pretty boring and simple at the moment.
  Add header, footer etc, add an ability to change number of recipes in the list.
- Add feature-specs (Capybara + selenium)
- Render markdown in recipes' description ( using [redcarpet](https://github.com/vmg/redcarpet) for example )
- Add more info from Contentful CDN besides the recipes themselves (there are some links and page information) 
- When showing the page with a list of recipes ('index') - we have all the detailed information about the recipes, we just choose not to show it.
  So we can actually show the detailed information about the recipe in a modal window, which is shown after clicking the list element.
  This way we do not have to make another request to the server (and the server doesn't need to touch Contentful to get this data again).
  Taking data from Contentful is the slowest part now (for me in Moscow region at least). 
  I see that it works pretty fast on Heroku having servers located in Europe. But a request to Contentful from Moscow is pretty slow, so it makes sense to keep them to a minimum. Of course having all the detailed info about the recipes will somewhat bloat the 'index' page size, but for now it doesn't look like it can significantly reduce the load speed. 
- The site's content is not individual for each user (it's almost static in that sense) so it makes sense to make heavy use of caching. But in this particular case I would choose to cache pages on web-server (Nginx for example) so it's not the Rails application's concern.

