$(document).on('turbolinks:load', function(){

    $('#document_index_list').select2({
        tags: true,
        placeholder: "Index 1, Index 2, ...",
      
        tokenSeparators: [',', ' '],
        createTag: function (params) {
            var term = $.trim(params.term);
        
            if (term === '') {
              return null;
            }
        
            return {
              id: term,
              text: term,
              newTag: true // add additional parameters
            }
          }
    });
  });