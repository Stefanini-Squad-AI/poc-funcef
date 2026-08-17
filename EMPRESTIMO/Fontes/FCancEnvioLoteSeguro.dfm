inherited frmCancEnvioLoteSeguro: TfrmCancEnvioLoteSeguro
  Left = 138
  Top = 260
  HelpContext = 150108
  Caption = 'Desfazer Envio em Lote de Seguros '
  ClientWidth = 666
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 666
    inherited pgcControle: TPageControl
      Width = 666
      inherited TabSheet1: TTabSheet
        Caption = 'Desfazer Envio em Lote de Seguros [ seleção ]'
        object GroupBox3: TGroupBox
          Left = 168
          Top = 120
          Width = 329
          Height = 61
          Caption = ' Período de Datas '
          TabOrder = 0
          object Label5: TLabel
            Left = 32
            Top = 28
            Width = 27
            Height = 13
            Caption = 'de:  '
          end
          object Label6: TLabel
            Left = 174
            Top = 28
            Width = 27
            Height = 13
            Caption = 'até: '
          end
          object edtDataIni: TwwDBDateTimePicker
            Left = 56
            Top = 24
            Width = 97
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
          object edtDataFim: TwwDBDateTimePicker
            Left = 200
            Top = 24
            Width = 97
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
      end
      inherited TabSheet2: TTabSheet
        Caption = 'Desfazer Envio em Lote de Seguros [ Documentos ]'
        object DBgrdHistMov: TwwDBGrid
          Left = 17
          Top = 34
          Width = 624
          Height = 287
          Selected.Strings = (
            'NODOCUMENTO'#9'10'#9'Nº Doc.'#9'F'
            'NUMAPGR'#9'5'#9'Nº AP'#9'F'
            'NOME'#9'28'#9'Nome'#9'F'
            'PORTADORFORMA'#9'30'#9'Conta Caixa X Forma Pagto.'#9'F'
            'VALOR'#9'10'#9'Valor'#9'F'
            'STATUS_DOC'#9'10'#9'Status'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
          DataSource = dsDocumento
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          KeyOptions = []
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
          ParentFont = False
          TabOrder = 1
          TitleAlignment = taCenter
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          UseTFields = False
          IndicatorColor = icBlack
        end
        object Panel3: TPanel
          Left = 16
          Top = 8
          Width = 625
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Documentos'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
      end
    end
    inherited Panel1: TPanel
      Width = 666
      inherited fcLabel1: TfcLabel
        Width = 473
        Caption = 'Desfazer Envio em Lote de Seguros [ seleção ]'
      end
    end
  end
  inherited Dock971: TDock97
    Width = 666
    inherited tb97Fundo: TToolbar97
      inherited bbtnAjuda: TmaHelpBitBtn
        ClickHelpContext = 150025
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 995
    Top = 27
  end
  object qryDocumento: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '   DOC.CODDOCUMENTO,'
      '   DOC.IDPESSOA,'
      '   DOC.CODPORTFORMA,'
      '   DOC.IDFORCLI,'
      ''
      '   DOC.IDMODULO,'
      '   DOC.RECPAG,'
      '   DOC.NODOCUMENTO,'
      '   DOC.COMPLDOCUMENTO,'
      '   DOC.DATAVENCTO,'
      
        '   DECODE(DOC.STATUS, '#39'0'#39', '#39'Em Aberto'#39', '#39'2'#39', '#39'Pago'#39', '#39#39') AS STAT' +
        'US_DOC,'
      ''
      '   DOC.OPERACAO,'
      '   DOC.NUMAPGR,'
      ''
      '   LDC.VALOR,'
      ''
      '   PFO.DESCRICAO AS PORTADORFORMA,'
      ''
      '   FAV.NOME'
      ''
      'FROM'
      '   DOCUMENTO      DOC,'
      '   PESSOA         FAV,'
      ''
      '   ('
      '   SELECT'
      '      LAN.CODDOCUMENTO,'
      '      LAN.NUMLANCTO,'
      '      LAN.VALOR,'
      '      LAN.DEBCRE,'
      '      LAN.OPERACAO,'
      '      LAN.HISTORICOCOMPL'
      '   FROM'
      '      LANCTODOCUM LAN'
      '   WHERE'
      '      LTRIM(RTRIM(LAN.OPERACAO)) = '#39'2'#39
      '   ) LDC,'
      ''
      '   PORTADORFORMA  PFO,'
      '   HISTMOVEMPTMO  HME'
      ''
      'WHERE'
      '       DOC.IDMODULO        = 15'
      '   AND DOC.RECPAG          = '#39'P'#39
      '   AND DOC.DATAPROGRAMADA  BETWEEN :PDATAINI AND :PDATAFIM'
      '   AND DOC.CODDOCUMENTO    = LDC.CODDOCUMENTO'
      '   AND DOC.CODPORTFORMA    = PFO.CODPORTFORMA'
      '   AND DOC.CODDOCUMENTO    = HME.CODDOCUMENTOPROC'
      '   AND DOC.IDFORCLI        = FAV.IDPESSOA')
    ValidateWithMask = True
    Left = 72
    Top = 224
    ParamData = <
      item
        DataType = ftDate
        Name = 'PDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAFIM'
        ParamType = ptInput
      end>
    object qryDocumentoCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object qryDocumentoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryDocumentoCODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
    end
    object qryDocumentoIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
    end
    object qryDocumentoIDMODULO: TFloatField
      FieldName = 'IDMODULO'
    end
    object qryDocumentoRECPAG: TStringField
      FieldName = 'RECPAG'
      FixedChar = True
      Size = 1
    end
    object qryDocumentoNODOCUMENTO: TFloatField
      FieldName = 'NODOCUMENTO'
    end
    object qryDocumentoCOMPLDOCUMENTO: TStringField
      FieldName = 'COMPLDOCUMENTO'
      FixedChar = True
      Size = 3
    end
    object qryDocumentoDATAVENCTO: TDateTimeField
      FieldName = 'DATAVENCTO'
    end
    object qryDocumentoSTATUS_DOC: TStringField
      FieldName = 'STATUS_DOC'
      Size = 9
    end
    object qryDocumentoOPERACAO: TStringField
      FieldName = 'OPERACAO'
      FixedChar = True
      Size = 2
    end
    object qryDocumentoNUMAPGR: TFloatField
      FieldName = 'NUMAPGR'
    end
    object qryDocumentoVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object qryDocumentoPORTADORFORMA: TStringField
      FieldName = 'PORTADORFORMA'
      Size = 50
    end
    object qryDocumentoNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
  end
  object dsDocumento: TwwDataSource
    DataSet = qryDocumento
    Left = 72
    Top = 176
  end
end
