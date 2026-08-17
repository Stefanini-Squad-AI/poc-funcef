inherited frmCadOpcoesBenef: TfrmCadOpcoesBenef
  Left = 276
  Top = 145
  Caption = 'Opções de Benefício'
  ClientHeight = 362
  ClientWidth = 594
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 594
    Height = 323
    object pnlOpcoes: TPanel
      Left = 1
      Top = 129
      Width = 592
      Height = 96
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
        Left = 417
        Top = 33
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
        Left = 218
        Top = 33
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
        Top = 52
        Width = 151
        Height = 21
        Hint = 'Clique no botão à direita para calcular o valor do benefício'
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
        Left = 218
        Top = 52
        Width = 151
        Height = 21
        Hint = 'Clique no botão à direita para calcular o valor do benefício'
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
        Left = 417
        Top = 52
        Width = 151
        Height = 21
        Hint = 'Clique no botão à direita para calcular o valor do benefício'
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
    object pnlParticipante: TPanel
      Left = 1
      Top = 1
      Width = 592
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
      TabOrder = 1
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
      object Label6: TLabel
        Left = 312
        Top = 36
        Width = 146
        Height = 16
        Caption = 'Plano Previdenciário'
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
      object Label10: TLabel
        Left = 312
        Top = 79
        Width = 66
        Height = 16
        Caption = 'Benefício'
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
        Width = 270
        Height = 21
        Enabled = False
        ReadOnly = True
        TabOrder = 0
      end
      object edPatroTit: TEdit
        Left = 25
        Top = 94
        Width = 270
        Height = 21
        Enabled = False
        ReadOnly = True
        TabOrder = 1
      end
      object edPlanoTit: TEdit
        Left = 312
        Top = 51
        Width = 250
        Height = 21
        Enabled = False
        ReadOnly = True
        TabOrder = 2
      end
      object edBeneficio: TEdit
        Left = 312
        Top = 94
        Width = 250
        Height = 21
        Enabled = False
        ReadOnly = True
        TabOrder = 3
      end
    end
    object pnl1: TPanel
      Left = 1
      Top = 225
      Width = 592
      Height = 96
      Align = alTop
      BevelInner = bvLowered
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object Lbl1: TLabel
        Left = 15
        Top = 3
        Width = 149
        Height = 23
        Caption = 'Opções de Texto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -19
        Font.Name = 'Bookman Old Style'
        Font.Style = [fsItalic]
        ParentFont = False
      end
      object lblOpcaoTexto1: TLabel
        Left = 18
        Top = 33
        Width = 102
        Height = 16
        Caption = 'Opção Texto 1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblOpcaoTexto3: TLabel
        Left = 417
        Top = 33
        Width = 102
        Height = 16
        Caption = 'Opção Texto 3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblOpcaoTexto2: TLabel
        Left = 218
        Top = 33
        Width = 102
        Height = 16
        Caption = 'Opção Texto 2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtCampoTexto1: TcmMaskEditDlg
        Left = 18
        Top = 52
        Width = 151
        Height = 21
        Hint = 'Clique no botão à direita para calcular o valor do benefício'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnExit = edtCampoTexto1Exit
        OnBtnClick = edtCampoTexto1BtnClick
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
      object edtCampoTexto2: TcmMaskEditDlg
        Left = 218
        Top = 52
        Width = 151
        Height = 21
        Hint = 'Clique no botão à direita para calcular o valor do benefício'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnExit = edtCampoTexto2Exit
        OnBtnClick = edtCampoTexto2BtnClick
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
      object edtCampoTexto3: TcmMaskEditDlg
        Left = 417
        Top = 52
        Width = 151
        Height = 21
        Hint = 'Clique no botão à direita para calcular o valor do benefício'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnExit = edtCampoTexto3Exit
        OnBtnClick = edtCampoTexto3BtnClick
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
    Top = 323
    Width = 594
    inherited tb97Fundo: TToolbar97
      Left = 422
      DockPos = 425
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 253
      DockPos = 256
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  object qryBeneficio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDREGRACALCOP1, IDREGRACALCOP2, IDREGRACALCOP3,'
      '       IDREGRAVALIDAOP1, IDREGRAVALIDAOP2, IDREGRAVALIDAOP3,'
      
        '       IDREGRAPAGAMENTO, IDREGRAVALIDAOPTEXTO1, IDREGRAVALIDAOPT' +
        'EXTO2,'
      
        '       IDREGRAVALIDAOPTEXTO3, IDREGRACALCOPTEXTO1,IDREGRACALCOPT' +
        'EXTO2,IDREGRACALCOPTEXTO3,'
      '       IDBENEFICIO'
      'FROM   BENEFPLANPREV'
      'WHERE  IDPLANOPREV = :IDPLANOPREV'
      'AND    IDBENEFICIO = :IDBENEFICIO')
    ValidateWithMask = True
    Left = 518
    Top = 11
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDBENEFICIO'
        ParamType = ptUnknown
      end>
  end
  object qryPart: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT EL.IDSITFUNC, PP.IDSITPART, PP.IDSITPLANOPREV'
      'FROM   ELEGPATRO EL, PARTPREVPLAN PP'
      'WHERE  EL.IDPESSJUR = :IDPESSJUR'
      'AND    EL.IDPESSOA  = :IDPESSOA'
      'AND    PP.IDPESSOA  = EL.IDPESSOA'
      'AND    PP.IDPESSJUR = EL.IDPESSJUR'
      'AND    PP.IDPLANOPREV = :IDPLANOPREV')
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
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 446
    Top = 20
  end
end
