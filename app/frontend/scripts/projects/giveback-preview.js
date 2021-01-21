document.addEventListener('turbolinks:load', (e) => {

  const givebackTitle = document.querySelector('.input-titl')
  const givebackSummary = document.querySelector('.g-descript')
  const givebackPrice = document.querySelector('.g-price')
  const givebackDate = document.querySelector('.g-deliver')
  const fileImg = document.querySelector('#giveback_image')
  
  const giveTitle = document.querySelector('.g-title')
  const cardPrice = document.querySelector('.giveback-card-price')
  const cardSummary = document.querySelector('.g-summary')
  const cardTime = document.querySelector('.g-time')
  const img = document.querySelector('.pre-imgs')


  
  
  giveTitle.innerText=""


  const date= givebackDate.value


  cardSummary.innerText="例：簡短描述專案內容，吸引瀏覽者在投資你的夢想。"



  




  givebackTitle.addEventListener('keyup',(e) => {
    const changeTitle=e.currentTarget.value
    giveTitle.innerText=changeTitle
  })
  givebackSummary.addEventListener('keyup',(e) => {
    const changeSummary=e.currentTarget.value
    cardSummary .innerText=changeSummary
  })

  givebackPrice.addEventListener('keyup', (e) => {
    const changePrice=e.currentTarget.value
    cardPrice.innerText="$"+ changePrice
  })


    fileImg.addEventListener('change', function(){

        const file =fileImg.files[0]
        
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




