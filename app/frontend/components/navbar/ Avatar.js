import React,{useState} from 'react';
import './Button.scss'
import Dropdown from './Dropdown';
import logo from '../../images/user.png'


export function Avatar({user}) {
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

  if (user === null){
    return(
      <div>
        
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

