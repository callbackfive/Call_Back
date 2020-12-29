import React from 'react'
import '../styles/navbar'

const Menu = () => {

  return(

    <div calssName="">

    <div calssName="logo">

      <img src="../images/logo.jpg" alt="" className="logo"/>
      
    </div>
    <div calssName="menu-list">
      <a href="#" calssName="menu-item">關於</a>
      <a href="#" calssName="menu-item">提案</a>
      <a href="#" calssName="menu-item">探索</a> 
    </div>
    
   </div>
   
  )
  
}

const Userprofile = () => {
  return(

    <div className="user-profile">
            
      <div className="drop-down-btn flex space-x-2 ">              
        <button className="user-pic">
            <img src="https://picsum.photos/40/40/?random=1" className="pic"/>
        </button>
        <button className="down-icon">
        <i className="fas fa-caret-down"></i>
        <i className="fas fa-caret-up"></i>
        </button>
      </div> 
    </div> 

  )
}


const Dropdown = () => {

  return(

    <div calssName="user-list">
          <div calssName="list-item">登入</div>
          <div calssName="list-item">註冊</div>
    </div>

  )
  
}

const App = () => {

  return(

    <nav calssName="navbar">
    
      <div calssName="container">
    
        <div calssName="row">
          <Menu/>,
          <Userprofile/>
        </div>
      </div>
    
    </nav>
    
    
    )
  
}

export default App

