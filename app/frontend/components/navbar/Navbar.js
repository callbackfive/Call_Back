import React,{useState} from 'react';
import { Button } from './Button';
import {Link} from 'react-router-dom'
import  './Navbar.scss'


const Navbar = ({user}) => {

  const [click,setClick] = useState(false)
  const [dropdown,setDropdown] = useState(false)

  const handleClick = () => { setClick(!click)}
  const closeMobileMenu = () => {setClick(false)};

  
  return(
    <>
  <nav> 
    <div className="navbar-container"> 
      <div className="row"> 

        <div className="nav-left">

          <a href="/" className="navbar-logo">
            <div className="logo-txt">CALLBACK</div>
            <div className="logo-pic"><img src="https://phillee.s3-us-west-1.amazonaws.com/uploads/project/image/logo.png" alt=""/></div>
          </a>

          <div className={click? 'nav-menu active':'nav-menu'}>
            <li className="nav-items">
              <Link to='/' className='nav-links-mobile' onClick={closeMobileMenu}>註冊</Link>
            </li>
            <a className="nav-items  nav-links" onClick={() => {window.location.href="/about"}}>關於</a>
            <a className="nav-items  nav-links" onClick={() => {window.location.href="/projects/proposal"}}>提案</a>
            <a className="nav-items nav-links" onClick={() => {window.location.href="/projects"}}>探索</a>

          </div>

        </div>

        <div className="nav-right">
          <div className="menu-icon" onClick={handleClick}>
            <i className={click ? 'fas fa-times':'fas fa-bars'}></i>
          </div>
          <Button user={user}/>
        </div>

      </div>

      </div>
  </nav>
    </>
  )
  
}

export default Navbar;

// <li className="nav-items  nav-links" onClick={() => {window.location.href="/about"}}>關於</li>
// <li className="nav-items  nav-links" onClick={() => {window.location.href="/project/proposal"}}>提案</li>
// <li className="nav-items  nav-links" onClick={() => {window.location.href="/projects"}}>探索</li>

// <li className="nav-items  nav-links" onClick={closeMobileMenu}>
// <Link to='/' className='nav-links' onClick={closeMobileMenu}>關於</Link>
// </li>

// <li className="nav-items">
//   <Link to='/' className='nav-links' onClick={closeMobileMenu}>提案</Link>
// </li>

// <li className="nav-items">
//   <Link to='/' className='nav-links' onClick={closeMobileMenu}>探索</Link>
// </li>