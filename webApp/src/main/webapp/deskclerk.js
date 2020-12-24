function removeB(id){
    $.ajax({
        url: 'deleteBooking?res=' + id,
    }).done(function(){
        location.reload()
    })
}


