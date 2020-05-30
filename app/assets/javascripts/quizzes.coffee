# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$selected_mdc_class = ""
$('#submit').hide()

$check_boxes = $('input')
# $check_boxes.prop 'checked', false
# console.log($check_boxes)
# $('input[type=checkbox]').click ->
#     $check_boxes.prop 'checked', false
#     $(this).prop 'checked', true

$mdc_boxes = $('input:radio.mdc')
$ds_boxes = $('input:radio.ds')
$df_boxes = $('input:checkbox.df')

$mdc_boxes.click ->
    $mdc_boxes.prop 'checked', false
    $check_boxes.prop 'checked', false
    $(this).prop 'checked', true
    $selected_mdc_class = $(this).attr('class').split(" ")[1]
    if $selected_mdc_class == "bk"
        $('#ds_Pseudomonas').prop 'checked', true
        $('.osu').prop 'checked', true
        $('div.row.bk_row').css('color', 'black')
        $("div ul li div.row").not($('div.row.bk_row')).css('color', '#DCDCDC')
    else if $selected_mdc_class == "fk"
        $('#ds_Filamentous').prop 'checked', true
        $('.fm').prop 'checked', true
        $('div.row.fk_row').css('color', 'black')
        $("div ul li div.row").not($('div.row.fk_row')).css('color', '#DCDCDC')
    else if $selected_mdc_class == "pk"
        $('#ds_Acanthamoeba').prop 'checked', true
        $('.rk').prop 'checked', true
        $('div.row.pk_row').css('color', 'black')
        $("div ul li div.row").not($('div.row.pk_row')).css('color', '#DCDCDC')
    else if $selected_mdc_class == "vk"
        $('#ds_Herpes').prop 'checked', true
        $('.de').prop 'checked', true
        $('div.row.vk_row').css('color', 'black')
        $("div ul li div.row").not($('div.row.vk_row')).css('color', '#DCDCDC')
    else if $selected_mdc_class == "nk"
        $('#ds_Marginal').prop 'checked', true
        $('.pu').prop 'checked', true
        $('div.row.nk_row').css('color', 'black')
        $("div ul li div.row").not($('div.row.nk_row')).css('color', '#DCDCDC')


$ds_boxes.click ->
    if ($(this).hasClass($selected_mdc_class))
        $ds_boxes.prop 'checked', false
        $(this).prop 'checked', true
    else
        $(this).prop 'checked', false

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