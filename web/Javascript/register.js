function validateForm()
{
    if (document.coordinator.fname.value === "") {
        alert("Field empty!");
        document.myForm.email.focus();
        return false;
    }
    if (document.coordinator.lname.value === "") {
        alert("Field empty!");
        document.myForm.email2.focus();
        return false;
    }
    if (document.myForm.zip.value == "" || isNaN(document.myForm.zip.value)) {
        alert("Wrong zip format");
        document.myForm.zip.focus();
        return false;
    }
    if (document.myForm.department.value === "") {
        alert("Field empty!");
        document.myForm.password.focus();
        return false;
    }
    if (document.coordinator.password.value === "")
    {
        alert("Field empty!");
        document.myForm.password.focus();
        return false;
    }
    if (document.myForm.password2.value == "")
    {
        alert("Field empty!");
        document.myForm.password2.focus();
        return false;
    }
    if (document.myForm.password.value !== document.myForm.password2.value)
    {
        alert("Passwords don't match");
        document.myForm.password2.focus();
        return false;
    }
    return(true);
}