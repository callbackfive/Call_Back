import React from 'react'

export const Category = () => {
  return (
    <>
    
      <div className="grid grid-cols-3 gap-4">
        <div className="category">
          <div className="category-pic"><img src={category.image.url} alt=""/></div>
          <div className="category-title">{category.title}</div>
        </div>
      </div>
      
    </>

  )
}
