inherited frmAcertaImposto: TfrmAcertaImposto
  Left = 185
  Top = 240
  HelpContext = 90001
  Caption = 'Acerta Imposto'
  ClientHeight = 148
  ClientWidth = 413
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 413
    Height = 109
    object prgBarAtuFluxo: TProgressBar
      Left = 5
      Top = 82
      Width = 403
      Height = 22
      Align = alBottom
      Min = 0
      Max = 100
      Step = 2
      TabOrder = 0
      Visible = False
    end
    object Memo1: TMemo
      Left = 5
      Top = 5
      Width = 403
      Height = 77
      Align = alClient
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Lines.Strings = (
        'Acerta os Impostos não lançados')
      ParentFont = False
      TabOrder = 1
    end
  end
  inherited Dock971: TDock97
    Top = 109
    Width = 413
    inherited tb97Fundo: TToolbar97
      Left = 100
      DockPos = 100
      inherited sep1: TToolbarSep97
        Left = 145
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 227
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 147
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 229
        HelpContext = 90001
      end
      object bbtnAcerta: TBitBtn
        Left = 0
        Top = 0
        Width = 145
        Height = 33
        Cancel = True
        Caption = '&Acerta'
        TabOrder = 2
        OnClick = bbtnAcertaClick
        Glyph.Data = {
          B6010000424DB601000000000000760000002800000022000000100000000100
          0400000000004001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888988888
          888888888887F888888888000000888889988888888888888877FFFFFFF88800
          0000888899999999988888888777777777F88800000088889999999998888888
          87777777778888000000888889988888888888888877F8888888880000008888
          889888888888888888878888888888000000888888888888888888888FFFFFFF
          FFFF880000008887000000000088888877777777777F880000008887BFB7BF7F
          B08888887FF87FF7F87F880000008887FBF7FB7BF08888887F8F7F87FF7F8800
          00008887BFB7BF7FB08888887FF87FF7F87F880000008887FBF7FB7BF0888888
          7F8F7F87FF7F880000008887BFB7BF7FB08888887FF87FF7F87F880000008887
          FBF7FB7BF08888887FFF7FF7FF7F880000008887777777777088888877777777
          7778880000008888888888888888888888888888888888000000}
        NumGlyphs = 3
        Spacing = 2
      end
    end
  end
  object qryAlterador: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODALTERADOR, DESCRICAO'
      'FROM TIPOALTERADOR'
      'WHERE'
      '    (IDPESSOA = :IDPESSOA) AND '
      '    (ACRESDECRES = '#39'C'#39') AND '
      '    (RECPAG = '#39'P'#39')'
      '')
    ValidateWithMask = True
    Left = 296
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryAlteradorDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 35
      FieldName = 'DESCRICAO'
      Origin = 'TIPOALTERADOR.DESCRICAO'
      Size = 35
    end
    object qryAlteradorCODALTERADOR: TFloatField
      DisplayWidth = 10
      FieldName = 'CODALTERADOR'
      Origin = 'TIPOALTERADOR.CODALTERADOR'
      Visible = False
    end
  end
  object qryDocumento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT D.CODDOCUMENTO,'
      '       D.CODTIPDOC,'
      '       DECODE(L.VLRLIQUIDO,NULL,0,L.VLRLIQUIDO) AS VLRLIQUIDO,'
      '       L.VALOR,'
      '       D.DATAPROGRAMADA,'
      '       D.IDFORCLI,'
      '       L.DATALANCTO,'
      '       D.DATAEMISSAO,'
      '       L.DEBCRE,'
      '       L.NUMLANCTO,'
      '       D.OPERACAO'
      'FROM DOCUMENTO D,'
      '     TIPODOCRECPAG T,'
      '     LANCTODOCUM L'
      'WHERE ((D.OPERACAO = '#39'1 '#39') OR (D.OPERACAO = '#39'2 '#39')) AND'
      '      (D.IDPESSOA = :IDPESSOA) AND'
      '      (D.RECPAG = '#39'P'#39') AND'
      '      ((D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL)) AND'
      '      (D.CODTIPDOC = T.CODTIPDOC) AND'
      '      (L.CODDOCUMENTO = D.CODDOCUMENTO) AND'
      '      (L.OPERACAO = D.OPERACAO) AND'
      '      (L.ESTORNO IS NULL) AND'
      '      ((T.FLGDOCFISCAL IS NULL) OR (T.FLGDOCFISCAL = '#39'S'#39')) AND'
      '      (NOT EXISTS (SELECT M.CODDOCUMENTO'
      '                   FROM LANCTODOCUM M'
      '                   WHERE (M.CODALTERADOR IS NOT NULL) AND'
      '                         (M.CODDOCUMENTO = D.CODDOCUMENTO)))'
      '')
    ValidateWithMask = True
    Left = 216
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryDocumentoCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object qryDocumentoCODTIPDOC: TFloatField
      FieldName = 'CODTIPDOC'
    end
    object qryDocumentoVLRLIQUIDO: TFloatField
      FieldName = 'VLRLIQUIDO'
    end
    object qryDocumentoVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object qryDocumentoDATAPROGRAMADA: TDateTimeField
      FieldName = 'DATAPROGRAMADA'
    end
    object qryDocumentoIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
    end
    object qryDocumentoDATALANCTO: TDateTimeField
      FieldName = 'DATALANCTO'
    end
    object qryDocumentoDATAEMISSAO: TDateTimeField
      FieldName = 'DATAEMISSAO'
    end
    object qryDocumentoDEBCRE: TStringField
      FieldName = 'DEBCRE'
      Size = 1
    end
    object qryDocumentoNUMLANCTO: TFloatField
      FieldName = 'NUMLANCTO'
    end
    object qryDocumentoOPERACAO: TStringField
      FieldName = 'OPERACAO'
      Size = 2
    end
  end
end
