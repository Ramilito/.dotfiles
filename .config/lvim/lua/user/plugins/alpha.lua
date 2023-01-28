lvim.builtin.alpha.active = true

lvim.builtin.alpha.dashboard.section.header.val = {
  "██████╗░███████╗███╗░░██╗████████╗░█████╗░██████╗░░█████╗░███╗░░░███╗██╗  ░█████╗░██████╗░",
  "██╔══██╗██╔════╝████╗░██║╚══██╔══╝██╔══██╗██╔══██╗██╔══██╗████╗░████║██║  ██╔══██╗██╔══██╗",
  "██████╔╝█████╗░░██╔██╗██║░░░██║░░░███████║██████╔╝███████║██╔████╔██║██║  ███████║██████╦╝",
  "██╔══██╗██╔══╝░░██║╚████║░░░██║░░░██╔══██║██╔══██╗██╔══██║██║╚██╔╝██║██║  ██╔══██║██╔══██╗",
  "██║░░██║███████╗██║░╚███║░░░██║░░░██║░░██║██║░░██║██║░░██║██║░╚═╝░██║██║  ██║░░██║██████╦╝",
  "╚═╝░░╚═╝╚══════╝╚═╝░░╚══╝░░░╚═╝░░░╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░░░░╚═╝╚═╝  ╚═╝░░╚═╝╚═════╝░",
}

lvim.builtin.alpha.dashboard.section.footer.val = {
  "rentarami.ab"
}

lvim.builtin.alpha.dashboard.section.buttons.entries = {
  { "f", "  Find File", "<CMD>Telescope find_files<CR>" },
  { "n", "  New File", "<CMD>ene!<CR>" },
  { "r", "  Recently Used Files", "<CMD>Telescope oldfiles<CR>" },
  { "t", "  Find Word", "<CMD>Telescope live_grep<CR>" },
  { "s", "  Load Session", "<CMD>:Telescope session-lens search_session<CR>" },
  {
    "c",
    "  Configuration",
    "<CMD>edit " .. require("lvim.config"):get_user_config_path() .. " <CR>",
  },
}
