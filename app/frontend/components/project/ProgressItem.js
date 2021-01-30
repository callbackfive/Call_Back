import React,{useState} from 'react'
import "../home/ProgressingBar.scss"


const Progress = ({done}) => {
  const [style, setStyle] = useState({});

	
	setTimeout(() => {
		const newStyle = {
			opacity: 1,
			width: `${done}%`
		}
	
		setStyle(newStyle);
  }, 200);
  if(0< done){
    return (
      <>
      <div className="percent-progress">
        <div className="progress-done" style={style}></div>
      </div>
      </>
    )
  
  } else {
    return (
      <>
      <div className="percent-progress">
        <div className="progress-undone" style={style}></div>
      </div>
      </>
    )

  }

}

export default Progress


