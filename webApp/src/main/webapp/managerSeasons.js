function removeS(HotelID, Name){
    $.ajax({
        url: 'deleteSeason?ses=' + Name + '&hotel=' + HotelID,
    }).done(function(){
        location.reload()
    })
}