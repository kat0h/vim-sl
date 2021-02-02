let s:save_cpo = &cpo
set cpp&vim

let s:sl_resource = [
      \"                        (@@) (  ) (@)  ( )  @@    ()    @     O     @     O      @      ",
      \"                   (   )                                                                ",
      \"               (@@@@)                                                                   ",
      \"            (    )                                                                      ",
      \"          (@@@)                                                                         ",
      \"      ====        ________                ___________                                   ",
      \"  _D _|  |_______/        \\/g__I_I_____===__|_________|                                ",
      \"   |(_)---  |   H\\/g________/ |   |        =|___ ___|      _________________           ",
      \"   /     |  |   H  |  |     |   |         ||_| |_||     _|                \\/g_____A    ",
      \"  |      |  |   H  |__--------------------| [___] |   =|                        |       ",
      \"  | ________|___H__/__|_____/[][]~\\/g_______|       |   -|                        |    ",
      \"  |/ |   |-----------I_____I [][] []  D   |=======|____|________________________|_      ",
      \"__/ =| o |=-~~\\/g  /~~\\  /~~\\  /~~\\ ____Y___________|__|__________________________|_",
      \" |/-=|___|=    ||    ||    ||    |_____/~\\/g___/          |_D__D__D_|  |_D__D__D_|     ",
      \"  \\/g_/      \\_O=====O=====O=====O/      \\_/               \\_/   \\_/    \\_/   \\_/",
      \]

function! g:vim_sl#sl()
  let l:term_columns = str2nr(execute("set columns")->split("=")[1])
  let l:term_row = str2nr(execute("set lines")->split("=")[1])

  let l:sl = popup_create("", {"line": float2nr(floor((l:term_row-len(s:sl_resource))/2.0))})

  for l:i in range(l:term_columns)
    call popup_settext(l:sl, map(copy(s:sl_resource), {idx, v -> v[0:l:i]}))
    call popup_move(l:sl,
          \{ "col": l:term_columns - l:i})
    redraw
    sleep 20m
  endfor
  for l:i in range(len(s:sl_resource[0]))
    call popup_settext(l:sl, map(copy(s:sl_resource), {idx, v -> v[l:i:]}))
    redraw
    sleep 20m
  endfor
  call popup_close(l:sl)
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
