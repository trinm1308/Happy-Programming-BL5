/**
 *
 * ProfileSettings
 *
 * Pages.Profile.Settings.html page content scripts. Initialized from scripts.js file.
 *
 *
 */

class ProfileSecurity {
  constructor() {
    // Initialization of the page plugins
    this._initMoveContent();
    this._initForm();
  }

  // Moving menu for responsive sizes
  _initMoveContent() {
    if (document.querySelector('#settingsMoveContent') && typeof MoveContent !== 'undefined') {
      const menuMove = document.querySelector('#settingsMoveContent');
      const targetSelectorMenu = menuMove.getAttribute('data-move-target');
      const moveBreakpointMenu = menuMove.getAttribute('data-move-breakpoint');
      const menuMoveContent = new MoveContent(menuMove, {
        targetSelector: targetSelectorMenu,
        moveBreakpoint: moveBreakpointMenu,
      });
    }
  }

  
  _initForm() {
        const form = document.getElementById('changePassForm');
        if (!form) {
            return;
        }
        form.addEventListener('submit', (event) => {
            event.preventDefault();
            event.stopPropagation();
          
                const formValues = {
                    username: form.querySelector('[name="password"]').value,
                    newpass: form.querySelector('[name="newpass"]').value,
                    repass: form.querySelector('[name="repass"]').value,
                    
                };
                $.ajax({
                    type: "POST",
                    data: formValues,
                    success: function (response) {
                        if (response == "Success") {
                            updateSuccess()
                        } else if (response == "Not match"){
                            updateFailed(1)
                        } else if (response == "Wrong old pass"){
                            updateFailed(2)
                        } else {
                            updateFailed(0)
                        }
                    }

                });
                return;
            
        });

        async function updateSuccess(response) {
            document.getElementById("message").style.color = "green";
            document.getElementById("message").innerHTML = "Cập nhật thành công!";
            setTimeout(function () {
                window.location.href = "profile";
            }, 1000);
        }

        function updateFailed(code) {
            if (code == 0){
                
            document.getElementById("message").style.color = "red";
            document.getElementById("message").innerHTML = "Cập nhật thất bại";
        }
        if (code == 1){
                
            document.getElementById("message").style.color = "red";
            document.getElementById("message").innerHTML = "Vui lòng nhập lại mật khẩu mới";
        }
        if (code == 2){
                
            document.getElementById("message").style.color = "red";
            document.getElementById("message").innerHTML = "Sai mật khẩu cũ";
        }
        }
    }
}
