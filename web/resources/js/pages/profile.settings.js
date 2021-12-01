/**
 *
 * ProfileSettings
 *
 * Pages.Profile.Settings.html page content scripts. Initialized from scripts.js file.
 *
 *
 */

class ProfileSettings {
  constructor() {
    // Initialization of the page plugins
    this._initMoveContent();
    this._initGenderSelect();
    this._initBirthdayDatePicker();
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

  // Gender select2
  _initGenderSelect() {
    if (document.getElementById('genderSelect') !== null && jQuery().select2) {
      jQuery('#genderSelect').select2({minimumResultsForSearch: Infinity, placeholder: ''});
    }
  }

  // Birthday date picker
  _initBirthdayDatePicker() {
    if (document.getElementById('birthday') !== null && jQuery().datepicker) {
      jQuery('#birthday').datepicker({
        autoclose: true,
      });
    }
  }
  _initForm() {
        const form = document.getElementById('profileForm');
        if (!form) {
            return;
        }
        form.addEventListener('submit', (event) => {
            event.preventDefault();
            event.stopPropagation();
          
                const formValues = {
                    action: "chginfo",
                    email: form.querySelector('[name="email"]').value,
                    name: form.querySelector('[name="name"]').value,
                    gender: form.querySelector('[name="gender"]').value,
                    dob: form.querySelector('[name="dob"]').value,
                    phone: form.querySelector('[name="phone"]').value,
                    bio: form.querySelector('[name="bio"]').value,
                };
                $.ajax({
                   
                    type: "POST",
                    data: formValues,
                    success: function (response) {
                        if (response == "Success") {
                            updateSuccess()
                        } else {
                            updateFailed()
                        }
                    }

                });
                return;
            
        });

        async function updateSuccess(response) {
            document.getElementById("message").style.color = "green";
            document.getElementById("message").innerHTML = "Cập nhật thành công!";
            setTimeout(function () {
                window.location.href = "profile?action=general";
            }, 1000);
        }

        function updateFailed(response) {
            document.getElementById("message").style.color = "red";
            document.getElementById("message").innerHTML = "Cập nhật thất bại";
        }
    }
}
