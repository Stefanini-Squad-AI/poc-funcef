inherited frmSolicitaPlano: TfrmSolicitaPlano
  Left = 195
  Top = 136
  Caption = 'Selecione o Plano desejado'
  ClientWidth = 445
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 445
    object StaticText1: TStaticText
      Left = 27
      Top = 25
      Width = 194
      Height = 27
      Caption = 'Plano Previdenciário'
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
    object dbgrdPlanPatro: TwwDBGrid
      Left = 22
      Top = 56
      Width = 399
      Height = 160
      Selected.Strings = (
        'NOME'#9'50'#9'NOME')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = False
      ShowVertScrollBar = False
      DataSource = dsPlanPrev
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
      OnDblClick = dbgrdPlanPatroDblClick
      OnKeyDown = dbgrdPlanPatroKeyDown
      IndicatorColor = icBlack
    end
  end
  inherited Dock971: TDock97
    Width = 445
    inherited tb97Fundo: TToolbar97
      Left = 275
      DockPos = 275
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 107
      DockPos = 107
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  object qryPlanPrev: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PLANPREV.NOME, PLANPREV.IDPLANOPREV'
      'FROM   PLANPREV'
      'ORDER BY PLANPREV.NOME')
    ValidateWithMask = True
    Left = 325
    Top = 9
  end
  object dsPlanPrev: TwwDataSource
    AutoEdit = False
    DataSet = qryPlanPrev
    Left = 257
    Top = 9
  end
end
