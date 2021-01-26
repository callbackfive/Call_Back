document.addEventListener('turbolinks:load', () => {

  const page1 = document.getElementById('profile-info-pg1')
  const page2 = document.getElementById('rofile-proposal-p2')
  const page3 = document.getElementById('profile-sponser-pg3')
  const page4 = document.getElementById('profile-edit-bg4')

  const btn1 = document.getElementById('profile-info-btn')
  const btn2 = document.getElementById('profile-proposal-btn')
  const btn3 = document.getElementById('profile-sponser-btn')
  const btn4 = document.getElementById('profile-contact-btn')

  btn2.addEventListener('click' ,function(){
    page1.style.marginLeft="-25%"
    btn2.classList.add('active')
    btn1.classList.remove('active')
    btn3.classList.remove('active')
    btn4.classList.remove('active')
   

  })
  btn1.addEventListener('click' ,function(){
    
    page1.style.marginLeft=""
    btn1.classList.add('active')
    btn2.classList.remove('active')
    btn3.classList.remove('active')
    btn4.classList.remove('active')
    


  })
  btn3.addEventListener('click' ,function(){
  
    page1.style.marginLeft="-50%"
    btn3.classList.add('active')
    btn2.classList.remove('active')
    btn1.classList.remove('active')
    btn4.classList.remove('active')
 
  })

  btn4.addEventListener('click' ,function(){
  
    page1.style.marginLeft="-75%"
    btn4.classList.add('active')
    btn2.classList.remove('active')
    btn1.classList.remove('active')
    btn3.classList.remove('active')
 
  })


  })


