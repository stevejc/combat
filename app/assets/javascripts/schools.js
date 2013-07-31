jQuery(function($) {

$('input[type=checkbox]').click(function(){
  $.post('update_session', { school_id: $(this).val(), checked: $(this).prop('checked')  });
alert($(this).val());
});


$('.remove-school').tooltip();

})