jQuery(document).ready(function () {
  function updateRoleUI() {
    let selected = $('input[name="role"]:checked').val();
    if (selected === "student") {
      jQuery(".form-id-label").text("Student Id");
    } else {
      jQuery(".form-id-label").text("Teacher Id");
    }
  }

  // Listen for changes on the radio buttons
  jQuery('input[name="role"]').on("change", updateRoleUI);

  // Initialize on page load
  updateRoleUI();
});
