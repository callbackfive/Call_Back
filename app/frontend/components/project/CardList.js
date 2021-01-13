
import React from 'react'
import Card from '../home/Card'
import '../home/Rank.scss'



 const CardList = ({projects}) => {
  return (
    <div>

      <section className='ranking'>
        <div className="ranking-container ">
          <div className="ranking-row">
            <div className="ranking-txt flex">
              <h2 className="title">全部商品</h2>
            </div>
            <div className="ranking-projects">
              {projects.map(project => (
                    <Card key={index} project={project}/>
                ))
                }   
            </div>
            <a href="/projects" className="more-btn">查看更多</a> 
          </div>
        </div>
      </section>
    </div>
  )
}

export default CardList
