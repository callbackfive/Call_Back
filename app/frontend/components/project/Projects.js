import React,{useState,useEffect} from 'react'
import '../../styles/project'
import CategoryList from '../../components/project/CategoryList'
import CardList from '../../components/project/CardList'


const Projects = () => {

  const [projects, setProjects]= useState([])
  const [isFilter, setIsFilter]= useState([])
  const [isLoading, setIsLoading]= useState(true)


  useEffect(() => {
    Promise.all([
      fetch('/apis/projects')
      .then(res => res.json())
      .then((data) =>{
        setProjects(data)
        console.log(data)
        setIsLoading(false)
  
      })
      .catch(err => console.log(err)),

    ])
  },[])
  
  
  const handleBtn = (e) => {
  
    const currentCategory = e.currentTarget.value
    console.log(currentCategory)
    let isFilter;
    if(currentCategory ==="全部"){
      isFilter=projects
      setIsFilter(isFilter)
    }else{
      isFilter=projects.filter((item) => item.category === currentCategory )
      setIsFilter(isFilter)
    }
    
    console.log(isFilter)
    
  }

  return(
    <>
    <section className="category-bg">
      <div className="category-container ">
      <CategoryList handleBtn={handleBtn}/>
      </div> 
    </section>
    <section className="projects-bg">
      <div className="projects-container ">
        <CardList key={projects.id} isFilter={isFilter} projects={projects} />
      </div> 
    </section>

    </>
  )
  
}

export default Projects
