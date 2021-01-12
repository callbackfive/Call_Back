import React,{useState,useEffect} from 'react'
import './Card.scss'

 const Card  = ({ project }) => {

  return (
    <>
    <a href="">
    <div className="card-item">
      <div className="card-pic"><img className="item-img" src={project.image.url}/></div>
      
      <div className="item-content">

        <div className="item-category">
          <p>{project.category}</p>
          <p>SUCCESS !</p>
        </div>

        <div className="item-txt">
          <h2 className="truncate">{project.title}</h2>
          <p>{project.name}</p>
        </div>

        <div className="item-progress">


          <div className="pg-txt flex justify-between">
            
            <div className="price">{project.target_amount}</div>
            <div className="days">剩53天</div>

          </div>
        </div>
      </div>
    </div>
    </a>
    </>
  )
}

export default Card
