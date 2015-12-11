$(function () {
  $('#datetimepicker').datetimepicker({
    viewMode: 'years',
    format: 'DD-MM-YYYY'
  });
});

function sendDate() {
  var date = document.getElementById("datetimepicker").value;
  window.location.href = "/days/" + date;
}
