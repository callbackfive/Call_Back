import React from 'react'
import Navbar from '../components/navbar/Navbar'
import {BrowserRouter as Router} from 'react-router-dom'



const App = () => {

  const node = document.getElementById('navbar_current_user')
  const data = JSON.parse(node.getAttribute('user_data'))

  return(
    <Router>
      <Navbar user={data} />
    </Router>
  )
  
}

export default App;