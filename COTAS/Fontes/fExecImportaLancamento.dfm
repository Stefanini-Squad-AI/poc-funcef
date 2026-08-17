inherited frmExecImportaLancamento: TfrmExecImportaLancamento
  Left = 327
  Top = 196
  HelpContext = 545003
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Importar Lançamentos'
  ClientHeight = 376
  ClientWidth = 504
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 504
    Height = 337
    inherited PagControle: TPageControl
      Width = 502
      Height = 335
      inherited tabSelecao: TTabSheet
        object Bevel1: TBevel [0]
          Left = 11
          Top = 9
          Width = 467
          Height = 34
        end
        inherited lblTitulo: TfcLabel
          Left = 122
          Top = 13
          Width = 247
          Align = alNone
          Caption = 'Arquivos de lançamento'
        end
        object Label1: TLabel
          Left = 10
          Top = 72
          Width = 129
          Height = 13
          Caption = 'Arquivo de Importação'
        end
        object btProcuraArqTxt: TSpeedButton
          Left = 415
          Top = 88
          Width = 30
          Height = 22
          Hint = 'Buscar arquivo de importação'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
            300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
            330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
            333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
            339977FF777777773377000BFB03333333337773FF733333333F333000333333
            3300333777333333337733333333333333003333333333333377333333333333
            333333333333333333FF33333333333330003333333333333777333333333333
            3000333333333333377733333333333333333333333333333333}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = btProcuraArqTxtClick
        end
        object SpeedButton2: TSpeedButton
          Left = 447
          Top = 88
          Width = 30
          Height = 22
          Hint = 'Apagar o arquivo selecionado'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
            555557777F777555F55500000000555055557777777755F75555005500055055
            555577F5777F57555555005550055555555577FF577F5FF55555500550050055
            5555577FF77577FF555555005050110555555577F757777FF555555505099910
            555555FF75777777FF555005550999910555577F5F77777775F5500505509990
            3055577F75F77777575F55005055090B030555775755777575755555555550B0
            B03055555F555757575755550555550B0B335555755555757555555555555550
            BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
            50BB555555555555575F555555555555550B5555555555555575}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = SpeedButton2Click
        end
        object Label2: TLabel
          Left = 11
          Top = 134
          Width = 114
          Height = 13
          Caption = 'Arquivo de exceção'
        end
        object btExcluiArqTxt: TSpeedButton
          Left = 447
          Top = 147
          Width = 29
          Height = 22
          Hint = 'Apagar o arquivo selecionado'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
            555557777F777555F55500000000555055557777777755F75555005500055055
            555577F5777F57555555005550055555555577FF577F5FF55555500550050055
            5555577FF77577FF555555005050110555555577F757777FF555555505099910
            555555FF75777777FF555005550999910555577F5F77777775F5500505509990
            3055577F75F77777575F55005055090B030555775755777575755555555550B0
            B03055555F555757575755550555550B0B335555755555757555555555555550
            BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
            50BB555555555555575F555555555555550B5555555555555575}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = btExcluiArqTxtClick
        end
        object btBuscaArqTxtErr: TSpeedButton
          Left = 415
          Top = 147
          Width = 30
          Height = 22
          Hint = 'Buscar arquivo de erros'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
            300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
            330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
            333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
            339977FF777777773377000BFB03333333337773FF733333333F333000333333
            3300333777333333337733333333333333003333333333333377333333333333
            333333333333333333FF33333333333330003333333333333777333333333333
            3000333333333333377733333333333333333333333333333333}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = btBuscaArqTxtErrClick
        end
        object edArqTxtImp: TEdit
          Left = 10
          Top = 88
          Width = 400
          Height = 21
          ReadOnly = True
          TabOrder = 0
        end
        object edArqTxtErro: TEdit
          Left = 9
          Top = 148
          Width = 400
          Height = 21
          ReadOnly = True
          TabOrder = 1
        end
      end
      inherited TabSheet1: TTabSheet
        inherited fcLabel1: TfcLabel
          Width = 303
          Caption = 'Listagem de Erros no Arquivo'
        end
        object Label3: TLabel
          Left = 190
          Top = 70
          Width = 104
          Height = 13
          Caption = 'Erros encontrados'
        end
        object btSalvarArqErro: TSpeedButton
          Left = 11
          Top = 69
          Width = 41
          Height = 22
          Hint = 'Salvar lista de erros...'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
            7700333333337777777733333333008088003333333377F73377333333330088
            88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
            000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
            FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
            99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
            99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
            99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
            93337FFFF7737777733300000033333333337777773333333333}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = btSalvarArqErroClick
        end
        object ListExcecao: TListBox
          Left = 8
          Top = 176
          Width = 465
          Height = 41
          ItemHeight = 13
          TabOrder = 2
        end
        object ListArquivo: TListBox
          Left = 8
          Top = 128
          Width = 465
          Height = 33
          ItemHeight = 13
          TabOrder = 1
          Visible = False
        end
        object ListErros: TListBox
          Left = 8
          Top = 96
          Width = 473
          Height = 211
          ItemHeight = 13
          TabOrder = 0
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 337
    Width = 504
    inherited tb97Fundo: TToolbar97
      Left = 64
      inherited btnContinuar: TfcShapeBtn
        Visible = False
      end
      inherited btnVoltar: TfcShapeBtn
        Visible = False
      end
      inherited btnConfirmar: TfcShapeBtn
        Caption = 'Importar'
        Enabled = True
        OnClick = btnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      2
      (
        'TMemo'
        'Text'
        0)
      (
        'TRichEdit'
        'Text'
        0))
  end
  object BuscaArqTxt: TOpenDialog
    Filter = 'Arquivos de Importação (.txt)|*.*txt'
    InitialDir = '\'
    Title = 'Procurar por arquivo de lançamento'
    Left = 465
    Top = 11
  end
  object BuscaArqTxtErr: TOpenDialog
    Filter = 'Arquivos de Erros (.txt)|*.*txt'
    InitialDir = '\'
    Title = 'Procurar por  arquivo de erros'
    Left = 385
    Top = 11
  end
  object SalvarArqErro: TSaveDialog
    DefaultExt = '.txt'
    Filter = 'Arquivos de Texto (*.*txt)|.txt'
    InitialDir = '\'
    Title = 'Salvar Lista de Erros'
    Left = 457
    Top = 59
  end
end
