import React from "react";
import ReactDOM from "react-dom";
import Carousel from "react-elastic-carousel";
import Item from "./items";
import './Carousel.css'


const breakPoints = [
  { width: 1, itemsToShow: 1 },
  { width: 1200, itemsToShow: 1 },
];
const photo =[
  {
    name:"ubayeat",
    url:""
  },
  {
    name:"shoppinggo",
    url:""
  },
  {
    name:"sociview",
    url:""
  },
  {
    name:"rubytixt",
    url:""
  },
]

function App () {
  return (
    <>
      <div className="banner-carousel " >
        <Carousel breakPoints={breakPoints} enableAutoPlay autoPlaySpeed={100000}  showArrow ={false} pagination ={false}>
          <Item>Call Back your money !</Item>
          <Item></Item>
        </Carousel>
      </div>
    </>
  )
}

export default  App

