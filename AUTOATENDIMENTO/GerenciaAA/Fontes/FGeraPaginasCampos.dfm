inherited frmGeraPaginasCampos: TfrmGeraPaginasCampos
  Left = 276
  Top = 182
  HelpContext = 4650002
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Geração de Páginas e Campos'
  ClientHeight = 412
  ClientWidth = 545
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 545
    Height = 373
    object lblMsg: TLabel
      Left = 16
      Top = 324
      Width = 513
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 
        'Clique em [Ok] para incluir as páginas e campos novos no banco d' +
        'e dados.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object grpPaginas: TGroupBox
      Left = 16
      Top = 16
      Width = 513
      Height = 145
      Caption = 'Páginas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object lblMsgPaginas: TLabel
        Left = 8
        Top = 24
        Width = 497
        Height = 13
        AutoSize = False
        Caption = 'lblMsgPaginas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblTituloQtdePagNovas: TLabel
        Left = 296
        Top = 128
        Width = 177
        Height = 13
        AutoSize = False
        Caption = 'Quantidade de páginas novas:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblQtdePagNovas: TLabel
        Left = 472
        Top = 128
        Width = 33
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object grdPaginas: TStringGrid
        Left = 8
        Top = 40
        Width = 497
        Height = 81
        ColCount = 1
        DefaultRowHeight = 18
        FixedCols = 0
        RowCount = 1
        FixedRows = 0
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = []
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goRangeSelect, goDrawFocusSelected, goColSizing, goRowSelect]
        ParentFont = False
        TabOrder = 0
        ColWidths = (
          475)
      end
    end
    object grpCampos: TGroupBox
      Left = 16
      Top = 168
      Width = 513
      Height = 145
      Caption = 'Campos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object lblMsgCampos: TLabel
        Left = 8
        Top = 24
        Width = 497
        Height = 13
        AutoSize = False
        Caption = 'lblMsgCampos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblTituloQtdeCamNovos: TLabel
        Left = 296
        Top = 128
        Width = 177
        Height = 13
        AutoSize = False
        Caption = 'Quantidade de campos novos:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblQtdeCamNovos: TLabel
        Left = 472
        Top = 128
        Width = 33
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object grdCampos: TStringGrid
        Left = 8
        Top = 40
        Width = 497
        Height = 81
        ColCount = 2
        DefaultColWidth = 237
        DefaultRowHeight = 18
        FixedCols = 0
        RowCount = 1
        FixedRows = 0
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = []
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goRangeSelect, goDrawFocusSelected, goColSizing, goRowSelect]
        ParentFont = False
        TabOrder = 0
      end
    end
    object ProgressBar: TProgressBar
      Left = 16
      Top = 344
      Width = 513
      Height = 16
      Min = 0
      Max = 100
      Step = 1
      TabOrder = 2
    end
  end
  inherited Dock971: TDock97
    Top = 373
    Width = 545
    inherited tb97Fundo: TToolbar97
      Left = 373
      DockPos = 383
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 204
      DockPos = 214
      inherited bbtnConfirmar: TBitBtn
        Enabled = False
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 155
    Top = 355
    TargetsData = (
      1
      2
      (
        'TMemo'
        'Text'
        0)
      (
        ''
        'Cells'
        0))
  end
  object cdsWebCampo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 40
    Top = 351
    object cdsWebCampoIDCAMPO: TFloatField
      FieldName = 'IDCAMPO'
    end
    object cdsWebCampoIDCAMPOPAI: TFloatField
      FieldName = 'IDCAMPOPAI'
    end
    object cdsWebCampoIDPAGINA: TFloatField
      FieldName = 'IDPAGINA'
    end
    object cdsWebCampoDESCCAMPO: TStringField
      FieldName = 'DESCCAMPO'
      Size = 100
    end
    object cdsWebCampoFLGSEMPREHAB: TStringField
      FieldName = 'FLGSEMPREHAB'
      FixedChar = True
      Size = 1
    end
  end
  object cdsWebPagina: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 8
    Top = 351
    object cdsWebPaginaIDPAGINA: TFloatField
      FieldName = 'IDPAGINA'
    end
    object cdsWebPaginaIDPAGINAPAI: TFloatField
      FieldName = 'IDPAGINAPAI'
    end
    object cdsWebPaginaDESCPAGINA: TStringField
      FieldName = 'DESCPAGINA'
      Size = 100
    end
    object cdsWebPaginaFLGSEMPREHAB: TStringField
      FieldName = 'FLGSEMPREHAB'
      FixedChar = True
      Size = 1
    end
  end
  object cdsPaginasNovas: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 88
    Top = 351
    object cdsPaginasNovasIDPAGINA: TFloatField
      FieldName = 'IDPAGINA'
    end
    object cdsPaginasNovasIDPAGINAPAI: TFloatField
      FieldName = 'IDPAGINAPAI'
    end
    object cdsPaginasNovasDESCPAGINA: TStringField
      FieldName = 'DESCPAGINA'
      Size = 100
    end
    object cdsPaginasNovasFLGSEMPREHAB: TStringField
      FieldName = 'FLGSEMPREHAB'
      FixedChar = True
      Size = 1
    end
  end
  object cdsCamposNovos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 120
    Top = 351
    object cdsCamposNovosIDCAMPO: TFloatField
      FieldName = 'IDCAMPO'
    end
    object cdsCamposNovosIDCAMPOPAI: TFloatField
      FieldName = 'IDCAMPOPAI'
    end
    object cdsCamposNovosIDPAGINA: TFloatField
      FieldName = 'IDPAGINA'
    end
    object cdsCamposNovosDESCCAMPO: TStringField
      FieldName = 'DESCCAMPO'
      Size = 100
    end
    object cdsCamposNovosFLGSEMPREHAB: TStringField
      FieldName = 'FLGSEMPREHAB'
      FixedChar = True
      Size = 1
    end
  end
  object cdsWebInterface: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 8
    Top = 320
  end
  object cdsWebTpUsuCampo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 85
    Top = 315
    object cdsWebTpUsuCampoIDTIPOUSUARIO: TFloatField
      FieldName = 'IDTIPOUSUARIO'
    end
    object cdsWebTpUsuCampoIDCAMPO: TFloatField
      FieldName = 'IDCAMPO'
    end
    object cdsWebTpUsuCampoIDWEBINTERFACE: TFloatField
      FieldName = 'IDWEBINTERFACE'
    end
    object cdsWebTpUsuCampoTITULOCAMPO: TStringField
      FieldName = 'TITULOCAMPO'
      Size = 100
    end
    object cdsWebTpUsuCampoFLGDISPONIVEL: TStringField
      FieldName = 'FLGDISPONIVEL'
      FixedChar = True
      Size = 1
    end
    object cdsWebTpUsuCampoIDREGRAACESSO: TFloatField
      FieldName = 'IDREGRAACESSO'
    end
  end
  object cdsWebTpUsuPagina: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 133
    Top = 240
    object cdsWebTpUsuPaginaIDTIPOUSUARIO: TFloatField
      FieldName = 'IDTIPOUSUARIO'
    end
    object cdsWebTpUsuPaginaIDPAGINA: TFloatField
      FieldName = 'IDPAGINA'
    end
    object cdsWebTpUsuPaginaIDWEBINTERFACE: TFloatField
      FieldName = 'IDWEBINTERFACE'
    end
    object cdsWebTpUsuPaginaTITULOPAGINA: TStringField
      FieldName = 'TITULOPAGINA'
      Size = 100
    end
    object cdsWebTpUsuPaginaFLGUSAPADRAO: TStringField
      FieldName = 'FLGUSAPADRAO'
      FixedChar = True
      Size = 1
    end
    object cdsWebTpUsuPaginaPAGCONTEUDO: TStringField
      FieldName = 'PAGCONTEUDO'
      Size = 100
    end
    object cdsWebTpUsuPaginaLAYERACESSO: TStringField
      FieldName = 'LAYERACESSO'
      Size = 50
    end
    object cdsWebTpUsuPaginaFLGDISPONIVEL: TStringField
      FieldName = 'FLGDISPONIVEL'
      FixedChar = True
      Size = 1
    end
    object cdsWebTpUsuPaginaFLGCONTAACESSO: TStringField
      FieldName = 'FLGCONTAACESSO'
      FixedChar = True
      Size = 1
    end
    object cdsWebTpUsuPaginaIDREGRAACESSO: TFloatField
      FieldName = 'IDREGRAACESSO'
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 256
    Top = 192
  end
end
