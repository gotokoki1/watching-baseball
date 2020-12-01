function comment() {
  const submit = document.getElementById("submit");
  const pathId = document.querySelector('.form').dataset.post;
  submit.addEventListener("click", (e) => {
    const formData = new FormData(document.getElementById("form"));
    const XHR = new XMLHttpRequest();
    XHR.open("POST", `/baseballs/${pathId}/comments`, true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = () => {
      if (XHR.status != 200) {
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
        return null;
      }
      const item = XHR.response.post;
      const list = document.getElementById("list");
      const formText = document.getElementById("text");
      const url = ` /users/${item.user_id}`;
      const HTML = `
      <li class="comments_list">
      ${item.text}
      <a href=${url} class='comment_user'>${item.nickname}</a>
      <span class="delete_comment" >削除</span>
      </li>`;
      list.insertAdjacentHTML("afterend", HTML);
      formText.value = "";
    };
    e.preventDefault();
  });
}
window.addEventListener("load", comment);