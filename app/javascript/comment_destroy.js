const form = document.getElementById("form");
function destroyComment() {
    const XHR = new XMLHttpRequest();
    XHR.open("DELETE", `/baseballs/${liDataId}/comment/1`, true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = () => {
    liDataId.dataset.id = 1;
    liDataId.remove();
    };
  }
form.addEventListener("submit", comment_destroy);