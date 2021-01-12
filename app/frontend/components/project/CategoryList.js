import React from 'react'
import Category from '../project/Category'

const CategoryList = () => {
  return (
    <div>

      {projects.slice.map(category=> (
          <Card key={category.id} project={category}/>
        ))
      }   
      <Catego/>
    </div>
    
  )
}

export default CategoryList

