import React from 'react'
import { useEffect } from 'react/cjs/react.development'
import Category from '../project/Category'

const CategoryList = () => {
  const [projects, setProjects]= useState([])

  useEffect
  fetch()

  return (
    <div>

      {
      category.map(category=> (
        <Catego key={category.id} category={category}/>
        ))
      }  

    </div>
    
  )
}

export default CategoryList

