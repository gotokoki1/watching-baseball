function handleDelete(e) {
  console.log(e.target);
  const baseballId = document.querySelector('#form').dataset.post;
  const id = e.target.dataset.comment;
  const formData = new FormData(document.getElementById("form"));
  const XHR = new XMLHttpRequest();
  XHR.open("DELETE", `/baseballs/${baseballId}/comments/${id}`, true);
  XHR.responseType = "json";
  XHR.onload = () => {
    if (XHR.status != 200) {
      alert(`Error ${XHR.status}: ${XHR.statusText}`);
      return null;
    }
    e.target.parentElement.remove();
  }
  XHR.send(formData);
}

export function listsWrapper(){
  const lists = document.querySelectorAll('.comments_list');
  console.log(lists);
  lists.forEach(function(list) {
    list.addEventListener('click', (e) => handleDelete(e));
  })
}

document.addEventListener('DOMContentLoaded', listsWrapper);

