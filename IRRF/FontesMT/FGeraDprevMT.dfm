inherited frmGeraDprevMT: TfrmGeraDprevMT
  Left = 351
  Top = 289
  HelpContext = 240018
  Caption = 'Gera DPREV'
  ClientHeight = 324
  ClientWidth = 504
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 504
    Height = 285
    object grpBoxImport: TGroupBox
      Left = 6
      Top = 220
      Width = 492
      Height = 51
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Nome do Arquivo '
      TabOrder = 6
      object edtImport: TEdit
        Left = 7
        Top = 21
        Width = 442
        Height = 21
        TabStop = False
        Anchors = [akLeft, akTop, akRight]
        Color = clInactiveCaption
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object btbtnSeleciona: TBitBtn
        Left = 454
        Top = 20
        Width = 30
        Height = 22
        Anchors = [akTop, akRight]
        TabOrder = 1
        OnClick = btbtnSelecionaClick
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          555555500000000000005577777777777700557FB8B8B8B8B70057FB8B8B8B8B
          807057F8B8B8B8B870707F8B8B8B8B8B07707FFFFFFFFFF70870777777777777
          7B7057F8B8B8B8B8B87057FB8B8B8FFFFF7057F8B8B8F7777775557FFFFF7555
          5555555777775555555555555555555555555555555555555555}
      end
    end
    object PSubTipoRepresentante: TCMProcuraSubTipo
      Left = 6
      Top = 8
      Width = 492
      Height = 48
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Representante da pessoa jurídica  '
      TabOrder = 0
      CampoEdit = ceRazaoSocial
      MostraMensagens = False
      Mensagens.EmBranco = 'Beneficiário não pode estar em branco'
      Mensagens.NaoExiste = 'Beneficiário não existe'
      PermiteChaveInvalida = False
      PermiteChaveEmBranco = False
      SubTipo = stRepresentante
      FiltraSubTipo = False
    end
    object gbAnoCalendario: TGroupBox
      Left = 388
      Top = 114
      Width = 110
      Height = 43
      Caption = ' Ano-Calendário '
      TabOrder = 4
      object edtAno: TEdit
        Left = 10
        Top = 16
        Width = 73
        Height = 21
        TabOrder = 0
        Text = '2005'
      end
      object UpDown1: TUpDown
        Left = 83
        Top = 16
        Width = 16
        Height = 21
        Associate = edtAno
        Min = 2005
        Max = 3000
        Position = 2005
        TabOrder = 1
        Thousands = False
        Wrap = False
      end
    end
    object rdgrpTipoDeclaracao: TRadioGroup
      Left = 8
      Top = 114
      Width = 213
      Height = 43
      Caption = ' Tipo de declaração '
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        '&Original'
        '&Retificadora')
      TabOrder = 2
      OnClick = rdgrpTipoDeclaracaoClick
    end
    object grpbxUltRecibo: TGroupBox
      Left = 228
      Top = 114
      Width = 153
      Height = 43
      Caption = ' Número do Últ. Recibo '
      Enabled = False
      TabOrder = 3
      object reUltRecibo: TRealEdit
        Left = 12
        Top = 15
        Width = 127
        Height = 21
        Alignment = taRightJustify
        Enabled = False
        Lines.Strings = (
          '0')
        MaxLength = 10
        TabOrder = 0
        WordWrap = False
        IntDigits = 10
        DecDigits = 0
        NumberFormat = iNumber
        Signal = False
      end
    end
    object PSubTipoResponsavel: TCMProcuraSubTipo
      Left = 7
      Top = 61
      Width = 492
      Height = 48
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Pessoa Responsável pelo Arquivo '
      TabOrder = 1
      CampoEdit = ceRazaoSocial
      MostraMensagens = True
      Mensagens.EmBranco = 'Beneficiário não pode estar em branco'
      Mensagens.NaoExiste = 'Beneficiário não existe'
      PermiteChaveInvalida = False
      PermiteChaveEmBranco = False
      SubTipo = stResponsavel
      FiltraSubTipo = False
    end
    object plEmpresa: TPanel
      Left = 8
      Top = 163
      Width = 213
      Height = 53
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 5
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 102
        Height = 13
        Caption = 'Natureza Jurídica'
      end
      object Label2: TLabel
        Left = 120
        Top = 8
        Width = 79
        Height = 13
        Caption = 'CNAE - Fiscal'
      end
      object mkNatureza: TMaskEdit
        Left = 8
        Top = 24
        Width = 47
        Height = 21
        EditMask = '999-9;0;_'
        MaxLength = 5
        TabOrder = 0
      end
      object mkCNAE: TMaskEdit
        Left = 120
        Top = 23
        Width = 81
        Height = 21
        EditMask = '99.99-99/9;0;_'
        MaxLength = 10
        TabOrder = 1
      end
    end
    object Panel1: TPanel
      Left = 228
      Top = 163
      Width = 269
      Height = 53
      Anchors = [akLeft, akTop, akRight]
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 7
      object Label3: TLabel
        Left = 8
        Top = 8
        Width = 248
        Height = 13
        Caption = 'Situação referente a portabilidade de saída'
      end
      object dblkPortabilidade: TwwDBLookupCombo
        Left = 8
        Top = 24
        Width = 253
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'50'#9'Descrição'#9'F')
        LookupTable = cmcdsSitPart
        LookupField = 'IDSITPART'
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 285
    Width = 504
    inherited tb97Fundo: TToolbar97
      Left = 256
      inherited sep1: TToolbarSep97
        Left = 161
      end
      inherited bbtnSair: TBitBtn
        Left = 80
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 163
      end
      object bbtnGera: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Cancel = True
        Caption = '&Gera'
        TabOrder = 2
        OnClick = bbtnGeraClick
        Glyph.Data = {
          BE060000424DBE06000000000000360400002800000024000000120000000100
          0800000000008802000000000000000000000001000000010000000000000000
          80000080000000808000800000008000800080800000C0C0C000C0DCC000F0C8
          A400000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
          0303030303030303030303030303030303030303030303030303030303030303
          03030303030303030303030303030303030303030303FF030303030303030303
          03030303030303040403030303030303030303030303030303F8F8FF03030303
          03030303030303030303040202040303030303030303030303030303F80303F8
          FF030303030303030303030303040202020204030303030303030303030303F8
          03030303F8FF0303030303030303030304020202020202040303030303030303
          0303F8030303030303F8FF030303030303030304020202FA0202020204030303
          0303030303F8FF0303F8FF030303F8FF03030303030303020202FA03FA020202
          040303030303030303F8FF03F803F8FF0303F8FF03030303030303FA02FA0303
          03FA0202020403030303030303F8FFF8030303F8FF0303F8FF03030303030303
          FA0303030303FA0202020403030303030303F80303030303F8FF0303F8FF0303
          0303030303030303030303FA0202020403030303030303030303030303F8FF03
          03F8FF03030303030303030303030303FA020202040303030303030303030303
          0303F8FF0303F8FF03030303030303030303030303FA02020204030303030303
          03030303030303F8FF0303F8FF03030303030303030303030303FA0202020403
          030303030303030303030303F8FF0303F8FF03030303030303030303030303FA
          0202040303030303030303030303030303F8FF03F8FF03030303030303030303
          03030303FA0202030303030303030303030303030303F8FFF803030303030303
          030303030303030303FA0303030303030303030303030303030303F803030303
          0303030303030303030303030303030303030303030303030303030303030303
          0303}
        NumGlyphs = 2
        Spacing = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 7
    Top = 291
    TargetsData = (
      1
      1
      (
        'TRealEdit'
        'Text'
        0))
  end
  object svDPrev: TSaveDialog
    Filter = 'Arquivo texto (*.txt)|*.txt'
    InitialDir = 'c:\'
    Left = 39
    Top = 291
  end
  object cmcdsSitPlanoPrev: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 72
    Top = 291
  end
  object cmcdsSitPart: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 104
    Top = 291
  end
end
