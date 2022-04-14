function progress(){

    let checks = document.querySelectorAll(".check");
    checks.forEach(function(check){
      check.addEventListener("click", (e) => {
        const cardID = e.target.id
        const taskID = e.target.value
        let pb = document.getElementById(`bar${cardID}`);
        let cnt_input = $(`#card${cardID} input:checkbox`).length;
        let cnt_checked = $(`#card${cardID} input:checkbox:checked`).length;

        if(cnt_checked/cnt_input == 1) {
          pb.setAttribute('style','width:100%;');
          pb.setAttribute('class','progress-bar progress-bar-striped active');
          pb.innerHTML = " 100% ";
        } else if(cnt_checked/cnt_input > 0) {
          pb.setAttribute('style',`width:${Math.floor(cnt_checked/cnt_input*100)}%;`);
          pb.setAttribute('class','progress-bar')  ;
          pb.innerHTML = ` ${Math.floor(cnt_checked/cnt_input*100)}% `;
        } else {
          pb.setAttribute('style','width:0%;');
          pb.setAttribute('class','progress-bar');  
          pb.innerHTML= " 0% ";
        };

        const formData = new FormData();
        formData.append("task_id", taskID);
        formData.append("finish", e.target.checked);

        const XHR = new XMLHttpRequest();
        XHR.open("PUT", `/tasks/${taskID}`, true);
        XHR.responseType = "json";
        XHR.send(formData);

      });
    });
  };

  function new_task(){
  const new_task = document.getElementById("new_task");
  const taskall = document.getElementById("items");
  new_task.addEventListener('keypress', add_task);

  function add_task(e) {

    if (e.keyCode === 13) {
      e.preventDefault();
      const html  =`
      <label ><input type="checkbox" class="check task" id="new" value ="new" title ="${new_task.value}" >${new_task.value}</label><br>
      `
    
      taskall.insertAdjacentHTML("beforeend", html);
      new_task.value = "";
      progress();
    }  
  };

};


window.addEventListener('load', progress);
window.addEventListener('load', new_task);
