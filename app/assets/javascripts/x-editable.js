function enableXEditable() {
  $('.editable').editable({
    format: 'DD-MM-YYYY',    
    template: 'DD / MMM / YYYY',    
    combodate: {
      minYear: 2000,
      maxYear: 2025
    }
  });
}  
