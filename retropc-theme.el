;;; retropc-theme.el --- RetroPC amber phosphor theme for Doom Emacs -*- lexical-binding: t; -*-

;; Author: Converted from rondilley/omarchy-retropc-theme
;; URL: https://github.com/rondilley/omarchy-retropc-theme
;; Version: 0.1.0
;; Package-Requires: ((emacs "27.1"))
;; Keywords: faces, theme, doom, retro, amber

;;; Commentary:

;; A Doom Emacs-compatible port of the Omarchy RetroPC Neovim theme.
;; Install by placing this file in ~/.config/doom/themes/retropc-theme.el
;; and setting: (setq doom-theme 'retropc)

;;; Code:

(deftheme retropc
  "RetroPC amber phosphor theme, ported from Omarchy RetroPC's Neovim theme.")

(let* ((class '((class color) (min-colors 89)))
       ;; Original RetroPC palette, adapted from neovim.lua.
       (bg0     "#000000")
       (bg1     "#000000")
       (bg2     "#1A1612")
       (bg3     "#2A1F00")
       (bg4     "#2A1F00")
       (fg0     "#FFCC00")
       (fg1     "#FFB000")
       (fg2     "#CC9900")
       (fg3     "#996600")
       (sel0    "#2A1F00")
       ;; Nightfox used blend(#2A1F00, #FFCC00, 0.2). Approximate result:
       (sel1    "#554000")
       (comment "#996600")
       (red     "#FF8800")
       (red+1   "#FF9C1F")
       (red-1   "#FF6600")
       (orange  "#FFBB00")
       (orange+1 "#FFCC00")
       (orange-1 "#D99F00")
       (yellow  "#FFCC00")
       (yellow+1 "#FFDD33")
       (yellow-1 "#FFB000")
       (white   "#FFB000")
       (white+1 "#FFCC00")
       (white-1 "#CC9900")
       (black   "#2A1F00")
       (black+1 "#805500")
       (black-1 "#1A1612")
       (green   "#CC9900")
       (green+1 "#D4AA00")
       (green-1 "#996600")
       (cyan    "#FFAA00")
       (cyan+1  "#FFBB00")
       (cyan-1  "#CC8800")
       (blue    "#CC9900")
       (blue+1  "#D4AA00")
       (blue-1  "#996600")
       (magenta "#FF9900")
       (magenta+1 "#FFAA00")
       (magenta-1 "#CC7700")
       (pink    "#FFAA00")
       (ts-param "#FFAA00")
       (ts-prop  "#FFB000")
       (modeline-bg "#0F0F0C")
       (modeline-fg fg2))

  (custom-theme-set-faces
   'retropc

   ;; Core UI
   `(default ((,class (:background ,bg0 :foreground ,fg1))))
   `(cursor ((,class (:background ,fg0))))
   `(fringe ((,class (:background ,bg0 :foreground ,fg3))))
   `(region ((,class (:background ,sel1 :foreground ,fg0))))
   `(highlight ((,class (:background ,sel0 :foreground ,fg0))))
   `(hl-line ((,class (:background ,bg2))))
   `(vertical-border ((,class (:foreground ,bg3))))
   `(window-divider ((,class (:foreground ,bg3))))
   `(minibuffer-prompt ((,class (:foreground ,orange :weight bold))))
   `(escape-glyph ((,class (:foreground ,red :weight bold))))
   `(link ((,class (:foreground ,yellow :underline t))))
   `(shadow ((,class (:foreground ,comment))))
   `(success ((,class (:foreground ,green+1 :weight bold))))
   `(warning ((,class (:foreground ,red :weight bold))))
   `(error ((,class (:foreground ,red-1 :weight bold))))
   `(match ((,class (:background ,sel1 :foreground ,fg0 :weight bold))))
   `(lazy-highlight ((,class (:background ,sel0 :foreground ,fg0))))
   `(isearch ((,class (:background ,yellow :foreground ,bg0 :weight bold))))
   `(isearch-fail ((,class (:background ,red-1 :foreground ,bg0 :weight bold))))
   `(trailing-whitespace ((,class (:background ,red-1))))
   `(show-paren-match ((,class (:background ,sel1 :foreground ,fg0 :weight bold))))
   `(show-paren-mismatch ((,class (:background ,red-1 :foreground ,bg0 :weight bold))))

   ;; Font lock / syntax — mirrors the Neovim Treesitter intent.
   `(font-lock-builtin-face ((,class (:foreground ,orange :weight bold))))
   `(font-lock-comment-face ((,class (:foreground ,comment :slant italic))))
   `(font-lock-comment-delimiter-face ((,class (:foreground ,comment :slant italic))))
   `(font-lock-constant-face ((,class (:foreground ,white))))
   `(font-lock-doc-face ((,class (:foreground ,comment :slant italic))))
   `(font-lock-function-name-face ((,class (:foreground ,orange :weight bold))))
   `(font-lock-keyword-face ((,class (:foreground ,red :weight bold))))
   `(font-lock-negation-char-face ((,class (:foreground ,red :weight bold))))
   `(font-lock-preprocessor-face ((,class (:foreground ,red :weight bold))))
   `(font-lock-regexp-grouping-backslash ((,class (:foreground ,yellow :weight bold))))
   `(font-lock-regexp-grouping-construct ((,class (:foreground ,yellow :weight bold))))
   `(font-lock-string-face ((,class (:foreground ,orange))))
   `(font-lock-type-face ((,class (:foreground ,white-1))))
   `(font-lock-variable-name-face ((,class (:foreground ,white))))
   `(font-lock-warning-face ((,class (:foreground ,red :weight bold))))

   ;; Line numbers
   `(line-number ((,class (:background ,bg0 :foreground ,fg3))))
   `(line-number-current-line ((,class (:background ,bg2 :foreground ,fg0 :weight bold))))

   ;; Mode line / Doom modeline
   `(mode-line ((,class (:background ,modeline-bg :foreground ,comment :box nil :weight bold :overline ,orange))))
   `(mode-line-inactive ((,class (:background ,modeline-bg :foreground ,comment :box nil))))
   `(mode-line-buffer-id ((,class (:foreground ,bg0 :weight bold))))
   `(doom-modeline-bar ((,class (:background ,orange))))
   `(doom-modeline-bar-inactive ((,class (:background ,modeline-bg))))
   `(doom-modeline-buffer-file ((,class (:foreground ,bg0 :weight bold))))
   `(doom-modeline-buffer-modified ((,class (:foreground ,red-1 :weight bold))))
   `(doom-modeline-buffer-path ((,class (:foreground ,bg0))))
   `(doom-modeline-info ((,class (:foreground ,cyan+1))))
   `(doom-modeline-warning ((,class (:foreground ,red))))
   `(doom-modeline-urgent ((,class (:foreground ,red-1 :weight bold))))

   ;; Completion / Ivy / Vertico / Consult / Corfu
   `(completions-common-part ((,class (:foreground ,yellow :weight bold))))
   `(completions-first-difference ((,class (:foreground ,red :weight bold))))
   `(ivy-current-match ((,class (:background ,sel1 :foreground ,fg0 :weight bold))))
   `(ivy-minibuffer-match-face-1 ((,class (:foreground ,fg1))))
   `(ivy-minibuffer-match-face-2 ((,class (:foreground ,yellow :weight bold))))
   `(ivy-minibuffer-match-face-3 ((,class (:foreground ,orange :weight bold))))
   `(ivy-minibuffer-match-face-4 ((,class (:foreground ,red :weight bold))))
   `(vertico-current ((,class (:background ,sel1 :foreground ,fg0))))
   `(consult-highlight-mark ((,class (:background ,sel1 :foreground ,fg0))))
   `(consult-highlight-match ((,class (:foreground ,yellow :weight bold))))
   `(corfu-default ((,class (:background ,bg2 :foreground ,fg1))))
   `(corfu-current ((,class (:background ,sel1 :foreground ,fg0))))
   `(corfu-border ((,class (:background ,bg3))))
   `(orderless-match-face-0 ((,class (:foreground ,yellow :weight bold))))
   `(orderless-match-face-1 ((,class (:foreground ,orange :weight bold))))
   `(orderless-match-face-2 ((,class (:foreground ,red :weight bold))))
   `(orderless-match-face-3 ((,class (:foreground ,cyan :weight bold))))

   ;; Company
   `(company-tooltip ((,class (:background ,bg2 :foreground ,fg1))))
   `(company-tooltip-selection ((,class (:background ,sel1 :foreground ,fg0))))
   `(company-tooltip-common ((,class (:foreground ,yellow :weight bold))))
   `(company-tooltip-common-selection ((,class (:foreground ,yellow :weight bold))))
   `(company-scrollbar-bg ((,class (:background ,bg3))))
   `(company-scrollbar-fg ((,class (:background ,fg3))))
   `(company-preview ((,class (:background ,sel0 :foreground ,fg0))))
   `(company-preview-common ((,class (:foreground ,yellow :weight bold))))

   ;; Search / swiper
   `(swiper-line-face ((,class (:background ,bg2))))
   `(swiper-match-face-1 ((,class (:foreground ,fg1))))
   `(swiper-match-face-2 ((,class (:foreground ,yellow :weight bold))))
   `(swiper-match-face-3 ((,class (:foreground ,orange :weight bold))))
   `(swiper-match-face-4 ((,class (:foreground ,red :weight bold))))

   ;; Org
   `(org-level-1 ((,class (:foreground ,yellow :weight bold :height 1.15))))
   `(org-level-2 ((,class (:foreground ,orange :weight bold :height 1.10))))
   `(org-level-3 ((,class (:foreground ,fg0 :weight bold))))
   `(org-level-4 ((,class (:foreground ,fg1 :weight bold))))
   `(org-level-5 ((,class (:foreground ,fg2 :weight bold))))
   `(org-block ((,class (:background ,bg2 :foreground ,fg1))))
   `(org-block-begin-line ((,class (:background ,bg3 :foreground ,comment))))
   `(org-block-end-line ((,class (:background ,bg3 :foreground ,comment))))
   `(org-code ((,class (:foreground ,orange))))
   `(org-verbatim ((,class (:foreground ,yellow))))
   `(org-link ((,class (:foreground ,yellow :underline t))))
   `(org-table ((,class (:foreground ,fg0))))
   `(org-date ((,class (:foreground ,orange))))
   `(org-todo ((,class (:foreground ,red :weight bold))))
   `(org-done ((,class (:foreground ,green :weight bold))))
   `(org-hide ((,class (:foreground ,bg0))))

   ;; Markdown
   `(markdown-header-face-1 ((,class (:foreground ,yellow :weight bold :height 1.15))))
   `(markdown-header-face-2 ((,class (:foreground ,orange :weight bold :height 1.10))))
   `(markdown-header-face-3 ((,class (:foreground ,fg0 :weight bold))))
   `(markdown-code-face ((,class (:background ,bg2 :foreground ,orange))))
   `(markdown-inline-code-face ((,class (:foreground ,yellow))))
   `(markdown-link-face ((,class (:foreground ,yellow :underline t))))
   `(markdown-url-face ((,class (:foreground ,comment :underline t))))

   ;; Git / Magit / Diff-hl
   `(diff-added ((,class (:background ,bg2 :foreground ,green+1))))
   `(diff-removed ((,class (:background ,bg2 :foreground ,red-1))))
   `(diff-changed ((,class (:background ,bg2 :foreground ,yellow))))
   `(diff-refine-added ((,class (:background ,sel0 :foreground ,green+1))))
   `(diff-refine-removed ((,class (:background ,sel0 :foreground ,red-1))))
   `(magit-section-heading ((,class (:foreground ,yellow :weight bold))))
   `(magit-branch-local ((,class (:foreground ,orange :weight bold))))
   `(magit-branch-remote ((,class (:foreground ,green+1 :weight bold))))
   `(magit-diff-added ((,class (:background ,bg2 :foreground ,green+1))))
   `(magit-diff-removed ((,class (:background ,bg2 :foreground ,red-1))))
   `(magit-diff-context ((,class (:background ,bg0 :foreground ,fg2))))
   `(magit-diff-hunk-heading ((,class (:background ,bg3 :foreground ,fg0))))
   `(magit-diff-hunk-heading-highlight ((,class (:background ,sel1 :foreground ,fg0 :weight bold))))
   `(diff-hl-insert ((,class (:foreground ,green+1 :background ,green+1))))
   `(diff-hl-change ((,class (:foreground ,yellow :background ,yellow))))
   `(diff-hl-delete ((,class (:foreground ,red-1 :background ,red-1))))

   ;; Dired / Treemacs / Neotree equivalents
   `(dired-directory ((,class (:foreground ,fg3 :weight bold))))
   `(dired-marked ((,class (:foreground ,orange :weight bold))))
   `(dired-ignored ((,class (:foreground ,comment))))
   `(treemacs-root-face ((,class (:foreground ,orange :weight bold))))
   `(treemacs-directory-face ((,class (:foreground ,fg3))))
   `(treemacs-file-face ((,class (:foreground ,fg1))))
   `(treemacs-git-added-face ((,class (:foreground ,green))))
   `(treemacs-git-modified-face ((,class (:foreground ,yellow))))
   `(treemacs-git-renamed-face ((,class (:foreground ,orange))))
   `(treemacs-git-untracked-face ((,class (:foreground ,green+1))))
   `(treemacs-git-ignored-face ((,class (:foreground ,comment))))
   `(treemacs-git-conflict-face ((,class (:foreground ,red :weight bold))))
   `(neo-dir-link-face ((,class (:foreground ,fg3))))
   `(neo-root-dir-face ((,class (:foreground ,orange :weight bold))))
   `(neo-file-link-face ((,class (:foreground ,fg1))))

   ;; LSP / Flycheck / Flymake
   `(flycheck-error ((,class (:underline (:style wave :color ,red-1)))))
   `(flycheck-warning ((,class (:underline (:style wave :color ,red)))))
   `(flycheck-info ((,class (:underline (:style wave :color ,cyan)))))
   `(flymake-error ((,class (:underline (:style wave :color ,red-1)))))
   `(flymake-warning ((,class (:underline (:style wave :color ,red)))))
   `(flymake-note ((,class (:underline (:style wave :color ,cyan)))))
   `(lsp-face-highlight-textual ((,class (:background ,sel0))))
   `(lsp-face-highlight-read ((,class (:background ,sel0))))
   `(lsp-face-highlight-write ((,class (:background ,sel1))))
   `(lsp-ui-doc-background ((,class (:background ,bg2))))
   `(lsp-ui-sideline-code-action ((,class (:foreground ,yellow))))

   ;; Which-key / Helpful / Eldoc boxes
   `(which-key-key-face ((,class (:foreground ,orange :weight bold))))
   `(which-key-command-description-face ((,class (:foreground ,fg1))))
   `(which-key-group-description-face ((,class (:foreground ,yellow))))
   `(which-key-separator-face ((,class (:foreground ,comment))))
   `(tooltip ((,class (:background ,bg2 :foreground ,fg1))))
   `(eldoc-box-body ((,class (:background ,bg2 :foreground ,fg1))))

   ;; Term / ansi-color
   `(ansi-color-black ((,class (:foreground ,black :background ,black))))
   `(ansi-color-red ((,class (:foreground ,red :background ,red))))
   `(ansi-color-green ((,class (:foreground ,green :background ,green))))
   `(ansi-color-yellow ((,class (:foreground ,yellow :background ,yellow))))
   `(ansi-color-blue ((,class (:foreground ,blue :background ,blue))))
   `(ansi-color-magenta ((,class (:foreground ,magenta :background ,magenta))))
   `(ansi-color-cyan ((,class (:foreground ,cyan :background ,cyan))))
   `(ansi-color-white ((,class (:foreground ,white :background ,white))))
   `(term-color-black ((,class (:foreground ,black :background ,black))))
   `(term-color-red ((,class (:foreground ,red :background ,red))))
   `(term-color-green ((,class (:foreground ,green :background ,green))))
   `(term-color-yellow ((,class (:foreground ,yellow :background ,yellow))))
   `(term-color-blue ((,class (:foreground ,blue :background ,blue))))
   `(term-color-magenta ((,class (:foreground ,magenta :background ,magenta))))
   `(term-color-cyan ((,class (:foreground ,cyan :background ,cyan))))
   `(term-color-white ((,class (:foreground ,white :background ,white))))

   ;; Doom dashboard-ish faces
   `(doom-dashboard-banner ((,class (:foreground ,fg3))))
   `(doom-dashboard-menu-title ((,class (:foreground ,fg1 :weight bold))))
   `(doom-dashboard-menu-desc ((,class (:foreground ,fg1))))
   `(doom-dashboard-loaded ((,class (:foreground ,fg3))))
   `(doom-dashboard-footer ((,class (:foreground ,fg3))))

   ;; Tree-sitter faces used by Emacs 29+ / treesit packages
   `(tree-sitter-hl-face:comment ((,class (:foreground ,comment :slant italic))))
   `(tree-sitter-hl-face:keyword ((,class (:foreground ,red :weight bold))))
   `(tree-sitter-hl-face:function ((,class (:foreground ,orange :weight bold))))
   `(tree-sitter-hl-face:function.call ((,class (:foreground ,orange))))
   `(tree-sitter-hl-face:string ((,class (:foreground ,orange))))
   `(tree-sitter-hl-face:number ((,class (:foreground ,orange))))
   `(tree-sitter-hl-face:operator ((,class (:foreground ,yellow))))
   `(tree-sitter-hl-face:variable ((,class (:foreground ,white))))
   `(tree-sitter-hl-face:constant ((,class (:foreground ,white))))
   `(tree-sitter-hl-face:type ((,class (:foreground ,white-1))))
   `(tree-sitter-hl-face:property ((,class (:foreground ,ts-prop))))
   `(tree-sitter-hl-face:parameter ((,class (:foreground ,ts-param :slant italic))))))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-directory load-file-name)))

(provide-theme 'retropc)
;;; retropc-theme.el ends here
