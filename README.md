# MoviesList

**Scope:** 
```
1. Use Ruby in Rails
2. fetch the movies list from http://www.omdbapi.com 
3. Display all the movies list
4. Add  movie to Favorites
5. Display all Favorites list
6. Remove movie from Favorites
7. View all the movie info
```
**Setup:**

**Install Ruby**
```
$asdf plugin add ruby
$asdf install ruby latest
$asdf global ruby latest
```

**Install Rails**
```
$gem install rails
```

**App Installation**
rails new movies_list
cd movies_list

**Gems Used**
```
gem 'httparty' #for calling third party services
gem 'bootstrap', '~> 5.3.2' #for form view
gem 'dotenv-rails' #for storing env variables

bundle install
```
**Generated Service for fetching movies list**
```
def self.get_movies_list(options={})
    url = "#{BASE_URL}?apikey=#{API_KEY}" #test-base-url: https://www.omdbapi.com/, test-api-key: bd05af55
    url += "&s=latest" unless options.present?
    url += "&plot=full&i=#{options[:id]}" if options[:id].present?
    uri = URI(url)
    response = Net::HTTP.get_response(uri)
    if response.is_a?(Net::HTTPSuccess)
      JSON.parse(response.body)
    else
      nil
    end
  end

this method is used for fetching the movies list from [omdapi ](https://www.omdbapi.com/)https://www.omdbapi.com/
```
**Please find some of the attached screens for reference**


**Show page**

![view](https://github.com/renukasalapu/MoviesList/assets/17824367/8d1495cf-a0c5-420c-8dfe-a99cb54951bf)


**Search View**

![search](https://github.com/renukasalapu/MoviesList/assets/17824367/07ce1841-e87b-409f-8fd8-f6864e4deb31)


**Favorites Page**

![favorites](https://github.com/renukasalapu/MoviesList/assets/17824367/3fff08e3-eafc-4e21-bdb9-309d21c1e062)


**Movies List**

![allmovies](https://github.com/renukasalapu/MoviesList/assets/17824367/d920b57d-a1f4-494b-a072-cc740f1163d7)
