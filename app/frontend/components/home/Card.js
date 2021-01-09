import React,{useState,useEffect} from 'react'
import './Card.scss'

 const Card  = ({ project }) => {

  return (
    <>

    <div className="card-item">

      <img className="item-img" src={project.webformatURL}/>
     
      <div className="item-content">

        <div className="item-category">
          <p>創意生活</p>
          <p>SUCCESS !</p>
        </div>

        <div className="item-txt">
          <h2>SWOL 雙水箱旋轉拖把 | 分離淨水和污水，才是真正的乾淨</h2>
          <p>Swol</p>
        </div>

        <div className="item-progress">


          <div className="pg-txt">
            
            <div className="price">$30,000</div>
            <div className="days">剩53天</div>

          </div>
        </div>
      </div>
    </div>
    
    </>
  )
}

export default Card
