inherited FrmCadOpcoesElegivel: TFrmCadOpcoesElegivel
  Left = 136
  Top = 170
  BorderIcons = [biSystemMenu]
  Caption = 'Opções do Elegível'
  ClientHeight = 356
  ClientWidth = 417
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 417
    Height = 317
    object pnlParticipante: TPanel
      Left = 5
      Top = 5
      Width = 407
      Height = 128
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
      object Label1: TLabel
        Left = 15
        Top = 3
        Width = 332
        Height = 23
        Caption = 'Participante Previdenciário (Titular)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -19
        Font.Name = 'Bookman Old Style'
        Font.Style = [fsItalic]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 25
        Top = 36
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
        Left = 25
        Top = 79
        Width = 99
        Height = 16
        Caption = 'Patrocinadora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edNomeTit: TEdit
        Left = 25
        Top = 51
        Width = 324
        Height = 21
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object edPatroTit: TEdit
        Left = 25
        Top = 94
        Width = 324
        Height = 21
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
    end
    object pnlOpcoes: TPanel
      Left = 5
      Top = 133
      Width = 407
      Height = 179
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
        Width = 65
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
        Left = 18
        Top = 35
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
        Left = 17
        Top = 131
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
        Left = 18
        Top = 83
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
      object edOpcao1: TcmMaskEditDlg
        Left = 18
        Top = 54
        Width = 151
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
        Left = 18
        Top = 102
        Width = 151
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
        Left = 17
        Top = 150
        Width = 151
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
    end
  end
  inherited Dock971: TDock97
    Top = 317
    Width = 417
    inherited tb97Fundo: TToolbar97
      Left = 247
      DockPos = 247
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
  object qryPart: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT EL.IDSITFUNC'
      'FROM   ELEGPATRO EL'
      'WHERE  EL.IDPESSJUR = :IDPESSJUR'
      'AND    EL.IDPESSOA  = :IDPESSOA')
    ValidateWithMask = True
    Left = 524
    Top = 122
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 446
    Top = 20
  end
  object qrypatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDREGRACALCOP1, IDREGRACALCOP2, IDREGRACALCOP3,'
      '       IDREGRAVALIDAOP1, IDREGRAVALIDAOP2, IDREGRAVALIDAOP3,'
      '       IDPESSOA'
      'FROM   PATRO'
      'WHERE  IDPESSOA = :IDPESSOA'
      '')
    ValidateWithMask = True
    Left = 518
    Top = 11
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
end
