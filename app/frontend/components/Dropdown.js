import React,{useState} from 'react';
import {MenuItems} from './MenuItems';
import {Link} from 'react-router-dom';
import './Dropdown.scss';

const Dropdown = ({ isShow, onShow }) => {
  
  const [click,setClick]=useState(false)
  const handleClick = () => {setClick(!click)}


  return(
    <>
    <ul onClick={handleClick} className={isShow ? 'dropdown-menu clicke':'dropdown-menu'}>

      {MenuItems.map((item, index)=>{
        return(

          <li key={index}>
          <Link className={item.cName} to={item.path} onClick={() => {onShow(false)}}
          >
          {item.title}
          </Link>
        </li>

        )

      })}



    </ul>

    </>

  )
  
}

export default  Dropdown;