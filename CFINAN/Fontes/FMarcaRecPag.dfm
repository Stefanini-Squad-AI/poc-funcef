inherited frmMarcaRecPag: TfrmMarcaRecPag
  Left = 18
  Top = 141
  Caption = 'Marca os Documentos que serão Pagos e Recebidos'
  ClientHeight = 395
  ClientWidth = 746
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 746
    Height = 356
    object pnlDocAbertoPag: TPanel
      Left = 5
      Top = 179
      Width = 736
      Height = 31
      Align = alTop
      Alignment = taLeftJustify
      BevelInner = bvRaised
      Caption = '  Documentos em Aberto no Contas a Pagar'
      Color = clGrayText
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object sbMarcaTCAP: TSpeedButton
        Left = 454
        Top = 3
        Width = 129
        Height = 25
        Caption = 'Marca Todos'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777000007
          777777770022222007777778222222222077778A227722222207778A2FFF7222
          220778A22FFFF722222078A22FFFFF72222078A22FF7FFF7222078A22FF72FFF
          722078A22FF222FF7220778A2222222FF207778A2222222222077778AA222222
          2077777788AAAAA8877777777788888777777777777777777777}
        ParentFont = False
        OnClick = sbMarcaTCAPClick
      end
      object sbInvSelCAP: TSpeedButton
        Left = 598
        Top = 3
        Width = 129
        Height = 25
        Caption = 'Inverte Seleção'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Glyph.Data = {
          6E020000424D6E02000000000000760000002800000036000000120000000100
          040000000000F801000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777777777777FFFFFF777777777777777777777770077777770000007777777
          777FF888888F7777777777777777777777007777700111111077017777F88777
          77787F8777777700000077777700777701111111110011777F877FFFFF7788F8
          7777004444440770470077701119999911111177F877F88888F777F877704444
          4444400447007701119777779111117F877F8777778F77F8770444CCCCC44444
          47007701197777777111117F87F87777777877F870444C77777C444447007700
          0977777711111177888877777F8FFFF87044C777777744444700777777777779
          99999977FFFFF777788888887000C77777744444470070000007777777777778
          888887777777FFF77777777777CCCCCCC7007044444C777777000C787777F877
          7777888800000077777777777700704444C7777777044C7877778777777F87F8
          011111C77777700097007044440077777044C778777788FFFFF8778701111C77
          7777701197007044444400000444C7787FF7778888877F870111100777770119
          7700704CC4444444444C7778F88FF777777FF8770111111000001119770077C7
          7CC444444CC7777787788FFFFFF88777019911111111119777007777777CCCCC
          C777777777777888888777777977991111119977770077777777777777777777
          777777777777777777777799999977777700}
        NumGlyphs = 3
        ParentFont = False
        OnClick = sbInvSelCAPClick
      end
    end
    object pnlDocAbertoRec: TPanel
      Left = 5
      Top = 5
      Width = 736
      Height = 31
      Align = alTop
      Alignment = taLeftJustify
      BevelInner = bvRaised
      Caption = '  Documentos em Aberto no Contas a Receber'
      Color = clGrayText
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object sbInvSelCAR: TSpeedButton
        Left = 598
        Top = 3
        Width = 129
        Height = 25
        Caption = 'Inverte Seleção'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Glyph.Data = {
          6E020000424D6E02000000000000760000002800000036000000120000000100
          040000000000F801000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777777777777FFFFFF777777777777777777777770077777770000007777777
          777FF888888F7777777777777777777777007777700111111077017777F88777
          77787F8777777700000077777700777701111111110011777F877FFFFF7788F8
          7777004444440770470077701119999911111177F877F88888F777F877704444
          4444400447007701119777779111117F877F8777778F77F8770444CCCCC44444
          47007701197777777111117F87F87777777877F870444C77777C444447007700
          0977777711111177888877777F8FFFF87044C777777744444700777777777779
          99999977FFFFF777788888887000C77777744444470070000007777777777778
          888887777777FFF77777777777CCCCCCC7007044444C777777000C787777F877
          7777888800000077777777777700704444C7777777044C7877778777777F87F8
          011111C77777700097007044440077777044C778777788FFFFF8778701111C77
          7777701197007044444400000444C7787FF7778888877F870111100777770119
          7700704CC4444444444C7778F88FF777777FF8770111111000001119770077C7
          7CC444444CC7777787788FFFFFF88777019911111111119777007777777CCCCC
          C777777777777888888777777977991111119977770077777777777777777777
          777777777777777777777799999977777700}
        NumGlyphs = 3
        ParentFont = False
        OnClick = sbInvSelCARClick
      end
      object sbMarcaTCAR: TSpeedButton
        Left = 454
        Top = 3
        Width = 129
        Height = 25
        Caption = 'Marca Todos'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777000007
          777777770022222007777778222222222077778A227722222207778A2FFF7222
          220778A22FFFF722222078A22FFFFF72222078A22FF7FFF7222078A22FF72FFF
          722078A22FF222FF7220778A2222222FF207778A2222222222077778AA222222
          2077777788AAAAA8877777777788888777777777777777777777}
        ParentFont = False
        OnClick = sbMarcaTCARClick
      end
    end
    object dbgrAbertoCAP: TwwDBGrid
      Left = 5
      Top = 210
      Width = 736
      Height = 147
      Hint = 
        'Duplo Click no campo Pag.,  confirma que ele será pago e vice-ve' +
        'rsa'
      Selected.Strings = (
        'FLGCONFIRMARECPAG'#9'1'#9'Pag.'
        'DATAPROGRAMADA'#9'10'#9'Data ~Programada'
        'RAZAOSOCIAL'#9'25'#9'Fornecedor'
        'NUMDOC'#9'12'#9'Documento'
        'NUMAPGR'#9'11'#9'No. A.P.'
        'SALDO'#9'12'#9'Valor a Pagar'
        'DATACFLOAT'#9'10'#9'Data ~c/Float'
        'DATAVENCTO'#9'10'#9'Data ~Vencimento'
        'DATALANCTO'#9'10'#9'Data ~Lançamento'
        'DESCRICAO'#9'30'#9'Conta Bancária/Caixa'
        'OBS'#9'30'#9'O.B.S.')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alTop
      DataSource = dsAbertoCAP
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 2
      TitleButtons = False
      IndicatorColor = icBlack
    end
    object dbgrAbertoCAR: TwwDBGrid
      Left = 5
      Top = 36
      Width = 736
      Height = 143
      Hint = 
        'Duplo Click no campo Rec.,  confirma que ele será recebido e vic' +
        'e-versa'
      Selected.Strings = (
        'FLGCONFIRMARECPAG'#9'1'#9'Rec.'#9'No'
        'DATAPROGRAMADA'#9'10'#9'Data ~Programada'#9'No'
        'RAZAOSOCIAL'#9'25'#9'Cliente'#9'No'
        'NUMDOC'#9'12'#9'Documento'#9'No'
        'NUMAPGR'#9'11'#9'No. Guia Rec.'#9'No'
        'SALDO'#9'12'#9'Valor a Receber'#9'No'
        'DATACFLOAT'#9'10'#9'Data ~c/Float'#9'No'
        'DATAVENCTO'#9'10'#9'Data ~Vencimento'#9'No'
        'DATALANCTO'#9'10'#9'Data ~Lançamento'#9'No'
        'DESCRICAO'#9'30'#9'Conta Bancária/Caixa'#9'No'
        'OBS'#9'30'#9'O.B.S.'#9'No')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alTop
      DataSource = dsAbertoCAR
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      TitleAlignment = taLeftJustify
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
    Top = 356
    Width = 746
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryAbertoCAR: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT DECODE(C.DESCRICAO,NULL,'#39'Sem conta selecionada'#39',C.DESCRIC' +
        'AO) AS DESCRICAO,'
      '       C.CODPORTADOR,'
      '       D.CODDOCUMENTO,'
      
        '       (D.DATAPROGRAMADA+DECODE(P.DMAIS,NULL,0,P.DMAIS)) AS DATA' +
        'CFLOAT,'
      '       D.DATAPROGRAMADA,'
      '       D.DATAVENCTO,'
      '       S.SALDO,'
      '       PE.RAZAOSOCIAL,'
      '       DECODE(D.OBS,NULL,L.HISTORICOCOMPL,D.OBS) AS OBS,'
      '       L.DATALANCTO,'
      '       D.NODOCUMENTO||'#39'/'#39'||D.COMPLDOCUMENTO AS NUMDOC,'
      '       D.NUMAPGR,'
      '       D.FLGCONFIRMARECPAG'
      'FROM   '
      
        '     (SELECT CODDOCUMENTO, SUM(DECODE(DEBCRE,'#39'D'#39',VALOR,VALOR*-1)' +
        ') AS SALDO'
      '      FROM LANCTODOCUM '
      '      GROUP BY CODDOCUMENTO) S,'
      '      PESSOA PE, '
      '      DOCUMENTO D, '
      '      LANCTODOCUM L, '
      '      PORTADORFORMA P, '
      '      PORTADORCONTA C'
      'WHERE ((D.STATUS <> 2) OR (D.STATUS IS NULL)) AND'
      
        '      ((D.OPERACAO = '#39'1 '#39') OR (D.OPERACAO = '#39'2 '#39') OR (D.OPERACAO' +
        ' = '#39'3 '#39') OR (D.OPERACAO = '#39'14'#39')) AND'
      '      (D.IDPESSOA = :pIDPESSOA) AND'
      '      (D.DATAPROGRAMADA <= TO_DATE(:pDATAREF,'#39'DD/MM/YYYY'#39')) AND'
      '      (D.RECPAG = '#39'R'#39') AND'
      '      (D.IDFORCLI = PE.IDPESSOA) AND'
      '      (D.CODDOCUMENTO = S.CODDOCUMENTO) AND '
      '      (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '      (D.OPERACAO = L.OPERACAO) AND'
      '      (L.ESTORNO IS NULL) AND'
      '      (D.CODPORTFORMA = P.CODPORTFORMA(+)) AND'
      '      (P.CODPORTADOR = C.CODPORTADOR(+))'
      'ORDER BY D.DATAPROGRAMADA DESC '
      ' ')
    UpdateObject = updAbertoCAR
    ControlType.Strings = (
      'FLGCONFIRMARECPAG;CheckBox;S;N')
    ValidateWithMask = True
    Left = 160
    Top = 48
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pDATAREF'
        ParamType = ptUnknown
      end>
    object qryAbertoCARFLGCONFIRMARECPAG: TStringField
      DisplayLabel = 'Rec.'
      DisplayWidth = 1
      FieldName = 'FLGCONFIRMARECPAG'
      Size = 1
    end
    object qryAbertoCARDATAPROGRAMADA: TDateTimeField
      DisplayLabel = 'Data ~Programada'
      DisplayWidth = 10
      FieldName = 'DATAPROGRAMADA'
      EditMask = '!99/99/0000;1;_'
    end
    object qryAbertoCARRAZAOSOCIAL: TStringField
      DisplayLabel = 'Cliente'
      DisplayWidth = 25
      FieldName = 'RAZAOSOCIAL'
      ReadOnly = True
      Size = 60
    end
    object qryAbertoCARNUMDOC: TStringField
      DisplayLabel = 'Documento'
      DisplayWidth = 12
      FieldName = 'NUMDOC'
      ReadOnly = True
      Size = 44
    end
    object qryAbertoCARNUMAPGR: TFloatField
      DisplayLabel = 'No. Guia Rec.'
      DisplayWidth = 11
      FieldName = 'NUMAPGR'
      ReadOnly = True
    end
    object qryAbertoCARSALDO: TFloatField
      DisplayLabel = 'Valor a Receber'
      DisplayWidth = 12
      FieldName = 'SALDO'
      ReadOnly = True
      DisplayFormat = '#,##0.00'
    end
    object qryAbertoCARDATACFLOAT: TDateTimeField
      DisplayLabel = 'Data ~c/Float'
      DisplayWidth = 10
      FieldName = 'DATACFLOAT'
      ReadOnly = True
    end
    object qryAbertoCARDATAVENCTO: TDateTimeField
      DisplayLabel = 'Data ~Vencimento'
      DisplayWidth = 10
      FieldName = 'DATAVENCTO'
      ReadOnly = True
    end
    object qryAbertoCARDATALANCTO: TDateTimeField
      DisplayLabel = 'Data ~Lançamento'
      DisplayWidth = 10
      FieldName = 'DATALANCTO'
      ReadOnly = True
    end
    object qryAbertoCARDESCRICAO: TStringField
      DisplayLabel = 'Conta Bancária/Caixa'
      DisplayWidth = 30
      FieldName = 'DESCRICAO'
      ReadOnly = True
      Size = 50
    end
    object qryAbertoCAROBS: TMemoField
      DisplayLabel = 'O.B.S.'
      DisplayWidth = 30
      FieldName = 'OBS'
      ReadOnly = True
      BlobType = ftMemo
      Size = 1000
    end
    object qryAbertoCARCODPORTADOR: TFloatField
      FieldName = 'CODPORTADOR'
      ReadOnly = True
      Visible = False
    end
    object qryAbertoCARCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      ReadOnly = True
      Visible = False
    end
  end
  object dsAbertoCAR: TwwDataSource
    DataSet = qryAbertoCAR
    Left = 232
    Top = 48
  end
  object updAbertoCAR: TUpdateSQL
    ModifySQL.Strings = (
      'update DOCUMENTO'
      'set'
      '  DATAPROGRAMADA = :DATAPROGRAMADA,'
      '  FLGCONFIRMARECPAG = :FLGCONFIRMARECPAG'
      'where'
      '  CODDOCUMENTO = :OLD_CODDOCUMENTO')
    InsertSQL.Strings = (
      'insert into DOCUMENTO'
      '  (DATAPROGRAMADA, FLGCONFIRMARECPAG)'
      'values'
      '  (:DATAPROGRAMADA, :FLGCONFIRMARECPAG)')
    DeleteSQL.Strings = (
      'delete from DOCUMENTO'
      'where'
      '  CODDOCUMENTO = :OLD_CODDOCUMENTO')
    Left = 304
    Top = 47
  end
  object qryAbertoCAP: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT DECODE(C.DESCRICAO,NULL,'#39'Sem conta selecionada'#39',C.DESCRIC' +
        'AO) AS DESCRICAO,'
      '       C.CODPORTADOR,'
      '       D.CODDOCUMENTO,'
      
        '       (D.DATAPROGRAMADA+DECODE(P.DMAIS,NULL,0,P.DMAIS)) AS DATA' +
        'CFLOAT,'
      '       D.DATAPROGRAMADA,'
      '       D.DATAVENCTO,'
      '       S.SALDO,'
      '       PE.RAZAOSOCIAL,'
      '       DECODE(D.OBS,NULL,L.HISTORICOCOMPL,D.OBS) AS OBS,'
      '       L.DATALANCTO,'
      '       D.NODOCUMENTO||'#39'/'#39'||D.COMPLDOCUMENTO AS NUMDOC,'
      '       D.NUMAPGR,'
      '       D.FLGCONFIRMARECPAG'
      'FROM'
      
        '     (SELECT CODDOCUMENTO, SUM(DECODE(DEBCRE,'#39'C'#39',VALOR,VALOR*-1)' +
        ') AS SALDO'
      '      FROM LANCTODOCUM'
      '      GROUP BY CODDOCUMENTO) S,'
      '      PESSOA PE,'
      '      DOCUMENTO D,'
      '      LANCTODOCUM L,'
      '      PORTADORFORMA P,'
      '      PORTADORCONTA C'
      'WHERE ((D.STATUS <> 2) OR (D.STATUS IS NULL)) AND'
      
        '      ((D.OPERACAO = '#39'1 '#39') OR (D.OPERACAO = '#39'2 '#39') OR (D.OPERACAO' +
        ' = '#39'3 '#39') OR (D.OPERACAO = '#39'14'#39')) AND'
      '      (D.DATAPROGRAMADA <= TO_DATE(:pDATAREF,'#39'DD/MM/YYYY'#39')) AND'
      '      (D.IDPESSOA = :pIDPESSOA) AND'
      '      (D.RECPAG = '#39'P'#39') AND'
      '      (D.IDFORCLI = PE.IDPESSOA) AND'
      '      (D.CODDOCUMENTO = S.CODDOCUMENTO) AND'
      '      (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '      (D.OPERACAO = L.OPERACAO) AND'
      '      (L.ESTORNO IS NULL) AND'
      '      (D.CODPORTFORMA = P.CODPORTFORMA(+)) AND'
      '      (P.CODPORTADOR = C.CODPORTADOR(+))'
      'ORDER BY D.DATAPROGRAMADA DESC'
      ' ')
    UpdateObject = updAbertoCAP
    ControlType.Strings = (
      'FLGCONFIRMARECPAG;CheckBox;S;N')
    ValidateWithMask = True
    Left = 160
    Top = 104
    ParamData = <
      item
        DataType = ftString
        Name = 'pDATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryAbertoCAPFLGCONFIRMARECPAG: TStringField
      DisplayLabel = 'Pag.'
      DisplayWidth = 1
      FieldName = 'FLGCONFIRMARECPAG'
      Size = 1
    end
    object qryAbertoCAPDATAPROGRAMADA: TDateTimeField
      DisplayLabel = 'Data ~Programada'
      DisplayWidth = 10
      FieldName = 'DATAPROGRAMADA'
      EditMask = '!99/99/0000;1;_'
    end
    object qryAbertoCAPRAZAOSOCIAL: TStringField
      DisplayLabel = 'Fornecedor'
      DisplayWidth = 25
      FieldName = 'RAZAOSOCIAL'
      ReadOnly = True
      Size = 60
    end
    object qryAbertoCAPNUMDOC: TStringField
      DisplayLabel = 'Documento'
      DisplayWidth = 12
      FieldName = 'NUMDOC'
      ReadOnly = True
      Size = 44
    end
    object qryAbertoCAPNUMAPGR: TFloatField
      DisplayLabel = 'No. A.P.'
      DisplayWidth = 11
      FieldName = 'NUMAPGR'
      ReadOnly = True
    end
    object qryAbertoCAPSALDO: TFloatField
      DisplayLabel = 'Valor a Pagar'
      DisplayWidth = 12
      FieldName = 'SALDO'
      ReadOnly = True
      DisplayFormat = '#,##0.00'
    end
    object qryAbertoCAPDATACFLOAT: TDateTimeField
      DisplayLabel = 'Data ~c/Float'
      DisplayWidth = 10
      FieldName = 'DATACFLOAT'
      ReadOnly = True
    end
    object qryAbertoCAPDATAVENCTO: TDateTimeField
      DisplayLabel = 'Data ~Vencimento'
      DisplayWidth = 10
      FieldName = 'DATAVENCTO'
      ReadOnly = True
    end
    object qryAbertoCAPDATALANCTO: TDateTimeField
      DisplayLabel = 'Data ~Lançamento'
      DisplayWidth = 10
      FieldName = 'DATALANCTO'
      ReadOnly = True
    end
    object qryAbertoCAPDESCRICAO: TStringField
      DisplayLabel = 'Conta Bancária/Caixa'
      DisplayWidth = 30
      FieldName = 'DESCRICAO'
      ReadOnly = True
      Size = 50
    end
    object qryAbertoCAPOBS: TMemoField
      DisplayLabel = 'O.B.S.'
      DisplayWidth = 30
      FieldName = 'OBS'
      ReadOnly = True
      BlobType = ftMemo
      Size = 1000
    end
    object qryAbertoCAPCODPORTADOR: TFloatField
      FieldName = 'CODPORTADOR'
      ReadOnly = True
      Visible = False
    end
    object qryAbertoCAPCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      ReadOnly = True
      Visible = False
    end
  end
  object dsAbertoCAP: TwwDataSource
    DataSet = qryAbertoCAP
    Left = 232
    Top = 104
  end
  object updAbertoCAP: TUpdateSQL
    ModifySQL.Strings = (
      'update DOCUMENTO'
      'set'
      '  DATAPROGRAMADA = :DATAPROGRAMADA,'
      '  FLGCONFIRMARECPAG = :FLGCONFIRMARECPAG'
      'where'
      '  CODDOCUMENTO = :OLD_CODDOCUMENTO')
    InsertSQL.Strings = (
      'insert into DOCUMENTO'
      '  (DATAPROGRAMADA, FLGCONFIRMARECPAG)'
      'values'
      '  (:DATAPROGRAMADA, :FLGCONFIRMARECPAG)')
    DeleteSQL.Strings = (
      'delete from DOCUMENTO'
      'where'
      '  CODDOCUMENTO = :OLD_CODDOCUMENTO')
    Left = 304
    Top = 103
  end
end
