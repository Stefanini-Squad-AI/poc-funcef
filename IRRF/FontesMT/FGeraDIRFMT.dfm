inherited frmGeraDIRFMT: TfrmGeraDIRFMT
  Left = 235
  Top = 115
  HelpContext = 240017
  Caption = 'Geração da Dirf'
  ClientHeight = 491
  ClientWidth = 762
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 762
    Height = 452
    object lblMensagem: TLabel
      Left = 12
      Top = 406
      Width = 74
      Height = 13
      Caption = 'lblMensagem'
    end
    object Label4: TLabel
      Left = 354
      Top = 170
      Width = 306
      Height = 13
      Caption = 'Retirar as pessoas: (IDPESSOA separado por vírgula)'
    end
    object Label5: TLabel
      Left = 354
      Top = 206
      Width = 333
      Height = 13
      Caption = 'Filtro de Pessoas (CPF entre aspas, separados por virgula)'
    end
    object PSubTipoResponsavel: TCMProcuraSubTipo
      Left = 8
      Top = 64
      Width = 369
      Height = 49
      Caption = ' Pessoa Responsável pelo Arquivo '
      TabOrder = 3
      CampoEdit = ceRazaoSocial
      MostraMensagens = True
      Mensagens.EmBranco = 'Beneficiário não pode estar em branco'
      Mensagens.NaoExiste = 'Beneficiário não existe'
      PermiteChaveInvalida = False
      PermiteChaveEmBranco = False
      SubTipo = stCliente
      FiltraSubTipo = False
    end
    object rgSistema: TRadioGroup
      Left = 8
      Top = 15
      Width = 369
      Height = 46
      Caption = ' Gerar de '
      Columns = 3
      Items.Strings = (
        '&Pagamento'
        '&Benefícios'
        '&Contas a Pagar')
      TabOrder = 0
      OnClick = rgSistemaClick
    end
    object gbNatureza: TGroupBox
      Left = 384
      Top = 15
      Width = 136
      Height = 46
      Caption = ' Ano-Calendário '
      TabOrder = 1
      object edtData: TEdit
        Left = 16
        Top = 18
        Width = 97
        Height = 21
        TabOrder = 0
        Text = '2001'
      end
      object UpDown1: TUpDown
        Left = 113
        Top = 18
        Width = 16
        Height = 21
        Associate = edtData
        Min = 2001
        Max = 3000
        Position = 2001
        TabOrder = 1
        Thousands = False
        Wrap = False
      end
    end
    object GroupBox1: TGroupBox
      Left = 531
      Top = 15
      Width = 136
      Height = 46
      Caption = ' Ano de referência '
      TabOrder = 2
      object edtDataRef: TEdit
        Left = 16
        Top = 17
        Width = 97
        Height = 21
        TabOrder = 0
        Text = '2002'
      end
      object UpDown2: TUpDown
        Left = 113
        Top = 17
        Width = 16
        Height = 21
        Associate = edtDataRef
        Min = 2002
        Max = 3000
        Position = 2002
        TabOrder = 1
        Thousands = False
        Wrap = False
      end
    end
    object cbPesExi: TCheckBox
      Left = 8
      Top = 195
      Width = 343
      Height = 17
      Caption = 'Beneficiário com Exigibilidade'
      TabOrder = 6
      OnClick = cbPesExiClick
    end
    object grpBoxImport: TGroupBox
      Left = 504
      Top = 241
      Width = 249
      Height = 84
      Enabled = False
      TabOrder = 12
      object Label1: TLabel
        Left = 16
        Top = 39
        Width = 159
        Height = 13
        Caption = 'Nome do Arquivo a Importar'
      end
      object edtImport: TEdit
        Left = 16
        Top = 55
        Width = 185
        Height = 21
        TabStop = False
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
        Left = 203
        Top = 53
        Width = 30
        Height = 22
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
      object chckboxImporta: TCheckBox
        Left = 16
        Top = 17
        Width = 113
        Height = 17
        Caption = 'Importar arquivo'
        TabOrder = 2
        OnClick = chckboxImportaClick
      end
    end
    object gbValor: TGroupBox
      Left = 140
      Top = 241
      Width = 360
      Height = 84
      Caption = ' Valor mínimo de rendimento '
      TabOrder = 11
      object Label2: TLabel
        Left = 4
        Top = 48
        Width = 343
        Height = 13
        Caption = 
          'Para gerar DIRF sem valor mínimo de Rendimento Tributável, use Z' +
          'ERO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 4
        Top = 61
        Width = 345
        Height = 13
        Caption = 
          'Para gerar DIRF somente de quem teve Rendimento Tributável, use ' +
          '0,01'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblAnual: TLabel
        Left = 6
        Top = 24
        Width = 37
        Height = 13
        Caption = 'Anual:'
      end
      object lblIndenizacao: TLabel
        Left = 172
        Top = 24
        Width = 74
        Height = 13
        Caption = 'Indenização:'
      end
      object rValorMinimo: TRealEdit
        Left = 44
        Top = 20
        Width = 110
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        MaxLength = 10
        TabOrder = 0
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object rValorIndenizacao: TRealEdit
        Left = 248
        Top = 20
        Width = 108
        Height = 21
        Alignment = taRightJustify
        Enabled = False
        Lines.Strings = (
          '      0,00')
        MaxLength = 10
        TabOrder = 1
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
    end
    object rdgrpTipoArquivo: TRadioGroup
      Left = 8
      Top = 241
      Width = 129
      Height = 45
      Caption = 'Este Arquivo é '
      ItemIndex = 0
      Items.Strings = (
        '&Original'
        '&Retificadora')
      TabOrder = 9
      OnClick = rdgrpTipoArquivoClick
    end
    object rgNaturDeclar: TRadioGroup
      Left = 8
      Top = 328
      Width = 745
      Height = 78
      Caption = 'Este Arquivo é '
      ItemIndex = 0
      Items.Strings = (
        
          '0 - PF ou PJ de direito privado, exceto Instituição Administrado' +
          'ra de Fundo ou Clube de Investimento'
        
          '1 - Órgões, Autarquias e Fundações da Administração Pública Fede' +
          'ral'
        
          '2 - Órgões, Autarquias e Fundações da Administração Pública Esta' +
          'dual ou Municipal'
        '3 - Instituição Administradora de Fundo ou Clube de Investimento')
      TabOrder = 13
    end
    object prgBarAtuFluxo: TProgressBar
      Left = 1
      Top = 429
      Width = 760
      Height = 22
      Align = alBottom
      Min = 0
      Max = 100
      Step = 2
      TabOrder = 14
    end
    object chckBoxRetencao: TCheckBox
      Left = 8
      Top = 178
      Width = 343
      Height = 17
      Caption = 'Gerar a Dirf Somente dos que Tiveram Retenção'
      Checked = True
      State = cbChecked
      TabOrder = 5
    end
    object chkParticipMantido: TCheckBox
      Left = 8
      Top = 212
      Width = 343
      Height = 17
      Caption = 'Gerar para participantes Auto patrocinados'
      TabOrder = 7
    end
    object edPessoanotin: TEdit
      Left = 352
      Top = 184
      Width = 401
      Height = 21
      TabOrder = 8
    end
    object gbNumRecibo: TGroupBox
      Left = 8
      Top = 285
      Width = 129
      Height = 41
      Caption = ' Numero do Recibo '
      Enabled = False
      TabOrder = 10
      object edNumeroRecibo: TEdit
        Left = 5
        Top = 12
        Width = 118
        Height = 21
        TabOrder = 0
      end
    end
    object pSubTipoPlanoSaude: TCMProcuraSubTipo
      Left = 384
      Top = 64
      Width = 369
      Height = 49
      Caption = 'Administradora do Plano de Saúde '
      TabOrder = 4
      CampoEdit = ceRazaoSocial
      MostraMensagens = True
      Mensagens.EmBranco = 'Beneficiário não pode estar em branco'
      Mensagens.NaoExiste = 'Beneficiário não existe'
      PermiteChaveInvalida = False
      PermiteChaveEmBranco = False
      SubTipo = stCliente
      FiltraSubTipo = False
    end
    object edFiltroCPF: TEdit
      Left = 352
      Top = 220
      Width = 401
      Height = 21
      TabOrder = 15
    end
    object pSubTipoPlanoOdonto: TCMProcuraSubTipo
      Left = 8
      Top = 120
      Width = 369
      Height = 49
      Caption = 'Administradora do Plano Odontológico'
      TabOrder = 16
      CampoEdit = ceRazaoSocial
      MostraMensagens = True
      Mensagens.EmBranco = 'Beneficiário não pode estar em branco'
      Mensagens.NaoExiste = 'Beneficiário não existe'
      PermiteChaveInvalida = False
      PermiteChaveEmBranco = False
      SubTipo = stCliente
      FiltraSubTipo = False
    end
  end
  inherited Dock971: TDock97
    Top = 452
    Width = 762
    inherited tb97Fundo: TToolbar97
      Left = 421
      inherited sep1: TToolbarSep97
        Left = 161
      end
      inherited bbtnSair: TBitBtn
        Left = 80
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 163
        HelpContext = 240011
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
    Top = 595
    TargetsData = (
      1
      1
      (
        'TRealEdit'
        'Text'
        0))
  end
  object svDirf: TSaveDialog
    InitialDir = 'c:\'
    Left = 232
    Top = 598
  end
  object opDirf: TOpenDialog
    Left = 109
    Top = 595
  end
end
