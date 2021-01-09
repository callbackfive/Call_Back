
import React from 'react';
import ReactDOM from 'react-dom';
import PropTypes from 'prop-types'

import Banner from '../../components/home/Carousel'
import Rank from '../../components/home/Rank'
import  '../../styles/application.scss'

document.addEventListener('turbolinks:load',() => {
   
  ReactDOM.render(
  <>  
    <Banner/>
    <Rank/>
  </>,
    document.getElementById('content'),
  )
  
})