
var textArea = document.getElementById("msg");
var furniture_ownerId = document.getElementById("txt_hid");

function sendChat() {
    var msg = textArea.value;
    var Id = furniture_ownerId.value;

    $.ajax({
        url: "AjaxChat.jsp",
        type: "POST",
        data: {chat: msg, id: Id},
        success: function(result) {
            textArea.value = "";
            $('#conversation').animate({scrollTop: $('#conversation')[0].scrollHeight});
            reloadSection();
        }
    });





}


function deleteChat(id)
{
    var text = "Press a button!\nEither OK or Cancel.";
    if (confirm(text) == true) {
        $.ajax({
            url: "AjaxDelete.jsp",
            type: "POST",
            data: {tid: id},
            success: function(result) {

            }
        });
    } else {
        text = "You canceled!";
    }
}

reloadSection();

$(document).ready(function() {
    setInterval(function() {
        reloadSection();
    }, 5000);
});

function reloadSection() {
    $("#conversation").load('Load.jsp?id=' + furniture_ownerId.value);
    $('#conversation').animate({scrollTop: $('#conversation')[0].scrollHeight});
}














   