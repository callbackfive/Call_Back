import React,{useState, useEffect} from 'react';
import './Notification.scss'
import MsgList from './MsgList';


  export function Notification({user}) {
    //const [msg, setMsg] = useState('')
    const [isClick, setIsClick] = useState(false)
    const handleClick = () => {
      setIsClick(!isClick)
      if(window.innerWidth<960 ){
        setdropDown(false)
      }else{
        setdropDown(!dropdown)
      }
    }
    const [dropdown, setdropDown] = useState(false)
    //  useEffect(() => {
    //    window.addNewMsgToBtn = (msg) => {
    //      setMsg(msg)
    //    }
    //  })
   if(user === null){
    return(
      <>
      <div className="flex">
        <button className='notification-btn' onClick={handleClick}>
          <i className={isClick ? 'fas':'fas'}></i>
        </button>
      </div> 
      {dropdown && <MsgList user={user} isShow={dropdown} />}
      </>  
  )

   }else{
    return(
      <>
      <div className="flex">
        <button className='notification-btn' onClick={handleClick}>
          <i className={isClick ? 'fas':'fas notice'}></i>
        </button>
      </div> 
      {dropdown && <MsgList user={user} isShow={dropdown} />}
      </>  
  )

   }
} 
  
  




