inherited frmAvisoVenc: TfrmAvisoVenc
  Left = 37
  Top = 170
  HelpContext = 120017
  Caption = 'Aviso vencimento dos Contratos'
  ClientHeight = 375
  ClientWidth = 755
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 755
    Height = 336
    object dbgContrato: TwwDBGrid
      Left = 1
      Top = 1
      Width = 753
      Height = 334
      Selected.Strings = (
        'NOMECONTRATO'#9'41'#9'Contrato'#9'F'
        'DATAPREVENCERRA'#9'19'#9'Data Prevista Venc/Encer'#9'F'
        'DIASFALTAM'#9'17'#9'Dias para Encerramento'#9'F'
        'DATAAVISO'#9'11'#9'Data Aviso'#9'F'
        'AVISO'#9'8'#9'Aviso(dias)'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = dsContrato
      TabOrder = 0
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      OnCalcCellColors = dbgContratoCalcCellColors
      IndicatorColor = icBlack
    end
  end
  inherited Dock971: TDock97
    Top = 336
    Width = 755
    inherited tb97Fundo: TToolbar97
      Left = 103
      DockPos = 103
      inherited sep1: TToolbarSep97
        Left = 437
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 161
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      object ToolbarSep972: TToolbarSep97 [2]
        Left = 352
        Top = 0
        Blank = True
        SizeHorz = 4
      end
      inherited bbtnSair: TBitBtn
        Left = 356
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 439
        HelpContext = 120017
      end
      object bbtnIniciarRenovacao: TBitBtn
        Left = 0
        Top = 0
        Width = 161
        Height = 33
        Caption = '&Iniciar Renovação'
        TabOrder = 2
        OnClick = bbtnIniciarRenovacaoClick
        Kind = bkRetry
      end
      object bbtnProcessoRenovacao: TmaHelpBitBtn
        Left = 163
        Top = 0
        Width = 189
        Height = 33
        Caption = '&Processo de Renovação'
        TabOrder = 3
        OnClick = bbtnProcessoRenovacaoClick
        Glyph.Data = {
          42020000424D4202000000000000420000002800000010000000100000000100
          1000030000000002000000000000000000000000000000000000007C0000E003
          00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C104210421F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000FF7F00001F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000FF7FFF7FFF7F00001F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C00000000FF7FFF7FFF7FFF7FFF7FFF7F00001F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1042FF7FFF7FFF7FFF7FFF7F1F00FF7F00001F7C
          1F7C1F7C1F7C00401F7C1F7C1042FF7FFF7F1F001F001F00FF7FFF7FFF7F0000
          1F7C1F7C1F7C004000401F7C1F7C1042FF7FFF7FFF7FFF7FFF7F1F00FF7F0000
          1F7C1F7C1F7C0040004000401F7C1042FF7FFF7F1F001F001F00FF7FFF7FFF7F
          00001F7C1F7C1F7C0040004000400000000000000000FF7FFF7FFF7F1F00FF7F
          FF7F00001F7C1F7C1F7C00400000FF031F7CFF031F7C000010021F00FF7FFF7F
          FF7FFF7F00001F7C1F7C0000FF031F7CFF031F7CFF031F7C0000FF7FFF7FFF7F
          104210421F7C1F7C1F7C00001F7CFF031F7CFF031F7CFF030000FF7F10421042
          1F7C1F7C1F7C1F7C1F7C0000FF031F7CFF031F7CFF031F7C000010421F7C1F7C
          1F7C1F7C1F7C1F7C1F7C00001F7CFF031F7CFF031F7CFF0300001F7C1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C00001F7CFF031F7CFF0300001F7C1F7C1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000000000001F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C}
        ClickHelpContext = 0
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 40
    Top = 56
  end
  object qryContrato: TwwQuery
    AfterScroll = qryContratoAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT C.IDCONTRATO,'
      '       C.NOMECONTRATO,'
      '       C.DATAPREVENCERRA,'
      '       C.AVISO,'
      '       (TO_DATE(DATAPREVENCERRA,'#39'DD/MM/YY'#39')-AVISO) DATAAVISO,'
      
        '       (ROUND(TO_DATE(DATAPREVENCERRA,'#39'DD/MM/YY'#39')-TO_DATE(SYSDAT' +
        'E,'#39'DD/MM/YY'#39'))) DIASFALTAM,'
      '       C.FLGFIMCONTRATO,'
      '       C.IDTIPOPROCESSORAD,'
      '       C.CODCENTRORESPON,'
      '       C.UNIDNEGOC,'
      '       ADT.IDPROCESSO,'
      '       RI.FLGOK,'
      '       RI.OBS'
      'FROM CONTRATOCONTR C,'
      '     (SELECT AD1.IDCONTRATO,'
      '             AD1.IDPROCESSO'
      '      FROM ADITAMENTO AD1'
      '      WHERE (AD1.IDADITAMENTO = (SELECT Max(IDADITAMENTO)'
      '                                 FROM ADITAMENTO AD2'
      
        '                                 WHERE (AD2.IDCONTRATO=AD1.IDCON' +
        'TRATO)))) ADT,'
      '      (SELECT IDPROCESSO,'
      '              FLGOK,'
      '              OBS'
      '       FROM RADINSTPROCESSO'
      '       WHERE (IDPESSOA=:IDPESSOA)) RI'
      ''
      'WHERE (C.IDCONTRATO=ADT.IDCONTRATO(+)) AND'
      '      (ADT.IDPROCESSO=RI.IDPROCESSO(+)) AND'
      '      ((C.DATAPREVENCERRA-C.AVISO)<=SYSDATE) AND'
      '      (C.FLGFIMCONTRATO = '#39'S'#39') AND'
      '      (C.IDPESSOA = :IDPESSOA) AND'
      
        '      (C.IDCONTRATO IN (SELECT CUS.IDCONTRATO FROM CONTRATOUSUAR' +
        'IO CUS'
      '                        WHERE  CUS.IDUSUARIO = :IDUSUARIO))'
      'ORDER BY DATAPREVENCERRA'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 104
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDUSUARIO'
        ParamType = ptUnknown
      end>
    object qryContratoNOMECONTRATO: TStringField
      DisplayLabel = 'Contrato'
      DisplayWidth = 41
      FieldName = 'NOMECONTRATO'
      Size = 60
    end
    object qryContratoDATAPREVENCERRA: TDateTimeField
      DisplayLabel = 'Data Prevista Venc/Encer'
      DisplayWidth = 19
      FieldName = 'DATAPREVENCERRA'
    end
    object qryContratoDIASFALTAM: TFloatField
      DisplayLabel = 'Dias para Encerramento'
      DisplayWidth = 17
      FieldName = 'DIASFALTAM'
    end
    object qryContratoDATAAVISO: TDateTimeField
      DisplayLabel = 'Data Aviso'
      DisplayWidth = 11
      FieldName = 'DATAAVISO'
    end
    object qryContratoAVISO: TFloatField
      DisplayLabel = 'Aviso(dias)'
      DisplayWidth = 8
      FieldName = 'AVISO'
    end
    object qryContratoIDCONTRATO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONTRATO'
      Visible = False
    end
    object qryContratoFLGFIMCONTRATO: TStringField
      DisplayWidth = 1
      FieldName = 'FLGFIMCONTRATO'
      Visible = False
      Size = 1
    end
    object qryContratoIDTIPOPROCESSORAD: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOPROCESSORAD'
      Visible = False
    end
    object qryContratoCODCENTRORESPON: TStringField
      DisplayWidth = 10
      FieldName = 'CODCENTRORESPON'
      Visible = False
      FixedChar = True
      Size = 10
    end
    object qryContratoUNIDNEGOC: TFloatField
      DisplayWidth = 10
      FieldName = 'UNIDNEGOC'
      Visible = False
    end
    object qryContratoIDPROCESSO: TFloatField
      FieldName = 'IDPROCESSO'
      Visible = False
    end
    object qryContratoFLGOK: TStringField
      FieldName = 'FLGOK'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryContratoOBS: TStringField
      FieldName = 'OBS'
      Visible = False
      Size = 200
    end
  end
  object dsContrato: TwwDataSource
    DataSet = qryContrato
    Left = 176
    Top = 56
  end
  object qryAditamento: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM ADITAMENTO'
      'WHERE (1=2)'
      ' ')
    UpdateObject = upAditamento
    ValidateWithMask = True
    Left = 40
    Top = 176
    object qryAditamentoIDCONTRATO: TFloatField
      FieldName = 'IDCONTRATO'
      Origin = 'BASEDADOS.ADITAMENTO.IDCONTRATO'
    end
    object qryAditamentoIDADITAMENTO: TFloatField
      FieldName = 'IDADITAMENTO'
      Origin = 'BASEDADOS.ADITAMENTO.IDADITAMENTO'
    end
    object qryAditamentoDATAASSADITAMENTO: TDateTimeField
      FieldName = 'DATAASSADITAMENTO'
      Origin = 'BASEDADOS.ADITAMENTO.DATAASSADITAMENTO'
    end
    object qryAditamentoDESCADITAMENTO: TMemoField
      FieldName = 'DESCADITAMENTO'
      Origin = 'BASEDADOS.ADITAMENTO.DESCADITAMENTO'
      BlobType = ftMemo
      Size = 500
    end
    object qryAditamentoFLGVIRTUAL: TStringField
      FieldName = 'FLGVIRTUAL'
      Origin = 'BASEDADOS.ADITAMENTO.FLGVIRTUAL'
      FixedChar = True
      Size = 1
    end
    object qryAditamentoTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.ADITAMENTO.TRGDTINCLUSAO'
    end
    object qryAditamentoTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.ADITAMENTO.TRGUSERINCLUSAO'
      Size = 30
    end
    object qryAditamentoCODADITAMENTO: TStringField
      FieldName = 'CODADITAMENTO'
      Origin = 'BASEDADOS.ADITAMENTO.CODADITAMENTO'
      Size = 15
    end
    object qryAditamentoIDPROCESSO: TFloatField
      FieldName = 'IDPROCESSO'
      Origin = 'BASEDADOS.ADITAMENTO.IDPROCESSO'
    end
  end
  object dsAditamento: TwwDataSource
    DataSet = qryAditamento
    Left = 112
    Top = 176
  end
  object upAditamento: TUpdateSQL
    ModifySQL.Strings = (
      'update ADITAMENTO'
      'set'
      '  IDCONTRATO = :IDCONTRATO,'
      '  IDADITAMENTO = :IDADITAMENTO,'
      '  DATAASSADITAMENTO = :DATAASSADITAMENTO,'
      '  DESCADITAMENTO = :DESCADITAMENTO,'
      '  FLGVIRTUAL = :FLGVIRTUAL,'
      '  CODADITAMENTO = :CODADITAMENTO,'
      '  IDPROCESSO = :IDPROCESSO'
      'where'
      '  IDCONTRATO = :OLD_IDCONTRATO and'
      '  IDADITAMENTO = :OLD_IDADITAMENTO')
    InsertSQL.Strings = (
      'insert into ADITAMENTO'
      
        '  (IDCONTRATO, IDADITAMENTO, DATAASSADITAMENTO, DESCADITAMENTO, ' +
        'FLGVIRTUAL, '
      '   CODADITAMENTO, IDPROCESSO)'
      'values'
      
        '  (:IDCONTRATO, :IDADITAMENTO, :DATAASSADITAMENTO, :DESCADITAMEN' +
        'TO, :FLGVIRTUAL, '
      '   :CODADITAMENTO, :IDPROCESSO)')
    DeleteSQL.Strings = (
      'delete from ADITAMENTO'
      'where'
      '  IDCONTRATO = :OLD_IDCONTRATO and'
      '  IDADITAMENTO = :OLD_IDADITAMENTO')
    Left = 192
    Top = 176
  end
end
