import React,{useState,useEffect} from 'react'
import '../../components/home/Card.scss'

 const itemCard  = ({ project,isClick }) => {

  if(project.status === "succeeded"){
    return (
      <>
        <button onClick={()=>isClick(project.id)}>
          <div className="card-item">
            <div className="card-pic">
              <img className="card-img" src={project.img}/>
            </div>
            <div className="item-content">
              <div className="item-category">
                <p>{project.category_title}</p>
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
        </button>
      </>
    )
  }else{
    return (
      <>
         <a onClick={()=>isClick(project.id)}>
          <div className="card-item">
            <div className="card-pic">
              <img className="item-img" src={project.img}/>
            </div>
            
            <div className="item-content">

              <div className="item-category">
                <p>{project.category}</p>
                
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

}

export default itemCard