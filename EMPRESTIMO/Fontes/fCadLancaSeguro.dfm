inherited frmLancaDeposito: TfrmLancaDeposito
  Left = 88
  Top = 192
  HelpContext = 150040
  Caption = 'Controle de Depósito de Repasse de Seguro'
  ClientHeight = 282
  ClientWidth = 537
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 537
    Height = 249
    object Label1: TLabel
      Left = 16
      Top = 58
      Width = 71
      Height = 13
      Caption = 'Depósito em'
    end
    inline molContratoEmptmo: TmolContratoEmptmo
      Left = 8
      Top = 8
      Width = 521
      inherited edtNome: TEdit
        Width = 265
      end
      inherited btnBuscaContrato: TBitBtn
        Left = 464
        OnClick = molContratoEmptmobtnBuscaContratoClick
      end
      inherited btnLimpaContrato: TBitBtn
        Left = 488
      end
    end
    object edtData: TwwDBDateTimePicker
      Left = 16
      Top = 72
      Width = 105
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      ButtonStyle = cbsCustom
      Epoch = 1950
      ButtonWidth = 20
      ButtonGlyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        88888888888888888888800000000000000880FFFFFFFFFFFF0880F878787978
        7F0880F7878797978F0880F8787879787F0880F7878787878F0880F878787878
        7F0880F7878787878F0880FFFFFFFFFFFF0880F4C4C4C7777F0880FC4C4C4777
        7F0880FFFFFFFFFFFF0880000000000000088888888888888888}
      ShowButton = True
      TabOrder = 1
      UnboundDataType = wwDTEdtDate
      DisplayFormat = 'dd/mm/yyyy'
    end
    object wwDBGrid1: TwwDBGrid
      Left = 16
      Top = 112
      Width = 505
      Height = 120
      Selected.Strings = (
        'IDCONTRATOEMPTMO'#9'10'#9'Contrato'
        'NOME'#9'34'#9'Beneficiário'
        'PERCINDENIZACAO'#9'8'#9'% Indeniz.'
        'VLRREPASSE'#9'10'#9'Valor')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = dsSeguro
      TabOrder = 2
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      IndicatorColor = icBlack
    end
  end
  inherited Dock971: TDock97
    Top = 249
    Width = 537
    inherited tb97Fundo: TToolbar97
      Left = 365
      inherited bbtnAjuda: TmaHelpBitBtn
        ClickHelpContext = 150025
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  object qrySeguro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     CON.IDCONTRATOEMPTMO,'
      '     CON.IDINSCRICAOEMPTMO,'
      '     CBS.NOME,'
      '     CBS.IDBENEFSEGURO,'
      '     CBS.PERCINDENIZACAO,'
      '     CBS.VLRREPASSE'
      'FROM'
      '    CONTRATOEMPTMO CON,'
      '    CONTRATOXBENEFSEG CBS'
      'WHERE'
      '    CON.IDCONTRATOEMPTMO = :PIDCONTRATOEMPTMO'
      'AND CBS.IDINSCRICAOEMPTMO = CON.IDINSCRICAOEMPTMO'
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 184
    Top = 112
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
    object qrySeguroIDCONTRATOEMPTMO: TFloatField
      DisplayLabel = 'Contrato'
      DisplayWidth = 10
      FieldName = 'IDCONTRATOEMPTMO'
      Origin = 'BASEDADOS.CONTRATOEMPTMO.IDCONTRATOEMPTMO'
    end
    object qrySeguroNOME: TStringField
      DisplayLabel = 'Beneficiário'
      DisplayWidth = 34
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PESSOA.NOME'
      Size = 60
    end
    object qrySeguroPERCINDENIZACAO: TFloatField
      DisplayLabel = '% Indeniz.'
      DisplayWidth = 8
      FieldName = 'PERCINDENIZACAO'
      Origin = 'BASEDADOS.CONTRATOXBENEFSEG.PERCINDENIZACAO'
    end
    object qrySeguroVLRREPASSE: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 10
      FieldName = 'VLRREPASSE'
      Origin = 'BASEDADOS.CONTRATOXBENEFSEG.VLRREPASSE'
    end
    object qrySeguroIDBENEFSEGURO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDBENEFSEGURO'
      Origin = 'BASEDADOS.CONTRATOXBENEFSEG.IDBENEFSEGURO'
      Visible = False
    end
    object qrySeguroIDINSCRICAOEMPTMO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINSCRICAOEMPTMO'
      Origin = 'BASEDADOS.CONTRATOEMPTMO.IDINSCRICAOEMPTMO'
      Visible = False
    end
  end
  object dsSeguro: TDataSource
    DataSet = qrySeguro
    Left = 184
    Top = 160
  end
  object qryUpdate: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   CONTRATOXBENEFSEG'
      'SET'
      '   DATAREPASSE  =:PDATAREPASSE'
      'WHERE'
      '       IDINSCRICAOEMPTMO =:PIDINSCRICAOEMPTMO'
      '   AND IDBENEFSEGURO     =:PIDBENEFSEGURO')
    ValidateWithMask = True
    Left = 300
    Top = 127
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'PDATAREPASSE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDINSCRICAOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDBENEFSEGURO'
        ParamType = ptInput
      end>
  end
end
