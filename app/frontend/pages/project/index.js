import React from 'react'
import ReactDOM from 'react-dom';
import Projects from '../../components/project/Projects'



document.addEventListener('turbolinks:load', () => {

  ReactDOM.render(
    <Projects/>,
    document.getElementById('project-content')
  )
})