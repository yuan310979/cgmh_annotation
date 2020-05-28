# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$selected_mdc_class = "bk"
$('#submit').hide()

$check_boxes = $('input[type=checkbox]')
# $check_boxes.prop 'checked', false
# console.log($check_boxes)
# $('input[type=checkbox]').click ->
#     $check_boxes.prop 'checked', false
#     $(this).prop 'checked', true

$mdc_boxes = $('input:checkbox.mdc')
$mdc_boxes.click ->
    $mdc_boxes.prop 'checked', false
    $check_boxes.prop 'checked', false
    $(this).prop 'checked', true
    $selected_mdc_class = $(this).attr('class').split(" ")[1]
    console.log($check_boxes)

$ds_boxes = $('input:checkbox.ds')
$ds_boxes.click ->
    if ($(this).hasClass($selected_mdc_class))
        $ds_boxes.prop 'checked', false
        $(this).prop 'checked', true
    else
        $(this).prop 'checked', false

$df_boxes = $('input:checkbox.df')
$df_boxes.click ->
    if !($(this).hasClass($selected_mdc_class))
        $(this).prop 'checked', false

$check_boxes.click ->
    $mdc = false
    $ds = false
    $df = false
    $mdc_boxes.each (index) ->
        $mdc += $(this)[0].checked
    $ds_boxes.each (index) ->
        $ds += $(this)[0].checked
    $df_boxes.each (index) ->
        $df += $(this)[0].checked
    if $mdc <= 0 || $ds <= 0 || $df <= 0
        $('#submit').hide()
    else
        $('#submit').show()