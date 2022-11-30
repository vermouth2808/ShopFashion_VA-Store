$(document).ready(function () {
    ShowCount();
    $('body').on('click', '.addToCart', function (e) {
        e.preventDefault();
        var id = $(this).data('id');
        var quantity = 1;
        var tQuantity = $('#var-value').text();
        if (tQuantity != '') {
            quantity = parseInt(tQuantity);
        }

        //alert(id + " " + quantity);
        $.ajax({
            url: "/Shop/AddToCart",
            type: 'POST',
            dataType: "json",
            data: { id: id, quantity: quantity },
            success: function (rs) {
                if (rs.Success) {
                    $('#checkout_item').html(rs.count);
                    alert(rs.msg);
                }
            }
        });

    });


    $('body').on('click', '.btnDelete', function (e) {
        e.preventDefault();
        var id = $(this).data('id');
        var conf = confirm('Bạn có chắc xóa sản phẩm này khỏi giỏ hàng ?')
        if (conf == true) {
            $.ajax({
                url: "/Shop/DeteleCart",
                type: 'POST',
                dataType: "json",
                data: { id: id },
                success: function (rs) {
                    if (rs.Success) {
                        $('#checkout_item').html(rs.count);
                        $('#trow_' + id).remove();

                    }
                }
            });
        }
        

    });
});

function ShowCount() {
    $.ajax({
        url: "/Shop/ShowCount",
        type: 'GET',
        dataType: "json",
        success: function (rs) {
            if (rs.Success) {
                $('#checkout_item').html(rs.count);
            }
        }
    });
}

