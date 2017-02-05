function! Toggle_Spell()

    let b:is_spell_enabled = &spell

    if b:is_spell_enabled
        set nospell
        let b:is_spell_enabled = 0
    else
        set spell
        let b:is_spell_enabled = 1
    endif

endfunction

nnoremap <F4> :call Toggle_Spell()<CR>

