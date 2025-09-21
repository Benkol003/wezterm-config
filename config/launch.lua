local platform = require('utils.platform')

local options = {
   default_prog = {},
   launch_menu = {},
}

if platform.is_win then
   options.default_prog = { 'pwsh', '-NoLogo' }
   options.launch_menu = {
      { label = 'PowerShell', args = { 'pwsh', '-NoLogo' } },
      { label = 'Command Prompt', args = { 'cmd' } },
      { label  = "VS Dev Console", args = {'pwsh', '-NoLogo','-NoExit','-Command','Launch-VsDevShell.ps1'} },
      { label = 'Msys2', args = { 'msys2_shell.cmd','-defterm','-here','-no-start' } },
      { label = 'Msys2 Ucrt64', args = { 'msys2_shell.cmd','-defterm','-here','-no-start', '-ucrt64' } }
   }
elseif platform.is_mac then
   options.default_prog = { '/opt/homebrew/bin/fish', '-l' }
   options.launch_menu = {
      { label = 'Bash', args = { 'bash', '-l' } },
      { label = 'Fish', args = { '/opt/homebrew/bin/fish', '-l' } },
      { label = 'Nushell', args = { '/opt/homebrew/bin/nu', '-l' } },
      { label = 'Zsh', args = { 'zsh', '-l' } },
   }
elseif platform.is_linux then
   options.default_prog = { 'fish', '-l' }
   options.launch_menu = {
      { label = 'Bash', args = { 'bash', '-l' } },
      { label = 'Fish', args = { 'fish', '-l' } },
      { label = 'Zsh', args = { 'zsh', '-l' } },
   }
end

return options
