import React,{useState,useEffect} from 'react'
import '../../styles/project'
import CategoryList from '../../components/project/CategoryList'
import CardList from '../../components/project/CardList'


const Projects = () => {

  const [projects, setProjects]= useState([])
  const [isLoading, setIsLoading]= useState(true)
  const [isFilter, setIsFilter]= useState([])

  useEffect(() => {
    
    (async () => {
      console.log('123')
      const response = await fetch('/apis/projects');
      const data = await response.json();
      setProjects(data);
      setIsFilter(data);

    })();
    
  },[])
 

  console.log('state: ', isFilter)
  
  const handleBtn = (e) => {
  
    const currentCategory = e.currentTarget.value
    // console.log(currentCategory)
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
    {
      console.log('return:' ,isFilter)
    }
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
