/**
 *
 * EditorControls
 *
 * Interface.Forms.Controls.Editor.html page content scripts. Initialized from scripts.js file.
 *
 *
 */

class EditorControls {
    constructor() {
        // Initialization of the page plugins
        if (typeof Quill === 'undefined') {
            console.log('Quill is undefined!');
            return;
        }

        this.quillToolbarOptions = [
            ['bold', 'italic', 'underline', 'strike'],
            ['blockquote', 'code-block'],
            [{list: 'ordered'}, {list: 'bullet'}],
            [{indent: '-1'}, {indent: '+1'}],
            [{size: ['small', false, 'large', 'huge']}],
            [{header: [1, 2, 3, 4, 5, 6, false]}],
            [{font: []}],
            [{align: []}],
            ['clean'],
        ];

        this.quillBubbleToolbarOptions = [
            ['bold', 'italic', 'underline', 'strike'],
            [{header: [1, 2, 3, 4, 5, 6, false]}],
            [{list: 'ordered'}, {list: 'bullet'}],
            [{align: []}],
            [{color: []}]
        ];

        this._initStandardEditor();
        this._initQuillBubble();
        this._initQuillFilled();
        this._initQuillTopLabel();
        this._initQuillFloatingLabel();
    }

    _initStandardEditor() {
        if (document.getElementById('quillEditor')) {
            new Quill('#quillEditor', {
                modules: {
                    toolbar: this.quillToolbarOptions,
                    active: {},
                },
                theme: 'snow',
            });
        }
    }

    _initQuillBubble() {
        if (document.getElementById('quillEditorBubble')) {
            var quill = new Quill('#quillEditorBubble', {
                modules: {toolbar: this.quillBubbleToolbarOptions, active: {}},
                theme: 'bubble',
            });
            $("#saveContent").click(function (e) {
                e.preventDefault();
                const lessonId = $("#lessonId").text();
                const formValues = {
                    content: JSON.stringify(quill.getContents()),
                    courseId: getUrlParameter("cid"),
                    lessonId: lessonId,
                    action: "addNote"
                };
                $.ajax({
                    type: "POST",
                    data: formValues,
                    success: function (response) {
                        if (response === "Note success") {
                            createSuccess()
                        } else if (response === "Update note fail") {
                            createFailed(0)
                        } else if (response === "Insert note fail") {
                            createFailed(1)
                        } else {
                            createFailed(-1)
                        }
                    }
                });
            });

            function createSuccess(response) {
                document.getElementById("message").style.color = "green";
                document.getElementById("message").innerHTML = "Thêm/Cập nhật note thành công";
            }

            function createFailed(code) {
                document.getElementById("message").style.color = "red";
                if (code === 0) {
                    document.getElementById("message").innerHTML = "Cập ghi chú không thành công!";
                }
                if (code === 1) {
                    document.getElementById("message").innerHTML = "Thêm ghi chú không thành công";
                }
                if (code === -1) {
                    document.getElementById("message").innerHTML = "ID của bài học này không tồn tại hoặc có lỗi bên server";
                }
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

            $("#noteStatus").click(function (e) {
                e.preventDefault();
                const lessonId = $("#lessonId").text();
                const formValues = {
                    lessonId: lessonId,
                    courseId: getUrlParameter("cid"),
                    action: "getNote"
                };
                $.ajax({
                    type: "POST",
                    data: formValues,
                    success: function (response) {
                        if (response === "Get note data fail") {
                            createFailed(0)
                        } else if (response === "No note data") {
                            createFailed(1)
                        } else {
                            getSuccess(response)
                        }
                    }
                });
                function getSuccess(response) {
                    quill.setContents(JSON.parse(response));
                    quill.enable();
                }

                function getFailed(code) {
                    document.getElementById("message").style.color = "red";
                    if (code === 0) {
                        document.getElementById("message").innerHTML = "Lấy dữ liệu note không thành công";
                    }
                }


                // Set note visible
                if ($("#quillEditorBubble").is(":visible") === false) {
                    $("#noteStatus").text("Hide note");
                    $("#noteBody").removeAttr("hidden");
                    $("#quillEditorBubble").removeAttr("hidden");
                    $("#saveContent").removeAttr("hidden");
                    $("#setContent").removeAttr("hidden");
                    $("#clearContent").removeAttr("hidden");
                    $("#moveThis").removeAttr("hidden");
                } else {
                    // Set note unvisible
                    $("#noteStatus").text("Add note");
                    $("#noteBody").attr("hidden", "true");
                    $("#quillEditorBubble").attr("hidden", "true");
                    $("#saveContent").attr("hidden", "true");
                    $("#setContent").attr("hidden", "true");
                    $("#clearContent").attr("hidden", "true");
                    $("#moveThis").attr("hidden", "true");
                }
            });
            $("#setContent").click(function (e) {
                e.preventDefault();
                quill.setContents(JSON.parse("{\"ops\":[{\"attributes\":{\"bold\":true},\"insert\":\"an\"},{\"insert\":\"\\n\\n\\n\"},{\"attributes\":{\"italic\":true,\"bold\":true},\"insert\":\"com \"},{\"insert\":\"\\n\\n\"},{\"attributes\":{\"bold\":true},\"insert\":\"AN COM\"},{\"attributes\":{\"header\":1},\"insert\":\"\\n\"},{\"insert\":\"\\n\"}]}"));
                quill.enable();
            });
            $("#clearContent").click(function (e) {
                e.preventDefault();
                quill.setContents('');
                quill.enable();
            });
            dragElement(document.getElementById("quillBubble"));
            function dragElement(elmnt) {
                var pos1 = 0, pos2 = 0, pos3 = 0, pos4 = 0;
                if (document.getElementById("moveThis")) {
                    /* if present, the header is where you move the DIV from:*/
                    document.getElementById("moveThis").onmousedown = dragMouseDown;
                } else {
                    /* otherwise, move the DIV from anywhere inside the DIV:*/
                    elmnt.onmousedown = dragMouseDown;
                }

                function dragMouseDown(e) {
                    e = e || window.event;
                    e.preventDefault();
                    // get the mouse cursor position at startup:
                    pos3 = e.clientX;
                    pos4 = e.clientY;
                    document.onmouseup = closeDragElement;
                    // call a function whenever the cursor moves:
                    document.onmousemove = elementDrag;
                }

                function elementDrag(e) {
                    e = e || window.event;
                    e.preventDefault();
                    // calculate the new cursor position:
                    pos1 = pos3 - e.clientX;
                    pos2 = pos4 - e.clientY;
                    pos3 = e.clientX;
                    pos4 = e.clientY;
                    // set the element's new position:
                    elmnt.style.top = (elmnt.offsetTop - pos2) + "px";
                    elmnt.style.left = (elmnt.offsetLeft - pos1) + "px";
                }

                function closeDragElement() {
                    /* stop moving when mouse button is released:*/
                    document.onmouseup = null;
                    document.onmousemove = null;
                }
            }
        }
    }

    _initQuillFilled() {
        if (document.getElementById('quillEditorFilled')) {
            new Quill('#quillEditorFilled', {
                modules: {toolbar: this.quillBubbleToolbarOptions, active: {}},
                theme: 'bubble',
                placeholder: 'Editor',
            });
        }
    }

    _initQuillTopLabel() {
        if (document.getElementById('quillEditorTopLabel')) {
            new Quill('#quillEditorTopLabel', {
                modules: {toolbar: this.quillBubbleToolbarOptions, active: {}},
                theme: 'bubble',
            });
        }
    }

    _initQuillFloatingLabel() {
        if (document.getElementById('quillEditorFloatingLabel')) {
            const floatingQuill = new Quill('#quillEditorFloatingLabel', {
                modules: {toolbar: this.quillBubbleToolbarOptions, active: {}},
                theme: 'bubble',
            });
            floatingQuill.on('editor-change', function (eventName, ...args) {
                if (floatingQuill.getLength() > 1) {
                    document.getElementById('quillEditorFloatingLabel').classList.add('full');
                } else {
                    document.getElementById('quillEditorFloatingLabel').classList.remove('full');
                }
            });
        }
    }
}
