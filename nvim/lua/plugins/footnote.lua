return { -- 返回插件配置表
  'chenxin-yan/footnote.nvim', -- 插件仓库地址（脚注管理插件）
  opts = { -- 插件选项
      keys = { -- 键位映射
        n = { -- 普通模式
            new_footnote = '<leader>fn', -- Leader+fn 新建脚注
            organize_footnotes = '<leader>of', -- Leader+of 整理脚注
            next_footnote = ']f', -- ]f 跳转到下一个脚注
            prev_footnote = '[f', -- [f 跳转到上一个脚注
        },
        i = { -- insert mode -- 插入模式
            new_footnote = '<C-f>', -- Ctrl+f 新建脚注
        },
      },
      organize_on_save = true, -- 保存时自动整理脚注
      organize_on_new = false, -- 新建脚注时不自动整理
  }
}
