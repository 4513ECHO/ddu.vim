function ddu#ui#async_action(
      \ action_name, params = {}, ui_name=b:->get('ddu_ui_name', '')) abort
  call ddu#ui_async_action(a:ui_name, a:action_name, a:params)
endfunction

function ddu#ui#sync_action(
      \ action_name, params = {}, ui_name=b:->get('ddu_ui_name', '')) abort
  call ddu#ui_sync_action(a:ui_name, a:action_name, a:params)
endfunction

function ddu#ui#do_action(
      \ action_name, params = {}, ui_name=b:->get('ddu_ui_name', '')) abort
  return ddu#ui#sync_action(a:action_name, a:params, a:ui_name)
endfunction

function ddu#ui#multi_actions(
      \ actions, ui_name=b:->get('ddu_ui_name', '')) abort
  for action in a:actions
    call call('ddu#ui_sync_action',
          \ [a:ui_name] + (type(action) == v:t_list ? action : [action]))
  endfor
endfunction

function ddu#ui#get_item(name=b:->get('ddu_ui_name', '')) abort
  return b:->get('ddu_ui_item', {})
endfunction

function ddu#ui#get_items(name=b:->get('ddu_ui_name', '')) abort
  return b:->get('ddu_ui_items', [])
endfunction

function ddu#ui#get_selected_items(name=b:->get('ddu_ui_name', '')) abort
  return b:->get('ddu_ui_selected_items', [])->empty()
        \ ? [ddu#ui#get_item(a:name)]
        \ : b:->get('ddu_ui_selected_items', [])
endfunction

function ddu#ui#visible(
      \ name=b:->get('ddu_ui_name', ''), tabnr = tabpagenr()) abort
  return ddu#denops#_running() ?
        \ ddu#denops#_request('uiVisible', [a:name, a:tabnr]) : v:false
endfunction

function ddu#ui#winids(name=b:->get('ddu_ui_name', '')) abort
  return ddu#denops#_running() ?
        \ ddu#denops#_request('uiWinids', [a:name]) : []
endfunction

function ddu#ui#update_cursor(name=b:->get('ddu_ui_name', '')) abort
  return ddu#denops#_running() ?
        \ ddu#denops#_request('uiUpdateCursor', [a:name]) : []
endfunction
