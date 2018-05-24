$(function(){
  let form = $('#movie-search');
  form.submit(function(e){
    e.preventDefault();

    $.ajax({
      url: 'https://api.themoviedb.org/3/search/movie?api_key=3deceb9041e72a8856191ddeaf96a293',
      data: form.serialize()
    })
    .done(function(data){
      displayMovies(data);
    });
  });



$('#movies').on('click','img.movie_poster',function(e){
  e.preventDefault();

  let id = $(e.target).data('id');

  $.ajax({
    url: 'https://api.themoviedb.org/3/movie/' + id + '?',
    data: {'api_key' : '3deceb9041e72a8856191ddeaf96a293'}
  })
  .done(function(data){
    displayMovie(data)
  })
});

function displayMovies(data){
  let container = $("#movies");
  let htmlString = "";

  container.empty();

  let imageUrl = getBaseImageUrl();

  if (data["results"].length == 0) {
    htmlString = `<div class="alert alert-danger text-center" role="alert">No Data Found!</div>`;
  }
  else{
    data["results"].forEach(function(movie){
      htmlString += `
      <img src=${movie["poster_path"] == null ? "/assets/no.jpg" : imageUrl + "/" + movie["poster_path"]} data-id="${movie['id']}" class="movie_poster"/>
                     <p>${movie["title"]}</p>
                     <p>${movie["overview"]}</p>`;
    });
  }

  container.append(htmlString);
}




    function displayMovie(movie){
        let container = $("#movies");
        let htmlString = "";
        
        var imageUrl = getBaseImageUrl();

        container.empty();
        htmlString +=
        `    

            
            <img src=${movie["poster_path"] == null ? "/assets/no.jpg" : imageUrl + "/" + movie["poster_path"]} data-id="${movie['id']}" class = "movie_poster" />
            <h1>${movie["title"]}</h2>
            <br /> <br /> <br /> <br />
            <h3>Vote Average:${movie["vote_average"]}</h3>
           <b> Adult:</b> ${movie["adult"]}<br />
            <b>Overview: </b> ${movie["overview"]}<br />
            <b>Original Title: </b> ${movie["original_title"]}<br />
            <b>Original Language: </b> ${movie["original_language"]}<br />
            <b>Release Date: </b> ${movie["release_date"]}<br />
            <b>Plot: </b> ${movie["plot"]}<br />
            <b>Runtime: </b> ${movie["runtime"]}<br />
            <b>Released: </b> ${movie["released"]}<br />
            <b>Genre: </b> ${movie["genre"]}<br />
            <b>Language: </b> ${movie["language"]}<br />
            <b>Budget: </b> ${movie["budget"]}<br />
            <b>Homepage: </b> ${movie["homepage"]}<br />
            <b>Tmdb Id: </b> ${movie["tmdb_id"]}<br />
            <b>Imdb Id: </b> ${movie["imdb_id"]}<br />
            <b>Popularity: </b> ${movie["popularity"]}<br />
            

            <form id="rating-form" action="/reviews" method="POST">
              <input type="hidden" name="authenticity_token" value=${window._token} />
              <input type="hidden" name="tmdb_id" value=${movie["id"]} />
              <b> Ratings: </b>
              <input type="text" name= "review[rating]" class="form-control" placeholder="Ratings out of 10">
              <br />
              <input type="submit" class="btn btn-success pull-right" />
            </form>

            `;
             container.append(htmlString);

             
}
      
 function getBaseImageUrl(){
    var url = "";
    var settings = {
      "async": false,
      "crossDomain": true,
      "url": "https://api.themoviedb.org/3/configuration?api_key=3deceb9041e72a8856191ddeaf96a293",
      "method": "GET",
      "headers": {},
      "data": "{}"
    }

    $.ajax(settings).done(function (response) {
      url = response["images"]["base_url"] + response["images"]["poster_sizes"][3];
    });
    return url;
  }
});
