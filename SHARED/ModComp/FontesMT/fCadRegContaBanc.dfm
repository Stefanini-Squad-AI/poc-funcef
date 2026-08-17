inherited frmCadRegContaBanc: TfrmCadRegContaBanc
  Left = 366
  Top = 213
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = 'Informações Sobre as Contas Bancárias Associadas a Esta Etapa'
  ClientHeight = 443
  ClientWidth = 500
  FormStyle = fsNormal
  Visible = False
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 500
    Height = 404
    BorderWidth = 2
    object Label14: TLabel
      Left = 31
      Top = 29
      Width = 88
      Height = 13
      Caption = 'Conta Bancária'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 32
      Top = 116
      Width = 47
      Height = 13
      Caption = 'Agência'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 31
      Top = 156
      Width = 99
      Height = 13
      Caption = 'Número da Conta'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 32
      Top = 74
      Width = 37
      Height = 13
      Caption = 'Banco'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 16
      Top = 8
      Width = 113
      Height = 20
      Caption = 'Nossa Conta'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object Bevel1: TBevel
      Left = 0
      Top = 201
      Width = 501
      Height = 3
    end
    object Label3: TLabel
      Left = 32
      Top = 316
      Width = 47
      Height = 13
      Caption = 'Agência'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 32
      Top = 356
      Width = 99
      Height = 13
      Caption = 'Número da Conta'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 32
      Top = 274
      Width = 37
      Height = 13
      Caption = 'Banco'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 16
      Top = 208
      Width = 153
      Height = 20
      Caption = 'Conta de Terceiro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 32
      Top = 231
      Width = 37
      Height = 13
      Caption = 'Titular'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dblkContaBancaria: TwwDBLookupCombo
      Left = 31
      Top = 44
      Width = 438
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'60'#9'DESCRICAO')
      DataField = 'CODPORTADOR'
      DataSource = dsEtapa
      LookupTable = CdsContaBancaria
      LookupField = 'CODPORTADOR'
      Style = csDropDownList
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      OrderByDisplay = False
      AllowClearKey = True
      ShowMatchText = True
      OnChange = dblkContaBancariaChange
    end
    object dbedNumAgencia: TwwDBEdit
      Left = 32
      Top = 131
      Width = 55
      Height = 21
      TabStop = False
      DataField = 'NUMAGENCIA'
      DataSource = DsContaBancaria
      ReadOnly = True
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbedConta: TwwDBEdit
      Left = 31
      Top = 171
      Width = 124
      Height = 21
      TabStop = False
      DataField = 'NOCONTACORR'
      DataSource = DsContaBancaria
      ReadOnly = True
      TabOrder = 2
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbedAgencia: TwwDBEdit
      Left = 103
      Top = 131
      Width = 367
      Height = 21
      TabStop = False
      DataField = 'AGENCIA'
      DataSource = DsContaBancaria
      ReadOnly = True
      TabOrder = 3
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbedNumBanco: TwwDBEdit
      Left = 32
      Top = 89
      Width = 55
      Height = 21
      TabStop = False
      DataField = 'NUMBANCO'
      DataSource = DsContaBancaria
      ReadOnly = True
      TabOrder = 4
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbedBanco: TwwDBEdit
      Left = 103
      Top = 89
      Width = 367
      Height = 21
      TabStop = False
      DataField = 'BANCO'
      DataSource = DsContaBancaria
      ReadOnly = True
      TabOrder = 5
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbedNumAgencia3: TwwDBEdit
      Left = 32
      Top = 331
      Width = 55
      Height = 21
      TabStop = False
      DataField = 'NUMAGENCIA'
      DataSource = dsContaBancaria3
      ReadOnly = True
      TabOrder = 6
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbedConta3: TwwDBEdit
      Left = 32
      Top = 371
      Width = 124
      Height = 21
      TabStop = False
      DataField = 'CONTACORRENTE'
      DataSource = dsContaBancaria3
      ReadOnly = True
      TabOrder = 7
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbedAgencia3: TwwDBEdit
      Left = 103
      Top = 331
      Width = 367
      Height = 21
      TabStop = False
      DataField = 'AGENCIA'
      DataSource = dsContaBancaria3
      ReadOnly = True
      TabOrder = 8
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbedNumBanco3: TwwDBEdit
      Left = 32
      Top = 289
      Width = 55
      Height = 21
      TabStop = False
      DataField = 'NUMBANCO'
      DataSource = dsContaBancaria3
      ReadOnly = True
      TabOrder = 9
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbedBanco3: TwwDBEdit
      Left = 103
      Top = 289
      Width = 367
      Height = 21
      TabStop = False
      DataField = 'BANCO'
      DataSource = dsContaBancaria3
      ReadOnly = True
      TabOrder = 10
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblcTitular: TwwDBLookupCombo
      Left = 32
      Top = 246
      Width = 438
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TITULAR'#9'60'#9'TITULAR')
      DataField = 'IDCBANCARIA'
      DataSource = dsEtapa
      LookupTable = CdsContaBancaria3
      LookupField = 'IDCBANCARIA'
      Style = csDropDownList
      TabOrder = 11
      AutoDropDown = True
      ShowButton = True
      OrderByDisplay = False
      AllowClearKey = True
      ShowMatchText = True
    end
    object spbtnProcTitular: TBitBtn
      Left = 176
      Top = 209
      Width = 25
      Height = 24
      Hint = 'Procura Titular da Conta por Qualquer Tipo de Documento'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 12
      OnClick = spbtnProcTitularClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
        777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
        77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
        77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
        077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
        FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
        F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
        7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
        777777787FFF8777777777770000777777777777888877777777}
      NumGlyphs = 2
    end
    object DBRadioGroup1: TDBRadioGroup
      Left = 202
      Top = 357
      Width = 141
      Height = 38
      Caption = 'Conta Preferencial'
      Columns = 2
      DataField = 'FLGCONTAPREF'
      DataSource = dsContaBancaria3
      Items.Strings = (
        'Sim'
        'Não')
      ReadOnly = True
      TabOrder = 13
      TabStop = True
      Values.Strings = (
        '1')
    end
  end
  inherited Dock971: TDock97
    Top = 404
    Width = 500
    inherited tb97Fundo: TToolbar97
      Left = 328
      inherited sep3: TToolbarSep97
        Visible = False
      end
      inherited bbtnSair: TBitBtn
        Enabled = False
        Visible = False
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 159
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 443
    Top = 9
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  object CdsEtapa: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 206
    Top = 83
  end
  object dsEtapa: TwwDataSource
    DataSet = CdsEtapa
    Left = 201
    Top = 9
  end
  object CdsContaBancaria: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 290
    Top = 154
  end
  object DsContaBancaria: TwwDataSource
    DataSet = CdsContaBancaria
    Left = 289
    Top = 214
  end
  object CdsContaBancaria3: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 416
    Top = 277
  end
  object dsContaBancaria3: TwwDataSource
    DataSet = CdsContaBancaria3
    Left = 419
    Top = 341
  end
end
