document.addEventListener('turbolinks:load', () => {

  const page1 = document.getElementById('page1')
  const page2 = document.getElementById('page2')
  const page3 = document.getElementById('page3')

  const step1 = document.getElementById('step-btn1')
  const step2 = document.getElementById('step-btn2')
  const step3 = document.getElementById('step-btn3')

  step2.addEventListener('click' ,function(){
    page1.style.marginLeft="-33.33%"
    step2.classList.add('active')
    step1.classList.remove('active')
    step3.classList.remove('active')
    console.log(step2)

  })
  step1.addEventListener('click' ,function(){
    
    page1.style.marginLeft=""
    step1.classList.add('active')
    step2.classList.remove('active')
    step3.classList.remove('active')
    


  })
  step3.addEventListener('click' ,function(){
  
    page1.style.marginLeft="-66.666%"
    step3.classList.add('active')
    step2.classList.remove('active')
    step1.classList.remove('active')
 
  })


  })


