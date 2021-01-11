import React,{useState,useEffect} from 'react'
import './Card.scss'

 const Card  = ({ project }) => {

  return (
    <>

    <div className="card-item">

      <img className="item-img" src=""/>
     
      <div className="item-content">

        <div className="item-category">
          <p>{project.category}</p>
          <p>SUCCESS !</p>
        </div>

        <div className="item-txt">
          <h2>{project.title}</h2>
          <p>{project.name}</p>
        </div>

        <div className="item-progress">


          <div className="pg-txt">
            
            <div className="price">{project.target_amount}</div>
            <div className="days">剩53天</div>

          </div>
        </div>
      </div>
    </div>
    
    </>
  )
}

export default Card
