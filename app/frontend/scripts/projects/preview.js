document.addEventListener('turbolinks:load', (e) => {

  const inpuTitle = document.querySelector('.inpuTitle')
  const selectCategory = document.querySelector('#project_category_id')
  const inputSummary = document.querySelector('#project_summary')
  const fileImg = document.querySelector('#project_image')
  
  const cardTitle = document.querySelector('.card-title')
  const cardCategory = document.querySelector('.card-category')
  const cardSummary = document.querySelector('.card-summary')
  const img = document.querySelector('.pre-img')


  
  const title=inpuTitle.value
  cardTitle.innerText=title

  const category= selectCategory.options[selectCategory.selectedIndex].text
  cardCategory.innerText=category

  cardSummary.innerText="例：簡短描述專案內容，吸引瀏覽者在 flyingV 首頁上點擊你的專案。"



  




  inpuTitle.addEventListener('keyup',(e) => {
    const changeTitle=e.currentTarget.value
    cardTitle.innerText=changeTitle
  })
  inputSummary.addEventListener('keyup',(e) => {
    const changeSummary=e.currentTarget.value
    cardSummary .innerText=changeSummary
  })

  selectCategory.addEventListener('change', (e) => {
    const changeCategory=e.currentTarget.options[e.currentTarget.selectedIndex].text
    cardCategory .innerText=changeCategory
  })


    fileImg.addEventListener('change', function(){

        const file =fileImg.files[0]
        console.log(file);
        
        if(file){
          const reader= new FileReader()
          img.style.display="block"

          reader.addEventListener('load',function(){
            console.log(this)
            img.setAttribute('src',this.result)
          })

          reader.readAsDataURL(file)

        }else{
          img.style.display=null
          img.setAttribute('src',"")
        }



  
    })

  
})




