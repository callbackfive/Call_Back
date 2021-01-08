import React,{useState} from 'react';
import {Link} from 'react-router-dom';
import './Dropdown.scss';
import Rails from '@rails/ujs'

const Dropdown = ({ isShow, onShow, user }) => {
  
  const [click,setClick]=useState(false)
  const handleClick = () => {setClick(!click)}

  const test = (e) => {
    e.preventDefault()
    alert(1)
    Rails.ajax({
      url: '/users/sign_out',
      type: 'DELETE',
    })
  }

  if(user === null){

    return(
      <>
      
      <ul onClick={handleClick} className={isShow ? 'dropdown-menu clicke':'dropdown-menu'}>
  
      <li className="dropdown-link" onClick={()=>{window.location.href="/users/sign_in"}}>登入</li>
      <li className="dropdown-link" onClick={()=>{window.location.href="/users/sign_out"}}>註冊</li>
  
      </ul>
  
      </>
  
    )

  }else

  {


    return(
      <>
      
      <ul onClick={handleClick} className={isShow ? 'dropdown-menu clicke':'dropdown-menu'} style={{zIndex: 1000}}>
  
      <li className="dropdown-link" onClick={()=>{window.location.href="/users/sign_in"}}>個人頁面</li>
      <li className="dropdown-link" onClick={()=>{window.location.href="/users/sign_out"}}>登出</li>
      <li className="dropdown-link">
        <a href="/?abc=123" onClick={(e) => test(e)}>test</a>
      </li>
  
      </ul>
  
      </>

  
    )



  }


  


  
}

export default  Dropdown;



// {MenuItems.map((item, index)=>{
//   return(

//     <li key={index}>
//     <Link className={item.cName} to={item.path} onClick={() => {onShow(false)}}
//     >
//     {item.title}
//     </Link>
//   </li>


//   )

// })}