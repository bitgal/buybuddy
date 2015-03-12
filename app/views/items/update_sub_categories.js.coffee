$("#item_sub_category_id").empty()
  .append("<%= escape_javascript(render(:partial => @sub_categories)) %>")