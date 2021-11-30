/**
 *
 * AuthLogin
 *
 * Pages.Authentication.Login.html page content scripts. Initialized from scripts.js file.
 *
 *
 */

class AuthLogin {
    constructor() {
        // Initialization of the page plugins
        this._initForm();
    }

    // Form validation
    _initForm() {
        const form = document.getElementById('loginForm');
        if (!form) {
            return;
        }
        const validateOptions = {
            rules: {
                email: {
                    required: true,
                    email: true,
                },
            },
            messages: {
                email: {
                    email: 'Bạn phải nhập đúng định dạng email!',
                },
            },
        };
        jQuery(form).validate(validateOptions);
        form.addEventListener('submit', (event) => {
            event.preventDefault();
            event.stopPropagation();
            if (jQuery(form).valid()) {
                const formValues = {
                    email: form.querySelector('[name="email"]').value,
                    password: form.querySelector('[name="password"]').value,
                    action: "login"
                };
                console.log(formValues);
                $.ajax({
                    type: "POST",
                    data: formValues,
                    success: function (response) {
                        if (response === "Success") {
                            loginSuccess()
                        } else if (response === "Blocked!") {
                            Blocked()
                        } else if (response === "Not verify!") {
                            VerifyError()
                        } else {
                            loginFailed()
                        }
                    }

                });
                return;
            }
        });

        async function loginSuccess() {
            document.getElementById("message").style.color = "green";
            document.getElementById("message").innerHTML = "Đăng nhập thành công!";
            setTimeout(function () {
                window.location.href = "home";
            }, 1000);
        }

        function loginFailed() {
            document.getElementById("message").style.color = "red";
            document.getElementById("message").innerHTML = "Đăng nhập thất bại";
        }
        function Blocked() {
            document.getElementById("message").style.color = "red";
            document.getElementById("message").innerHTML = "Tài khoản này đã bị khoá!";
        }
        function VerifyError() {
            document.getElementById("message").style.color = "red";
            document.getElementById("message").innerHTML = "Tài khoản này chưa được kích hoạt!";
        }
    }
}

