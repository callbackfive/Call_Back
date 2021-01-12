
import Card from './Card'
import React,{useState,useEffect} from 'react';
import './Rank.scss'



 const Rank = () => {
  const [imgs, setImgs]= useState([])
  const [projects, setProjects]= useState([])
  const [isLoading, setIsLoading]= useState(true)
  const [term,setTerm] = useState('')

   useEffect(() => {
     fetch('https://pixabay.com/api/?key=19824148-0c6e7daba051df63bad6ebff9&q=${term}&image_type=photo&pretty=true')
     .then(res => res.json())
     .then((data) =>{
       setImgs(data.hits)
       setIsLoading(false)

      })
     .catch(err => console.log(err))
   },[])

   useEffect(() => {
    fetch('/apis/projects')
    .then(res => res.json())
    .then((data) =>{
      setProjects(data)
      console.log(data)
      setIsLoading(false)

     })
    .catch(err => console.log(err))
  },[])

  return (
    <div>

      <section className='ranking'>
        <div className="ranking-container ">
          <div className="ranking-row">
            <div className="ranking-txt flex">
              <h2 className="title">Fun夯商品</h2>
              <a href="/projects" className="more-btn">查看更多</a>
            </div>
            <div className="ranking-projects">
              {projects.slice(4, 10).map(project => (
                  <Card key={project.id} project={project}/>
              ))
              }        
            </div>
          </div>
        </div>
      </section>

       
       
       
      
    </div>
  )
}

export default Rank
