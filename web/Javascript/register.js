function validateForm()
{
    if (document.coordinator.fname.value === "") {
        alert("First name cannot be empty!");
        document.coordinator.fname.focus();
        return false;
    }
    if (document.coordinator.lname.value === "") {
        alert("Last name cannot be empty!");
        document.coordinator.lname.focus();
        return false;
    }
    if (document.coordinator.department.value === "") {
        alert("Department cannot be empty!");
        document.coordinator.department.focus();
        return false;
    }
    if (document.coordinator.subject.value === "") {
        alert("Subject cannot be empty!");
        document.coordinator.subject.focus();
        return false;
    }
    if (document.coordinator.email.value === "") {
        alert("Email cannot be empty!");
        document.coordinator.email.focus();
        return false;
    }
    if (document.coordinator.password.value === "")
    {
        alert("Password cannot be empty!");
        document.coordinator.password.focus();
        return false;
    }
    return(true);
}