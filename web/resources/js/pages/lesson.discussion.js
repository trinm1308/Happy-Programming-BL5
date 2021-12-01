
/**
 *
 * AuthLogin
 *
 * Pages.Authentication.Login.html page content scripts. Initialized from scripts.js file.
 *
 *
 */

class DiscussionForm {
    constructor() {
        // Initialization of the page plugins
        this._initForm();
    }

    // Form validation
    _initForm() {
        const form = $("#commentForm")[0];
        const validateOptions = {
            rules: {
                content: {
                    required: true,
                },
            },
            messages: {
                content: {
                    required: 'Vui lòng không để trống bình luận!',
                },
            },
        };
        $(form).validate(validateOptions);
        form.addEventListener('submit', (event) => {
            event.preventDefault();
            if (jQuery(form).valid()) {
                const formValues = {
                    action: "comment",
                    lessonId: "1",
                    did: getUrlParameter("did"),
                    content: form.querySelector('[name="content"]').value
                };
                $.ajax({
                    type: "POST",
                    data: formValues,
                    success: function (response) {
                        if (response === "Add comment fail") {
                            createFailed(0)
                        } else {
                            createSuccess(response);
                        }
                    },
                });
                return;
            }
        });

        function createSuccess(response) {
            $("#comment-contain").prepend(response);
            $(':input', '#commentForm').val('');
        }

        function createFailed(code) {
            document.getElementById("message").style.color = "red";
            $("#regBut").attr("disabled", false)
            if (code === 0) {
                document.getElementById("message").innerHTML = "Thêm bình luận không thành công!";
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
        }
    }
}