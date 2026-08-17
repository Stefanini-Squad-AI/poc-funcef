inherited frmOrdenaFluxo: TfrmOrdenaFluxo
  Left = 233
  Top = 200
  Caption = 'Determina a Ordem de Impressão do Fluxo'
  ClientHeight = 281
  ClientWidth = 328
  FormStyle = fsNormal
  Visible = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 328
    Height = 242
    object dbgTiposSel: TwwDBGrid
      Left = 5
      Top = 44
      Width = 318
      Height = 193
      Selected.Strings = (
        'DESCRICAO'#9'35'#9'Descrição da Linha')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = dsLinhasFlu
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
    object pnlTituloP: TPanel
      Left = 5
      Top = 5
      Width = 318
      Height = 39
      Align = alTop
      BevelInner = bvLowered
      Color = clGray
      TabOrder = 1
      object lblTituloP: TLabel
        Left = 77
        Top = 8
        Width = 165
        Height = 22
        Alignment = taCenter
        Caption = 'Linhas do Fluxo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 242
    Width = 328
    inherited tb97Fundo: TToolbar97
      Left = 2
      DockPos = 2
      inherited sep1: TToolbarSep97
        Left = 172
      end
      inherited bbtnSair: TBitBtn
        Left = 92
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 174
      end
      object bbtnDescer: TBitBtn
        Left = 46
        Top = 0
        Width = 46
        Height = 33
        Cancel = True
        TabOrder = 2
        OnClick = bbtnDescerClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333303333
          333333333337F33333333333333033333333333333373F333333333333090333
          33333333337F7F33333333333309033333333333337373F33333333330999033
          3333333337F337F33333333330999033333333333733373F3333333309999903
          333333337F33337F33333333099999033333333373333373F333333099999990
          33333337FFFF3FF7F33333300009000033333337777F77773333333333090333
          33333333337F7F33333333333309033333333333337F7F333333333333090333
          33333333337F7F33333333333309033333333333337F7F333333333333090333
          33333333337F7F33333333333300033333333333337773333333}
        NumGlyphs = 2
        Spacing = 2
      end
      object bbtnSubir: TBitBtn
        Left = 0
        Top = 0
        Width = 46
        Height = 33
        Cancel = True
        TabOrder = 3
        OnClick = bbtnSubirClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000333
          3333333333777F33333333333309033333333333337F7F333333333333090333
          33333333337F7F33333333333309033333333333337F7F333333333333090333
          33333333337F7F33333333333309033333333333FF7F7FFFF333333000090000
          3333333777737777F333333099999990333333373F3333373333333309999903
          333333337F33337F33333333099999033333333373F333733333333330999033
          3333333337F337F3333333333099903333333333373F37333333333333090333
          33333333337F7F33333333333309033333333333337373333333333333303333
          333333333337F333333333333330333333333333333733333333}
        NumGlyphs = 2
        Spacing = 2
      end
    end
  end
  object dsLinhasFlu: TwwDataSource
    DataSet = qryLinhasFlu
    Left = 273
    Top = 69
  end
  object qryLinhasFlu: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODLINHAFLUXO,ORDEM,DESCRICAO FROM MONTAFLUXO')
    UpdateObject = updLinhasFlu
    ValidateWithMask = True
    Left = 276
    Top = 12
  end
  object updLinhasFlu: TUpdateSQL
    ModifySQL.Strings = (
      'update MONTAFLUXO'
      'set'
      '  ORDEM = :ORDEM'
      'where'
      '  CODLINHAFLUXO = :OLD_CODLINHAFLUXO')
    InsertSQL.Strings = (
      'insert into MONTAFLUXO'
      '  (ORDEM)'
      'values'
      '  (:ORDEM)')
    DeleteSQL.Strings = (
      'delete from MONTAFLUXO'
      'where'
      '  CODLINHAFLUXO = :OLD_CODLINHAFLUXO')
    Left = 270
    Top = 129
  end
end
