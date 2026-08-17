inherited frmAgenda: TfrmAgenda
  Left = 27
  Top = 156
  Caption = 'Sua Agenda'
  ClientHeight = 329
  ClientWidth = 733
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 733
    Height = 290
    BorderWidth = 2
    object dbGrd: TwwDBGrid
      Left = 4
      Top = 4
      Width = 725
      Height = 282
      Selected.Strings = (
        'DATAREALOCOR'#9'16'#9'Data e Hora'
        'DESCRICAO'#9'40'#9'Tipo de Etapa'
        'NOME'#9'60'#9'Contraparte'
        'PROCJCJNUM'#9'25'#9'Processo'
        'ASSUNTO'#9'40'#9'Assunto'
        'VARA'#9'40'#9'Vara'
        'CIDADE'#9'50'#9'Cidade'
        'UF'#9'3'#9'UF')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = dsEtapa
      KeyOptions = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit, dgWordWrap]
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
      IndicatorColor = icBlack
    end
  end
  inherited Dock971: TDock97
    Top = 290
    Width = 733
    inherited tb97Fundo: TToolbar97
      Left = 567
      DockPos = 575
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 411
    Top = 203
  end
  object dsEtapa: TwwDataSource
    AutoEdit = False
    DataSet = CdsEtapa
    Left = 357
    Top = 120
  end
  object CdsEtapa: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 414
    Top = 118
  end
end
