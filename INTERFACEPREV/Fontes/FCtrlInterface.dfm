inherited frmCtrlinterface: TfrmCtrlinterface
  Left = 312
  Top = 150
  HelpContext = 320028
  Caption = 'Controle de Cobranças e Pagamentos por Lote '
  ClientHeight = 450
  ClientWidth = 777
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 777
    Height = 411
    object Splitter1: TSplitter
      Left = 207
      Top = 119
      Width = 6
      Height = 291
      Cursor = crHSplit
    end
    object pnlTitulos: TPanel
      Left = 1
      Top = 1
      Width = 775
      Height = 118
      Align = alTop
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Label1: TLabel
        Left = 16
        Top = 40
        Width = 35
        Height = 13
        Caption = 'Módulo'
      end
      object StaticText1: TStaticText
        Left = 21
        Top = 89
        Width = 136
        Height = 27
        Caption = 'Patrocinadoras'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -19
        Font.Name = 'Bookman Old Style'
        Font.Style = [fsItalic]
        ParentColor = False
        ParentFont = False
        TabOrder = 0
      end
      object grplegenda: TGroupBox
        Left = 220
        Top = 0
        Width = 555
        Height = 118
        Align = alRight
        Caption = 'Situação do Lote'
        TabOrder = 1
        object Shape4: TShape
          Left = 8
          Top = 30
          Width = 16
          Height = 12
          Brush.Color = 16777124
        end
        object Label11: TLabel
          Left = 32
          Top = 29
          Width = 230
          Height = 13
          Caption = 'Enviado para Módulo de Cobrança / Pagamento'
          WordWrap = True
        end
        object Shape5: TShape
          Left = 282
          Top = 31
          Width = 16
          Height = 12
          Brush.Color = 13303807
        end
        object Shape6: TShape
          Left = 8
          Top = 60
          Width = 16
          Height = 12
          Brush.Color = clGray
        end
        object Label14: TLabel
          Left = 307
          Top = 31
          Width = 241
          Height = 26
          AutoSize = False
          Caption = 'Recebido pelo Módulo de Cobrança / Pagamento'
          WordWrap = True
        end
        object Label12: TLabel
          Left = 33
          Top = 60
          Width = 224
          Height = 13
          Caption = 'Emitido pelo Módulo de Cobrança / Pagamento'
          WordWrap = True
        end
        object Shape1: TShape
          Left = 282
          Top = 61
          Width = 16
          Height = 12
        end
        object Label16: TLabel
          Left = 307
          Top = 61
          Width = 189
          Height = 26
          AutoSize = False
          Caption = 'Processado pelo Módulo de Origem'
          WordWrap = True
        end
      end
      object CheckBox1: TCheckBox
        Left = 16
        Top = 7
        Width = 150
        Height = 17
        Caption = 'Legenda / Cores    '
        Checked = True
        State = cbChecked
        TabOrder = 2
        OnClick = CheckBox1Click
      end
      object cmbmodulo: TComboBox
        Left = 16
        Top = 56
        Width = 189
        Height = 21
        ItemHeight = 13
        TabOrder = 3
        OnChange = cmbmoduloChange
        Items.Strings = (
          'Assistencial'
          'Previdenciário'
          'Empréstimo'
          'Folha de Benefícios')
      end
    end
    object Panel1: TPanel
      Left = 213
      Top = 119
      Width = 563
      Height = 291
      Align = alClient
      TabOrder = 1
      object wwDBGrid1: TwwDBGrid
        Left = 1
        Top = 1
        Width = 561
        Height = 289
        Selected.Strings = (
          'IDLOTE'#9'13'#9'Número do Envio '
          'MESREFERENCIA'#9'9'#9'Mês de ~Referência  '
          'FLGPREPARADO'#9'8'#9'Preparado'
          'DATAPREPARO'#9'10'#9'Data do~Preparo'
          'FLGIDATMP'#9'7'#9'Enviado'
          'DATAIDATMP'#9'10'#9'Data do~Envio '
          'FLGIDAINTERFACE'#9'8'#9'Emitido'
          'DATAIDAINTERFACE'#9'11'#9'Data de Emissão '
          'FLGVOLTATMP'#9'5'#9'Recebido '
          'DATAVOLTATMP'#9'10'#9'Data do ~Recebimento '
          'NUMREG'#9'16'#9'Número de Itens ~no Lote  '#9'F'
          'VLRTOTAL'#9'10'#9'Valor Total ~do Lote'
          'DESCRICAO'#9'200'#9'Descrição')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 1
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dsAssist
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        ReadOnly = True
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 2
        TitleButtons = False
        OnCalcCellColors = wwDBGrid1CalcCellColors
        IndicatorColor = icBlack
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 119
      Width = 206
      Height = 291
      Align = alLeft
      TabOrder = 2
      object dbgrdPatro: TwwDBGrid
        Left = 1
        Top = 1
        Width = 204
        Height = 289
        Selected.Strings = (
          'NOME'#9'60'#9'NOME')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        ShowVertScrollBar = False
        Align = alClient
        DataSource = dsPatro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgEditing, dgIndicator, dgColumnResize, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        ParentFont = False
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
  inherited Dock971: TDock97
    Top = 411
    Width = 777
    inherited tb97Fundo: TToolbar97
      Left = 504
      DockPos = 504
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 155
  end
  object dsPatro: TwwDataSource
    AutoEdit = False
    DataSet = qryPatro
    Left = 148
    Top = 300
  end
  object qryPatro: TwwQuery
    AfterScroll = qryPatroAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.IDPESSOA, P.NOME'
      'FROM   PESSOA P, PATRO PT'
      'WHERE  P.IDPESSOA = PT.IDPESSOA'
      'AND    PT.IDFUNDACAO = :IDFUNDACAO'
      ' ')
    ValidateWithMask = True
    Left = 148
    Top = 354
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object dsAssist: TwwDataSource
    DataSet = qryAssist
    Left = 268
    Top = 288
  end
  object qryAssist: TwwQuery
    BeforeOpen = qryAssistBeforeOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDLOTE, FLGIDATMP, IDPESSOA,  '
      '              FLGVOLTATMP, FLGIDAINTERFACE, FLGVOLTAINTERFACE, '
      '              FLGEMITIUCC, DATAIDATMP, DATAVOLTATMP, '
      
        '              DATAIDAINTERFACE,  DATAVOLTAINTERFA,  DATAEMITIUCC' +
        ', '
      
        '              NUMREG, VLRTOTAL, MESREFERENCIA, TIPO, FLGPREPARAD' +
        'O,'
      '              DATAPREPARO, DESCRICAO, FLGATRASODEVOL'
      'FROM CTRLINTERFACE '
      'WHERE IDPESSOA = :IDPESSOA '
      'AND TIPO =  :tipo '
      'ORDER BY IDLOTE DESC')
    ControlType.Strings = (
      'FLGIDATMP;CheckBox;1;0'
      'FLGVOLTATMP;CheckBox;1;0'
      'FLGIDAINTERFACE;CheckBox;1;0'
      'FLGVOLTAINTERFACE;CheckBox;1;0'
      'FLGEMITIUCC;CheckBox;1;0'
      'FLGPREPARADO;CheckBox;1;0'
      'FLGATRASODEVOL;CheckBox;1;0')
    ValidateWithMask = True
    Left = 271
    Top = 340
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'tipo'
        ParamType = ptUnknown
      end>
    object qryAssistIDLOTE: TFloatField
      DisplayLabel = 'Número do Envio '
      DisplayWidth = 13
      FieldName = 'IDLOTE'
      Origin = 'CTRLINTERFACE.IDLOTE'
    end
    object qryAssistMESREFERENCIA: TStringField
      DisplayLabel = 'Mês de ~Referência  '
      DisplayWidth = 9
      FieldName = 'MESREFERENCIA'
      Origin = 'CTRLINTERFACE.MESREFERENCIA'
      Size = 7
    end
    object qryAssistFLGPREPARADO: TFloatField
      DisplayLabel = 'Preparado'
      DisplayWidth = 8
      FieldName = 'FLGPREPARADO'
    end
    object qryAssistDATAPREPARO: TDateTimeField
      DisplayLabel = 'Data do~Preparo'
      DisplayWidth = 10
      FieldName = 'DATAPREPARO'
    end
    object qryAssistFLGIDATMP: TFloatField
      DisplayLabel = 'Enviado'
      DisplayWidth = 7
      FieldName = 'FLGIDATMP'
      Origin = 'CTRLINTERFACE.FLGIDATMP'
    end
    object qryAssistDATAIDATMP: TDateTimeField
      DisplayLabel = 'Data do~Envio '
      DisplayWidth = 10
      FieldName = 'DATAIDATMP'
      Origin = 'CTRLINTERFACE.DATAIDATMP'
    end
    object qryAssistFLGIDAINTERFACE: TFloatField
      DisplayLabel = 'Emitido'
      DisplayWidth = 8
      FieldName = 'FLGIDAINTERFACE'
      Origin = 'CTRLINTERFACE.FLGIDAINTERFACE'
    end
    object qryAssistDATAIDAINTERFACE: TDateTimeField
      DisplayLabel = 'Data de Emissão '
      DisplayWidth = 11
      FieldName = 'DATAIDAINTERFACE'
      Origin = 'CTRLINTERFACE.DATAIDAINTERFACE'
    end
    object qryAssistFLGVOLTATMP: TFloatField
      DisplayLabel = 'Recebido '
      DisplayWidth = 5
      FieldName = 'FLGVOLTATMP'
      Origin = 'CTRLINTERFACE.FLGVOLTATMP'
    end
    object qryAssistDATAVOLTATMP: TDateTimeField
      DisplayLabel = 'Data do ~Recebimento '
      DisplayWidth = 10
      FieldName = 'DATAVOLTATMP'
      Origin = 'CTRLINTERFACE.DATAVOLTATMP'
    end
    object qryAssistNUMREG: TFloatField
      DisplayLabel = 'Número de Itens ~no Lote  '
      DisplayWidth = 16
      FieldName = 'NUMREG'
      Origin = 'CTRLINTERFACE.NUMREG'
    end
    object qryAssistVLRTOTAL: TFloatField
      DisplayLabel = 'Valor Total ~do Lote'
      DisplayWidth = 10
      FieldName = 'VLRTOTAL'
      Origin = 'CTRLINTERFACE.VLRTOTAL'
      DisplayFormat = '###,###,###,###,###.00'
    end
    object qryAssistDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 200
      FieldName = 'DESCRICAO'
      Size = 200
    end
    object qryAssistFLGVOLTAINTERFACE: TFloatField
      DisplayLabel = 'Voltou da ~Cobrança '
      DisplayWidth = 8
      FieldName = 'FLGVOLTAINTERFACE'
      Origin = 'CTRLINTERFACE.FLGVOLTAINTERFACE'
      Visible = False
    end
    object qryAssistFLGATRASODEVOL: TStringField
      DisplayWidth = 15
      FieldName = 'FLGATRASODEVOL'
      Visible = False
      Size = 1
    end
    object qryAssistIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'CTRLINTERFACE.IDPESSOA'
      Visible = False
    end
    object qryAssistFLGEMITIUCC: TFloatField
      FieldName = 'FLGEMITIUCC'
      Origin = 'CTRLINTERFACE.FLGEMITIUCC'
      Visible = False
    end
    object qryAssistDATAEMITIUCC: TDateTimeField
      FieldName = 'DATAEMITIUCC'
      Origin = 'CTRLINTERFACE.DATAEMITIUCC'
      Visible = False
    end
    object qryAssistTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'CTRLINTERFACE.TIPO'
      Visible = False
      Size = 1
    end
    object qryAssistDATAVOLTAINTERFA: TDateTimeField
      FieldName = 'DATAVOLTAINTERFA'
      Origin = 'CTRLINTERFACE.DATAVOLTAINTERFA'
      Visible = False
    end
  end
end
