inherited frmCalculoRepasse: TfrmCalculoRepasse
  Left = 63
  Top = 54
  HelpContext = 150039
  Caption = 'Cálculo de Repasse de Seguro'
  ClientHeight = 369
  ClientWidth = 632
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 632
    Height = 336
    inherited pgcControle: TPageControl
      Width = 632
      Height = 303
      inherited TabSheet1: TTabSheet
        object gbxQuitacao: TGroupBox
          Left = 320
          Top = 160
          Width = 289
          Height = 65
          Caption = ' Quitações '
          TabOrder = 0
          object Label5: TLabel
            Left = 24
            Top = 18
            Width = 66
            Height = 13
            Caption = 'Data Inicial'
          end
          object Label3: TLabel
            Left = 160
            Top = 18
            Width = 59
            Height = 13
            Caption = 'Data Final'
          end
          object edtDataInicial: TwwDBDateTimePicker
            Left = 24
            Top = 32
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
            TabOrder = 0
            UnboundDataType = wwDTEdtDate
            DisplayFormat = 'dd/mm/yyyy'
          end
          object edtDataFinal: TwwDBDateTimePicker
            Left = 160
            Top = 32
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
        end
        inline molContratoEmptmo: TmolContratoEmptmo
          Left = 8
          Top = 8
          Width = 607
          TabOrder = 1
          inherited edtNome: TEdit
            Width = 353
          end
          inherited btnBuscaContrato: TBitBtn
            Left = 552
            OnClick = molContratoEmptmobtnBuscaContratoClick
          end
          inherited btnLimpaContrato: TBitBtn
            Left = 576
          end
        end
        inline molListaPatro: TmolListaPatro
          Left = 8
          Top = 56
          Height = 177
          TabOrder = 2
          inherited Label6: TLabel
            Width = 86
          end
          inherited lstPatro: TCheckListBox
            Height = 153
          end
          inherited btnInvertePatro: TBitBtn
            OnClick = molListaPatrobtnInvertePatroClick
          end
          inherited btnMarcaTodosPatro: TBitBtn
            OnClick = molListaPatrobtnMarcaTodosPatroClick
          end
        end
        inline molListaPlano: TmolListaPlano
          Left = 312
          Top = 56
          Height = 105
          TabOrder = 3
          inherited Label6: TLabel
            Width = 119
          end
          inherited lstPlano: TCheckListBox
            Height = 81
          end
          inherited btnInvertePlano: TBitBtn
            OnClick = molListaPlanobtnInvertePlanoClick
          end
          inherited btnMarcaTodosPlano: TBitBtn
            OnClick = molListaPlanobtnMarcaTodosPlanoClick
          end
        end
      end
      inherited TabSheet2: TTabSheet
        object wwDBGrid1: TwwDBGrid
          Left = 8
          Top = 8
          Width = 609
          Height = 273
          Selected.Strings = (
            'IDCONTRATOEMPTMO'#9'12'#9'Contrato'
            'BENEFICIARIO'#9'36'#9'Beneficiário'#9'F'
            'PERCINDENIZACAO'#9'5'#9'%'
            'REPASSESEGURO'#9'13'#9'Repasse Fund.'
            'REPASSEBENEF'#9'13'#9'Repasse Benef.')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dtsHistMovVirtual
          TabOrder = 0
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
    end
    inherited Panel1: TPanel
      Width = 632
      inherited fcLabel1: TfcLabel
        Width = 310
        Caption = 'Cálculo de Repasse de Seguro'
      end
    end
  end
  inherited Dock971: TDock97
    Top = 336
    Width = 632
    inherited tb97Fundo: TToolbar97
      Left = 460
      inherited bbtnAjuda: TmaHelpBitBtn
        ClickHelpContext = 150025
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 166
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 771
    Top = 3
  end
  object qryHistMov: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CNT.IDCONTRATOEMPTMO,'
      '   CNT.IDINSCRICAOEMPTMO,'
      '   CNT.VLRCONTRATO,'
      '   CNT.DATACREDITO,'
      '   CNT.TXJUROS,'
      '   PES.NOME,'
      '   CBS.IDBENEFSEGURO,'
      '   NVL(CBS.PERCINDENIZACAO,0) AS PERCINDENIZACAO,'
      '   HME.HMEVLRPREVISTO,'
      '   HME.HMEDATAPREVISTA'
      ''
      'FROM'
      '   HISTMOVEMPTMO     HME,'
      '   CONTRATOEMPTMO    CNT,'
      '   CONTRATOXBENEFSEG CBS,'
      '   PESSOA            PES'
      ''
      'WHERE'
      '       CNT.FLGSITUACAO        IN ('#39'K'#39','#39'Q'#39')'
      '   AND HME.HMETIPOMOV         = 3'
      '   AND (HME.HMECENTRALIZA     = 1 OR HME.HMEDESTACADO = 1)'
      '   AND HME.HMEORIGEM          = 8'
      '   AND HME.IDCONTRATOEMPTMO   = CNT.IDCONTRATOEMPTMO'
      '   AND CNT.IDINSCRICAOEMPTMO  = CBS.IDINSCRICAOEMPTMO(+)'
      '   AND CBS.IDBENEFSEGURO      = PES.IDPESSOA(+)'
      ''
      'ORDER BY'
      '    CNT.IDINSCRICAOEMPTMO')
    ValidateWithMask = True
    Left = 28
    Top = 271
    object qryHistMovIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryHistMovIDINSCRICAOEMPTMO: TFloatField
      FieldName = 'IDINSCRICAOEMPTMO'
    end
    object qryHistMovNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryHistMovIDBENEFSEGURO: TFloatField
      FieldName = 'IDBENEFSEGURO'
    end
    object qryHistMovPERCINDENIZACAO: TFloatField
      FieldName = 'PERCINDENIZACAO'
    end
    object qryHistMovHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
    end
    object qryHistMovVLRCONTRATO: TFloatField
      FieldName = 'VLRCONTRATO'
    end
    object qryHistMovDATACREDITO: TDateTimeField
      FieldName = 'DATACREDITO'
    end
    object qryHistMovHMEDATAPREVISTA: TDateTimeField
      FieldName = 'HMEDATAPREVISTA'
    end
    object qryHistMovTXJUROS: TFloatField
      FieldName = 'TXJUROS'
    end
  end
  object qryHistMovVirtual: TwwQuery
    CachedUpdates = True
    AutoRefresh = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   0                                           AS IDCONTRATOEMPT' +
        'MO,'
      '   '#39'                                        '#39'  AS BENEFICIARIO,'
      '   0                                           AS REPASSESEGURO,'
      '   0                                           AS REPASSEBENEF,'
      
        '   0                                           AS PERCINDENIZACA' +
        'O'
      'FROM'
      '   DUAL'
      'WHERE'
      '   1 = 2'
      ' ')
    UpdateObject = updHistMovVirtual
    ValidateWithMask = True
    Left = 220
    Top = 287
    object qryHistMovVirtualIDCONTRATOEMPTMO: TFloatField
      DisplayLabel = 'Contrato'
      DisplayWidth = 12
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryHistMovVirtualBENEFICIARIO: TStringField
      DisplayLabel = 'Beneficiário'
      DisplayWidth = 36
      FieldName = 'BENEFICIARIO'
      FixedChar = True
      Size = 40
    end
    object qryHistMovVirtualPERCINDENIZACAO: TFloatField
      DisplayLabel = '%'
      DisplayWidth = 5
      FieldName = 'PERCINDENIZACAO'
    end
    object qryHistMovVirtualREPASSESEGURO: TFloatField
      DisplayLabel = 'Repasse Fund.'
      DisplayWidth = 13
      FieldName = 'REPASSESEGURO'
    end
    object qryHistMovVirtualREPASSEBENEF: TFloatField
      DisplayLabel = 'Repasse Benef.'
      DisplayWidth = 13
      FieldName = 'REPASSEBENEF'
    end
  end
  object dtsHistMovVirtual: TDataSource
    DataSet = qryHistMovVirtual
    Left = 80
    Top = 288
  end
  object updHistMovVirtual: TUpdateSQL
    InsertSQL.Strings = (
      'insert into DUAL'
      '  (IDCONTRATOEMPTMO, BENEFICIARIO, REPASSESEGURO, REPASSEBENEF)'
      'values'
      '  (:IDCONTRATOEMPTMO, :BENEFICIARIO, :REPASSESEGURO, '
      ':REPASSEBENEF)')
    Left = 148
    Top = 271
  end
  object qryCalculo: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 360
    Top = 8
  end
  object qryUpdate: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '    CONTRATOXBENEFSEG'
      'SET'
      '    VLRSALDOREC = :PVLRSALDOREC,'
      '    VLRREPASSE  = :PVLRREPASSE'
      'WHERE'
      '    IDINSCRICAOEMPTMO = :PIDINSCRICAOEMPTMO'
      'AND IDBENEFSEGURO     = :PIDBENEFSEGURO')
    ValidateWithMask = True
    Left = 324
    Top = 263
    ParamData = <
      item
        DataType = ftCurrency
        Name = 'PVLRSALDOREC'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'PVLRREPASSE'
        ParamType = ptUnknown
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
