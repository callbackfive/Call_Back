
import ClassicEditor from '@ckeditor/ckeditor5-build-classic';

import SimpleUploadAdapter from '@ckeditor/ckeditor5-upload/src/adapters/simpleuploadadapter';

document.addEventListener('turbolinks:load', () => {

  ClassicEditor.create(document.querySelector('#ckeditor'), {
    plugins: [ SimpleUploadAdapter ],
    simpleUpload: { 
      uploadUrl: '/uploads',
      // Enable the XMLHttpRequest.withCredentials property.
      withCredentials: true,
      headers: {
        'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
      }
    },

  })
})