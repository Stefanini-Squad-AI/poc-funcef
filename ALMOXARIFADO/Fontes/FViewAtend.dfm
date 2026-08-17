inherited FrmViewAtend: TFrmViewAtend
  Left = 25
  Top = 161
  Caption = 'Visualização dos Antendimentos'
  ClientHeight = 279
  ClientWidth = 725
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 725
    Height = 240
    object plnTitulo: TPanel
      Left = 5
      Top = 5
      Width = 715
      Height = 35
      Align = alTop
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = ' Requisição : 421  Artigo : Extratato de Sapona '
      Color = clGray
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object GrdAtend: TwwDBGrid
      Left = 5
      Top = 40
      Width = 715
      Height = 195
      Selected.Strings = (
        'DATAENTREGA'#9'10'#9'Data~Entrega'
        'QTDEENTREGA'#9'10'#9'Quantidade~Entrega'
        'CODMEDIDA'#9'4'#9'Unidade~Medida'
        'VALORUN'#9'10'#9'Valor~Unitário'
        'STATUS'#9'14'#9'Status'
        'ATENDENTE'#9'30'#9'Atendente'
        'DATARECEB'#9'10'#9'Data~Confir/Devol.'
        'CONFDEV'#9'30'#9'Recebedor')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = FrmAcompReqCad.dsAtend
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      TabOrder = 1
      TitleAlignment = taCenter
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 2
      TitleButtons = False
      IndicatorColor = icBlack
    end
  end
  inherited Dock971: TDock97
    Top = 240
    Width = 725
    inherited tb97Fundo: TToolbar97
      Left = 559
      DockPos = 559
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 763
  end
end
