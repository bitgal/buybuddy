$("#item_sub_category").empty()
  .append("<%= escape_javascript(render(:partial => @sub_categories)) %>")