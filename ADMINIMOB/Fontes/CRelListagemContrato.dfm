inherited cfgRelListagemContrato: TcfgRelListagemContrato
  Left = 89
  Top = 156
  Caption = 'Listagem de Contratos'
  ClientHeight = 277
  ClientWidth = 441
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 441
    Height = 244
    object Label1: TLabel
      Left = 16
      Top = 10
      Width = 84
      Height = 13
      Caption = 'Administradora'
    end
    object lblTipoContrato: TLabel
      Left = 16
      Top = 50
      Width = 96
      Height = 13
      Caption = 'Tipo de Contrato'
    end
    object Label15: TLabel
      Left = 16
      Top = 91
      Width = 128
      Height = 13
      Caption = 'Vencimento (mês/ano)'
    end
    object rdgVigencia: TRadioGroup
      Left = 16
      Top = 131
      Width = 409
      Height = 49
      Caption = ' Exibir: '
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Apenas Contratos vigentes'
        'Todos os Contratos')
      TabOrder = 2
    end
    object rdgOrdenacao: TRadioGroup
      Left = 16
      Top = 187
      Width = 409
      Height = 49
      Caption = ' Ordenar por: '
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Nº do Contrato'
        'Nome do Contrato')
      TabOrder = 3
    end
    object edtAdminImovel: TEdit
      Left = 16
      Top = 24
      Width = 361
      Height = 21
      Enabled = False
      TabOrder = 0
    end
    object btnBuscaAdm: TBitBtn
      Left = 376
      Top = 24
      Width = 24
      Height = 22
      Hint = 'Busca uma Administradora'
      TabOrder = 1
      OnClick = btnBuscaAdmClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
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
    object btnLimpaAdminImovel: TBitBtn
      Left = 400
      Top = 24
      Width = 24
      Height = 22
      Hint = 'Limpa a seleção de Administradora'
      TabOrder = 4
      OnClick = btnLimpaAdminImovelClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        88888888888FF8888888888888008888888888888F77F8888888888800F08888
        8888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0888
        88887788888F788888887FFFFFCF888888887F88FF7888FF88887FFCCCF88008
        888878F777888778F88887FFFF880110888887F88F8878878F8887FFC8809991
        0888878F7887F88878F8887FF88099991088887F88878F88878F887FF8880999
        03088878F88878F878788887F8888090B03088878F888787878788887888880B
        0B038888788888787878888888888880B0B38888888888878788888888888888
        0BBB88888888888878F888888888888880BB8888888888888788}
      NumGlyphs = 2
    end
    object dblkTipoContrato: TDBLookupComboBox
      Left = 16
      Top = 65
      Width = 411
      Height = 21
      KeyField = 'IDTIPOCONTRIMOB'
      ListField = 'DESCRICAO'
      ListSource = dsTipoContrato
      TabOrder = 5
    end
    object cboMes: TComboBox
      Left = 16
      Top = 105
      Width = 134
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 6
      Items.Strings = (
        'Janeiro'
        'Fevereiro'
        'Março'
        'Abril'
        'Maio'
        'Junho'
        'Julho'
        'Agosto'
        'Setembro'
        'Outubro'
        'Novembro'
        'Dezembro')
    end
    object DBspnAno: TwwDBSpinEdit
      Left = 153
      Top = 105
      Width = 62
      Height = 21
      Increment = 1
      TabOrder = 7
      UnboundDataType = wwDefault
    end
  end
  inherited Dock971: TDock97
    Top = 244
    Width = 441
    inherited tb97Fundo: TToolbar97
      Left = 269
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 97
    end
  end
  object dsTipoContrato: TwwDataSource
    AutoEdit = False
    DataSet = cdsTipoContrato
    Left = 340
    Top = 86
  end
  object cdsTipoContrato: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTipoContrato'
    Left = 356
    Top = 87
    object cdsTipoContratoIDTIPOCONTRIMOB: TFloatField
      FieldName = 'IDTIPOCONTRIMOB'
      Origin = 'BASEDADOS.TIPOCONTRIMOB.IDTIPOCONTRIMOB'
    end
    object cdsTipoContratoSIGLA: TStringField
      FieldName = 'SIGLA'
      Origin = 'BASEDADOS.TIPOCONTRIMOB.SIGLA'
      FixedChar = True
      Size = 5
    end
    object cdsTipoContratoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.TIPOCONTRIMOB.NOME'
      Size = 60
    end
    object cdsTipoContratoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.TIPOCONTRIMOB.SIGLA'
      Size = 68
    end
  end
  object dspTipoContrato: TDataSetProvider
    DataSet = qryTipoContrato
    Constraints = True
    Left = 378
    Top = 87
  end
  object qryTipoContrato: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select '
      '  idtipocontrimob, '
      '  sigla, '
      '  nome,'
      '  (sigla || '#39' - '#39' || nome) as descricao '
      'from '
      '  tipocontrimob')
    ValidateWithMask = True
    Left = 396
    Top = 87
    object qryTipoContratoIDTIPOCONTRIMOB: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOCONTRIMOB'
      Origin = 'BASEDADOS.TIPOCONTRIMOB.IDTIPOCONTRIMOB'
    end
    object qryTipoContratoSIGLA: TStringField
      DisplayWidth = 5
      FieldName = 'SIGLA'
      Origin = 'BASEDADOS.TIPOCONTRIMOB.SIGLA'
      FixedChar = True
      Size = 5
    end
    object qryTipoContratoNOME: TStringField
      DisplayWidth = 60
      FieldName = 'NOME'
      Origin = 'BASEDADOS.TIPOCONTRIMOB.NOME'
      Size = 60
    end
    object qryTipoContratoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.TIPOCONTRIMOB.SIGLA'
      Size = 68
    end
  end
end
