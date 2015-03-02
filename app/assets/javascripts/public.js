function enableDismiss(target, dismissedButton){
  dismissedButton.click(function(e) {
    e.preventDefault();
    target.hide("slow");
  });
}

function enableDatePicker(datePicker) {
  datePicker.datepicker(
    {showOtherMonths: true,
    selectOtherMonths: true,
    dateFormat: "dd-mm-yy"}
  );
}