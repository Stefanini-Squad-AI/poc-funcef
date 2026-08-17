inherited FrmHistIR: TFrmHistIR 
  Left = 348
  Top = 114
  BorderIcons = []
  Caption = 'Histórico de Dependente IR'
  ClientHeight = 363
  ClientWidth = 313
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 313
    Height = 324
    object dbGridHistIR: TwwDBGrid
      Left = 1
      Top = 1
      Width = 311
      Height = 322
      Selected.Strings = (
        'DTINICIO'#9'18'#9'Dara de Início'
        'DTFINAL'#9'18'#9'Data de Término')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = dsHistIR
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      ReadOnly = True
      TabOrder = 0
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      OnDblClick = dbGridHistIRDblClick
      IndicatorColor = icBlack
    end
  end
  inherited Dock971: TDock97
    Top = 324
    Width = 313
    inherited tb97Fundo: TToolbar97
      Left = 169
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  object qryHistIR: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT D.Inicioimpostor AS DTINICIO , D.Fimimpostor AS DTFINAL'
      'FROM DEPENTIT D '
      'WHERE D.IDPESSOA = :IDPESSOA')
    ValidateWithMask = True
    Left = 136
    Top = 136
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end>
    object qryHistIRDTINICIO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DTINICIO'
      Origin = 'BASEDADOS.DEPENTIT.INICIOIMPOSTOR'
    end
    object qryHistIRDTFINAL: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DTFINAL'
      Origin = 'BASEDADOS.DEPENTIT.FIMIMPOSTOR'
    end
  end
  object dsHistIR: TwwDataSource
    DataSet = qryHistIR
    Left = 68
    Top = 140
  end
end
