inherited FrmCadOpcoesPartAss: TFrmCadOpcoesPartAss
  Left = 152
  Top = 71
  BorderIcons = [biSystemMenu]
  Caption = 'Opções do Participante'
  ClientHeight = 384
  ClientWidth = 457
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 457
    Height = 345
    object pnlOpcoes: TPanel
      Left = 1
      Top = 114
      Width = 455
      Height = 230
      Align = alClient
      BevelInner = bvLowered
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object Label11: TLabel
        Left = 15
        Top = 3
        Width = 68
        Height = 23
        Caption = 'Opções'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -19
        Font.Name = 'Bookman Old Style'
        Font.Style = [fsItalic]
        ParentFont = False
      end
      object lblNomeValorBase1: TLabel
        Left = 12
        Top = 33
        Width = 59
        Height = 16
        Caption = 'Opção 1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblNomeValorBase3: TLabel
        Left = 11
        Top = 84
        Width = 59
        Height = 16
        Caption = 'Opção 3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblNomeValorBase2: TLabel
        Left = 232
        Top = 34
        Width = 59
        Height = 16
        Caption = 'Opção 2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblNomeValorBase4: TLabel
        Left = 232
        Top = 85
        Width = 59
        Height = 16
        Caption = 'Opção 4'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblNomeValorBase6: TLabel
        Left = 232
        Top = 135
        Width = 59
        Height = 16
        Caption = 'Opção 6'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblNomeValorBase5: TLabel
        Left = 12
        Top = 134
        Width = 59
        Height = 16
        Caption = 'Opção 5'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblNomeValorBase8: TLabel
        Left = 232
        Top = 183
        Width = 59
        Height = 16
        Caption = 'Opção 8'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblNomeValorBase7: TLabel
        Left = 12
        Top = 182
        Width = 59
        Height = 16
        Caption = 'Opção 7'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edOpcao1: TcmMaskEditDlg
        Left = 12
        Top = 51
        Width = 195
        Height = 21
        Hint = 'Clique no botão à direita para calcular o valor da Opção'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnExit = edOpcao1Exit
        OnBtnClick = edOpcao1BtnClick
        BtnGlyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
          73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
          0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
          0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
          0333337F777777737F333308888888880333337F333333337F33330888888888
          03333373FFFFFFFF733333700000000073333337777777773333}
        BtnNumGlyphs = 2
        BtnWidth = 17
      end
      object edOpcao2: TcmMaskEditDlg
        Left = 232
        Top = 52
        Width = 195
        Height = 21
        Hint = 'Clique no botão à direita para calcular o valor da Opção'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnExit = edOpcao2Exit
        OnBtnClick = edOpcao2BtnClick
        BtnGlyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
          73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
          0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
          0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
          0333337F777777737F333308888888880333337F333333337F33330888888888
          03333373FFFFFFFF733333700000000073333337777777773333}
        BtnNumGlyphs = 2
        BtnWidth = 17
      end
      object edOpcao3: TcmMaskEditDlg
        Left = 11
        Top = 101
        Width = 195
        Height = 21
        Hint = 'Clique no botão à direita para calcular o valor da Opção'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnExit = edOpcao3Exit
        OnBtnClick = edOpcao3BtnClick
        BtnGlyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
          73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
          0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
          0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
          0333337F777777737F333308888888880333337F333333337F33330888888888
          03333373FFFFFFFF733333700000000073333337777777773333}
        BtnNumGlyphs = 2
        BtnWidth = 17
      end
      object edOpcao4: TcmMaskEditDlg
        Left = 232
        Top = 102
        Width = 195
        Height = 21
        Hint = 'Clique no botão à direita para calcular o valor da Opção'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnExit = edOpcao4Exit
        OnBtnClick = edOpcao4BtnClick
        BtnGlyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
          73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
          0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
          0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
          0333337F777777737F333308888888880333337F333333337F33330888888888
          03333373FFFFFFFF733333700000000073333337777777773333}
        BtnNumGlyphs = 2
        BtnWidth = 17
      end
      object edOpcao5: TcmMaskEditDlg
        Left = 12
        Top = 152
        Width = 195
        Height = 21
        Hint = 'Clique no botão à direita para calcular o valor da Opção'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnExit = edOpcao5Exit
        OnBtnClick = edOpcao5BtnClick
        BtnGlyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
          73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
          0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
          0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
          0333337F777777737F333308888888880333337F333333337F33330888888888
          03333373FFFFFFFF733333700000000073333337777777773333}
        BtnNumGlyphs = 2
        BtnWidth = 17
      end
      object edOpcao6: TcmMaskEditDlg
        Left = 232
        Top = 153
        Width = 195
        Height = 21
        Hint = 'Clique no botão à direita para calcular o valor da Opção'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        OnExit = edOpcao6Exit
        OnBtnClick = edOpcao6BtnClick
        BtnGlyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
          73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
          0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
          0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
          0333337F777777737F333308888888880333337F333333337F33330888888888
          03333373FFFFFFFF733333700000000073333337777777773333}
        BtnNumGlyphs = 2
        BtnWidth = 17
      end
      object edOpcao7: TcmMaskEditDlg
        Left = 12
        Top = 200
        Width = 195
        Height = 21
        Hint = 'Clique no botão à direita para calcular o valor da Opção'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        OnExit = edOpcao7Exit
        OnBtnClick = edOpcao7BtnClick
        BtnGlyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
          73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
          0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
          0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
          0333337F777777737F333308888888880333337F333333337F33330888888888
          03333373FFFFFFFF733333700000000073333337777777773333}
        BtnNumGlyphs = 2
        BtnWidth = 17
      end
      object edOpcao8: TcmMaskEditDlg
        Left = 232
        Top = 201
        Width = 195
        Height = 21
        Hint = 'Clique no botão à direita para calcular o valor da Opção'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 7
        OnExit = edOpcao8Exit
        OnBtnClick = edOpcao8BtnClick
        BtnGlyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
          73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
          0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
          0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
          0333337F777777737F333308888888880333337F333333337F33330888888888
          03333373FFFFFFFF733333700000000073333337777777773333}
        BtnNumGlyphs = 2
        BtnWidth = 17
      end
    end
    object pnlParticipante: TPanel
      Left = 1
      Top = 1
      Width = 455
      Height = 113
      Align = alTop
      BevelInner = bvLowered
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Label2: TLabel
        Left = 18
        Top = 2
        Width = 215
        Height = 23
        Caption = 'Participante Assistencial'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = True
      end
      object Label1: TLabel
        Left = 15
        Top = 3
        Width = 215
        Height = 23
        Caption = 'Participante Assistencial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -19
        Font.Name = 'Bookman Old Style'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = True
      end
      object Label5: TLabel
        Left = 9
        Top = 30
        Width = 42
        Height = 16
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 9
        Top = 68
        Width = 129
        Height = 16
        Caption = 'Plano Assistencial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edNomePartAss: TEdit
        Left = 9
        Top = 45
        Width = 424
        Height = 21
        Color = clInactiveCaption
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object edPlanAss: TEdit
        Left = 9
        Top = 83
        Width = 424
        Height = 21
        Color = clInactiveCaption
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
    end
  end
  inherited Dock971: TDock97
    Top = 345
    Width = 457
    inherited tb97Fundo: TToolbar97
      Left = 248
      DockPos = 248
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 79
      DockPos = 79
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 667
    Top = 523
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 254
    Top = 4
  end
  object qryPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT FLGACEITAOPCAO, IDPLANASS, FLGATIVO, NUMOPCOES, '
      
        '       IDREGRAVALOP1, IDREGRAVALOP2, IDREGRAVALOP3, IDREGRAVALOP' +
        '4, '
      
        '       IDREGRAVALOP5, IDREGRAVALOP6, IDREGRAVALOP7, IDREGRAVALOP' +
        '8, '
      
        '       IDREGRACALCOP1, IDREGRACALCOP2, IDREGRACALCOP3, IDREGRACA' +
        'LCOP4, '
      
        '       IDREGRACALCOP5, IDREGRACALCOP6, IDREGRACALCOP7, IDREGRACA' +
        'LCOP8, '
      
        '       NOMEVALORBASE1, NOMEVALORBASE2, NOMEVALORBASE3, NOMEVALOR' +
        'BASE4, '
      
        '       NOMEVALORBASE5, NOMEVALORBASE6, NOMEVALORBASE7, NOMEVALOR' +
        'BASE8, '
      '       FLGOBRIGAOP1, FLGOBRIGAOP2, FLGOBRIGAOP3, FLGOBRIGAOP4, '
      '       FLGOBRIGAOP5, FLGOBRIGAOP6, FLGOBRIGAOP7, FLGOBRIGAOP8, '
      '       FLGEDITAOP1, FLGEDITAOP2, FLGEDITAOP3, FLGEDITAOP4, '
      '       FLGEDITAOP5, FLGEDITAOP6, FLGEDITAOP7, FLGEDITAOP8'
      'FROM PLANASS'
      'WHERE IDPLANASS = :IDPLANASS'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 302
    Top = 4
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANASS'
        ParamType = ptUnknown
      end>
  end
end
