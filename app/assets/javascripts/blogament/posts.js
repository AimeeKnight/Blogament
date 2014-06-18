// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){
  $("#post_image").change(animateProgressBar);
  displayTinyMCE();

  function animateProgressBar(){
    $('.progress-bar').css('width', '100%');
   }

  function displayTinyMCE(){
    $("[rel=tinymce]").tinymce({
      theme: "modern",
      toolbar: "bold,italic,underline,|,bullist,numlist,outdent,indent,|,undo,redo,|,pastetext,pasteword,",
      pagebreak_separator: "<p class='page-separator'>&nbsp;</p>",
      relative_urls: false,
      remove_script_host: false,
      document_base_url: (!window.location.origin ? window.location.protocol + "//" + window.location.host : window.location.origin) + "/",
    })
  }

});

