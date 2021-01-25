
// import ClassicEditor from '@ckeditor/ckeditor5-build-classic';
document.addEventListener('turbolinks:load', () => {

  ClassicEditor.create(document.querySelector('#ckeditor'), {
    simpleUpload: { uploadUrl: '/uploads' },
  })
})