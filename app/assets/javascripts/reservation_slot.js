$(function() {
  $('.reservation_check_box').click(function() {
    // checkboxがonの場合
    if (this.checked) {
      $.ajax({
        url: '/admin/reservationslotsettings/close_reservation',
        type: 'POST',
        data: {
          reservation: {
            day: $(this).data('day'),
            time: $(this).data('time'),
          }
        }
      });
    }
    // checkboxがoffの場合
    else {
      $.ajax({
        url: '/admin/reservationslotsettings/open_reservation',
        type: 'DELETE',
        data: {
          reservation: {
            day: $(this).data('day'),
            time: $(this).data('time')
          }
        }
      })
    }
  })
})
