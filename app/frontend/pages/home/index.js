
import React from 'react';
import ReactDOM from 'react-dom';
import PropTypes from 'prop-types'

import Banner from '../../components/home/Carousel'
import Rank from '../../components/home/Rank'
import  '../../styles/application.scss'

document.addEventListener('turbolinks:load',() => {
   const $content = document.getElementById('content')
   if (!$content) return;
   
  ReactDOM.render(
  <>  
    <Banner/>
    <Rank/>
  </>,
    $content,
  )
  
})