inherited frmConsHistRecEmp: TfrmConsHistRecEmp
  Left = 19
  Top = 194
  BorderIcons = []
  Caption = 'Histórico de Recebimento'
  ClientHeight = 256
  ClientWidth = 765
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 765
    Height = 217
    object tsetResult: TTabSet
      Left = 5
      Top = 193
      Width = 755
      Height = 19
      Cursor = crArrow
      Align = alBottom
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Tabs.Strings = (
        'Parcelas'
        'Itens de Recebimento'
        'Itens de Despesa')
      OnClick = tsetResultClick
    end
    object grpResultado: TGroupBox
      Left = 5
      Top = 5
      Width = 755
      Height = 188
      Align = alClient
      Caption = 'Resultado'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Bookman Old Style'
      Font.Style = [fsItalic]
      ParentFont = False
      TabOrder = 1
      object Shape1: TShape
        Left = 657
        Top = 69
        Width = 17
        Height = 14
        Brush.Color = clNavy
      end
      object Shape2: TShape
        Left = 657
        Top = 88
        Width = 17
        Height = 14
        Brush.Color = clSilver
      end
      object Shape3: TShape
        Left = 657
        Top = 49
        Width = 17
        Height = 14
      end
      object Shape8: TShape
        Left = 657
        Top = 126
        Width = 17
        Height = 14
        Brush.Color = 16768443
      end
      object Shape4: TShape
        Left = 657
        Top = 153
        Width = 17
        Height = 14
        Brush.Color = 9812223
      end
      object Shape9: TShape
        Left = 657
        Top = 107
        Width = 17
        Height = 14
        Brush.Color = clMaroon
      end
      object Label4: TLabel
        Left = 678
        Top = 124
        Width = 55
        Height = 26
        Caption = 'Divergente tratada'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object Label5: TLabel
        Left = 678
        Top = 152
        Width = 55
        Height = 26
        Caption = 'Divergente não tratada'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object Panel1: TPanel
        Left = 2
        Top = 25
        Width = 647
        Height = 160
        BevelOuter = bvNone
        Caption = 'Panel1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object dbgrdResultado3: TwwDBGrid
          Left = 0
          Top = 0
          Width = 647
          Height = 161
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alTop
          DataSource = wwdsItemDesp
          EditCalculated = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
          ParentFont = False
          TabOrder = 2
          TitleAlignment = taCenter
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 3
          TitleButtons = False
          OnCalcCellColors = dbgrdResultado3CalcCellColors
          IndicatorColor = icBlack
        end
        object dbgrdResultado2: TwwDBGrid
          Left = -8
          Top = 0
          Width = 656
          Height = 161
          Selected.Strings = (
            'ANOMESVENC'#9'9'#9'Mês de ~Referência'
            'NOMEITEMRECCRED'#9'27'#9'Item de Recebimento'
            'DATAPREVRECCRED'#9'12'#9'Data ~Prevista'
            'DATAREALRECCRED'#9'12'#9'Data de ~Recebimento'
            'VALRECCRED'#9'12'#9'Valor')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = wwdsItemRec
          EditCalculated = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
          ParentFont = False
          TabOrder = 1
          TitleAlignment = taCenter
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 3
          TitleButtons = False
          OnCalcCellColors = dbgrdResultado2CalcCellColors
          IndicatorColor = icBlack
        end
        object dbgrdResultado: TwwDBGrid
          Left = 0
          Top = 0
          Width = 647
          Height = 161
          Hint = 'Utilize clique duplo para efetivar recebimento manual.'
          Selected.Strings = (
            'MESREF'#9'9'#9'Mês de ~Referência'
            'DATAPREVREC'#9'11'#9'Data ~Prevista'
            'VALPREVREC'#9'11'#9'Valor'
            'CODOPERACAO'#9'12'#9'Operação'
            'DATAREALREC'#9'12'#9'Data de ~Recebimento'
            'VALREALREC'#9'11'#9'Valor'
            'DATAOPERACAO'#9'11'#9'Data da ~Operação'
            'SALDODEV'#9'13'#9'Saldo Devedor')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = ds
          EditCalculated = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          TitleAlignment = taCenter
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 3
          TitleButtons = False
          OnCalcCellColors = dbgrdResultadoCalcCellColors
          IndicatorColor = icBlack
        end
      end
      object StaticText1: TStaticText
        Left = 678
        Top = 69
        Width = 67
        Height = 17
        Caption = 'Em cobrança'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object StaticText2: TStaticText
        Left = 678
        Top = 89
        Width = 29
        Height = 17
        Caption = 'Pago'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object StaticText3: TStaticText
        Left = 678
        Top = 48
        Width = 44
        Height = 17
        Caption = 'A cobrar'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object StaticText4: TStaticText
        Left = 658
        Top = 17
        Width = 89
        Height = 27
        Caption = 'Legenda:'
        TabOrder = 4
      end
      object StaticText11: TStaticText
        Left = 678
        Top = 107
        Width = 51
        Height = 17
        Caption = 'Não pago'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
    end
  end
  inherited Dock971: TDock97
    Top = 217
    Width = 765
    inherited tb97Fundo: TToolbar97
      Left = 599
      DockPos = 599
    end
  end
  object wwqryItemDesp: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select A.ANOMESVENC, A.DATAPREVDESPCRED,  A.DATAREALDESPCRED,'
      '           A.VALDESPCRED, B.NOMEITEMDESP'
      'From HISTDESPCREDMUT A, ITEMDESPCRED B'
      'Where A.CODITEMDESPCRED = B.CODITEMDESPCRED'
      '   And  A.IDCONTRCREDMUT = :IDCONTRCREDMUT'
      'Order by A.ANOMESVENC, B.NOMEITEMDESP')
    PictureMasks.Strings = (
      
        'VALDESPCRED'#9'{{{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[' +
        '#][#]]],({{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[#][#' +
        ']]]),[-]{{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[#][#]' +
        ']]}'#9'T'#9'T')
    ValidateWithMask = True
    Left = 277
    Top = 104
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDCONTRCREDMUT'
        ParamType = ptUnknown
      end>
    object wwqryItemDespANOMESVENC: TStringField
      DisplayLabel = 'Mês de ~Referência'
      DisplayWidth = 9
      FieldName = 'ANOMESVENC'
      Origin = 'HISTDESPCREDMUT.ANOMESVENC'
      Size = 7
    end
    object wwqryItemDespNOMEITEMDESP: TStringField
      DisplayLabel = 'Item de Despesa'
      DisplayWidth = 27
      FieldName = 'NOMEITEMDESP'
      Origin = 'ITEMDESPCRED.NOMEITEMDESP'
      Size = 40
    end
    object wwqryItemDespDATAPREVDESPCRED: TDateTimeField
      DisplayLabel = 'Data ~Prevista'
      DisplayWidth = 12
      FieldName = 'DATAPREVDESPCRED'
      Origin = 'HISTDESPCREDMUT.DATAPREVDESPCRED'
    end
    object wwqryItemDespDATAREALDESPCRED: TDateTimeField
      DisplayLabel = 'Data de ~Recebimento'
      DisplayWidth = 12
      FieldName = 'DATAREALDESPCRED'
      Origin = 'HISTDESPCREDMUT.DATAREALDESPCRED'
    end
    object wwqryItemDespVALDESPCRED: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 12
      FieldName = 'VALDESPCRED'
      Origin = 'HISTDESPCREDMUT.VALDESPCRED'
      DisplayFormat = '###,###,##0.00'
    end
  end
  object wwdsItemDesp: TwwDataSource
    DataSet = wwqryItemDesp
    Left = 280
    Top = 160
  end
  object wwdsItemRec: TwwDataSource
    DataSet = wwqryItemRec
    Left = 181
    Top = 152
  end
  object wwqryItemRec: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select A.ANOMESVENC, A.DATAPREVRECCRED,  A.DATAREALRECCRED,'
      '           A.VALRECCRED, A.SALDORECEB, B.NOMEITEMRECCRED'
      'From HISTRECCREDMUT A,  ITEMRECEBCRED B'
      'Where A.CODITEMRECCRED = B.CODITEMRECCRED'
      'And  A.IDCONTRCREDMUT = :IDCONTRCREDMUT'
      'Order by A.ANOMESVENC, B.NOMEITEMRECCRED')
    ValidateWithMask = True
    Left = 181
    Top = 104
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDCONTRCREDMUT'
        ParamType = ptUnknown
      end>
    object wwqryItemRecANOMESVENC: TStringField
      DisplayLabel = 'Mês de ~Referência'
      DisplayWidth = 9
      FieldName = 'ANOMESVENC'
      Origin = 'HISTRECCREDMUT.ANOMESVENC'
      Size = 7
    end
    object wwqryItemRecNOMEITEMRECCRED: TStringField
      DisplayLabel = 'Item de Recebimento'
      DisplayWidth = 27
      FieldName = 'NOMEITEMRECCRED'
      Origin = 'ITEMRECEBCRED.NOMEITEMRECCRED'
      Size = 40
    end
    object wwqryItemRecDATAPREVRECCRED: TDateTimeField
      DisplayLabel = 'Data ~Prevista'
      DisplayWidth = 12
      FieldName = 'DATAPREVRECCRED'
      Origin = 'HISTRECCREDMUT.DATAPREVRECCRED'
    end
    object wwqryItemRecDATAREALRECCRED: TDateTimeField
      DisplayLabel = 'Data de ~Recebimento'
      DisplayWidth = 12
      FieldName = 'DATAREALRECCRED'
      Origin = 'HISTRECCREDMUT.DATAREALRECCRED'
    end
    object wwqryItemRecVALRECCRED: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 12
      FieldName = 'VALRECCRED'
      Origin = 'HISTRECCREDMUT.VALRECCRED'
      DisplayFormat = '###,###,##0.00'
    end
    object wwqryItemRecSALDORECEB: TFloatField
      DisplayLabel = 'Saldo'
      DisplayWidth = 15
      FieldName = 'SALDORECEB'
      Origin = 'HISTRECCREDMUT.SALDORECEB'
      Visible = False
      DisplayFormat = '###,###,##0.00'
    end
  end
  object wwqryParcelas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select MESREF, DATAPREVREC, VALPREVREC, DATAREALREC, '
      '            VALREALREC,  IDOPERACAO,'
      
        '            decode(CODOPERACAO,'#39'I'#39','#39'Normal'#39','#39'D'#39','#39'Devolução'#39','#39'M'#39',' +
        #39'Manual'#39', '#39'A'#39' ,'#39'Atraso'#39','#39'T'#39','#39'Automático'#39','#39'E'#39','#39'Estorno'#39') CODOPERA' +
        'CAO, '
      '           DATAOPERACAO, IDCONTRCREDMUT, SALDODEV , FLGFOLHA'
      'From VALEFETREC'
      'Where IDCONTRCREDMUT = :IDCONTRCREDMUT'
      'Order by MESREF'
      '')
    ValidateWithMask = True
    Left = 107
    Top = 108
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDCONTRCREDMUT'
        ParamType = ptUnknown
      end>
    object wwqryParcelasMESREF: TStringField
      DisplayLabel = 'Mês de ~Referência'
      DisplayWidth = 9
      FieldName = 'MESREF'
      Size = 7
    end
    object wwqryParcelasDATAPREVREC: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Data ~Prevista'
      DisplayWidth = 11
      FieldName = 'DATAPREVREC'
      Origin = 'VALEFETREC.DATAPREVREC'
    end
    object wwqryParcelasVALPREVREC: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 11
      FieldName = 'VALPREVREC'
      Origin = 'VALEFETREC.VALPREVREC'
      DisplayFormat = '###,###,##0.00'
    end
    object wwqryParcelasCODOPERACAO: TStringField
      DisplayLabel = 'Operação'
      DisplayWidth = 12
      FieldName = 'CODOPERACAO'
      Size = 10
    end
    object wwqryParcelasDATAREALREC: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Data de ~Recebimento'
      DisplayWidth = 12
      FieldName = 'DATAREALREC'
      Origin = 'VALEFETREC.DATAREALREC'
    end
    object wwqryParcelasVALREALREC: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 11
      FieldName = 'VALREALREC'
      Origin = 'VALEFETREC.VALREALREC'
      DisplayFormat = '###,###,##0.00'
    end
    object wwqryParcelasDATAOPERACAO: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Data da ~Operação'
      DisplayWidth = 11
      FieldName = 'DATAOPERACAO'
      Origin = 'VALEFETREC.DATAOPERACAO'
    end
    object wwqryParcelasSALDODEV: TFloatField
      DisplayLabel = 'Saldo Devedor'
      DisplayWidth = 13
      FieldName = 'SALDODEV'
      DisplayFormat = '###,###,##0.00'
    end
    object wwqryParcelasIDCONTRCREDMUT: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONTRCREDMUT'
      Visible = False
    end
    object wwqryParcelasFLGFOLHA: TFloatField
      FieldName = 'FLGFOLHA'
      Visible = False
    end
    object wwqryParcelasIDOPERACAO: TFloatField
      FieldName = 'IDOPERACAO'
      Visible = False
    end
  end
  object ds: TwwDataSource
    AutoEdit = False
    DataSet = wwqryParcelas
    Left = 108
    Top = 160
  end
end
