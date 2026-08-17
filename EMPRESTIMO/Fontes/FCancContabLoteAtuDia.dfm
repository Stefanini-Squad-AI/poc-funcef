inherited frmCancContabLoteAtuDia: TfrmCancContabLoteAtuDia
  Left = 269
  Top = 169
  HelpContext = 150053
  Caption = 'Desfazer Contabilização em Lote de Atualização'
  ClientWidth = 666
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 666
    inherited pgcControle: TPageControl
      Width = 666
      ActivePage = TabSheet2
      inherited TabSheet1: TTabSheet
        Caption = 'Desfazer Contabilização em Lote de Atualização [ seleção ]'
        object GroupBox3: TGroupBox
          Left = 168
          Top = 128
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
        Caption = 'Desfazer Contabilização em Lote de Atualização [ Planilha(s) ]'
        object DBgrdHistMov: TwwDBGrid
          Left = 17
          Top = 34
          Width = 624
          Height = 287
          Selected.Strings = (
            'PLNDATDIA'#9'14'#9'Data'
            'PLNCODIGO'#9'15'#9'Cód. Planilha'
            'PLNPLANIL'#9'15'#9'Nº Planilha'
            'TOTAL_CONTRATOS'#9'15'#9'Total de Contratos'
            'EFETIVADA'#9'20'#9' ')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
          DataSource = dsPlanilha
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
          IndicatorColor = icBlack
        end
        object Panel3: TPanel
          Left = 16
          Top = 8
          Width = 625
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Planilhas'
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
        Width = 595
        Caption = 'Desfazer Contabilização em Lote de Atualização [ seleção ]'
      end
    end
  end
  inherited Dock971: TDock97
    Width = 666
    inherited tb97Fundo: TToolbar97
      inherited bbtnAjuda: TmaHelpBitBtn
        ClickHelpContext = 150041
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 979
    Top = 3
    TargetsData = (
      1
      2
      (
        ''
        'Filter'
        0)
      (
        ''
        'DisplayLabel'
        0))
  end
  object dsPlanilha: TwwDataSource
    DataSet = wqryPlanilhas
    Left = 456
    Top = 74
  end
  object wqryPlanilhas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PLN.PLNCODIGO,'
      '   PLN.PLNPLANIL,'
      '   PLN.PLNDATDIA,'
      '   PLN.PERNUMERO,'
      '   PLN.PEREXERCICIO,'
      '   PLN.IDMODULO,'
      '   PLN.IDPESSOA,'
      '   PLN.PLNEFETIVADO,'
      '   DECODE(PLN.PLNEFETIVADO, '#39'S'#39', '#39'efetivada'#39', '#39#39') AS EFETIVADA,'
      '   COUNT(DISTINCT HME.IDCONTRATOEMPTMO) AS TOTAL_CONTRATOS'
      'FROM'
      '   PLANILHA PLN'
      
        '   JOIN HMECONTABILIZACAO CONTAB ON CONTAB.PLNCODIGO = PLN.PLNCO' +
        'DIGO'
      
        '   JOIN HMEATUDIARIA HME ON HME.IDHISTMOVEMPTMO = CONTAB.IDHISTM' +
        'OVEMPTMO'
      'WHERE'
      '       PLN.IDPESSOA   = :PIDEMPRESAPROP'
      '   AND PLN.IDMODULO   = 15'
      '   AND PLN.PLNDATDIA  BETWEEN :PDATAINI AND :PDATAFIM'
      'GROUP BY'
      '   PLN.PLNCODIGO,'
      '   PLN.PLNPLANIL,'
      '   PLN.PLNDATDIA,'
      '   PLN.PERNUMERO,'
      '   PLN.PEREXERCICIO,'
      '   PLN.IDMODULO,'
      '   PLN.IDPESSOA,'
      '   PLN.PLNEFETIVADO'
      'UNION ALL'
      'SELECT'
      '   PLN.PLNCODIGO,'
      '   PLN.PLNPLANIL,'
      '   PLN.PLNDATDIA,'
      '   PLN.PERNUMERO,'
      '   PLN.PEREXERCICIO,'
      '   PLN.IDMODULO,'
      '   PLN.IDPESSOA,'
      '   PLN.PLNEFETIVADO,'
      '   DECODE(PLN.PLNEFETIVADO, '#39'S'#39', '#39'efetivada'#39', '#39#39') AS EFETIVADA,'
      '   COUNT(DISTINCT HME.IDCONTRATOEMPTMO) AS TOTAL_CONTRATOS'
      'FROM'
      '   PLANILHA PLN'
      
        '   JOIN HMECONTABILIZACAO CONTAB ON CONTAB.PLNCODIGOESTORNO = PL' +
        'N.PLNCODIGO'
      
        '   JOIN HMEATUDIARIA HME ON HME.IDHISTMOVEMPTMO = CONTAB.IDHISTM' +
        'OVEMPTMO'
      'WHERE'
      '       PLN.IDPESSOA   = :PIDEMPRESAPROP'
      '   AND PLN.IDMODULO   = 15'
      '   AND PLN.PLNDATDIA  BETWEEN :PDATAINI AND :PDATAFIM'
      'GROUP BY'
      '   PLN.PLNCODIGO,'
      '   PLN.PLNPLANIL,'
      '   PLN.PLNDATDIA,'
      '   PLN.PERNUMERO,'
      '   PLN.PEREXERCICIO,'
      '   PLN.IDMODULO,'
      '   PLN.IDPESSOA,'
      '   PLN.PLNEFETIVADO  '
      'ORDER BY'
      '   PLNDATDIA, PLNPLANIL')
    UpdateObject = updPlanilhas
    ValidateWithMask = True
    Left = 519
    Top = 74
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PIDEMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PDATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PDATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PIDEMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PDATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PDATAFIM'
        ParamType = ptUnknown
      end>
    object qryPlanilhasPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
    end
    object qryPlanilhasPLNDATDIA: TDateTimeField
      FieldName = 'PLNDATDIA'
    end
    object qryPlanilhasPLNPLANIL: TFloatField
      FieldName = 'PLNPLANIL'
    end
    object qryPlanilhasTOTAL_CONTRATOS: TFloatField
      FieldName = 'TOTAL_CONTRATOS'
    end
  end
  object updPlanilhas: TUpdateSQL
    Left = 492
    Top = 147
  end
end
