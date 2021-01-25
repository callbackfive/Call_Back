
import React from 'react'
import ItemCard from '../../components/project/itemCards'
import '../home/Rank.scss'





 const CardList = ({isFilter,isClick}) => {
  return (
    <div>

      <section className='ranking'>
        <div className="ranking-container ">
          <div className="ranking-row">
            <div className="ranking-txt flex">
              <h2 className="title">募資中專案</h2>
            </div>
            <div className="ranking-projects">
              {isFilter.map(project => (
                    <ItemCard key={project.id} project={project} isClick={isClick}/>
                ))
                } 
            </div>
            <a href="/projects" className="more-btn"></a> 
          </div>
        </div>
      </section>
    </div>
  )
}

export default CardList
