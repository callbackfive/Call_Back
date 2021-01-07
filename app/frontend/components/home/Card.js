import React from 'react'
import './Card.scss'

export let Card  = (item) => {
  return (
    <>

    <div className="card-item">

      <img className="item-img" src="https://images.pexels.com/photos/1983038/pexels-photo-1983038.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"/>
     
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
