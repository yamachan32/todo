function post (){


 
const submit = document.getElementById("submit");
const card_id=document.getElementById("judge").title;

submit.addEventListener("click", (e) => {
  e.preventDefault();
  const form = document.getElementById("form");
  const elements = document.querySelectorAll(".task");
  const tasks = Array.prototype.slice.call(elements);

  let add_tasks = []; // 配列を定義
  for (let i = 0; i < tasks.length; i++) {
      let task = {finish: tasks[i].checked, matter: tasks[i].title, task_id: tasks[i].value}
      add_tasks.push(task);
  
  };
 
  let formData = new FormData(form);
  formData.append('add_tasks', JSON.stringify(add_tasks));

  const XHR = new XMLHttpRequest();

  if (submit.value=="作成"){
    XHR.open("POST", "/cards", true);
  }else if(submit.value=="更新"){
    XHR.open("PUT", `/cards/${card_id}`, true);
  }
  XHR.send(formData);

  window.location.href = "/";

});
};

window.addEventListener('load', post);
