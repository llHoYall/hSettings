"===============================================================================
" HoYa's Vim Color Scheme
"
" author:   hoya128@gmail.com
" version:  v1.0
" date:	    2016.06.21
"===============================================================================

set background=dark
hi clear
if exists("syntax_on")
	syntax reset
endif

let colors_name="HoYa"

" Base color *******************************************************************
hi Normal                             guifg=#d4d2cf   guibg=#201f1f
hi Normal                             ctermfg=253     ctermbg=235

" Cursor ***********************************************************************
hi Cursor                             guifg=fg        guibg=#0078ff
hi Cursor                             ctermfg=bg      ctermbg=153
hi lCursor                            guifg=black     guibg=white 
hi lCursor                            ctermfg=black   ctermbg=white
hi CursorColumn     gui=NONE          guifg=NONE      guibg=#202438           
hi CursorColumn     cterm=none        ctermfg=none    ctermbg=236             
hi CursorIM                           guifg=bg        guibg=#96cdcd
hi CursorIM                           ctermfg=bg      ctermbg=116
hi CursorLine       gui=NONE                          guibg=#202438           
hi CursorLine       cterm=none                        ctermbg=236             

" Status Line ******************************************************************
hi StatusLine       gui=bold          guifg=#508ed8   guibg=#1c2c3f           
hi StatusLine       cterm=bold        ctermfg=254     ctermbg=237             
hi StatusLineNC     gui=NONE          guifg=#78777f   guibg=#302f2f          
hi StatusLineNC     cterm=none        ctermfg=244     ctermbg=237             

" Comment Group ****************************************************************
hi Comment          gui=italic        guifg=#787775                                     
hi Comment          cterm=none        ctermfg=240                                     

" Preprocessor Group ***********************************************************
hi Define           gui=NONE          guifg=#78b753                                   
hi Define           cterm=none        ctermfg=223                                     
hi Include          gui=NONE          guifg=#78b753                                   
hi Include          cterm=none        ctermfg=223              
hi Macro            gui=NONE          guifg=#78b753                                   
hi Macro            cterm=none        ctermfg=223                     
hi PreCondit        gui=NONE          guifg=#78b753                                   
hi PreCondit        cterm=none        ctermfg=223                                                                            
hi PreProc          gui=NONE          guifg=#78b753                                   
hi PreProc          cterm=none        ctermfg=223                                     

" Type Group *******************************************************************
hi StorageClass     gui=NONE          guifg=#508ed8                                   
hi StorageClass     cterm=none        ctermfg=115                                     
hi Structure        gui=NONE          guifg=#508ed8                                   
hi Structure        cterm=none        ctermfg=115                                     
hi Type             gui=NONE          guifg=#508ed8                                   
hi Type             cterm=none        ctermfg=115            
hi Typedef          gui=NONE          guifg=#508ed8                                   
hi Typedef          cterm=none        ctermfg=115                                                              

" Constant Group ***************************************************************
hi Constant         gui=NONE          guifg=#ff0000                                  
hi Constant         cterm=none        ctermfg=116            
hi Boolean          gui=NONE          guifg=#c0a25f                                   
hi Boolean          cterm=none        ctermfg=116                                     
hi Character        gui=NONE          guifg=#96bff0                                   
hi Character        cterm=none        ctermfg=110                    
hi Float            gui=NONE          guifg=#c0a25f                                  
hi Float            cterm=none        ctermfg=116                                                                               
hi String           gui=NONE          guifg=#e85848                                   
hi String           cterm=none        ctermfg=110                                     
hi Number           gui=NONE          guifg=#c0a25f                                   
hi Number           cterm=none        ctermfg=116                                     

" Identifier Group *************************************************************
hi Identifier       gui=NONE          guifg=#508ed8                                   
hi Identifier       cterm=none        ctermfg=216                                     
hi Function         gui=NONE          guifg=#8e79a5                                   
hi Function         cterm=none        ctermfg=216                                     

" Statement Group **************************************************************
hi Conditional      gui=NONE          guifg=#00a000                                   
hi Conditional      cterm=none        ctermfg=150                 
hi Exception        gui=NONE          guifg=#4a5704                                   
hi Exception        cterm=none        ctermfg=150     
hi Keyword          gui=NONE          guifg=#aa3000                                   
hi Keyword          cterm=none        ctermfg=150  
hi Label            gui=NONE          guifg=#8e79a5                                   
hi Label            cterm=none        ctermfg=150       
hi Operator         gui=NONE          guifg=#ff9fec                                   
hi Operator         cterm=none        ctermfg=150                                     
hi Repeat           gui=NONE          guifg=#dba716                                 
hi Repeat           cterm=none        ctermfg=150                                                                                  
hi Statement        gui=NONE          guifg=#8e79a5                                   
hi Statement        cterm=none        ctermfg=150                 

" Search Group *****************************************************************
hi Search           gui=NONE                          guibg=#c0a25f          
hi Search           cterm=none                        ctermbg=214            
hi IncSearch        gui=NONE          guifg=#302f2f   guibg=#c0a25f                   
hi IncSearch        cterm=reverse     ctermfg=87                                      

" Fold Group *******************************************************************
hi Folded           gui=NONE          guifg=#91d6f8   guibg=#363946           
hi Folded           cterm=none        ctermfg=117     ctermbg=238             
hi FoldColumn       gui=NONE          guifg=#91d6f8   guibg=#363946           
hi FoldColumn       cterm=none        ctermfg=117     ctermbg=238            

" Tab Group ********************************************************************
hi TabLine          gui=NONE          guifg=#b6bf98   guibg=#363946           
hi TabLine          cterm=none        ctermfg=244     ctermbg=236       
hi TabLineFill      gui=NONE          guifg=#cfcfaf   guibg=#363946           
hi TabLineFill      cterm=none        ctermfg=187     ctermbg=236             
hi TabLineSel       gui=bold          guifg=#efefef   guibg=#414658           
hi TabLineSel       cterm=bold        ctermfg=254     ctermbg=236                  

" Visual Group *****************************************************************
hi Visual                             guifg=NONE      guibg=#1a2b40
hi Visual                             ctermfg=none    ctermbg=24
hi VisualNOS        gui=underline     guifg=fg                                        
hi VisualNOS        cterm=underline   ctermfg=fg                                      

" Special Group ****************************************************************
hi Debug            gui=NONE          guifg=#c00000   guibg=NONE
hi Debug            cterm=none        ctermfg=181     ctermbg=none            
hi Delimiter        gui=NONE          guifg=#C00000                                   
hi Delimiter        cterm=none        ctermfg=181                          
hi Error            gui=NONE          guifg=#e85848   guibg=#451e1a           
hi Error            cterm=none        ctermfg=167     ctermbg=52            
hi Ignore           guifg=bg
hi Ignore           ctermfg=bg           
hi Special          gui=NONE          guifg=#c00000                                   
hi Special          cterm=none        ctermfg=181                                     
hi SpecialChar      gui=NONE          guifg=#c00000                                   
hi SpecialChar      cterm=none        ctermfg=181                
hi SpecialComment   gui=NONE          guifg=#c00000                                   
hi SpecialComment   cterm=none        ctermfg=181                                                    
hi Tag              gui=NONE          guifg=#c00000                                   
hi Tag              cterm=none        ctermfg=181
hi Todo             gui=underline     guifg=#c0a25f   guibg=NONE
hi Todo             cterm=underline   ctermfg=228     ctermbg=none
hi Underlined       gui=underline     guifg=fg                                        
hi Underlined       cterm=underline   ctermfg=fg                                      

" Misc *************************************************************************
hi Directory        gui=NONE          guifg=#c0e0b0                                   
hi Directory        cterm=none        ctermfg=151        
hi ErrorMsg         gui=NONE          guifg=#e85848   guibg=#461e1a              
hi ErrorMsg         cterm=none        ctermfg=196     ctermbg=none
hi LineNr                             guifg=#b4d3b1   guibg=#323232
hi LineNr                             ctermfg=102     ctermbg=237
hi MatchParen       gui=bold          guifg=#00ff00   guibg=NONE              
hi MatchParen       cterm=bold        ctermfg=46      ctermbg=none        
hi ModeMsg          gui=bold          guifg=fg        guibg=NONE              
hi ModeMsg          cterm=none        ctermfg=117     ctermbg=none              
hi MoreMsg          gui=NONE          guifg=#2e8b57                                   
hi MoreMsg          cterm=none        ctermfg=29                            
hi NonText          gui=NONE          guifg=#404040                                   
hi NonText          cterm=none        ctermfg=235                         
hi Question         gui=NONE          guifg=fg                                        
hi Question         cterm=none        ctermfg=fg                                                         
hi SignColumn       gui=NONE          guifg=#9fafaf   guibg=#181818           
hi SignColumn       cterm=none        ctermfg=145     ctermbg=233           
hi SpecialKey                         guifg=#404040
hi SpecialKey                         ctermfg=237  
hi Title            gui=NONE          guifg=#62bdde                                   
hi Title            cterm=none        ctermfg=74                                      
hi VertSplit        gui=NONE          guifg=#777777   guibg=#363946           
hi VertSplit        cterm=none        ctermfg=242     ctermbg=237    
hi WarningMsg       gui=NONE          guifg=#e5786d                                   
hi WarningMsg       cterm=none        ctermfg=173                                     
hi WildMenu         gui=bold          guifg=#cae682   guibg=#363946           
hi WildMenu         cterm=bold        ctermfg=16      ctermbg=186             

" Diff *************************************************************************
hi DiffAdd          gui=NONE          guifg=#0000ff   guibg=#201f1f           
hi DiffAdd          cterm=none        ctermfg=108     ctermbg=22
hi DiffChange       gui=NONE          guifg=NONE      guibg=#4a343a           
hi DiffChange       cterm=none        ctermfg=fg      ctermbg=52          
hi DiffDelete       gui=NONE          guifg=#ff0000   guibg=#3c3631           
hi DiffDelete       cterm=none        ctermfg=59      ctermbg=58          
hi DiffText         gui=bold          guifg=#f05060   guibg=#4a343a           
hi DiffText         cterm=bold        ctermfg=203     ctermbg=52                             

" Popup Menu *******************************************************************
hi Pmenu            gui=NONE          guifg=#e0e0e0   guibg=#303840           
hi Pmenu            cterm=none        ctermfg=253     ctermbg=233             
hi PmenuSel         gui=NONE          guifg=#cae682   guibg=#505860           
hi PmenuSel         cterm=none        ctermfg=186     ctermbg=237    
hi PMenuSbar        gui=NONE                          guibg=#505860           
hi PMenuSbar        cterm=none                        ctermbg=59     
hi PMenuThumb       gui=NONE                          guibg=#808890           
hi PMenuThumb       cterm=none                        ctermbg=102                             
          
" Spelling *********************************************************************
hi SpellBad         gui=undercurl                                     guisp=#ee0000                                   
hi SpellBad         cterm=undercurl                   ctermbg=9               
hi SpellCap         gui=undercurl                                     guisp=#eeee00                                   
hi SpellCap         cterm=undercurl                   ctermbg=12
hi SpellLocal       gui=undercurl                                     guisp=#ffa500                                   
hi SpellLocal       cterm=undercurl                   ctermbg=14                          
hi SpellRare        gui=undercurl                                     guisp=#ffa500                                   
hi SpellRare        cterm=undercurl                   ctermbg=13                     