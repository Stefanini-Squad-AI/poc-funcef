inherited FrmAcertaFuncef: TFrmAcertaFuncef
  Left = 209
  Top = 143
  Caption = 'Acerta Funcef'
  ClientHeight = 127
  ClientWidth = 370
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 370
    Height = 88
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 353
      Height = 49
      Alignment = taCenter
      AutoSize = False
      Caption = 'Acerto de Lançamentos efetuados na FUNCEF'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
  end
  inherited Dock971: TDock97
    Top = 88
    Width = 370
    inherited tb97Fundo: TToolbar97
      Left = 122
      DockPos = 122
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 162
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 82
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 164
      end
      object btnAcerta: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = '&Acertar'
        TabOrder = 2
        OnClick = btnAcertaClick
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888088888888888888800888888888888880B0888888888888880B088
          8888888800000B088888888880BBBBB08888888880BBB00008888888880BBB08
          88888880000BFBF088888880BFBFB000088888880BFBF088888888880FBFBF08
          8888888880FBFBF0888888888000000088888888888888888888}
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 771
    Top = 65523
  end
  object qry: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     I.IDMOV,'
      '     I.IDITENSRECDEV,'
      '     I.CODMEDIDA,'
      '     I.IDEMPRESA,'
      '     I.CODCENTROCUSTO,'
      '     I.CODARTIGO,'
      '     I.CODALMOXARIFADO,'
      '     I.IDPESSOA,'
      '     I.QTDERECEBDEVOL,'
      '     I.VLRUNITARIO,'
      '     I.VLRESTOQUE,'
      '     I.DATAVALIDADE,'
      '     N.DATAENTDEVOL,'
      '     N.NUMNF,'
      '     N.COMPLNF'
      'FROM'
      '     ITENSRECEBDEVOL I,'
      '     NFRECEBDEVOL N'
      'WHERE'
      '       (I.IDMOV IS NULL)'
      '   AND (I.FLGDESTINO = '#39'E'#39')    '
      '   AND (I.IDNFRECEBDEVOL = N.IDNFRECEBDEVOL)'
      ''
      ''
      ''
      '')
    UpdateObject = upd
    ValidateWithMask = True
    Left = 328
    Top = 16
    object qryIDMOV: TFloatField
      FieldName = 'IDMOV'
      Origin = 'ITENSRECEBDEVOL.IDMOV'
    end
    object qryIDITENSRECDEV: TFloatField
      FieldName = 'IDITENSRECDEV'
      Origin = 'ITENSRECEBDEVOL.IDITENSRECDEV'
    end
    object qryCODMEDIDA: TStringField
      FieldName = 'CODMEDIDA'
      Origin = 'ITENSRECEBDEVOL.CODMEDIDA'
      Size = 4
    end
    object qryIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
      Origin = 'ITENSRECEBDEVOL.IDEMPRESA'
    end
    object qryCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Origin = 'ITENSRECEBDEVOL.CODCENTROCUSTO'
      Size = 10
    end
    object qryCODARTIGO: TStringField
      FieldName = 'CODARTIGO'
      Origin = 'ITENSRECEBDEVOL.CODARTIGO'
      Size = 14
    end
    object qryCODALMOXARIFADO: TFloatField
      FieldName = 'CODALMOXARIFADO'
      Origin = 'ITENSRECEBDEVOL.CODALMOXARIFADO'
    end
    object qryIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'ITENSRECEBDEVOL.IDPESSOA'
    end
    object qryQTDERECEBDEVOL: TFloatField
      FieldName = 'QTDERECEBDEVOL'
      Origin = 'ITENSRECEBDEVOL.QTDERECEBDEVOL'
    end
    object qryVLRUNITARIO: TFloatField
      FieldName = 'VLRUNITARIO'
      Origin = 'ITENSRECEBDEVOL.VLRUNITARIO'
    end
    object qryVLRESTOQUE: TFloatField
      FieldName = 'VLRESTOQUE'
      Origin = 'ITENSRECEBDEVOL.VLRESTOQUE'
    end
    object qryDATAENTDEVOL: TDateTimeField
      FieldName = 'DATAENTDEVOL'
      Origin = 'NFRECEBDEVOL.DATAENTDEVOL'
    end
    object qryNUMNF: TFloatField
      FieldName = 'NUMNF'
      Origin = 'NFRECEBDEVOL.NUMNF'
    end
    object qryCOMPLNF: TStringField
      FieldName = 'COMPLNF'
      Origin = 'NFRECEBDEVOL.COMPLNF'
      Size = 5
    end
    object qryDATAVALIDADE: TDateTimeField
      FieldName = 'DATAVALIDADE'
      Origin = 'ITENSRECEBDEVOL.DATAVALIDADE'
    end
  end
  object upd: TUpdateSQL
    ModifySQL.Strings = (
      'update ITENSRECEBDEVOL'
      'set'
      '  IDMOV = :IDMOV'
      'where'
      '  IDITENSRECDEV = :OLD_IDITENSRECDEV')
    InsertSQL.Strings = (
      'insert into ITENSRECEBDEVOL'
      '  (IDMOV)'
      'values'
      '  (:IDMOV)')
    DeleteSQL.Strings = (
      'delete from ITENSRECEBDEVOL'
      'where'
      '  IDITENSRECDEV = :OLD_IDITENSRECDEV')
    Left = 328
  end
end
