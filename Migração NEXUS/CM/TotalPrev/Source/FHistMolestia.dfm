inherited FrmHistMolestia: TFrmHistMolestia 
  Left = 816
  Top = 125
  BorderIcons = []
  Caption = 'Histórico Moléstia Grave '
  ClientHeight = 359
  ClientWidth = 311
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 311
    Height = 320
    object dbGridMolestia: TwwDBGrid
      Left = 1
      Top = 1
      Width = 309
      Height = 318
      Selected.Strings = (
        'DTINICIO'#9'18'#9'Data de Início'
        'DTFINAL'#9'18'#9'Data de Término')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = dsMolestia
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
      OnDblClick = dbGridMolestiaDblClick
      IndicatorColor = icBlack
    end
  end
  inherited Dock971: TDock97
    Top = 320
    Width = 311
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
  object qryMolestia: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select H.IDPESSOA, H.DTINICIO, H.DTFINAL'
      'From HSTMOLESTIAGRAVE H'
      'Where H.Idpessoa = :IDPESSOA')
    ValidateWithMask = True
    Left = 100
    Top = 100
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptInput
      end>
    object qryMolestiaDTINICIO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DTINICIO'
      Origin = 'BASEDADOS.HSTMOLESTIAGRAVE.DTINICIO'
    end
    object qryMolestiaDTFINAL: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DTFINAL'
      Origin = 'BASEDADOS.HSTMOLESTIAGRAVE.DTFINAL'
    end
  end
  object dsMolestia: TwwDataSource
    DataSet = qryMolestia
    Left = 56
    Top = 96
  end
end
