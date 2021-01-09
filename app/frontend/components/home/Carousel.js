import React from "react";
import ReactDOM from "react-dom";
import Carousel from "react-elastic-carousel";
import Item from "./items";
import './Carousel.css'


const breakPoints = [
  { width: 1, itemsToShow: 1 },
  { width: 1200, itemsToShow: 1 },
];

function App () {
  return (
    <>
      <div className="banner-carousel mt-2" >
        <Carousel breakPoints={breakPoints} enableAutoPlay autoPlaySpeed={2500}  showArrow ={false} pagination ={false}>
          <Item>Call Back your money !</Item>
          <Item>Two</Item>
        </Carousel>
      </div>
    </>
  )
}

export default  App

