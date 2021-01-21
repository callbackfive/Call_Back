document.addEventListener('turbolinks:load', () => {

  ClassicEditor.create(document.querySelector('#ckeditor'), {
    simpleUpload: { uploadUrl: '/uploads' },
  })
})