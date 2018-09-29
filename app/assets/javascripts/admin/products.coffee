# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
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

    event.preventDefault()

  # 削除ボタンを押されたとき
  $('form').on 'click', '.remove_field', (event) ->
    $(this).prev('input[name*=_destroy]').val('true')

    association = $(this).data('association')
    if association == "discs"
      $(this).parents('.disc-new').hide()
    else if association == "track_relations"
      $(this).closest('tr').hide()

    event.preventDefault()

  $('form').on 'click', '.change-mode', (e) ->
    $(this).parent().prevAll('.song-form').remove()
    mode = $(this).data('mode')
    if mode == "new"
      console.log('new')
      insert_item = $(this).data('exist')
      $(this).parent().before(insert_item)
      $(this).data('mode', 'exist')
      $(this).text('既存の楽曲から選択')
    else if mode == "exist"
      console.log('exist')
      insert_item = $(this).data('new')
      $(this).parent().before(insert_item)
      $(this).data('mode', 'new')
      $(this).text('新規楽曲を選択')

    e.preventDefault()
