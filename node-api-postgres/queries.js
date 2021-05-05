const Pool = require('pg').Pool
const pool = new Pool({
  user: 'austin',
  host: 'localhost',
  database: 'letswatchthis',
  password: 'password',
  port: 5432,
})

const getUsers = (request, response) => {
  pool.query('SELECT * FROM users ORDER BY user_id ASC', (error, results) => {
    if (error) {
      throw error
    }
    response.status(200).json(results.rows)
  })
}

const getMovies = (request, response) => {
  pool.query('SELECT * FROM movies ORDER BY movie_id ASC', (error, results) => {
    if (error) {
      throw error
    }
    response.status(200).json(results.rows)
  })
}

const getShows = (request, response) => {
  pool.query('SELECT * FROM shows ORDER BY show_id ASC', (error, results) => {
    if (error) {
      throw error
    }
    response.status(200).json(results.rows)
  })
}

const getBooks = (request, response) => {
  pool.query('SELECT * FROM books ORDER BY book_id ASC', (error, results) => {
    if (error) {
      throw error
    }
    response.status(200).json(results.rows)
  })
}

const getMoviesByUserId = (request, response) => {
  const id = parseInt(request.params.id)

  pool.query('SELECT * FROM movies JOIN users_movies ON movies.movie_id = users_movies.movie_id JOIN users ON users_movies.user_id = users.user_id WHERE users.user_id = $1', [id], (error, results) => {
    if (error) {
      throw error
    }
    response.status(200).json(results.rows)
  })
}

const getShowsByUserId = (request, response) => {
  const id = parseInt(request.params.id)

  pool.query('SELECT * FROM shows JOIN users_shows ON shows.show_id = users_shows.show_id JOIN users ON users_shows.user_id = users.user_id WHERE users.user_id = $1', [id], (error, results) => {
    if (error) {
      throw error
    }
    response.status(200).json(results.rows)
  })
}

const getBooksByUserId = (request, response) => {
  const id = parseInt(request.params.id)

  pool.query('SELECT * FROM books JOIN users_books ON books.book_id = users_books.book_id JOIN users ON users_books.user_id = users.user_id WHERE users.user_id = $1', [id], (error, results) => {
    if (error) {
      throw error
    }
    response.status(200).json(results.rows)
  })
}

const createUser = (request, response) => {
  const { name } = request.body

  pool.query('INSERT INTO users (user_name) VALUES ($1)', [name], (error, results) => {
    if (error) {
      throw error
    }
    response.status(201).send(`User added successfully.`)
  })
}

const deleteUser = (request, response) => {
  const id = parseInt(request.params.id)

  pool.query('DELETE FROM users WHERE user_id = $1', [id], (error, results) => {
    if (error) {
      throw error
    }
    response.status(200).send(`User deleted with ID`)
  })
}

const addMovie = (request, response) => {
  const { title, summary, mediaType, imagePath } = request.body

  pool.query('INSERT INTO movies (movie_title, movie_description, media_type, image_path) VALUES ($1, $2, $3, $4) RETURNING *', [title, summary, mediaType, imagePath], (error, results) => {
    if (error) {
      throw error
    }
    response.status(200).json(results.rows)
  })
}

const addShow = (request, response) => {
  const { title, summary, mediaType, imagePath } = request.body

  pool.query('INSERT INTO shows (show_title, show_description, media_type, image_path) VALUES ($1, $2, $3, $4)', [title, summary, mediaType, imagePath], (error, results) => {
    if (error) {
      throw error
    }
    response.status(200).json(results.rows)
  })
}

const addBook = (request, response) => {
  const { title, summary, mediaType, imagePath } = request.body

  pool.query('INSERT INTO books (book_title, book_description, media_type, image_path) VALUES ($1, $2, $3, $4)', [title, summary, mediaType, imagePath], (error, results) => {
    if (error) {
      throw error
    }
    response.status(200).json(results.rows)
  })
}

const addMovieToUserList = (request, response) => {
  const { userID, movieID, hasWatched } = request.body

  pool.query('INSERT INTO users_movies (user_id, movie_id, isCompleted) VALUES ($1, $2, $3)', [userID, movieID, hasWatched], (error, results) => {
    if (error) {
      throw error
    }
    response.status(201).send(`User/Movies join table added to successfully.`)
  })
}

const addShowToUserList = (request, response) => {
  const { userID, showID, hasWatched } = request.body

  pool.query('INSERT INTO users_shows (user_id, show_id, isCompleted) VALUES ($1, $2, $3)', [userID, showID, hasWatched], (error, results) => {
    if (error) {
      throw error
    }
    response.status(201).send(`User/Shows join table added to successfully.`)
  })
}

const addBookToUserList = (request, response) => {
  const { userID, bookID, hasWatched } = request.body

  pool.query('INSERT INTO users_books (user_id, book_id, isCompleted) VALUES ($1, $2, $3)', [userID, bookID, hasWatched], (error, results) => {
    if (error) {
      throw error
    }
    response.status(201).send(`User/Books join table added to successfully.`)
  })
}

const removeMovieFromUserList = (request, response) => {
  const id = parseInt(request.params.id)
  const mediaID = parseInt(request.params.mediaID)

  pool.query('DELETE FROM users_movies WHERE user_id = $1 AND movie_id = $2', [id, mediaID], (error, results) => {
    if (error) {
      throw error
    }
    response.status(200).send(`Movie removed from users list`)
  })
}

const removeShowFromUserList = (request, response) => {
  const id = parseInt(request.params.id)
  const mediaID = parseInt(request.params.mediaID)

  pool.query('DELETE FROM users_shows WHERE user_id = $1 AND show_id = $2', [id, mediaID], (error, results) => {
    if (error) {
      throw error
    }
    response.status(200).send(`Show removed from users list`)
  })
}

const removeBookFromUserList = (request, response) => {
  const id = parseInt(request.params.id)
  const mediaID = parseInt(request.params.mediaID)

  pool.query('DELETE FROM users_books WHERE user_id = $1 AND book_id = $2', [id, mediaID], (error, results) => {
    if (error) {
      throw error
    }
    response.status(200).send(`Book removed from users list`)
  })
}

// curl --data "title=Test Movie Insert&summary=Test Movie 1 Test Descriptions&mediaType=movie&imagePath=imagePlaceholder" http://localhost:3000/movies
// curl --data "userID=9&movieID=11&hasWatched=false" http://localhost:3000/moviesUpdateUserList
// curl --data "userID=9&showID=11&hasWatched=false" http://localhost:3000/showsUpdateUserList
// curl --data "userID=9&showID=10&hasWatched=false" http://localhost:3000/showsUpdateUserList
// curl --data "userID=9&bookID=11&hasWatched=false" http://localhost:3000/booksUpdateUserList
// curl --data "userID=9&bookID=10&hasWatched=false" http://localhost:3000/booksUpdateUserList
// curl --data "title=Test Show Insert&summary=Test Show 1 Test Descriptions&mediaType=show&imagePath=imagePlaceholder" http://localhost:3000/shows
// curl --data "title=Test Book Insert&summary=Test Book 1 Test Descriptions&mediaType=book&imagePath=imagePlaceholder" http://localhost:3000/books

// const createUser = (request, response) => {
//   const { name, email } = request.body

//   pool.query('INSERT INTO users (name, email) VALUES ($1, $2)', [name, email], (error, results) => {
//     if (error) {
//       throw error
//     }
//     response.status(201).send(`User added with ID: ${result.insertId}`)
//   })
// }

// const updateUser = (request, response) => {
//   const id = parseInt(request.params.id)
//   const { name, email } = request.body

//   pool.query(
//     'UPDATE users SET name = $1, email = $2 WHERE id = $3',
//     [name, email, id],
//     (error, results) => {
//       if (error) {
//         throw error
//       }
//       response.status(200).send(`User modified with ID: ${id}`)
//     }
//   )
// }

// const deleteUser = (request, response) => {
//   const id = parseInt(request.params.id)

//   pool.query('DELETE FROM users WHERE id = $1', [id], (error, results) => {
//     if (error) {
//       throw error
//     }
//     response.status(200).send(`User deleted with ID: ${id}`)
//   })
// }

module.exports = {
  getUsers,
  getMovies,
  getShows,
  getBooks,
  getMoviesByUserId,
  getShowsByUserId,
  getBooksByUserId, 
  createUser,
  deleteUser,
  addMovie,
  addShow,
  addBook,
  addMovieToUserList,
  addShowToUserList,
  addBookToUserList,
  removeMovieFromUserList,
  removeShowFromUserList,
  removeBookFromUserList
}