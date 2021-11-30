/**
 *
 * AuthRegister
 *
 * Pages.Authentication.Register.html page content scripts. Initialized from scripts.js file.
 *
 *
 */

class AuthRegister {
    constructor() {
        // Initialization of the page plugins
        this._initForm();
    }

    // Form validation
    _initForm() {
        const form = document.getElementById('registerForm');
        if (!form) {
            return;
        }
        const validateOptions = {
            rules: {
                email: {
                    required: true,
                    email: true,
                },
                password: {
                    required: true,
                    minlength: 6,
                    regex: /[a-z].*[0-9]|[0-9].*[a-z]/i,
                },
                registerCheck: {
                    required: true,
                },
                repass: {
                    required: true,
                    equalTo: "#password"
                },
            },
            messages: {
                email: {
                    email: 'Bạn phải nhập đúng định dạng email',
                },
                password: {
                    minlength: 'Mật khẩu phải có ít nhất {0} kí tự!',
                    regex: 'Mật khẩu phải bao gồm cả chữ và số!',
                },
                registerCheck: {
                    required: 'Vui lòng đọc và đồng ý với điều khoản của Acorn!',
                },
                repass: {
                    required: 'Vui lòng nhập lại mật khẩu!',

                },
            },
        };
        $(document).ajaxStart(function () {
            $("#regBut").attr("disabled", true);
            document.getElementById("message").innerHTML = "Đang gửi liên kết xác thực tài khoản đến email của bạn.";
        });
       
        jQuery(form).validate(validateOptions);
        form.addEventListener('submit', (event) => {
            event.preventDefault();
            event.stopPropagation();
            if (jQuery(form).valid()) {
                const formValues = {
                    action: "register",
                    yourname: form.querySelector('[name="yourname"]').value,
                    username: form.querySelector('[name="username"]').value,
                    email: form.querySelector('[name="email"]').value,
                    password: form.querySelector('[name="password"]').value,
                    repass: form.querySelector('[name="repass"]').value,
                    captchaResponse: form.querySelector('[name="g-recaptcha-response"]').value,
                    check: form.querySelector('[name="registerCheck"]').checked,
                };
                $.ajax({
                    type: "POST",
                    data: formValues,
                    success: function (response) {
                        if (response == "Success") {
                            createSuccess()
                        } else if (response === "Captcha failed!") {
                            createFailed(-1)
                        } else if (response === "Email existed") {
                            createFailed(-2)
                        } else if (response === "Username existed") {
                            createFailed(-3)
                        } else {
                            createFailed(0)
                        }
                    },

                });
                return;
            }
        });

        async function createSuccess(response) {
            document.getElementById("message").style.color = "green";
            document.getElementById("message").innerHTML = "Vui lòng truy cập email và xác nhận tài khoản.";
        }

        function createFailed(code) {
            document.getElementById("message").style.color = "red";
             $("#regBut").attr("disabled", false)
            if (code === -1) {
                document.getElementById("message").innerHTML = "Mã captcha không hợp lệ";
            }
            if (code === 0) {
                document.getElementById("message").innerHTML = "Đăng ký thất bại";
            }
            if (code === -2) {
                document.getElementById("message").innerHTML = "Email đã tồn tại";
            }
            if (code === -3) {
                document.getElementById("message").innerHTML = "Tên người dùng đã tồn tại";
            }

        }
    }
}

