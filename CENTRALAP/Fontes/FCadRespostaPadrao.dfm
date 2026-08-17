inherited FrmCadRespostaPadrao: TFrmCadRespostaPadrao
  Left = 214
  Top = 186
  HelpContext = 190015
  Caption = 'Respostas Padrão'
  ClientHeight = 257
  ClientWidth = 471
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 471
    Height = 171
    object Label2: TLabel
      Left = 12
      Top = 9
      Width = 54
      Height = 13
      Caption = 'Resposta'
    end
    object MemResposta2: TwwDBRichEdit
      Left = 11
      Top = 27
      Width = 449
      Height = 132
      ScrollBars = ssVertical
      AutoURLDetect = False
      DataField = 'DESCRESPATEN'
      DataSource = ds
      PrintJobName = 'Delphi 5'
      TabOrder = 0
      PopupOptions = [rpoPopupEdit, rpoPopupCut, rpoPopupCopy, rpoPopupPaste, rpoPopupBold, rpoPopupItalic, rpoPopupUnderline, rpoPopupFont, rpoPopupBullet, rpoPopupParagraph, rpoPopupTabs, rpoPopupFind, rpoPopupReplace]
      EditorOptions = [reoShowLoad, reoShowSaveAs, reoShowSaveExit, reoShowPrint, reoShowPageSetup, reoShowFormatBar, reoShowToolBar, reoShowStatusBar, reoShowHints, reoCloseOnEscape]
      EditorCaption = 'Cadastro de Resposta Padrão'
      EditorPosition.Left = 0
      EditorPosition.Top = 0
      EditorPosition.Width = 0
      EditorPosition.Height = 0
      MeasurementUnits = muInches
      PrintMargins.Top = 1
      PrintMargins.Bottom = 1
      PrintMargins.Left = 1
      PrintMargins.Right = 1
      RichEditVersion = 2
      Data = {
        6C0000007B5C727466315C616E73695C64656666307B5C666F6E7474626C7B5C
        66305C666E696C204D532053616E732053657269663B7D7D0D0A5C766965776B
        696E64345C7563315C706172645C6C616E67313034365C625C66305C66733134
        5C7061720D0A5C7061720D0A7D0D0A00}
    end
  end
  inherited Dock972: TDock97
    Width = 471
  end
  inherited Dock971: TDock97
    Top = 218
    Width = 471
    inherited tb97Fundo: TToolbar97
      Left = 301
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 134
    end
  end
  inherited qry: TwwQuery
    Tag = 5
    SQL.Strings = (
      'SELECT'
      '  IDRESPATEND,'
      '  DESCRESPATEN'
      'FROM'
      '  RESPATEND'
      'WHERE'
      '  IDRESPATEND = :IDRESPATEND')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDRESPATEND'
        ParamType = ptUnknown
      end>
    object qryIDRESPATEND: TFloatField
      FieldName = 'IDRESPATEND'
      Origin = 'RESPATEND.IDRESPATEND'
    end
    object qryDESCRESPATEN: TMemoField
      FieldName = 'DESCRESPATEN'
      Origin = 'RESPATEND.IDRESPATEND'
      BlobType = ftMemo
      Size = 2000
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 304
    Top = 6
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update RESPATEND'
      'set'
      '  IDRESPATEND = :IDRESPATEND,'
      '  DESCRESPATEN = :DESCRESPATEN'
      'where'
      '  IDRESPATEND = :OLD_IDRESPATEND')
    InsertSQL.Strings = (
      'insert into RESPATEND'
      '  (IDRESPATEND, DESCRESPATEN)'
      'values'
      '  (:IDRESPATEND, :DESCRESPATEN)')
    DeleteSQL.Strings = (
      'delete from RESPATEND'
      'where'
      '  IDRESPATEND = :OLD_IDRESPATEND')
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'SUBSTR(RESPATEND.DESCRESPATEN,1,200)')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      '')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'RESPATEND')
    CamposChave.Strings = (
      'RESPATEND.IDRESPATEND')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '100')
  end
  inherited ImlPadrao: TImageList
    Left = 393
    Top = 22
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
    Top = 58
  end
end
