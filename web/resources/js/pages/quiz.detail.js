/**
 *
 * QuizDetail
 *
 * Quiz.Detail.html page content scripts. Initialized from scripts.js file.
 *
 *
 */

class QuizDetail {
    constructor() {
        this._initTimer();
    }

    _initTimer() {

        const formValues = {
            action: "do",
        };
        $.ajax({
            type: "POST",
            data: formValues,
            success: function (response) {
                if (typeof Countdown !== 'undefined') {
                    const s = new Date();
                    const e = new Date(response);
                    var countdown = new Countdown({
                        selector: '#timer',
                        leadingZeros: true,
                        msgBefore: 'Đang tính thời gian',
                        msgAfter: "Đã hết thời gian.",
                        msgPattern: `
                      <div class="row gx-5">
                          <div class="col-auto">
                              <div class="display-5 text-primary mb-1">{minutes}</div>
                              <div>phút</div>
                          </div>
                          <div class="col-auto">
                              <div class="display-5 text-primary mb-1">{seconds}</div>
                              <div>giây</div>
                          </div>
                      </div>`,
                        dateEnd: e,
                        dateStart: s,
                        onEnd: function () {
                            document.getElementById("submit").click();
                        }


                    });
                }
            }

        });

    }
}
