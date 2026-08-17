inherited frmMovBensPendentes: TfrmMovBensPendentes
  Left = 33
  Top = 127
  HelpContext = 70027
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Entradas Pendentes do Almoxarifado'
  ClientHeight = 397
  ClientWidth = 724
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 724
    Height = 358
    object pnlSelNota: TPanel
      Left = 5
      Top = 5
      Width = 714
      Height = 122
      Align = alTop
      TabOrder = 0
      object Label2: TLabel
        Left = 8
        Top = 8
        Width = 194
        Height = 13
        Caption = 'Documentos com Bens Pendentes'
      end
      object dbgNotas: TwwDBGrid
        Left = 8
        Top = 24
        Width = 699
        Height = 74
        Selected.Strings = (
          'IDNOTA'#9'12'#9'Documento Nº'
          'NOME'#9'56'#9'Fornecedor'
          'DTANOTA'#9'10'#9'Data'
          'SOMANOTA'#9'16'#9'Valor Nota')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        DataSource = dsNotas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        ParentFont = False
        TabOrder = 0
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        OnCalcCellColors = dbgNotasCalcCellColors
        IndicatorColor = icBlack
        OnTopRowChanged = dbgNotasTopRowChanged
      end
      object bbtnProcessaNotas: TBitBtn
        Left = 547
        Top = 97
        Width = 164
        Height = 25
        Caption = 'Processa &Documento'
        ModalResult = 8
        TabOrder = 1
        OnClick = bbtnProcessaNotasClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888002222200
          88888887788888778F88887222222222088888788888888878F887A228822222
          208887F88FFF888887F887A2FFF8222220888788777FF888878F7A22FFFF8222
          22087F887777FF88887F7A22FFFFF82222087F8877777FF8887F7A22FF8FFF82
          22087F8877F777FF887F7A22FF82FFF822087F8877F8777F887F7A22FF222FF8
          220878F87788877FF87887A2222222FF208887F88888887787F887A222222222
          2088878F888888888788887AA222222208888878FF88888F788888877AAAAA77
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
      end
    end
    object pnlSelBem: TPanel
      Left = 5
      Top = 127
      Width = 714
      Height = 226
      Align = alClient
      TabOrder = 1
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 189
        Height = 13
        Caption = 'Bens do Documento Selecionado'
      end
      object dbgBensPend: TwwDBGrid
        Left = 8
        Top = 24
        Width = 699
        Height = 177
        Hint = 'Duplo click desfaz a seleção'
        Selected.Strings = (
          'PLACA'#9'16'#9'Nº Tombamento'
          'DESBEM'#9'61'#9'Descrição'
          'VALORG'#9'14'#9'Valor Aquisição'
          'ALTERADO'#9'3'#9'Ok')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        DataSource = dsBensPend
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        OnCalcCellColors = dbgBensPendCalcCellColors
        OnDblClick = dbgBensPendDblClick
        IndicatorColor = icBlack
        OnTopRowChanged = dbgBensPendTopRowChanged
      end
      object bbtnProcessaBem: TBitBtn
        Left = 582
        Top = 200
        Width = 130
        Height = 25
        Caption = 'Processa &Bem'
        TabOrder = 1
        OnClick = bbtnProcessaBemClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          88888FFFFFFFFFFFF888000000000000008877777777777777880BBBBBBBBBBB
          B08878888888888887F80BBBBBBBBBBBB0887F8FFFFFFFFFF7F80BCCCCCCCCCC
          B0887F7777777777F7880BBBBBBB000000087F8FFFF8777777780BCCCC40FFFF
          FFF87F777777FFF888880BBBB2040000FFF87F8FF877777788880BCCCB0240F0
          FFF87877787877F7F88880BBB00F2400FFF887FFF77F8777F8888800080FF240
          FFF88877787F8877F88888888800FF240FF888888877F8877F88888888880FF2
          40F8888888887F8877F88888888880FF24488888888887FFF778888888888800
          0248888888888877787888888888888888288888888888888878}
        NumGlyphs = 2
      end
    end
  end
  inherited Dock971: TDock97
    Top = 358
    Width = 724
    inherited tb97Fundo: TToolbar97
      Left = 544
      DockPos = 544
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 70027
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 377
      DockPos = 377
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 507
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryBensPend: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT BP.IDPESSOA, BP.IDFORNSERV, BP.IDNOTA, BP.IDITENSRECDEV, ' +
        'BP.PLACA, BP.DESBEM,'
      
        '       BP.VALORG, BP.IDMODULO, BP.IDGRUPO, BP.IDCLASSEBEM, BP.ID' +
        'CONJUNTO, BP.IDSITUACAO,'
      
        '       BP.CONTROLE, BP.COMPLNOTA, BP.DTANOTA, BP.DTAINCLUSAO, BP' +
        '.NUMSERIE,'
      '       0              AS IDTERCEIRO,'
      '       0              AS UNIDNEGOC,'
      '       0              AS CODSUBCONTA,'
      '       '#39'I'#39'            AS REGISTRO,'
      '       0              AS VALHISTORICO,'
      '       0              AS TAXADEP,'
      '       DTAINCLUSAO    AS DATAINICIODEP,'
      '       DTAINCLUSAO    AS DATAULTDEP,'
      '       '#39'                              '#39' AS IDOPCIONAL,'
      '       0              AS ALTERADO,'
      '       '#39'                              '#39' AS PROCESSOAQUIS,'
      '       '#39'                              '#39' AS EMPENHOAQUIS,'
      
        '       '#39'                                                        ' +
        '    '#39' AS PUBAUTOR,'
      
        '       '#39'                                                        ' +
        '    '#39' AS PUBEDITORA,'
      '       0              AS PUBANO,'
      '       S.DESCSITUACAO,'
      '       BP.IDBENSPENDENTES'
      ''
      'FROM BENSPENDENTES BP,'
      '     SITUACAO S'
      'WHERE (BP.IDPESSOA             = :PIDPESSOA)'
      '  AND (BP.IDFORNSERV           = :PIDFORNSERV)'
      '  AND (LTRIM(RTRIM(BP.IDNOTA)) = :PIDNOTA)'
      '  AND (BP.IDSITUACAO           = S.IDSITUACAO(+))'
      '  ')
    UpdateObject = updBensPend
    ControlType.Strings = (
      'ALTERADO;CheckBox;1;0')
    ValidateWithMask = True
    Left = 168
    Top = 296
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDFORNSERV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PIDNOTA'
        ParamType = ptUnknown
      end>
    object qryBensPendPLACA: TFloatField
      DisplayLabel = 'Nº Tombamento'
      DisplayWidth = 16
      FieldName = 'PLACA'
    end
    object qryBensPendDESBEM: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 61
      FieldName = 'DESBEM'
      Size = 200
    end
    object qryBensPendVALORG: TFloatField
      DisplayLabel = 'Valor Aquisição'
      DisplayWidth = 14
      FieldName = 'VALORG'
    end
    object qryBensPendALTERADO: TFloatField
      DisplayLabel = 'Ok'
      DisplayWidth = 3
      FieldName = 'ALTERADO'
    end
    object qryBensPendIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object qryBensPendIDFORNSERV: TFloatField
      FieldName = 'IDFORNSERV'
      Visible = False
    end
    object qryBensPendIDNOTA: TStringField
      FieldName = 'IDNOTA'
      Visible = False
      Size = 18
    end
    object qryBensPendIDITENSRECDEV: TFloatField
      FieldName = 'IDITENSRECDEV'
      Visible = False
    end
    object qryBensPendIDMODULO: TFloatField
      FieldName = 'IDMODULO'
      Visible = False
    end
    object qryBensPendIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
      Visible = False
    end
    object qryBensPendIDCLASSEBEM: TFloatField
      FieldName = 'IDCLASSEBEM'
      Visible = False
    end
    object qryBensPendIDCONJUNTO: TFloatField
      FieldName = 'IDCONJUNTO'
      Visible = False
    end
    object qryBensPendIDSITUACAO: TFloatField
      FieldName = 'IDSITUACAO'
      Visible = False
    end
    object qryBensPendCONTROLE: TStringField
      FieldName = 'CONTROLE'
      Visible = False
      Size = 1
    end
    object qryBensPendCOMPLNOTA: TStringField
      FieldName = 'COMPLNOTA'
      Visible = False
      Size = 5
    end
    object qryBensPendDTANOTA: TDateTimeField
      FieldName = 'DTANOTA'
      Visible = False
    end
    object qryBensPendDTAINCLUSAO: TDateTimeField
      FieldName = 'DTAINCLUSAO'
      Visible = False
    end
    object qryBensPendNUMSERIE: TStringField
      FieldName = 'NUMSERIE'
      Visible = False
    end
    object qryBensPendIDTERCEIRO: TFloatField
      FieldName = 'IDTERCEIRO'
      Visible = False
    end
    object qryBensPendUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Visible = False
    end
    object qryBensPendCODSUBCONTA: TFloatField
      FieldName = 'CODSUBCONTA'
      Visible = False
    end
    object qryBensPendREGISTRO: TStringField
      FieldName = 'REGISTRO'
      Visible = False
      Size = 1
    end
    object qryBensPendVALHISTORICO: TFloatField
      FieldName = 'VALHISTORICO'
      Visible = False
    end
    object qryBensPendTAXADEP: TFloatField
      FieldName = 'TAXADEP'
      Visible = False
    end
    object qryBensPendDATAINICIODEP: TDateTimeField
      FieldName = 'DATAINICIODEP'
      Visible = False
    end
    object qryBensPendDATAULTDEP: TDateTimeField
      FieldName = 'DATAULTDEP'
      Visible = False
    end
    object qryBensPendIDOPCIONAL: TStringField
      FieldName = 'IDOPCIONAL'
      Visible = False
      Size = 30
    end
    object qryBensPendPROCESSOAQUIS: TStringField
      FieldName = 'PROCESSOAQUIS'
      Visible = False
      Size = 30
    end
    object qryBensPendEMPENHOAQUIS: TStringField
      FieldName = 'EMPENHOAQUIS'
      Visible = False
      Size = 30
    end
    object qryBensPendPUBAUTOR: TStringField
      FieldName = 'PUBAUTOR'
      Visible = False
      Size = 60
    end
    object qryBensPendPUBEDITORA: TStringField
      FieldName = 'PUBEDITORA'
      Visible = False
      Size = 60
    end
    object qryBensPendPUBANO: TFloatField
      FieldName = 'PUBANO'
      Visible = False
    end
    object qryBensPendDESCSITUACAO: TStringField
      FieldName = 'DESCSITUACAO'
      Visible = False
      Size = 45
    end
    object qryBensPendIDBENSPENDENTES: TFloatField
      FieldName = 'IDBENSPENDENTES'
      Visible = False
    end
  end
  object dsBensPend: TwwDataSource
    AutoEdit = False
    DataSet = qryBensPend
    Left = 240
    Top = 296
  end
  object qryNotas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT BP.IDPESSOA, BP.IDFORNSERV, P.NOME, BP.IDNOTA, BP.DTANOTA' +
        ','
      '       SUM(BP.VALORG) AS SOMANOTA'
      'FROM BENSPENDENTES BP,'
      '     PESSOA P'
      'WHERE (BP.IDPESSOA   = :PIDPESSOA)'
      '  AND (BP.IDFORNSERV = P.IDPESSOA)'
      
        'GROUP BY BP.IDPESSOA, BP.IDFORNSERV, P.NOME, BP.IDNOTA, BP.DTANO' +
        'TA'
      '')
    ValidateWithMask = True
    Left = 408
    Top = 72
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryNotasIDNOTA: TStringField
      DisplayLabel = 'Documento Nº'
      DisplayWidth = 12
      FieldName = 'IDNOTA'
      Origin = 'BENSPENDENTES.IDNOTA'
      Size = 18
    end
    object qryNotasNOME: TStringField
      DisplayLabel = 'Fornecedor'
      DisplayWidth = 56
      FieldName = 'NOME'
      Origin = 'PESSOA.NOME'
      Size = 60
    end
    object qryNotasDTANOTA: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Data'
      DisplayWidth = 10
      FieldName = 'DTANOTA'
      Origin = 'BENSPENDENTES.DTANOTA'
    end
    object qryNotasSOMANOTA: TFloatField
      DisplayLabel = 'Valor Nota'
      DisplayWidth = 16
      FieldName = 'SOMANOTA'
      Origin = 'BENSPENDENTES.VALORG'
    end
    object qryNotasIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Origin = 'BENSPENDENTES.IDPESSOA'
      Visible = False
    end
    object qryNotasIDFORNSERV: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFORNSERV'
      Origin = 'BENSPENDENTES.IDFORNSERV'
      Visible = False
    end
  end
  object dsNotas: TwwDataSource
    AutoEdit = False
    DataSet = qryNotas
    Left = 456
    Top = 72
  end
  object updBensPend: TUpdateSQL
    ModifySQL.Strings = (
      'update BENSPENDENTES'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  IDFORNSERV = :IDFORNSERV,'
      '  IDNOTA = :IDNOTA,'
      '  IDITENSRECDEV = :IDITENSRECDEV,'
      '  PLACA = :PLACA,'
      '  DESBEM = :DESBEM,'
      '  VALORG = :VALORG,'
      '  IDMODULO = :IDMODULO,'
      '  IDGRUPO = :IDGRUPO,'
      '  IDCLASSEBEM = :IDCLASSEBEM,'
      '  IDCONJUNTO = :IDCONJUNTO,'
      '  IDSITUACAO = :IDSITUACAO,'
      '  CONTROLE = :CONTROLE,'
      '  COMPLNOTA = :COMPLNOTA,'
      '  DTANOTA = :DTANOTA,'
      '  DTAINCLUSAO = :DTAINCLUSAO,'
      '  NUMSERIE = :NUMSERIE,'
      '  IDTERCEIRO = :IDTERCEIRO,'
      '  UNIDNEGOC = :UNIDNEGOC,'
      '  CODSUBCONTA = :CODSUBCONTA,'
      '  REGISTRO = :REGISTRO,'
      '  VALHISTORICO = :VALHISTORICO,'
      '  TAXADEP = :TAXADEP,'
      '  DATAINICIODEP = :DATAINICIODEP,'
      '  DATAULTDEP = :DATAULTDEP,'
      '  IDOPCIONAL = :IDOPCIONAL,'
      '  ALTERADO = :ALTERADO,'
      '  PROCESSOAQUIS = :PROCESSOAQUIS,'
      '  EMPENHOAQUIS = :EMPENHOAQUIS,'
      '  PUBAUTOR = :PUBAUTOR,'
      '  PUBEDITORA = :PUBEDITORA,'
      '  PUBANO = :PUBANO'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDFORNSERV = :OLD_IDFORNSERV and'
      '  IDNOTA = :OLD_IDNOTA and'
      '  IDITENSRECDEV = :OLD_IDITENSRECDEV')
    InsertSQL.Strings = (
      'insert into BENSPENDENTES'
      
        '  (IDPESSOA, IDFORNSERV, IDNOTA, IDITENSRECDEV, PLACA, DESBEM, V' +
        'ALORG, '
      
        '   IDMODULO, IDGRUPO, IDCLASSEBEM, IDCONJUNTO, IDSITUACAO, CONTR' +
        'OLE, COMPLNOTA, '
      
        '   DTANOTA, DTAINCLUSAO, NUMSERIE, IDTERCEIRO, UNIDNEGOC, CODSUB' +
        'CONTA, '
      
        '   REGISTRO, VALHISTORICO, TAXADEP, DATAINICIODEP, DATAULTDEP, I' +
        'DOPCIONAL, '
      
        '   ALTERADO, PROCESSOAQUIS, EMPENHOAQUIS, PUBAUTOR, PUBEDITORA, ' +
        'PUBANO)'
      'values'
      
        '  (:IDPESSOA, :IDFORNSERV, :IDNOTA, :IDITENSRECDEV, :PLACA, :DES' +
        'BEM, :VALORG, '
      
        '   :IDMODULO, :IDGRUPO, :IDCLASSEBEM, :IDCONJUNTO, :IDSITUACAO, ' +
        ':CONTROLE, '
      
        '   :COMPLNOTA, :DTANOTA, :DTAINCLUSAO, :NUMSERIE, :IDTERCEIRO, :' +
        'UNIDNEGOC, '
      
        '   :CODSUBCONTA, :REGISTRO, :VALHISTORICO, :TAXADEP, :DATAINICIO' +
        'DEP, :DATAULTDEP, '
      
        '   :IDOPCIONAL, :ALTERADO, :PROCESSOAQUIS, :EMPENHOAQUIS, :PUBAU' +
        'TOR, :PUBEDITORA, '
      '   :PUBANO)')
    DeleteSQL.Strings = (
      'delete from BENSPENDENTES'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDFORNSERV = :OLD_IDFORNSERV and'
      '  IDNOTA = :OLD_IDNOTA and'
      '  IDITENSRECDEV = :OLD_IDITENSRECDEV')
    Left = 312
    Top = 296
  end
  object qryRemBensPend: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM BENSPENDENTES'
      'WHERE (IDBENSPENDENTES = :PIDBENSPENDENTES)')
    ValidateWithMask = True
    Left = 424
    Top = 296
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDBENSPENDENTES'
        ParamType = ptUnknown
      end>
  end
  object qryPlaca: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT B.IDBEM, B.IDPESSOA, B.PLACA, B.DESBEM, P.NOME AS NOMEFOR' +
        'N, B.IDNOTA, B.DTANOTA'
      'FROM BEM B,'
      '     PESSOA P'
      'WHERE (B.IDPESSOA = :IDPESSOA)'
      '  AND (B.PLACA = :PLACA)'
      '  AND (B.IDFORNSERV = P.IDPESSOA(+))'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 80
    Top = 296
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PLACA'
        ParamType = ptUnknown
      end>
  end
end
