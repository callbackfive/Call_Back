import React,{useState} from 'react';
import './Button.scss'
import {Link} from 'react-router-dom';
import Dropdown from './Dropdown';


export function Button({user}) {
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

 
  



  return(

    <div>
      
      <button className='login-btn' onClick={onClick} >
        <div className="user-pic">
          <img src="https://picsum.photos/40/40/?random=1" className="pic"/>
        </div>

        <div className="btn-icon" onClick={handleClick}>

          <i className={click ? 'fas fa-caret-down':'fas fa-caret-up'}></i>

        </div>
      
      </button>
      {dropdown && <Dropdown user={user} isShow={dropdown} onShow={(show) => setdropDown(show)} />}

    </div>

  )
} 

