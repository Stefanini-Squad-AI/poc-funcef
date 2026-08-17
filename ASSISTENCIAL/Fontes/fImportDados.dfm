inherited frmImportDados: TfrmImportDados
  Left = 147
  Top = 97
  BorderStyle = bsSingle
  Caption = 'Importação de Informações de Arquivo'
  ClientHeight = 388
  ClientWidth = 441
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 441
    Height = 349
    TabOrder = 2
  end
  object GroupBox1: TGroupBox [1]
    Left = 0
    Top = 0
    Width = 441
    Height = 349
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Bookman Old Style'
    Font.Style = [fsItalic]
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 15
      Top = 17
      Width = 82
      Height = 15
      Caption = 'Tipo de Layout'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 17
      Top = 200
      Width = 67
      Height = 15
      Caption = 'Associação'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 15
      Top = 101
      Width = 105
      Height = 15
      Caption = 'Campos do Layout'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbgTpLayout: TwwDBGrid
      Left = 10
      Top = 34
      Width = 423
      Height = 61
      Selected.Strings = (
        'DESCRICAO'#9'64'#9'Descrição')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = dsTpLayout
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleAlignment = taLeftJustify
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -11
      TitleFont.Name = 'Arial'
      TitleFont.Style = []
      TitleLines = 1
      TitleButtons = False
      OnDblClick = dbgTpLayoutDblClick
      IndicatorColor = icBlack
    end
    object dbgCpLayout: TwwDBGrid
      Left = 10
      Top = 116
      Width = 423
      Height = 79
      Selected.Strings = (
        'NOMECPO'#9'27'#9'Nome do Campo'
        'POSINICIAL'#9'10'#9'Pos. Inicial'
        'POSFINAL'#9'10'#9'Pos. Final'
        'FLGVALOR'#9'14'#9'Indicador de Valor')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = dsCpLayout
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      TitleAlignment = taLeftJustify
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -11
      TitleFont.Name = 'Arial'
      TitleFont.Style = []
      TitleLines = 1
      TitleButtons = False
      IndicatorColor = icBlack
    end
    object dbgLgLayout: TwwDBGrid
      Left = 11
      Top = 215
      Width = 422
      Height = 128
      Hint = 'Duplo click para e\'
      Selected.Strings = (
        'DESCASSOC'#9'64'#9'Campos Associados ao Layout')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = dsLgLayout
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
      TitleAlignment = taLeftJustify
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -11
      TitleFont.Name = 'Arial'
      TitleFont.Style = []
      TitleLines = 1
      TitleButtons = False
      IndicatorColor = icBlack
    end
  end
  inherited Dock971: TDock97
    Top = 349
    Width = 441
    inherited tb97Fundo: TToolbar97
      Left = 191
      DockPos = 191
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 23
      DockPos = 23
      inherited bbtnConfirmar: TBitBtn
        Caption = '&Importar'
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        ModalResult = 0
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 443
  end
  object qryCpLayout: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM CPLAYOUT'
      'WHERE IDLAYOUT = :PIDLAYOUT'
      'ORDER BY IDLAYOUT,IDCPLAYOUT')
    ValidateWithMask = True
    Left = 444
    Top = 93
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDLAYOUT'
        ParamType = ptUnknown
      end>
    object qryCpLayoutIDCPLAYOUT: TFloatField
      FieldName = 'IDCPLAYOUT'
      Origin = 'BASEDADOS.CPLAYOUT.IDCPLAYOUT'
    end
    object qryCpLayoutIDLAYOUT: TFloatField
      FieldName = 'IDLAYOUT'
      Origin = 'BASEDADOS.CPLAYOUT.IDLAYOUT'
    end
    object qryCpLayoutDATA: TDateTimeField
      FieldName = 'DATA'
      Origin = 'BASEDADOS.CPLAYOUT.DATA'
    end
    object qryCpLayoutNOMECPO: TStringField
      FieldName = 'NOMECPO'
      Origin = 'BASEDADOS.CPLAYOUT.NOMECPO'
    end
    object qryCpLayoutPOSINICIAL: TFloatField
      FieldName = 'POSINICIAL'
      Origin = 'BASEDADOS.CPLAYOUT.POSINICIAL'
    end
    object qryCpLayoutPOSFINAL: TFloatField
      FieldName = 'POSFINAL'
      Origin = 'BASEDADOS.CPLAYOUT.POSFINAL'
    end
    object qryCpLayoutFLGVALOR: TStringField
      FieldName = 'FLGVALOR'
      Origin = 'BASEDADOS.CPLAYOUT.FLGVALOR'
      FixedChar = True
      Size = 1
    end
    object qryCpLayoutIDMODULO: TFloatField
      FieldName = 'IDMODULO'
      Origin = 'BASEDADOS.CPLAYOUT.TRGDTINCLUSAO'
    end
    object qryCpLayoutTIPOREG: TStringField
      FieldName = 'TIPOREG'
      Origin = 'BASEDADOS.CPLAYOUT.TRGUSERINCLUSAO'
      Size = 10
    end
    object qryCpLayoutTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.CPLAYOUT.IDTABELA'
    end
    object qryCpLayoutTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.CPLAYOUT.IDMODULO'
      Size = 30
    end
  end
  object dsCpLayout: TwwDataSource
    DataSet = qryCpLayout
    Left = 475
    Top = 93
  end
  object dsTpLayout: TwwDataSource
    DataSet = qryTpLayout
    Left = 474
    Top = 56
  end
  object qryTpLayout: TwwQuery
    Active = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM TPLAYOUT'
      'ORDER BY IDLAYOUT')
    ValidateWithMask = True
    Left = 443
    Top = 56
    object qryTpLayoutDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 64
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.TPLAYOUT.DESCRICAO'
      Size = 30
    end
    object qryTpLayoutIDLAYOUT: TFloatField
      FieldName = 'IDLAYOUT'
      Origin = 'BASEDADOS.TPLAYOUT.IDLAYOUT'
      Visible = False
    end
    object qryTpLayoutTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.TPLAYOUT.TRGDTINCLUSAO'
      Visible = False
    end
    object qryTpLayoutTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.TPLAYOUT.TRGUSERINCLUSAO'
      Visible = False
      Size = 30
    end
  end
  object OpenDialog: TOpenDialog
    DefaultExt = '*.txt'
    Filter = '*.txt'
    InitialDir = 'c:\'
    Title = 'ABRIR ARQUIVO PARA IMPORTAÇÃO'
    Left = 480
    Top = 176
  end
  object qryIns: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 444
    Top = 240
  end
  object qryLgLayout: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      'LG.IDLGLAYOUT, LG.IDLAYOUT, LG.IDCPLAYOUT,'
      'LG.DESCASSOC'
      'FROM CPLAYOUT CP, LGLAYOUT LG'
      'WHERE '
      '(LG.IDLAYOUT=:PPIDLAYOUT)  AND'
      '(LG.IDCPLAYOUT = CP.IDCPLAYOUT)'
      'ORDER BY  LG.IDLGLAYOUT')
    ValidateWithMask = True
    Left = 444
    Top = 128
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PPIDLAYOUT'
        ParamType = ptUnknown
      end>
    object qryLgLayoutDESCASSOC: TStringField
      DisplayLabel = 'Campos Associados ao Layout'
      DisplayWidth = 64
      FieldName = 'DESCASSOC'
      Size = 60
    end
    object qryLgLayoutIDLGLAYOUT: TFloatField
      FieldName = 'IDLGLAYOUT'
      Visible = False
    end
    object qryLgLayoutIDLAYOUT: TFloatField
      FieldName = 'IDLAYOUT'
      Visible = False
    end
    object qryLgLayoutIDCPLAYOUT: TFloatField
      FieldName = 'IDCPLAYOUT'
      Visible = False
    end
  end
  object dsLgLayout: TwwDataSource
    DataSet = qryLgLayout
    Left = 475
    Top = 128
  end
  object qryAssoc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '             LG.IDLGLAYOUT,'
      '             LG.IDLAYOUT,'
      '             LG.IDCPLAYOUT,'
      '             LG.NOMEARQ,'
      '             LG.CAMPOARQ,'
      '             LG.TIPOARQ,'
      '             CP.TIPOREG,'
      '             CP.POSINICIAL,'
      '             CP.POSFINAL,'
      '             CP.FLGVALOR'
      ''
      '             FROM CPLAYOUT CP, LGLAYOUT LG'
      ''
      '             WHERE'
      '             (LG.IDLAYOUT=CP.IDLAYOUT) AND'
      '             (LG.IDCPLAYOUT=CP.IDCPLAYOUT)'
      ''
      '             ORDER BY LG.IDLAYOUT,LG.IDCPLAYOUT')
    ValidateWithMask = True
    Left = 444
    Top = 178
    object qryAssocIDLGLAYOUT: TFloatField
      FieldName = 'IDLGLAYOUT'
      Origin = 'BASEDADOS.LGLAYOUT.IDLGLAYOUT'
    end
    object qryAssocIDLAYOUT: TFloatField
      FieldName = 'IDLAYOUT'
      Origin = 'BASEDADOS.LGLAYOUT.IDLAYOUT'
    end
    object qryAssocIDCPLAYOUT: TFloatField
      FieldName = 'IDCPLAYOUT'
      Origin = 'BASEDADOS.LGLAYOUT.IDCPLAYOUT'
    end
    object qryAssocNOMEARQ: TStringField
      FieldName = 'NOMEARQ'
      Origin = 'BASEDADOS.LGLAYOUT.NOMEARQ'
    end
    object qryAssocCAMPOARQ: TStringField
      FieldName = 'CAMPOARQ'
      Origin = 'BASEDADOS.LGLAYOUT.CAMPOARQ'
    end
    object qryAssocTIPOARQ: TStringField
      FieldName = 'TIPOARQ'
      Origin = 'BASEDADOS.LGLAYOUT.TIPOARQ'
      FixedChar = True
      Size = 1
    end
    object qryAssocTIPOREG: TStringField
      FieldName = 'TIPOREG'
      Origin = 'BASEDADOS.CPLAYOUT.TIPOREG'
      Size = 10
    end
    object qryAssocPOSINICIAL: TFloatField
      FieldName = 'POSINICIAL'
      Origin = 'BASEDADOS.CPLAYOUT.POSINICIAL'
    end
    object qryAssocPOSFINAL: TFloatField
      FieldName = 'POSFINAL'
      Origin = 'BASEDADOS.CPLAYOUT.POSFINAL'
    end
    object qryAssocFLGVALOR: TStringField
      FieldName = 'FLGVALOR'
      Origin = 'BASEDADOS.CPLAYOUT.FLGVALOR'
      FixedChar = True
      Size = 1
    end
  end
end
