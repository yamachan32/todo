
window.addEventListener('turbolinks:load', function(){

function progress() {
  let cnt_input = $('#items input:checkbox').length;
  let cnt_checked = $('#items input:checkbox:checked').length;
  if(cnt_checked/cnt_input == 1) {
    $pb.attr({
      'style':'width:100%;',
      'class':'progress-bar progress-bar-striped active'
    }).html(" 100% ");
    } else if(cnt_checked/cnt_input > 0) {
    $pb.attr({
      'style':`width:${Math.floor(cnt_checked/cnt_input*100)}%;`,
      'class':'progress-bar'  
    }).html(` ${Math.floor(cnt_checked/cnt_input*100)}% `);
    } else {
    $pb.attr({
      'style':'width:0%;',
      'class':'progress-bar'  
    }).html(" 0% ");
  }
}


$("body").on('click','#items',progress);
const $pb = $('.progress-bar');

const new_task = document.getElementById("new_task");
const tasks = document.getElementById("items");
new_task.addEventListener('keypress', add_task);

function add_task(e) {

    if (e.keyCode === 13) {
    e.preventDefault();
    const html  =`
    <label ><input type="checkbox", class="task", value ="${new_task.value}" >${new_task.value}</label><br>
    `
    tasks.insertAdjacentHTML("beforeend", html);
    new_task.value = "";
    progress();
  }  
};

});
