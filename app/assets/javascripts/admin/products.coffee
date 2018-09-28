# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ready page:load', ->
  # 追加ボタンを押されたとき
  $('form').on 'click', '.add_field', (event) ->
    # 現在時刻をミリ秒形式で取得
    time = new Date().getTime()
    # ヘルパーで作ったインデックス値を↑と置換
    regexp = new RegExp($(this).data('id'), 'g')

    # ヘルパーから渡した fields(HTML) を挿入
    association = $(this).data('association')
    insert_item = $(this).data('fields').replace(regexp, time)
    if association == "discs"
        $(this).after(insert_item)
    else if association == "track_relations"
        table_body = $(this).next('table').children('tbody')
        table_body.append(insert_item)
        # $(this).after($(this).data('fields'))
    else

    event.preventDefault()

  # 削除ボタンを押されたとき
  $('form').on 'click', '.remove_field', (event) ->
    # 削除ボタンを押したフィールドの _destroy = true にする
    $(this).prev('input[name*=_destroy]').val('true')
    # 削除ボタンが押されたフィールドを隠す
    $(this).closest('div').hide()
    event.preventDefault()