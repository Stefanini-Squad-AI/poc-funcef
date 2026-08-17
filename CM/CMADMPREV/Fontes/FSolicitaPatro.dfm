inherited frmSolicitaPatro: TfrmSolicitaPatro
  Left = 306
  Top = 119
  Caption = 'Selecione a Patrocinadora desejada'
  ClientWidth = 358
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 358
    object StaticText2: TStaticText
      Left = 10
      Top = 13
      Width = 136
      Height = 27
      Caption = 'Patrocinadora'
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
    object dbgrdPatro: TwwDBGrid
      Left = 10
      Top = 44
      Width = 336
      Height = 176
      Selected.Strings = (
        'NOME'#9'50'#9'NOME')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = False
      ShowVertScrollBar = False
      DataSource = dsPatro
      KeyOptions = []
      Options = [dgEditing, dgColumnResize, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      OnDblClick = bbtnConfirmarClick
      IndicatorColor = icBlack
    end
  end
  inherited Dock971: TDock97
    Width = 358
    inherited tb97Fundo: TToolbar97
      Left = 173
      DockPos = 173
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 5
      DockPos = 5
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 324
    Top = 249
  end
  object qryPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.IDPESSOA, P.NOME'
      'FROM   PESSOA P, PATRO PT'
      'WHERE  PT.IDPESSOA = P.IDPESSOA'
      'ORDER BY P.NOME'
      ' ')
    ValidateWithMask = True
    Left = 207
    Top = 159
  end
  object dsPatro: TwwDataSource
    DataSet = qryPatro
    Left = 279
    Top = 240
  end
end
