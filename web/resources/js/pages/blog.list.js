$(document).ready(function () {
    $("#loadMore").click(function (e) {
        e.preventDefault();
        $.ajax({
            type: "POST",
            success: function (response) {
                $("#blogHere").append(response);
            }
        });
    });
});