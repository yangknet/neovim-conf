return {
  'chenxin-yan/footnote.nvim',
  opts = {
      keys = {
        n = {
            new_footnote = '<leader>fn',
            organize_footnotes = '<leader>of',
            next_footnote = ']f',
            prev_footnote = '[f',
        },
        i = { -- insert mode
            new_footnote = '<C-f>',
        },
      },
      organize_on_save = true,
      organize_on_new = false,
  }
}
