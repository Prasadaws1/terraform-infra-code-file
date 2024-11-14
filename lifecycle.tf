lifecycle {
prevent_destroy = true ###############--------------------->>>>>>>>>>>>>>> this help cant destroy
}


lifecycle {
ignore_changes = [tags, instance_type, instance_type] #################################--------------------------->>>>>>>>>>>>>>>>>>>>>>>>>>>> this can be help to ignore modification 
}

lifecycle {
create_before_destroy = true ###############--------------------->>>>>>>>>>>>>>> this can help to create one instance before tey destroy
}



