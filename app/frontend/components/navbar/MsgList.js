import React,{useState} from 'react';
import './MsgList.scss';
const MsgList = ({ isShow,user }) => {
  
  const [click,setClick]=useState(false)
  const handleClick = () => {setClick(!click)}

    return(
      <>
        <ul onClick={handleClick} className={isShow ? 'msg-menu clicke':'msg-menu'}style={{zIndex: 1000}}>
          <li className="msg-link">
            <a href="/dialogboxes">您有一則最新訊息!</a>
          </li>
          <li className="msg-link">
            <a href="#">您有一則最新留言！</a>
          </li>
        </ul>
      </>
    )
  }

export default  MsgList;
