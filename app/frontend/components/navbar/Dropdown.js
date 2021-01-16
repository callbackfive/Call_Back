import React,{useState} from 'react';
import {Link} from 'react-router-dom';
import './Dropdown.scss';
import Rails from '@rails/ujs'

const Dropdown = ({ isShow,user }) => {
  
  const [click,setClick]=useState(false)
  const handleClick = () => {setClick(!click)}

  const test = (e) => {
    Rails.ajax({
      url: '/users/sign_out',
      type: 'DELETE',
    })
  }

  if(user === null){

    return(
      <>
        <ul onClick={handleClick} className={isShow ? 'dropdown-menu clicke':'dropdown-menu'}style={{zIndex: 1000}}>
    
          <li className="dropdown-link">
            <a href="/users/sign_in">登入</a>
          </li>
          <li className="dropdown-link">
            <a href="/users/sign_up">註冊</a>
          </li>
        </ul>
      </>
    )

  }else

  {
    return(
      <>
        <ul onClick={handleClick} className={isShow ? 'dropdown-menu clicke':'dropdown-menu'} style={{zIndex: 1000}}>
        <li className="dropdown-link">
           {user.name}
          </li>
          <li className="dropdown-link">
            <a href="/users/profile">個人頁面</a>
          </li>
          <li className="dropdown-link">
            <a href="/users/sign_out" onClick={(e) => test(e)}>登出</a>
          </li>
        </ul>
      </>
    )
  }

}

export default  Dropdown;
