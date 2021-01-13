import React,{useState,useEffect} from 'react'
import Category from './Category'
import  './CategoryList.scss'

const CategoryList = ({handleBtn}) => {
  const [categories, setCategories]= useState([])
  const [isLoading, setIsLoading]= useState(true)


  useEffect(() => {
    fetch('/apis/categories')
    .then((res) => res.json())
    .then((data) =>{
      setCategories(data)
      console.log(data)
      setIsLoading(false) })
      .catch(err => console.log(err))
  },[])
  

  return (
    <>
      <div className="categories-list ">
      {
      categories.map(category=> (
        <Category key={category.id} category={category} handleBtn={handleBtn}/>
        ))
      } 
      </div>
 

    </>
    
  )
}

export default CategoryList

