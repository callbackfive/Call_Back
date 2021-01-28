document.addEventListener('turbolinks:load', () => {

  const page1 = document.getElementById('content-pg1')
  const page2 = document.getElementById('comment-pg2')
  const cntBtn = document.getElementById('content-btn')

  const commentBtn = document.getElementById('comment-btn')
  commentBtn.addEventListener('click' ,function(){
    page1.style.marginLeft="-50%"
    commentBtn.classList.add('clicked')
    cntBtn.classList.remove('clicked')
  })
  cntBtn.addEventListener('click' ,function(){
    
    page1.style.marginLeft=""
    cntBtn.classList.add('clicked')
    commentBtn.classList.remove('clicked')
  })
})


