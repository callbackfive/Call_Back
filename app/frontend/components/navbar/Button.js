import React,{useState, useEffect} from 'react';
import './Button.scss'
import {Link} from 'react-router-dom';
import Dropdown from './Dropdown';
import logo from '../../images/user.png'


export function Button({user}) {
  const [msg, setMsg] = useState('')
  const [click, setClick] = useState(true)
  const [dropdown, setdropDown] = useState(false)
  const handleClick = () => { setClick(!click)}

  
  const onClick= () => {
    if(window.innerWidth<960 ){
      setdropDown(false)
    }else{
      setdropDown(!dropdown)
    }
  }

  useEffect(() => {
    window.addNewMsgToBtn = (msg) => {
      setMsg(msg)
    }
  })

  if (user === null){

    return(

      <div>
        { msg ? 'red' : null }

        
        <button className='login-btn' onClick={onClick} >
          <div className="user-pic">
            <img src={logo} className="pic"/>
          </div>
  
          <div className="btn-icon" onClick={handleClick}>
  
            <i className={click ? 'fas fa-caret-down':'fas fa-caret-up'}></i>
  
          </div>
        
        </button>
        {dropdown && <Dropdown user={user} isShow={dropdown} onShow={(show) => setdropDown(show)} />}
  
      </div>
  
    )

  }else{

    return(

      <div>
        { msg }
        <button className='login-btn' onClick={onClick} >
          <div className="user-pic">
            <img src={user.image.url} className="pic"/>
          </div>
  
          <div className="btn-icon" onClick={handleClick}>
  
            <i className={click ? 'fas fa-caret-down':'fas fa-caret-up'}></i>
  
          </div>
        
        </button>
        {dropdown && <Dropdown user={user} isShow={dropdown} onShow={(show) => setdropDown(show)} />}
  
      </div>
  
    )

  }


} 

