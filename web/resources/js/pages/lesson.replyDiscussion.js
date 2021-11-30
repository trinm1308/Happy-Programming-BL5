
/**
 *
 * AuthLogin
 *
 * Pages.Authentication.Login.html page content scripts. Initialized from scripts.js file.
 *
 *
 */

class ReplyForm {
    constructor() {
// Initialization of the page plugins
        this._initForm();
    }

// Form validation
    _initForm() {
        $('.banana1').on('click', '.reply-btn', function (e) {

            e.preventDefault();
            const parent = $(this).parent();
            console.log(parent);
            console.log($(this));
            const commentId = parent.attr("id");
            console.log(commentId);
            const commentOwner = $(this).parent().attr("name");
            // Append reply form after the reply button fired
            var s = "";
            var form = "";
            var button = "";
            console.log($(this).attr('class'));
            if ($(this).parent().children(".insertHere").children(".replyForm").length === 0) {
                s = parent.children(".insertHere");
                button = "reply-btn";
                if ($(this).attr('class') === 'text-medium reply-btn reply-main-btn' && $(this).parent().children(".insertReplyHere").children(".replyForm").length === 0) {
                    s = $(this).parent().children(".insertReplyHere");
                    button = "reply-main-btn";
                } else if ($(this).attr('class') === 'text-medium reply-btn reply-main-rl-btn') {
                    s = $(this).parent().children(".insertReplyHere");
                    button = "reply-main-rl-btn";
                }
                console.log($("#userAvatar").attr("src"));
                s.prepend("<form style=\"display: grid;\" class=\"replyForm\">\n" +
                        "                        <div class=\"d-flex align-items-center mt-3\">\n" +
                        "                          <div class=\"col-auto\">\n" +
                        "                            <div class=\"sw-5 me-3\">\n" +
                        "                              <img src=" + $("#userAvatar").attr("src") + " class=\"img-fluid rounded-xl\" alt=\"thumb\">\n" +
                        "                            </div>\n" +
                        "                          </div>\n" +
                        "                          <div class=\"col pe-3\">\n" +
                        "                            <input type=\"text\" class=\"form-control\" placeholder=\"Enter your though\" name=\"replyContent\" value=\"@" + commentOwner + "\">\n" +
                        "                          </div>\n" +
                        "                        </div>\n" +
                        "                      </form>");
            } else {
                e.preventDefault();
            }
            if ($(this).attr('class') === 'text-medium reply-btn reply-main-btn' || $(this).attr('class') === 'text-medium reply-btn reply-main-rl-btn') {
                form = $(this).parent().children(".insertReplyHere").children(".replyForm")[0]
            } else {
                form = $(this).parent().children(".insertHere").children(".replyForm")[0]
            }
            const validateOptions = {
                rules: {
                    replyContent: {
                        required: true,
                    }
                },
                messages: {
                    replyContent: {
                        required: 'Vui lòng không để trống bình luận!',
                    }
                },
            };
            console.log(form);
            $(form).validate(validateOptions);
            form.addEventListener('submit', (event) => {
                event.preventDefault();
                event.stopPropagation();
                if (jQuery(form).valid()) {
                    const formValues = {
                        action: "replyComment",
                        lessonId: "1",
                        commentId: commentId,
                        did: getUrlParameter("did"),
                        replyContent: form.querySelector('[name="replyContent"]').value
                    };
                    console.log(formValues);
                    $.ajax({
                        type: "POST",
                        data: formValues,
                        success: function (response) {
                            if (response === "Add reply-comment fail") {
                                createFailed(0)
                            } else {
                                createSuccess(response, button);
                                $(form).remove();
                            }
                        },
                    });
                    return;
                }
            });
            function createSuccess(response, button) {
                if (button === "reply-main-btn") {
                    $(form).parent().parent().parent().parent().parent().prepend(response)
                } else if (button === "reply-main-rl-btn") {
                    $(form).parent().parent().parent().parent().parent().children(".insertHere").prepend(response)
                } else {
                    $(form).parent().prepend(response);
                }
                return;
            }

            function createFailed(code) {
                document.getElementById("message").style.color = "red";
                $("#regBut").attr("disabled", false)
                if (code === 0) {
                    document.getElementById("message").innerHTML = "Thêm bình luận không thành công!";
                }
                return;
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
            ;
        });
        $(".like-btn").click(function (e) {
            e.preventDefault();
            $(this).css("color", "pink");
        });
    }
}
