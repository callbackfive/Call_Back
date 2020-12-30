import React from 'react'
import '../styles/App.scss'
import Navbar from '../components/Navbar'
import {BrowserRouter as Router} from 'react-router-dom'



const App = () => {
  return(
    <Router>
      <Navbar />
    </Router>
  )

}

export default App;