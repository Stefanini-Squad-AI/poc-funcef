inherited frmPassosFormaCalc: TfrmPassosFormaCalc
  Left = 102
  Top = 141
  Width = 590
  Height = 393
  BorderIcons = [biMaximize]
  BorderStyle = bsSizeToolWin
  Caption = 'Passos da Forma de Cálculo Nº'
  Constraints.MinHeight = 393
  Constraints.MinWidth = 590
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 582
    Height = 327
    BorderWidth = 2
    object rcedPasso: TRichEdit
      Left = 8
      Top = 8
      Width = 566
      Height = 311
      Anchors = [akLeft, akTop, akRight, akBottom]
      BorderStyle = bsNone
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Lucida Console'
      Font.Style = []
      Lines.Strings = (
        '[001] - C(TEMLANCAMENTO) --> 1'
        '-----------------------------------------------------------'
        '[002] - C(VALORRUBRICA) --> 1'
        '-----------------------------------------------------------'
        '[003] - C(DATASALARIO) --> 10/12/2001'
        '-----------------------------------------------------------'
        '[004] - C(NORMALINI) --> 01/09/2002'
        '-----------------------------------------------------------'
        '[005] - C(BSRUBRICA) --> 0'
        '-----------------------------------------------------------'
        '[006] - C(DATAADMISSAO) --> 10/12/1990'
        '-----------------------------------------------------------'
        '[007] - C(NORMALFIM) --> 30/09/2002'
        '-----------------------------------------------------------')
      ParentFont = False
      PlainText = True
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 0
    end
  end
  inherited Dock971: TDock97
    Top = 327
    Width = 582
    inherited tb97Fundo: TToolbar97
      Left = 252
      inherited sep1: TToolbarSep97
        Left = 244
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 162
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      object ToolbarSep972: TToolbarSep97 [2]
        Left = 80
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 164
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 246
      end
      object bbtnConfirmar: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = '&Ok'
        Default = True
        ModalResult = 1
        TabOrder = 2
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888002222200
          88888887788888778F88887222222222088888788888888878F887A228822222
          208887F88FFF888887F887A2FFF8222220888788777FF888878F7A22FFFF8222
          22087F887777FF88887F7A22FFFFF82222087F8877777FF8887F7A22FF8FFF82
          22087F8877F777FF887F7A22FF82FFF822087F8877F8777F887F7A22FF222FF8
          220878F87788877FF87887A2222222FF208887F88888887787F887A222222222
          2088878F888888888788887AA222222208888878FF88888F788888877AAAAA77
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
      end
      object bbtnSalvar: TBitBtn
        Left = 82
        Top = 0
        Width = 80
        Height = 33
        Caption = '&Salvar'
        TabOrder = 3
        OnClick = bbtnSalvarClick
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
      end
    end
    object pnlTipoVisualizacao: TPanel
      Left = 2
      Top = 1
      Width = 249
      Height = 35
      TabOrder = 1
      object chkTipoVisualizacao: TCheckBox
        Left = 8
        Top = 9
        Width = 236
        Height = 17
        Caption = 'Visualização da Expressão em Linha?'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = chkTipoVisualizacaoClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 459
    Top = 211
    TargetsData = (
      1
      1
      (
        'TRichEdit'
        'Text'
        0))
  end
  object SaveDlg: TSaveDialog
    DefaultExt = '.txt'
    Filter = 'Arquivos texto|*.txt|Todos os arquivos|*.*'
    InitialDir = 'c:\'
    Title = 'Salvar Resultado dos Passos'
    Left = 457
    Top = 260
  end
end
