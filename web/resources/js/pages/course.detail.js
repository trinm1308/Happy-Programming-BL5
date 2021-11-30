/**
 *
 * CourseDetail
 *
 * Course.Detail.html page content scripts. Initialized from scripts.js file.
 *
 *
 */
var ratingValue = "5";

class CourseDetail {
    constructor() {
        this._initPlayer();
        this._initBarrating();
        this._initProgressBars();
        this._initForm();
    }

    _initPlayer() {
        if (document.querySelector('#videoPlayer') !== null && typeof Plyr !== 'undefined') {
            new Plyr(document.querySelector('#videoPlayer'));
        }
    }

    _initProgressBars() {
        document.querySelectorAll('.progress-bar').forEach((element) => {
            const volume = element.getAttribute('aria-valuenow');
            element.style.width = volume + '%';
        });
    }

    _initBarrating() {
        if (jQuery().barrating) {
            jQuery('.rating').each(function () {
                const current = jQuery(this).data('initialRating');
                const readonly = jQuery(this).data('readonly');
                const showSelectedRating = jQuery(this).data('showSelectedRating');
                const showValues = jQuery(this).data('showValues');
                jQuery(this).barrating({
                    initialRating: current,
                    readonly: readonly,
                    showValues: showValues,
                    showSelectedRating: showSelectedRating,
                    onSelect: function (value, text) { },
                    onClear: function (value, text) { },
                });
            });
            const ratingBar = jQuery('#ratingBar');
            ratingBar.barrating({
                initialRating: ratingBar.data('initialRating'),
                readonly: ratingBar.data('readonly'),
                showValues: ratingBar.data('showValues'),
                showSelectedRating: ratingBar.data('showSelectedRating'),
                onSelect: function (value, text) {
                    ratingValue = value;
                }
            });
        }
    }

    // Form validation
    _initForm() {
        const form = $("#reviewForm")[0];
        console.log(form);
        const validateOptions = {
            rules: {
                content: {
                    required: true,
                },
            },
            messages: {
                content: {
                    required: 'Vui lòng không để trống đánh giá!',
                },
            },
        };



        $(form).validate(validateOptions);
        form.addEventListener('submit', (event) => {
            event.preventDefault();
            event.stopPropagation();
            if (jQuery(form).valid()) {
                const formValues = {
                    action: "addReview",
                    ratingValue: ratingValue,
                    courseId: getUrlParameter("cid"),
                    content: form.querySelector('[name="content"]').value
                };
                console.log(formValues);
                $.ajax({
                    type: "POST",
                    data: formValues,
                    success: function (response) {
                        if (response === "Add review fail") {
                            createFailed(0)
                        } else if (response === "Course do not exist") {
                            createFailed(1)
                        } else {
                            createSuccess(response);
                        }
                    },
                });
                return;
            }
        });
        function createSuccess(response) {
            $("#review-contain").prepend(response);
            $(':input', '#reviewForm').val('');
        }

        function createFailed(code) {
            document.getElementById("message").style.color = "red";
            $("#regBut").attr("disabled", false)
            if (code === 0) {
                document.getElementById("message").innerHTML = "Thêm đánh giá không thành công!";
            } else {
                document.getElementById("message").innerHTML = "Khóa học không tồn tại!";
            }
        }
    }
}

// Get parameter function
function getUrlParameter(sParam) {
    var sPageURL = window.location.search.substring(1),
        sURLVariables = sPageURL.split('&'),
        sParameterName,
        i;

    for (i = 0; i < sURLVariables.length; i++) {
        sParameterName = sURLVariables[i].split('=');

        if (sParameterName[0] === sParam) {
            return typeof sParameterName[1] === undefined ? true : decodeURIComponent(sParameterName[1]);
        }
    }
    return false;
};

$("#learningNow").click(function (e) {
    e.preventDefault();
    window.location.href = "/course/player?cid=" + getUrlParameter("cid");
});
