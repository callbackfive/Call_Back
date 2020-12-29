import React,{useState} from 'react';
import { Button } from './Button';
import {Link} from 'react-router-dom'
import  './Navbar.css'



const Navbar = () => {


  const [click,setClick] = useState(false)
  const [dropdown,setDropdown] = useState(false)

  const handleClick = () => { setClick(!click)}
  const closeMobileMenu = () => {setClick(false)};


  
  return(
    <>
    <nav className="navbar">
    <Link to='/' className="navbar-logo">
      CallBack
    </Link>

    <div className="menu-icon" onClick={handleClick}>

      <i className={click ? 'fas fa-times':'fas fa-bars'}></i>

    </div>

    <ul className={click? 'nav-menu active':'nav-menu'}>

      <li className="nav-items">
        <Link to='/' className='nav-links' onClick={closeMobileMenu}>關於</Link>
      </li>

      <li className="nav-items">
        <Link to='/' className='nav-links' onClick={closeMobileMenu}>提案</Link>
      </li>

      <li className="nav-items">
        <Link to='/' className='nav-links' onClick={closeMobileMenu}>探索</Link>
      </li>

      <li className="nav-items">
        <Link to='/' className='nav-links-mobile' onClick={closeMobileMenu}>註冊</Link>
      </li>
      
    </ul>
    <Button />
   
    </nav>
    </>
  )
  
}

export default Navbar;