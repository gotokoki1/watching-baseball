function handleDelete(e) {
  const baseballId = document.querySelector('.comments_lists').dataset.baseball;
  const id = e.target.parentElement.dataset.id
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

function listsWrapper(){
  const lists = document.querySelectorAll('.delete_comment');
  console.log(lists);
  lists.forEach(function(list) {
    list.addEventListener('click', (e) => handleDelete(e));
  })
}

document.addEventListener('DOMContentLoaded', listsWrapper);
document.addEventListener('change', listsWrapper);