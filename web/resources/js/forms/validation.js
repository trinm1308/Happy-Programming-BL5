/**
 *
 * FormValidation
 *
 * Interface.Forms.Validation.html page content scripts. Initialized from scripts.js file.
 *
 *
 */

class FormValidation {
  constructor() {
    // Initialization of the page plugins
    if (!jQuery().validate) {
      console.log('validate is undefined!');
      return;
    }

    this._initBasicForm();
    this._initCommonRules();
    this._initTopLabelValidation();
    this._initFloatingLabelValidation();
    this._initFilledValidation();
    this._initPositions();
    this._initBootstrapValidation();
  }

  // Basic validation
  _initBasicForm() {
    // Select2
    if (jQuery().select2) {
      jQuery('#basicValidationSelect2').select2({minimumResultsForSearch: Infinity, placeholder: ''});
      jQuery('#basicValidationSelect2').on('change', function () {
        jQuery(this).valid();
      });
    }
    // Datepicker
    if (jQuery().datepicker) {
      jQuery('#basicValidationDate').datepicker({
        autoclose: true,
      });
      jQuery('#basicValidationDate').on('change', function () {
        jQuery(this).valid();
      });
    }
    // Form validation
    jQuery('#exampleForm').validate();
  }

  // Top label form validation
  _initTopLabelValidation() {
    // Select2
    if (jQuery().select2) {
      jQuery('#select2TopLabel').select2({minimumResultsForSearch: Infinity, placeholder: ''});
      jQuery('#select2TopLabel').on('change', function () {
        jQuery(this).valid();
      });
    }
    // Tagify
    if (typeof Tagify !== 'undefined') {
      if (document.querySelector('#tagsTopLabel') !== null) {
        new Tagify(document.querySelector('#tagsTopLabel'));
      }
      jQuery('#tagsTopLabel').on('change', function () {
        jQuery(this).valid();
      });
    }
    // Datepicker
    if (jQuery().datepicker) {
      jQuery('#dateTopLabel').datepicker({
        autoclose: true,
      });
      jQuery('#dateTopLabel').on('change', function () {
        jQuery(this).valid();
      });
    }
    // Form validation
    jQuery('#validationTopLabel').validate();
  }

  // Floating label form validation
  _initFloatingLabelValidation() {
    // Select2
    const _this = this;
    if (jQuery().select2) {
      jQuery('#select2FloatingLabel')
        .select2({minimumResultsForSearch: Infinity, placeholder: ''})
        .on('select2:open', function (e) {
          jQuery(this).addClass('show');
        })
        .on('select2:close', function (e) {
          _this._addFullClassToSelect2(this);
          jQuery(this).removeClass('show');
        });
      this._addFullClassToSelect2(jQuery('#select2FloatingLabel'));
      jQuery('#select2FloatingLabel').on('change', function () {
        jQuery(this).valid();
      });
    }
    // Tagify
    if (typeof Tagify !== 'undefined') {
      if (document.querySelector('#tagsFloatingLabel') !== null) {
        new Tagify(document.querySelector('#tagsFloatingLabel'));
        jQuery('#tagsFloatingLabel').on('change', function () {
          jQuery(this).valid();
        });
      }
    }
    // Datepicker
    if (jQuery().datepicker) {
      jQuery('#datePickerFloatingLabel')
        .datepicker({
          autoclose: true,
        })
        .on('show', function (e) {
          jQuery(this).addClass('show');
        });
      jQuery('#datePickerFloatingLabel').on('change', function () {
        jQuery(this).valid();
      });
    }
    // Form validation
    jQuery('#validationFloatingLabel').validate();
  }

  _initFilledValidation() {
    // Select2
    if (jQuery().select2) {
      jQuery('#select2Filled').select2({minimumResultsForSearch: Infinity});
      this._addFullClassToSelect2(jQuery('#select2Filled'));
      jQuery('#select2Filled').on('change', function () {
        jQuery(this).valid();
      });
    }
    // Tagify
    if (typeof Tagify !== 'undefined') {
      if (document.querySelector('#tagsFilled') !== null) {
        new Tagify(document.querySelector('#tagsFilled'));
        jQuery('#tagsFilled').on('change', function () {
          jQuery(this).valid();
        });
      }
    }
    // Datepicker
    if (jQuery().datepicker) {
      jQuery('#datePickerFilled').datepicker({
        autoclose: true,
      });
      jQuery('#datePickerFilled').on('change', function () {
        jQuery(this).valid();
      });
    }
    // Form validation
    jQuery('#validationFilled').validate();
  }

  // Position helpers
  _initPositions() {
    if (jQuery().validate) {
      jQuery('#tooltipPositions').validate();
    }
  }

  // Helper method for floating label Select2
  _addFullClassToSelect2(el) {
    if (jQuery(el).val() !== '' && jQuery(el).val() !== null) {
      jQuery(el).parent().find('.select2.select2-container').addClass('full');
    } else {
      jQuery(el).parent().find('.select2.select2-container').removeClass('full');
    }
  }

  // Common validation rules
  _initCommonRules() {
    jQuery('#rulesForm').validate({
      rules: {
        rulesName: {
          required: true,
          lettersonly: true,
        },
        rulesEmail: {
          required: true,
          email: true,
        },
        rulesId: {
          required: true,
          minlength: 8,
          maxlength: 8,
          number: true,
        },
        rulesDetail: {
          required: true,
          maxlength: 20,
        },
        rulesPassword: {
          required: true,
          minlength: 6,
        },
        rulesPasswordConfirm: {
          required: true,
          minlength: 6,
          equalTo: '#rulesPassword',
        },
        rulesCreditCard: {
          creditcard: true,
          nowhitespace: true,
          required: true,
        },
        rulesAge: {
          number: true,
          min: 18,
          required: true,
        },
      },
      messages: {
        rulesName: {
          lettersonly: 'Ch??? ch???p nh???n ch??? c??i!',
        },
        rulesEmail: {
          email: 'b???n ph???i ??i???n ????ng ?????nh d???ng email!',
        },
        rulesId: {
          number: 'B???n ph???i nh???p s??? !',
          minlength: 'B???n ph???i ??i???n ??t nh???t {0} k?? t???!',
          maxlength: 'B???n kh??ng ???????c nh???p qu?? {0} k?? t???!',
        },
        rulesPassword: {
          minlength: 'M???t kh???u ph???i ch???a ??t nh???t {0} k?? t???!',
        },
        rulesPasswordConfirm: {
          equalTo: 'Nh???p l???i m???t kh???u ph???i tr??ng kh???p!',
          minlength: 'M???t kh???u ph???i ch???a ??t nh???t {0} k?? t???!',
        },
        rulesDetail: {
          maxlength: 'Details must be maximum {0} characters!',
        },
        rulesCreditCard: {
          creditcard: 'Must be a valid credit card number!',
          nowhitespace: 'Must not contain whitespace!',
        },
      },
    });
  }

  _initBootstrapValidation() {
    var forms = document.querySelectorAll('.needs-validation');
    Array.prototype.slice.call(forms).forEach(function (form) {
      form.addEventListener(
        'submit',
        function (event) {
          if (!form.checkValidity()) {
            event.preventDefault();
            event.stopPropagation();
          }

          form.classList.add('was-validated');
        },
        false,
      );
    });
  }
}
