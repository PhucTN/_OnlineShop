// Huong doi tuong 
// Khai bao 1 doi tuong // user
// Khai bao phuong thuc // init 

$('.btn-active').off('click').on('click', function (e) {
    e.preventDefault(); // Chan default href #
    e.stopPropagation();
    var id = $(this).data('id');
    var self = this;
    $.ajax({
        url: '/Admin/User/ChangeStatus',
        data: { id: id },
        dataType: 'json',
        type: 'POST',
        //contentType: "application/json;charset=utf-8", -- Because dataType : json da truyen len roi nen ko can nua
        success: function (response) {
            if (response.status == true) {
                $(self).text('Active');
            }
            else {
                $(self).text('No Active');
            }
        }
    });
});

