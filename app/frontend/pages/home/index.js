
import React from 'react';
import ReactDOM from 'react-dom';
import PropTypes from 'prop-types'

import Banner from '../../components/home/Carousel'
import TopRank from '../../components/home/Card'
import  '../../styles/application.scss'

document.addEventListener('turbolinks:load',() => {
   
  ReactDOM.render(
  <>  
    <Banner/>
    <TopRank/>
  </>,
    document.getElementById('content'),
  )
  
})