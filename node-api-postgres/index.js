const express = require('express')
const bodyParser = require('body-parser')
const app = express()
const db = require('./queries')
const port = 3000

app.use(bodyParser.json())
app.use(
  bodyParser.urlencoded({
    extended: true,
  })
)

app.get('/', (request, response) => {
  response.json({ info: 'Test' })
})

app.get('/users', db.getUsers)
app.get('/movies', db.getMovies)
app.get('/shows', db.getShows)
app.get('/books', db.getBooks)
app.get('/users-movies/:id', db.getMoviesByUserId)
app.get('/users-shows/:id', db.getShowsByUserId)
app.get('/users-books/:id', db.getBooksByUserId)
app.post('/users', db.createUser)
app.post('/movies', db.addMovie)
app.post('/shows', db.addShow)
app.post('/books', db.addBook)
app.post('/moviesUpdateUserList', db.addMovieToUserList)
app.post('/showsUpdateUserList', db.addShowToUserList)
app.post('/booksUpdateUserList', db.addBookToUserList)
app.post('/updateMovieIsCompleted', db.updateMovieIsCompleted)
app.post('/updateShowIsCompleted', db.updateShowIsCompleted)
app.post('/updateBookIsCompleted', db.updateBookIsCompleted)
app.delete('/users-movies/:id/:mediaID', db.removeMovieFromUserList)
app.delete('/users-shows/:id/:mediaID', db.removeShowFromUserList)
app.delete('/users-books/:id/:mediaID', db.removeBookFromUserList)

app.listen(port, () => {
  console.log(`App running on port ${port}.`)
})