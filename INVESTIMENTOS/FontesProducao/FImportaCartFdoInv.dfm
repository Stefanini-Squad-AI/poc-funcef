inherited FrmImportaCartFdoInv: TFrmImportaCartFdoInv
  Left = 23
  Top = 60
  HelpContext = 790008
  Caption = 'Importação de Dados'
  ClientHeight = 436
  ClientWidth = 452
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 452
    Height = 397
    inherited bvlSepTit: TBevel
      Top = 49
      Width = 450
    end
    inherited pnlTitulo: TPanel
      Width = 450
      Height = 48
      inherited lbNomDescricao: TfcLabel
        Left = 26
        Top = 13
        Width = 386
        Caption = 'Carteiras dos Fundos de Investimento'
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 268
      Width = 450
      Height = 128
      Align = alBottom
      Enabled = False
      TabOrder = 2
      object ProgressBar1: TProgressBar
        Left = 13
        Top = 108
        Width = 417
        Height = 16
        Min = 0
        Max = 100
        TabOrder = 1
      end
      object RdgCarteiraAtivos: TRadioGroup
        Left = 12
        Top = 6
        Width = 418
        Height = 99
        Caption = 'Carteiras'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Operações Compromissadas'
          'Titulos Privados'
          'Titulos Públicos'
          'Bolsas (BM&F- BOVESPA)'
          'Swap'
          'Despesas com Corretagem'
          'Outras Contas')
        TabOrder = 0
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 52
      Width = 450
      Height = 208
      Align = alTop
      TabOrder = 1
      object Label3: TLabel
        Left = 12
        Top = 4
        Width = 113
        Height = 13
        Caption = 'Data da Importação'
      end
      object Label2: TLabel
        Left = 138
        Top = 4
        Width = 100
        Height = 13
        Caption = 'Bolsa de Valores '
      end
      object Label4: TLabel
        Left = 12
        Top = 44
        Width = 134
        Height = 13
        Caption = 'Fundo de Investimento '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 12
        Top = 164
        Width = 197
        Height = 13
        Caption = 'Indique o Caminho para o Arquivo '
      end
      object SB1: TSpeedButton
        Left = 407
        Top = 176
        Width = 22
        Height = 23
        Hint = 'Buscar Arquivo '
        Glyph.Data = {
          4E010000424D4E01000000000000760000002800000012000000120000000100
          040000000000D800000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
          DDDDDD000000DDDDDDDDDDDDDDDDDD000000D000000000000DD00D000000D0FF
          FFFFFFFF0D000D000000D0FFFFFFF0000800DD000000D0FFFFFF0877808DDD00
          0000D0FFFFF0877E880DDD000000D0FFFFF07777870DDD000000D0FFFFF07E77
          870DDD000000D0FFFFF08EE7880DDD000000D0FFFFFF087780DDDD000000D0FF
          FFFFF0000DDDDD000000D0FFFFFFFFFF0DDDDD000000D0FFFFFFF0000DDDDD00
          0000D0FFFFFFF070DDDDDD000000D0FFFFFFF00DDDDDDD000000DD00000000DD
          DDDDDD000000DDDDDDDDDDDDDDDDDD000000}
        ParentShowHint = False
        ShowHint = True
        OnClick = SB1Click
      end
      object Label5: TLabel
        Left = 12
        Top = 124
        Width = 123
        Height = 13
        Caption = 'Plano Contab X Patro'
      end
      object Label6: TLabel
        Left = 12
        Top = 85
        Width = 45
        Height = 13
        Caption = 'Carteira'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DateEdit1: TCMDateTimePicker
        Left = 12
        Top = 19
        Width = 113
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        Epoch = 1950
        ButtonGlyph.Data = {
          06050000424D06050000000000003604000028000000100000000D0000000100
          080000000000D000000000000000000000000001000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
          A6000020400000206000002080000020A0000020C0000020E000004000000040
          20000040400000406000004080000040A0000040C0000040E000006000000060
          20000060400000606000006080000060A0000060C0000060E000008000000080
          20000080400000806000008080000080A0000080C0000080E00000A0000000A0
          200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
          200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
          200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
          20004000400040006000400080004000A0004000C0004000E000402000004020
          20004020400040206000402080004020A0004020C0004020E000404000004040
          20004040400040406000404080004040A0004040C0004040E000406000004060
          20004060400040606000406080004060A0004060C0004060E000408000004080
          20004080400040806000408080004080A0004080C0004080E00040A0000040A0
          200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
          200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
          200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
          20008000400080006000800080008000A0008000C0008000E000802000008020
          20008020400080206000802080008020A0008020C0008020E000804000008040
          20008040400080406000804080008040A0008040C0008040E000806000008060
          20008060400080606000806080008060A0008060C0008060E000808000008080
          20008080400080806000808080008080A0008080C0008080E00080A0000080A0
          200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
          200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
          200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
          2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
          2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
          2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
          2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
          2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
          2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
          2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
          000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
          A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
          A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
          A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
          FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
          04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
          000000000000000000FF}
        ShowButton = True
        TabOrder = 0
      end
      object DbLkcBolsa: TwwDBLookupCombo
        Left = 138
        Top = 19
        Width = 293
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'SGLBOLSAVALORES'#9'40'#9'Sigla da Bolsa')
        LookupTable = QryBolsaValores
        LookupField = 'IDBOLSAVALORES'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
      end
      object edtArquivo: TEdit
        Left = 12
        Top = 178
        Width = 390
        Height = 21
        TabOrder = 5
      end
      object DbLkcPatroPlano: TwwDBLookupCombo
        Left = 12
        Top = 139
        Width = 320
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'PLANPRVCONTABPATRO'#9'30'#9'Descrição'#9'F')
        LookupTable = QryPatroPlanPrevContab
        LookupField = 'IDPLANPREVCTBPATR'
        Options = [loRowLines, loTitles]
        TabOrder = 4
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
      end
      object DbLkCCarteiraInvest: TwwDBLookupCombo
        Left = 12
        Top = 99
        Width = 417
        Height = 21
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCCARTINVEST'#9'60'#9'Carteira de Investimento'#9'F')
        LookupTable = qryCarteiraInvest
        LookupField = 'IDCARTEIRAINVEST'
        Options = [loRowLines, loTitles]
        ParentFont = False
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object DbLkCFundoInvest: TwwDBLookupCombo
        Left = 12
        Top = 60
        Width = 418
        Height = 21
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCFUNDOINVEST'#9'40'#9'Descrição'#9'F')
        LookupTable = QryFundoInvestOperacao
        LookupField = 'IDFUNDOINVEST'
        Options = [loRowLines, loTitles]
        ParentFont = False
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
    end
  end
  inherited Dock971: TDock97
    Top = 397
    Width = 452
    inherited tb97Fundo: TToolbar97
      Left = 280
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 111
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 171
    Top = 51
  end
  object OpenDialog1: TOpenDialog
    FileName = 'COTMECA.XLS'
    Filter = 'Excel|*.xls'
    InitialDir = 'C:\'
    Title = 'Busca Arquivo de Importação '
    Left = 238
    Top = 55
  end
  object QryImportacao: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 310
    Top = 55
  end
  object QryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 294
    Top = 7
  end
  object QryBolsaValores: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDBOLSAVALORES, SGLBOLSAVALORES '
      ''
      'FROM CM.BOLSAVALORES '
      ''
      'ORDER BY SGLBOLSAVALORES ')
    ValidateWithMask = True
    Left = 387
    Top = 55
    object QryBolsaValoresSGLBOLSAVALORES: TStringField
      DisplayLabel = 'Sigla da Bolsa'
      DisplayWidth = 40
      FieldName = 'SGLBOLSAVALORES'
      Origin = 'BOLSAVALORES.SGLBOLSAVALORES'
      Size = 10
    end
    object QryBolsaValoresIDBOLSAVALORES: TFloatField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'IDBOLSAVALORES'
      Origin = 'BOLSAVALORES.IDBOLSAVALORES'
      Visible = False
    end
  end
  object QryFundoInvestOperacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      ''
      
        '  FUN.IDFUNDOINVEST, FUN.DESCFUNDOINVEST, FUN.IDCARTEIRAINVEST, ' +
        'FUN.IDTIPOFUNDOINVEST'
      ''
      'FROM'
      ''
      '  FUNDOINVEST FUN'
      ''
      'ORDER BY'
      ''
      '  FUN.DESCFUNDOINVEST'
      ''
      ''
      ''
      ''
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 370
    Top = 4
    object QryFundoInvestOperacaoDESCFUNDOINVEST: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 40
      FieldName = 'DESCFUNDOINVEST'
      Origin = 'BASEDADOS.FUNDOINVEST.DESCFUNDOINVEST'
      Size = 60
    end
    object QryFundoInvestOperacaoIDFUNDOINVEST: TFloatField
      FieldName = 'IDFUNDOINVEST'
      Origin = 'BASEDADOS.FUNDOINVEST.IDFUNDOINVEST'
      Visible = False
    end
    object QryFundoInvestOperacaoIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'BASEDADOS.FUNDOINVEST.IDCARTEIRAINVEST'
      Visible = False
    end
    object QryFundoInvestOperacaoIDTIPOFUNDOINVEST: TFloatField
      FieldName = 'IDTIPOFUNDOINVEST'
      Origin = 'BASEDADOS.FUNDOINVEST.IDTIPOFUNDOINVEST'
      Visible = False
    end
  end
  object QryPatroPlanPrevContab: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PA.IDPLANPREVCTBPATR,'
      '   PA.IDPLANOPREV,'
      '   PA.IDPATRO,'
      '   (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLANPRVCONTABPATRO'
      'FROM'
      '   PESSOA PE,'
      '   PLANPREVCONTABPATRO PA,'
      '   PLANPREVCONTABIL PL'
      'WHERE'
      '   (PA.IDPATRO = PE.IDPESSOA(+))  AND'
      '   (PA.IDPLANOPREV = PL.IDPLANOPREV)'
      ''
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 386
    Top = 102
    object QryPatroPlanPrevContabPLANPRVCONTABPATRO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 30
      FieldName = 'PLANPRVCONTABPATRO'
      Origin = 'BASEDADOS.PLANPREVCONTABIL.NOME'
      Size = 113
    end
    object QryPatroPlanPrevContabIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
      Origin = 'BASEDADOS.PLANPREVCONTABPATRO.IDPLANPREVCTBPATR'
      Visible = False
    end
    object QryPatroPlanPrevContabIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.PLANPREVCONTABPATRO.IDPLANOPREV'
      Visible = False
    end
    object QryPatroPlanPrevContabIDPATRO: TFloatField
      FieldName = 'IDPATRO'
      Origin = 'BASEDADOS.PLANPREVCONTABPATRO.IDPATRO'
      Visible = False
    end
  end
  object qryCarteiraInvest: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'Select * From CarteiraInvest')
    ValidateWithMask = True
    Left = 383
    Top = 170
    object qryCarteiraInvestDESCCARTINVEST: TStringField
      DisplayLabel = 'Carteira de Investimento'
      DisplayWidth = 60
      FieldName = 'DESCCARTINVEST'
      Origin = 'CARTEIRAINVEST.DESCCARTINVEST'
      Size = 60
    end
    object qryCarteiraInvestIDCARTEIRAINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'CARTEIRAINVEST.IDCARTEIRAINVEST'
      Visible = False
    end
    object qryCarteiraInvestIDGESTORCARTEIRA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDGESTORCARTEIRA'
      Origin = 'CARTEIRAINVEST.IDGESTORCARTEIRA'
      Visible = False
    end
    object qryCarteiraInvestFLGCARTPROP: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGCARTPROP'
      Origin = 'CARTEIRAINVEST.FLGCARTPROP'
      Visible = False
    end
    object qryCarteiraInvestFLGCALCDIARIO: TStringField
      DisplayWidth = 1
      FieldName = 'FLGCALCDIARIO'
      Origin = 'CARTEIRAINVEST.FLGCALCDIARIO'
      Visible = False
      Size = 1
    end
    object qryCarteiraInvestDATAINICIO: TDateTimeField
      DisplayWidth = 10
      FieldName = 'DATAINICIO'
      Origin = 'CARTEIRAINVEST.DATAINICIO'
      Visible = False
    end
    object qryCarteiraInvestFLGTRATALOTE: TStringField
      DisplayWidth = 1
      FieldName = 'FLGTRATALOTE'
      Origin = 'CARTEIRAINVEST.TRGDTINCLUSAO'
      Visible = False
      Size = 1
    end
    object qryCarteiraInvestTRGDTINCLUSAO: TDateTimeField
      DisplayWidth = 10
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'CARTEIRAINVEST.TRGUSERINCLUSAO'
      Visible = False
    end
    object qryCarteiraInvestTRGUSERINCLUSAO: TStringField
      DisplayWidth = 30
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'CARTEIRAINVEST.FLGTRATALOTE'
      Visible = False
      Size = 30
    end
    object qryCarteiraInvestIDPLANOPREV: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANOPREV'
      Origin = 'CARTEIRAINVEST.IDPLANOPREV'
      Visible = False
    end
    object qryCarteiraInvestIDPATROCINADORA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPATROCINADORA'
      Origin = 'CARTEIRAINVEST.IDPATROCINADORA'
      Visible = False
    end
    object qryCarteiraInvestIDTIPOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOINVEST'
      Origin = 'CARTEIRAINVEST.IDTIPOINVEST'
      Visible = False
    end
    object qryCarteiraInvestIDMERCADO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDMERCADO'
      Origin = 'CARTEIRAINVEST.IDMERCADO'
      Visible = False
    end
    object qryCarteiraInvestFLGORDMOVINV: TStringField
      DisplayWidth = 1
      FieldName = 'FLGORDMOVINV'
      Origin = 'CARTEIRAINVEST.FLGORDMOVINV'
      Visible = False
      Size = 1
    end
  end
end
