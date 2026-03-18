return { -- 返回插件配置表
  "windwp/nvim-ts-autotag", -- 插件仓库地址（自动关闭和重命名 HTML/XML 标签）
  lazy = false, -- 禁用延迟加载（启动时立即加载）
  config = function () -- 插件配置函数
    require('nvim-ts-autotag').setup({ -- 初始化 nvim-ts-autotag 插件
      opts = { -- 全局选项配置
        -- Defaults -- 默认值
        enable_close = true, -- Auto close tags -- 自动关闭标签
        enable_rename = true, -- Auto rename pairs of tags -- 自动重命名成对的标签
        enable_close_on_slash = false -- Auto close on trailing </ -- 在输入 </ 时自动关闭
      },
      -- Also override individual filetype configs, these take priority. -- 也可以覆盖单个文件类型的配置，这些配置优先级更高
      -- Empty by default, useful if one of the "opts" global settings -- 默认为空，如果某个全局设置
      -- doesn't work well in a specific filetype -- 在特定文件类型中效果不好时很有用
      per_filetype = { -- 按文件类型配置
        ["html"] = { -- HTML 文件类型
          enable_close = false -- 禁用自动关闭标签
        }
      }
    })
  end
}
