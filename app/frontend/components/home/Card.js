import React,{useState,useEffect} from 'react'
import ProgressBar from './Progressing-bar'
import './Card.scss'


 const Card  = ({ project,onClick }) => {

  

  if(project.status === "succeeded"){
    return (
      <>
        <button onClick={()=>onClick(project.id)}>
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
                <div className="progress-barr">
                  <ProgressBar done="100"/>
                </div>
                <div className="pg-txt flex justify-between">
                  <div className="price">{project.total}% <span>已有 {project.count} 人贊助</span> </div>
                  <div className="days">還剩{project.days}天</div>
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
         <a onClick={()=>onClick(project.id)}>
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
                <div className="progress-barr">
                  {/* <ProgressBar done="{project.total}"/> */}
                  <ProgressBar done="{project.total}"/>
                </div>

                <div className="pg-txt flex justify-between">
              
                  <div className="price">{project.total}%<span>已有 {project.count} 人贊助</span></div>
                  <div className="days">還剩<span>{project.days}</span>天</div>

                </div>
              </div>
            </div>
          </div>
        </a>
      </>
    )
  }

}

export default Card
