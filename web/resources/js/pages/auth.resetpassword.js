/**
 *
 * AuthResetPassword
 *
 * Pages.Authentication.ResetPassword.html page content scripts. Initialized from scripts.js file.
 *
 *
 */

class AuthResetPassword {
    constructor() {
        // Initialization of the page plugins
        this._initForm();
    }

    // Form validation
    _initForm() {
        const form = document.getElementById('resetForm');
        if (!form) {
            return;
        }
        const validateOptions = {
            rules: {
                password: {
                    required: true,
                    minlength: 6,
                    regex: /[a-z].*[0-9]|[0-9].*[a-z]/i,
                },
                verifyPassword: {
                    required: true,
                    minlength: 6,
                    regex: /[a-z].*[0-9]|[0-9].*[a-z]/i,
                    equalTo: '#password',
                },
            },
            messages: {
                password: {
                    minlength: 'Password must be at least {0} characters!',
                    regex: 'Password must contain a letter and a number!',
                },
                verifyPassword: {
                    minlength: 'Password must be at least {0} characters!',
                    regex: 'Password must contain a letter and a number!',
                    equalTo: 'Passwords must match!',
                },
            },
        };
        jQuery(form).validate(validateOptions);
        form.addEventListener('submit', (event) => {
            event.preventDefault();
            event.stopPropagation();
            if (jQuery(form).valid()) {
                const formValues = {
                    action: "resetpw",
                    password: form.querySelector('[name="password"]').value,
                    verifyPassword: form.querySelector('[name="verifyPassword"]').value,
                    token: window.location.href.split('token=')[1]
                };
                $.ajax({
                    type: "POST",
                    data: formValues,
                    success: function (response) {
                        if (response == "1") {
                            changeSuccess()
                        } else if (response == "0") {
                            changeFailed(0)
                        } else {
                            changeFailed(-1)
                        }
                    },

                });
                return;
            }
        });

        async function changeSuccess(response) {
            document.getElementById("message").style.color = "green";
            document.getElementById("message").innerHTML = "Đổi mật khẩu thành công...";
            setTimeout(function () {
                window.location.href = "auth?action=login";
            }, 2000);
        }

        function accountFailed(code) {
            document.getElementById("message").style.color = "red";
            if (code === 0) {
                document.getElementById("message").innerHTML = "Đổi mật khẩu không thành công";
            }
            if (code === -1) {
                document.getElementById("message").innerHTML = "Mật khẩu không khớp";
            }
        }
    }
}
