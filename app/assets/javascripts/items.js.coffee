# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $(document).on 'change', '#item_category_id', (evt) ->
    $.ajax 'update_sub_categories',
      type: 'GET'
      dataType: 'script'
      data: {
        category_id: $("#item_category_id option:selected").val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        alert("Dynamic subcategory select OK!")
