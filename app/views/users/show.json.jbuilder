json.id @user.id
json.avatar_url @user.photo
json.reviews do
  json.array! @user.reviews do |review|
    json.movie review.movie, :title, :id, :release_date, :popularity, :tmdb_id, :poster
    json.rating review.rating
  end
end