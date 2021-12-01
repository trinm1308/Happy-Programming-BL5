/**
 *
 * ProfileSettings
 *
 * Pages.Profile.Settings.html page content scripts. Initialized from scripts.js file.
 *
 *
 */

 class ProfileEdit {
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
          const form = document.getElementById('changeProfileForm');
          if (!form) {
              return;
          }
          form.addEventListener('submit', (event) => {
              event.preventDefault();
              event.stopPropagation();
            
                  const formValues = {
                      username: form.querySelector('[name="username"]').value,
                      email: form.querySelector('[name="email"]').value,
                      name: form.querySelector('[name="name"]').value,
                      gender: form.querySelector('[name="gender"]').value,
                      dob: form.querySelector('[name="dob"]').value,
                      phone: form.querySelector('[name="phone"]').value,
                      bio: form.querySelector('[name="bio"]').value,
                      role: form.querySelector('[name="role"]').value,
                      status: form.querySelector('[name="status"]').value,
                      
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
                  window.location.href = "security";
              }, 1000);
          }
  
          function updateFailed(code) {
               
              document.getElementById("message").style.color = "red";
              document.getElementById("message").innerHTML = "Cập nhật thất bại";
          
          }
      }
  }