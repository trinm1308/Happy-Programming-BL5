/**
 *
 * AuthForgotPassword
 *
 * Pages.Authentication.ForgotPassword.html page content scripts. Initialized from scripts.js file.
 *
 *
 */

class AuthForgotPassword {
    constructor() {
        // Initialization of the page plugins
        this._initForm();
    }

    // Form validation
    _initForm() {
        const form = document.getElementById('forgotPasswordForm');
        if (!form) {
            return;
        }
        const validateOptions = {
            rules: {
                forgotPasswordEmail: {
                    required: true,
                    email: true,
                },
            },
            messages: {
                forgotPasswordEmail: {
                    email: 'Your email address must be in correct format!',
                },
            },
        };
        jQuery(form).validate(validateOptions);
        form.addEventListener('submit', (event) => {
            event.preventDefault();
            event.stopPropagation();
            if (jQuery(form).valid()) {
                const formValues = {
                    action: "forgot",
                    email: form.querySelector('[name="forgotPasswordEmail"]').value,
                };
                $.ajax({
                    type: "POST",
                    data: formValues,
                    success: function (response) {
                        if (response == "1") {
                            accountSuccess()
                        } else if (response === "0") {
                            accountFailed(0)
                        } else if (response === "-1") {
                            accountFailed(-1)
                        } else if (response === "-2") {
                            accountFailed(-2)
                        } else {
                            accountFailed(0)
                        }
                    },

                });
                return;
            }
        });

        async function accountSuccess(response) {
            document.getElementById("message").style.color = "green";
            document.getElementById("message").innerHTML = "??ang g???i email...";
            setTimeout(function () {
                window.location.href = "/auth?action=sent";
;
            }, 2000);
        }

        function accountFailed(code) {
            document.getElementById("message").style.color = "red";
            if (code === -1) {
                document.getElementById("message").innerHTML = "To??n kho???n c???a b???n ???? b??? kh??a!";
            }
            if (code === 0) {
                document.getElementById("message").innerHTML = "Vui l??ng x??c nh???n t??i kho???n email c???a b???n";
            }
            if (code === -2) {
                document.getElementById("message").innerHTML = "T??i kho???n kh??ng t???n t???i";
            }

        }
    }
}
