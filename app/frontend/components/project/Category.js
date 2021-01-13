import React from 'react'
import "./Category.scss";

const Category = ({category,handleBtn}) => {
  return (
    <>
      <button value={category.title} onClick={handleBtn}>
      <div className="category-btn" id={category.id}>
        <div className="category-pic">
          <div className="category-circle">
            <img src={category.image.url} alt="" className="w-full"/>
          </div> 
        </div>
        <div className="category-title">
          <p>{category.title}</p>
        </div>
      </div>
      </button>
    </>

  )
}
export default Category
