/**
 *
 * BlogDetail
 *
 * Pages.Blog.Detail.html page content scripts. Initialized from scripts.js file.
 *
 *
 */

class BlogDetail {
    constructor() {
        // Initialization of the page plugins
        this._initDetailGlideCarousel();
        this._initQuillBubble();
    }

    // Popular articles carousel
    _initDetailGlideCarousel() {
        if (document.querySelector('#glideBlogDetail') !== null && typeof GlideGallery !== 'undefined') {
            const element = document.querySelector('#glideBlogDetail');
            const glideLength = element.querySelector('.glide-large .glide__slides').children.length;
            const glideThumbCount = 5;
            const perView = Math.min(glideThumbCount, glideLength);
            new GlideGallery(
                    element.querySelector('.glide-large'),
                    element.querySelector('.glide-thumb'),
                    {
                        bound: true,
                        rewind: false,
                        focusAt: 0,
                        perView: 1,
                        startAt: 0,
                    },
                    {
                        bound: true,
                        rewind: false,
                        perView: perView,
                        perTouch: 1,
                        focusAt: 0,
                        startAt: 0,
                        breakpoints: {
                            1600: {
                                perView: Math.min(4, glideLength),
                            },
                            576: {
                                perView: Math.min(3, glideLength),
                            },
                            420: {
                                perView: Math.min(2, glideLength),
                            },
                        },
                    },
                    glideLength,
                    perView,
                    70,
                    );
        }
    }
    _initQuillBubble() {
        if (document.getElementById('quillEditorBubble')) {
            var quill = new Quill('#quillEditorBubble', {
                modules: {toolbar: this.quillBubbleToolbarOptions, active: {}},
                theme: 'bubble',
            });
            const formValues = {
                action: "getBlogContent",
                bid: getUrlParameter("bid")
            }
            console.log(formValues);
            $.ajax({
                type: "POST",
                data: formValues,
                success: function (response) {

                    quill.setContents(JSON.parse(response))
                    quill.disable();
                }
            });

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
    }
}
