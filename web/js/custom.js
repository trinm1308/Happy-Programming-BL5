var province = $('.province-select2').select2({
    theme: "bootstrap-5",
    ajax: {
        url: 'address-ajax',
        dataType: 'json',
        data: function (params) {
            var query = {
                term: params.term,
                type: 'province'
            };
            return query;
        },
        processResults: function (data) {
            return {
                results: data.map(function (element) {
                    return {
                        id: element.code,
                        text: element.name
                    };
                })
            };
        }
    }
});
var district = $('.district-select2').select2({
    theme: "bootstrap-5",
    ajax: {
        url: 'address-ajax',
        dataType: 'json',
        data: function (params) {
            var query = {
                term: params.term,
                type: 'district',
                provinceCode: $('#provinceCode').val()
            };
            return query;
        },
        processResults: function (data) {
            return {
                results: data.map(function (element) {
                    return {
                        id: element.code,
                        text: element.name
                    };
                })
            };
        }
    }
});
province.on("select2:select", function (e) {
    district.val('000').trigger("change");
});
$('.rating-form').on('submit', function (e) {
    var authorRegex = /^[a-zA-Z \-\.]+$/u;
    var point = parseInt($('[name=point]', $(e.target)).val());
    var author = $('[name=author]', $(e.target)).val();
    if (isNaN(point) || (point < 1 && point > 5)) {
        alert("Bạn chưa cho điểm đánh giá");
        e.preventDefault();
    }
    if (!authorRegex.test(author)) {
        alert("Tên không đúng định dạng");
        e.preventDefault();
    }
});
function getRating(restaurantId, point, page) {
    $('.rating-content').html('Loading...');
    $.get("rating?restaurantId=" + restaurantId + "&point=" + point + "&page=" + page, function (data) {
        $('.rating-content').html(data);
        $('input.rating', $('.rating-content')).rating();
    });
}
$('.btn-load-rating').on('click', function (e) {
    e.preventDefault();
    $('.btn-load-rating').removeClass('active');
    $(this).addClass('active');
    getRating($(this).data('restaurantId'), $(this).data('rating'), $(this).data('page'));
});
$('.rating-content').on('click', '.btn-load-rating-page', function (e) {
    e.preventDefault();
    getRating($(this).data('restaurantId'), $(this).data('rating'), $(this).data('page'));
});
$('.btn-load-rating.active').click();