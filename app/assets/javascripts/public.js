function enableDismiss(target, dismissedButton){
  dismissedButton.click(function(e) {
    e.preventDefault();
    target.hide("slow");
  });
}