import React,{useState,useEffect} from 'react'
import '../../styles/project'
import CategoryList from '../../components/project/CategoryList'
import CardList from '../../components/project/CardList'


const Projects = () => {

  const [projects, setProjects]= useState([])
  const [isLoading, setIsLoading]= useState(true)


  useEffect(() => {
    (async () => {
      const response = await fetch('/apis/projects');
      const data = await response.json();
      setProjects(data);
      setIsLoading(false);
     
    })();
  },[])
  console.log(projects)
  console.log(isLoading)
 
  const [isFilter, setIsFilter]= useState([])
  
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
        <CardList  isFilter={isFilter}  />
      </div> 
    </section>

    </>
  )
}

export default Projects
