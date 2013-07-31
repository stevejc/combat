jQuery(function($) {

$('input[type=checkbox]').click(function(){
  $.post('update_session', { school_id: $(this).val(), checked: $(this).prop('checked')  });
});


$('.remove-school').tooltip();

})