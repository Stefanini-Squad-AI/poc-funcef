inherited FrmconsultaRegra: TFrmconsultaRegra
  Left = 143
  Top = 112
  BorderStyle = bsDialog
  Caption = 'Consulta de Regras'
  ClientHeight = 369
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 330
    object Label9: TLabel
      Left = 15
      Top = 16
      Width = 33
      Height = 13
      Caption = 'Nome'
    end
    object Label2: TLabel
      Left = 439
      Top = 18
      Width = 40
      Height = 13
      Caption = 'Código'
    end
    object Label1: TLabel
      Left = 312
      Top = 64
      Width = 26
      Height = 13
      Caption = 'Tipo'
    end
    object Label3: TLabel
      Left = 16
      Top = 64
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object wwlkpcmbRegra: TwwDBLookupCombo
      Left = 14
      Top = 32
      Width = 411
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOMEREGRA'#9'60'#9'Nome da Regra'
        'IDREGRA'#9'10'#9'Código da Regra')
      LookupTable = wwQueryregra
      LookupField = 'NOMEREGRA'
      Options = [loTitles]
      ReadOnly = True
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
    end
    object wwDBEdit1: TwwDBEdit
      Left = 440
      Top = 32
      Width = 73
      Height = 21
      DataField = 'IDREGRA'
      DataSource = wwDataSource1
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object wwDBEdit2: TwwDBEdit
      Left = 312
      Top = 80
      Width = 203
      Height = 21
      DataField = 'DESCREGRA'
      DataSource = wwDataSource1
      TabOrder = 2
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object DBMemo1: TDBMemo
      Left = 16
      Top = 80
      Width = 281
      Height = 73
      DataField = 'DESCRICAOREGRA'
      DataSource = wwDataSource1
      TabOrder = 3
    end
    object DBGrid1: TDBGrid
      Left = 16
      Top = 164
      Width = 497
      Height = 149
      DataSource = wwDataSource2
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 4
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      Columns = <
        item
          Expanded = False
          FieldName = 'IDALGORITMODAREG'
          Title.Caption = 'Passo Nº'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAOALGORIT'
          Title.Caption = 'Descrição'
          Width = 415
          Visible = True
        end>
    end
    object DBCheckBox1: TDBCheckBox
      Left = 312
      Top = 120
      Width = 97
      Height = 17
      Caption = 'Publicada'
      DataField = 'PUBLICADA'
      DataSource = wwDataSource1
      TabOrder = 5
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
  end
  inherited Dock971: TDock97
    Top = 330
    inherited tb97Fundo: TToolbar97
      inherited bbtnSair: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Visible = False
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnSairClick
      end
    end
  end
  object wwQueryregra: TwwQuery
    AfterScroll = wwQueryregraAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'select regra.idtiporegra, regra.IDREGRA, regra.nomeregra, regra.' +
        ' descricaoregra, '
      '          regra.publicada, tiporegra.descregra'
      'from regra, tiporegra'
      'where regra.idtiporegra = tiporegra.idtiporegra'
      'order by nomeregra')
    ValidateWithMask = True
    Left = 400
    Top = 112
    object wwQueryregraIDREGRA: TFloatField
      FieldName = 'IDREGRA'
      Origin = 'REGRA.IDREGRA'
    end
    object wwQueryregraNOMEREGRA: TStringField
      FieldName = 'NOMEREGRA'
      Origin = 'REGRA.NOMEREGRA'
      Size = 60
    end
    object wwQueryregraIDTIPOREGRA: TFloatField
      FieldName = 'IDTIPOREGRA'
      Origin = 'REGRA.IDTIPOREGRA'
    end
    object wwQueryregraDESCRICAOREGRA: TMemoField
      FieldName = 'DESCRICAOREGRA'
      Origin = 'REGRA.DESCRICAOREGRA'
      BlobType = ftMemo
      Size = 1
    end
    object wwQueryregraPUBLICADA: TFloatField
      FieldName = 'PUBLICADA'
      Origin = 'REGRA.PUBLICADA'
    end
    object wwQueryregraDESCREGRA: TStringField
      FieldName = 'DESCREGRA'
      Origin = 'TIPOREGRA.DESCREGRA'
      Size = 60
    end
  end
  object wwDataSource1: TwwDataSource
    DataSet = wwQueryregra
    OnDataChange = wwDataSource1DataChange
    Left = 432
    Top = 112
  end
  object wwQrypassos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDALGORITMODAREG, DESCRICAOALGORIT '
      'FROM ALGREGRA'
      'WHERE IDREGRA =:vREGRA'
      'ORDER BY IDALGORITMODAREG')
    ValidateWithMask = True
    Left = 400
    Top = 144
    ParamData = <
      item
        DataType = ftInteger
        Name = 'vREGRA'
        ParamType = ptUnknown
      end>
  end
  object wwDataSource2: TwwDataSource
    DataSet = wwQrypassos
    Left = 432
    Top = 144
  end
end
