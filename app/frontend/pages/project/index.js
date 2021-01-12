import React from 'react';
import ReactDOM from 'react-dom';
import PropTypes from 'prop-types'

import CategoryList from '../../components/project/CategoryList'
import Cards from '../../components/home/Card'


document.addEventListener('turbolinks:load', () => {
   
  ReactDOM.render(
    <>
    <CategoryList/>
    <Cards/>
    </>,
    document.getElementById('project-content'),
  )
  
})