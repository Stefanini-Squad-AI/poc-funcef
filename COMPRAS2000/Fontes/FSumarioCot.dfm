inherited FrmSumarioCot: TFrmSumarioCot
  Left = 21
  Top = 52
  Caption = 'Sumário de Cotação'
  ClientHeight = 403
  ClientWidth = 768
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 768
    Height = 364
    object Splitter1: TSplitter
      Left = 273
      Top = 65
      Width = 7
      Height = 294
      Cursor = crHSplit
    end
    object plnTitulo: TPanel
      Left = 5
      Top = 5
      Width = 758
      Height = 60
      Align = alTop
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Label3: TLabel
        Left = 416
        Top = 41
        Width = 229
        Height = 13
        Caption = 'Selecionado pelo sistema e pelo usuário'
        Transparent = True
      end
      object Label2: TLabel
        Left = 416
        Top = 23
        Width = 144
        Height = 13
        Caption = 'Selecionado pelo usuário'
        Transparent = True
      end
      object Label1: TLabel
        Left = 416
        Top = 4
        Width = 145
        Height = 13
        Caption = 'Selecionado pelo sistema'
        Transparent = True
      end
      object Label4: TLabel
        Left = 8
        Top = 8
        Width = 100
        Height = 16
        Caption = 'Processo Nº : '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LbProc: TLabel
        Left = 104
        Top = 8
        Width = 50
        Height = 16
        Caption = 'LbProc'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbBar: TLabel
        Left = 8
        Top = 33
        Width = 123
        Height = 13
        Caption = 'Processando Sumário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        Visible = False
      end
      object BtnSelProc: TSpeedButton
        Left = 676
        Top = 5
        Width = 73
        Height = 49
        Caption = '&Processo'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
          777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
          77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
          77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
          077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
          FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
          F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
          7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
          777777787FFF8777777777770000777777777777888877777777}
        Layout = blGlyphTop
        NumGlyphs = 2
        OnClick = BtnSelProcClick
      end
      object lbStatus: TLabel
        Left = 8
        Top = 32
        Width = 54
        Height = 20
        Caption = 'Status'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Panel1: TPanel
        Left = 393
        Top = 3
        Width = 19
        Height = 17
        BevelInner = bvRaised
        Caption = 'S'
        Color = 8454143
        TabOrder = 0
      end
      object Panel2: TPanel
        Left = 393
        Top = 21
        Width = 19
        Height = 17
        BevelInner = bvRaised
        Caption = 'U'
        Color = 12042751
        TabOrder = 1
      end
      object Panel3: TPanel
        Left = 393
        Top = 39
        Width = 19
        Height = 17
        BevelInner = bvRaised
        Caption = 'C'
        Color = 8454016
        TabOrder = 2
      end
      object pgBar: TProgressBar
        Left = 136
        Top = 32
        Width = 249
        Height = 18
        Min = 0
        Max = 100
        TabOrder = 3
        Visible = False
      end
    end
    object GrdCotacao: TwwDBGrid
      Left = 280
      Top = 65
      Width = 483
      Height = 294
      Hint = 'Duplo Click para selecionar fornecedor'
      Selected.Strings = (
        'RAZAOSOCIAL'#9'30'#9'Fornecedor'#9'F'
        'PROPOSTA'#9'10'#9'Proposta Nº'#9'F'
        'PRECOAVALORPRES'#9'10'#9'Preço a Valor~Presente'#9'F'
        'STATUS'#9'1'#9'Status'#9'F'
        'PRECO'#9'10'#9'Preço'#9'F'
        'MOESIGLA'#9'10'#9'Moeda'#9'F'
        'QTDEFORNECIDA'#9'10'#9'Quantidade~Fornecida'#9'F'
        'CODMEDIDA'#9'4'#9'Unidade'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      Color = clWhite
      DataSource = dsCotacao
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      TitleAlignment = taCenter
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 2
      TitleButtons = False
      OnCalcCellColors = GrdCotacaoCalcCellColors
      OnDblClick = GrdCotacaoDblClick
      IndicatorColor = icBlack
      OnTopRowChanged = GrdCotacaoTopRowChanged
    end
    object grdArt: TwwDBGrid
      Left = 5
      Top = 65
      Width = 268
      Height = 294
      Selected.Strings = (
        'DESCRICAO'#9'30'#9'Artigo'
        'QTDEPEDIDA'#9'10'#9'Quatidade~Pedida')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alLeft
      Color = clWhite
      DataSource = dsProcxArt
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      ParentFont = False
      TabOrder = 2
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
    Top = 364
    Width = 768
    inherited tb97Fundo: TToolbar97
      Left = 338
      DockPos = 338
      inherited sep1: TToolbarSep97
        Left = 254
        SizeHorz = 5
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 339
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      object ToolbarSep972: TToolbarSep97 [2]
        Left = 126
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 259
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 341
      end
      object btnConfSel: TBitBtn
        Left = 128
        Top = 0
        Width = 126
        Height = 33
        Hint = 'Seleciona processo a ser consultado'
        Caption = '&Aceita Seleção'
        Default = True
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = btnConfSelClick
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333330000333333333333333333333333F33333333333
          00003333344333333333333333388F3333333333000033334224333333333333
          338338F3333333330000333422224333333333333833338F3333333300003342
          222224333333333383333338F3333333000034222A22224333333338F338F333
          8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
          33333338F83338F338F33333000033A33333A222433333338333338F338F3333
          0000333333333A222433333333333338F338F33300003333333333A222433333
          333333338F338F33000033333333333A222433333333333338F338F300003333
          33333333A222433333333333338F338F00003333333333333A22433333333333
          3338F38F000033333333333333A223333333333333338F830000333333333333
          333A333333333333333338330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
        Spacing = 2
      end
      object btnGeraOC: TBitBtn
        Left = 0
        Top = 0
        Width = 126
        Height = 33
        Caption = 'Gerar O.C.'
        Enabled = False
        TabOrder = 3
        OnClick = btnGeraOCClick
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
    Left = 779
    Top = 65523
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'COTACOES.CODPROCESSO'
      'PESSOA.RAZAOSOCIAL'
      'COTACOES.PROPOSTA'
      'PROCXART.CODARTIGO'
      
        'DECODE(PROCXART.IDPRODVARI,NULL,PRODUTO.DESCPROD,PRODVARI.DESCPR' +
        'ODVARI)')
    TipodeDado.Strings = (
      'N'
      'C'
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Nº do Processo'
      'Fornecedor'
      'Nº da Proposta'
      'Código do Item'
      'Descrição do Item')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'PROCESSO'
      'COTACOES'
      'PROCXART'
      'ARTIGO'
      'PRODUTO'
      'PRODVARI')
    CamposChave.Strings = (
      'COTACOES.CODPROCESSO'
      'COTACOES.IDFORCLI'
      'COTACOES.PROPOSTA'
      'PROCESSO.STATUS')
    Filtro.Strings = (
      'COTACOES.CODPROCESSO  = PROCESSO.CODPROCESSO'
      'COTACOES.IDPROCXART   = PROCXART.IDPROCXART'
      'COTACOES.CODPROCESSO  = PROCXART.CODPROCESSO'
      'COTACOES.IDFORCLI     = PESSOA.IDPESSOA'
      'PROCXART.CODARTIGO    = ARTIGO.CODARTIGO'
      'ARTIGO.CODPRODUTO     = PRODUTO.CODPRODUTO'
      'PROCXART.IDPRODVARI   = PRODVARI.IDPRODVARI(+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '60'
      '10'
      '14'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 487
    Top = 285
  end
  object qryCotacao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     C.IDFORCLI,'
      '     C.IDPROCXART,'
      '     C.CODPROCESSO,'
      '     C.PROPOSTA,'
      '     C.QTDEFORNECIDA,'
      '     C.PRECO,'
      '     C.CODMEDIDA,'
      '     C.NUMCOT,'
      '     C.DATACOT,'
      '     C.STATUS,'
      '     C.OBS,'
      '     C.MOECODIGO,'
      '     C.TXJUROS,'
      '     C.PRECOAVALORPRES,'
      '     P.RAZAOSOCIAL,'
      '     M.MOESIGLA'
      'FROM'
      '    PESSOA P,'
      '    COTACOES C,'
      '    MOEDA M'
      'WHERE'
      '      (C.CODPROCESSO  = :CODPROCESSO)'
      '  AND (C.IDPROCXART   = :IDPROCXART)'
      '  AND (C.IDFORCLI     = P.IDPESSOA)'
      '  AND (C.MOECODIGO    = M.MOECODIGO(+))'
      'ORDER BY C.PRECOAVALORPRES')
    UpdateObject = updCotacao
    ValidateWithMask = True
    Left = 400
    Top = 134
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPROCXART'
        ParamType = ptUnknown
      end>
    object qryCotacaoRAZAOSOCIAL: TStringField
      DisplayLabel = 'Fornecedor'
      DisplayWidth = 30
      FieldName = 'RAZAOSOCIAL'
      Origin = 'PESSOA.RAZAOSOCIAL'
      Size = 60
    end
    object qryCotacaoPROPOSTA: TFloatField
      DisplayLabel = 'Proposta Nº'
      DisplayWidth = 10
      FieldName = 'PROPOSTA'
      Origin = 'COTACOES.PROPOSTA'
    end
    object qryCotacaoPRECOAVALORPRES: TFloatField
      DisplayLabel = 'Preço a Valor~Presente'
      DisplayWidth = 10
      FieldName = 'PRECOAVALORPRES'
      Origin = 'COTACOES.PRECOAVALORPRES'
      DisplayFormat = '#,##0.00'
    end
    object qryCotacaoSTATUS: TStringField
      Alignment = taCenter
      DisplayLabel = 'Status'
      DisplayWidth = 1
      FieldName = 'STATUS'
      Origin = 'COTACOES.STATUS'
      Size = 1
    end
    object qryCotacaoPRECO: TFloatField
      DisplayLabel = 'Preço'
      DisplayWidth = 10
      FieldName = 'PRECO'
      Origin = 'COTACOES.PRECO'
      DisplayFormat = '#,##0.00'
    end
    object qryCotacaoMOESIGLA: TStringField
      DisplayLabel = 'Moeda'
      DisplayWidth = 10
      FieldName = 'MOESIGLA'
      Size = 10
    end
    object qryCotacaoQTDEFORNECIDA: TFloatField
      DisplayLabel = 'Quantidade~Fornecida'
      DisplayWidth = 10
      FieldName = 'QTDEFORNECIDA'
      Origin = 'COTACOES.QTDEFORNECIDA'
      DisplayFormat = '#,##0.00'
    end
    object qryCotacaoCODMEDIDA: TStringField
      DisplayLabel = 'Unidade'
      DisplayWidth = 4
      FieldName = 'CODMEDIDA'
      Origin = 'COTACOES.CODMEDIDA'
      Size = 4
    end
    object qryCotacaoIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = 'COTACOES.IDFORCLI'
      Visible = False
    end
    object qryCotacaoIDPROCXART: TFloatField
      FieldName = 'IDPROCXART'
      Origin = 'COTACOES.IDPROCXART'
      Visible = False
    end
    object qryCotacaoCODPROCESSO: TFloatField
      FieldName = 'CODPROCESSO'
      Origin = 'COTACOES.CODPROCESSO'
      Visible = False
    end
    object qryCotacaoNUMCOT: TFloatField
      FieldName = 'NUMCOT'
      Origin = 'COTACOES.NUMCOT'
      Visible = False
    end
    object qryCotacaoDATACOT: TDateTimeField
      FieldName = 'DATACOT'
      Origin = 'COTACOES.DATACOT'
      Visible = False
    end
    object qryCotacaoOBS: TStringField
      FieldName = 'OBS'
      Origin = 'COTACOES.OBS'
      Visible = False
      Size = 200
    end
    object qryCotacaoMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Origin = 'COTACOES.MOECODIGO'
      Visible = False
    end
    object qryCotacaoTXJUROS: TFloatField
      FieldName = 'TXJUROS'
      Origin = 'COTACOES.TXJUROS'
      Visible = False
    end
  end
  object updCotacao: TUpdateSQL
    ModifySQL.Strings = (
      'update COTACOES'
      'set'
      '  STATUS = :STATUS'
      'where'
      '  IDFORCLI = :OLD_IDFORCLI and'
      '  IDPROCXART = :OLD_IDPROCXART and'
      '  CODPROCESSO = :OLD_CODPROCESSO and'
      '  PROPOSTA = :OLD_PROPOSTA')
    InsertSQL.Strings = (
      'insert into COTACOES'
      '  (STATUS)'
      'values'
      '  (:STATUS)')
    DeleteSQL.Strings = (
      'delete from COTACOES'
      'where'
      '  IDFORCLI = :OLD_IDFORCLI and'
      '  IDPROCXART = :OLD_IDPROCXART and'
      '  CODPROCESSO = :OLD_CODPROCESSO and'
      '  PROPOSTA = :OLD_PROPOSTA')
    Left = 401
    Top = 120
  end
  object qryProcxArt: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      PXA.IDPROCXART,'
      '      PXA.CODPROCESSO,'
      '      PXA.CODARTIGO,'
      '      PXA.QTDEPEDIDA,'
      '      PXA.CODMEDIDA,'
      '      PXA.JUSTIFICATIVA,'
      '      PXA.STATUS,'
      
        '      SUBSTR(DECODE(PXA.IDPRODVARI,NULL,P.DESCPROD,PV.DESCPRODVA' +
        'RI),1,60) AS DESCRICAO'
      'FROM'
      '      PROCXART PXA,'
      '      PRODUTO P,'
      '      ARTIGO A,'
      '      PRODVARI PV'
      'WHERE'
      '      (PXA.CODPROCESSO = :CODPROCESSO)'
      '  AND (PXA.CODARTIGO = A.CODARTIGO)'
      '  AND (A.CODPRODUTO = P.CODPRODUTO)'
      '  AND (PXA.IDPRODVARI = PV.IDPRODVARI(+))'
      'ORDER BY DECODE(PXA.IDPRODVARI,NULL,P.DESCPROD,PV.DESCPRODVARI)'
      ' ')
    UpdateObject = UpdProcxArt
    ValidateWithMask = True
    Left = 181
    Top = 142
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODPROCESSO'
        ParamType = ptUnknown
      end>
    object qryProcxArtDESCRICAO: TStringField
      DisplayLabel = 'Artigo'
      DisplayWidth = 30
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object qryProcxArtQTDEPEDIDA: TFloatField
      DisplayLabel = 'Quatidade~Pedida'
      DisplayWidth = 10
      FieldName = 'QTDEPEDIDA'
      DisplayFormat = '#,##0.00'
    end
    object qryProcxArtIDPROCXART: TFloatField
      FieldName = 'IDPROCXART'
      Visible = False
    end
    object qryProcxArtCODPROCESSO: TFloatField
      FieldName = 'CODPROCESSO'
      Visible = False
    end
    object qryProcxArtCODARTIGO: TStringField
      FieldName = 'CODARTIGO'
      Visible = False
      Size = 14
    end
    object qryProcxArtCODMEDIDA: TStringField
      FieldName = 'CODMEDIDA'
      Visible = False
      Size = 4
    end
    object qryProcxArtJUSTIFICATIVA: TStringField
      FieldName = 'JUSTIFICATIVA'
      Visible = False
      Size = 200
    end
    object qryProcxArtSTATUS: TStringField
      FieldName = 'STATUS'
      Visible = False
      Size = 1
    end
  end
  object dsProcxArt: TwwDataSource
    DataSet = qryProcxArt
    OnDataChange = dsProcxArtDataChange
    Left = 182
    Top = 128
  end
  object dsCotacao: TwwDataSource
    DataSet = qryCotacao
    Left = 398
    Top = 106
  end
  object updProc: TUpdateSQL
    ModifySQL.Strings = (
      'update PROCESSO'
      'set'
      '  STATUS = :STATUS'
      'where'
      '  CODPROCESSO = :OLD_CODPROCESSO')
    Left = 17
    Top = 328
  end
  object qryProc: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      CODPROCESSO,'
      '      STATUS'
      'FROM'
      '      PROCESSO'
      'WHERE'
      '      (CODPROCESSO = :pCODPROCESSO)'
      '')
    UpdateObject = updProc
    ValidateWithMask = True
    Left = 41
    Top = 324
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pCODPROCESSO'
        ParamType = ptUnknown
      end>
    object qryProcCODPROCESSO: TFloatField
      FieldName = 'CODPROCESSO'
      Origin = 'PROCESSO.CODPROCESSO'
    end
    object qryProcSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'PROCESSO.STATUS'
      Size = 1
    end
  end
  object qryCalcCotacao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    DataSource = dsProcxArt
    SQL.Strings = (
      'SELECT'
      '     C.IDFORCLI,'
      '     C.IDPROCXART,'
      '     C.CODPROCESSO,'
      '     C.PROPOSTA,'
      '     C.QTDEFORNECIDA,'
      '     C.PRECO,'
      '     C.STATUS,'
      '     C.MOECODIGO,'
      '     C.TXJUROS,'
      '     C.PRECOAVALORPRES'
      'FROM'
      '    COTACOES C'
      'WHERE'
      '      (C.CODPROCESSO  = :CODPROCESSO)'
      'ORDER BY C.IDPROCXART, C.IDFORCLI, C.PROPOSTA'
      '')
    UpdateObject = udpCalcCotacao
    ValidateWithMask = True
    Left = 608
    Top = 206
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODPROCESSO'
        ParamType = ptUnknown
      end>
    object qryCalcCotacaoIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = 'COTACOES.IDFORCLI'
    end
    object qryCalcCotacaoIDPROCXART: TFloatField
      FieldName = 'IDPROCXART'
      Origin = 'COTACOES.IDPROCXART'
    end
    object qryCalcCotacaoCODPROCESSO: TFloatField
      FieldName = 'CODPROCESSO'
      Origin = 'COTACOES.CODPROCESSO'
    end
    object qryCalcCotacaoPROPOSTA: TFloatField
      FieldName = 'PROPOSTA'
      Origin = 'COTACOES.PROPOSTA'
    end
    object qryCalcCotacaoQTDEFORNECIDA: TFloatField
      FieldName = 'QTDEFORNECIDA'
      Origin = 'COTACOES.QTDEFORNECIDA'
    end
    object qryCalcCotacaoPRECO: TFloatField
      FieldName = 'PRECO'
      Origin = 'COTACOES.PRECO'
    end
    object qryCalcCotacaoSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'COTACOES.STATUS'
      Size = 1
    end
    object qryCalcCotacaoMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Origin = 'COTACOES.MOECODIGO'
    end
    object qryCalcCotacaoTXJUROS: TFloatField
      FieldName = 'TXJUROS'
      Origin = 'COTACOES.TXJUROS'
    end
    object qryCalcCotacaoPRECOAVALORPRES: TFloatField
      FieldName = 'PRECOAVALORPRES'
      Origin = 'COTACOES.PRECOAVALORPRES'
    end
  end
  object udpCalcCotacao: TUpdateSQL
    ModifySQL.Strings = (
      'update COTACOES'
      'set'
      '  IDFORCLI = :IDFORCLI,'
      '  IDPROCXART = :IDPROCXART,'
      '  CODPROCESSO = :CODPROCESSO,'
      '  PROPOSTA = :PROPOSTA,'
      '  QTDEFORNECIDA = :QTDEFORNECIDA,'
      '  STATUS = :STATUS,'
      '  PRECOAVALORPRES = :PRECOAVALORPRES'
      'where'
      '  IDFORCLI = :OLD_IDFORCLI and'
      '  IDPROCXART = :OLD_IDPROCXART and'
      '  CODPROCESSO = :OLD_CODPROCESSO and'
      '  PROPOSTA = :OLD_PROPOSTA')
    InsertSQL.Strings = (
      'insert into COTACOES'
      '  (IDFORCLI, IDPROCXART, CODPROCESSO, PROPOSTA, QTDEFORNECIDA, '
      'STATUS, '
      '   PRECOAVALORPRES)'
      'values'
      
        '  (:IDFORCLI, :IDPROCXART, :CODPROCESSO, :PROPOSTA, :QTDEFORNECI' +
        'DA, '
      ':STATUS, '
      '   :PRECOAVALORPRES)')
    DeleteSQL.Strings = (
      'delete from COTACOES'
      'where'
      '  IDFORCLI = :OLD_IDFORCLI and'
      '  IDPROCXART = :OLD_IDPROCXART and'
      '  CODPROCESSO = :OLD_CODPROCESSO and'
      '  PROPOSTA = :OLD_PROPOSTA')
    Left = 609
    Top = 152
  end
  object qryPrazoPag: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    DataSource = dsCalcCotacao
    SQL.Strings = (
      'SELECT'
      '     IDPROCXART,'
      '     IDFORCLI,'
      '     CODPROCESSO,'
      '     PROPOSTA,'
      '     IDPRAZOPGTO,'
      '     PRAZOPGTO,'
      '     PERIODOPRAZO,'
      '     DATAPGTO,'
      '     PERCENT'
      'FROM'
      '     PRAZOPGTO'
      'WHERE'
      '     (CODPROCESSO = :CODPROCESSO)'
      ' AND (IDFORCLI    = :IDFORCLI)'
      ' AND (IDPROCXART  = :IDPROCXART)'
      ' AND (PROPOSTA    = :PROPOSTA)')
    ValidateWithMask = True
    Left = 606
    Top = 268
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDFORCLI'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPROCXART'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PROPOSTA'
        ParamType = ptUnknown
      end>
    object qryPrazoPagIDPROCXART: TFloatField
      FieldName = 'IDPROCXART'
      Origin = 'PRAZOPGTO.IDPROCXART'
    end
    object qryPrazoPagIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = 'PRAZOPGTO.IDFORCLI'
    end
    object qryPrazoPagCODPROCESSO: TFloatField
      FieldName = 'CODPROCESSO'
      Origin = 'PRAZOPGTO.CODPROCESSO'
    end
    object qryPrazoPagPROPOSTA: TFloatField
      FieldName = 'PROPOSTA'
      Origin = 'PRAZOPGTO.PROPOSTA'
    end
    object qryPrazoPagIDPRAZOPGTO: TFloatField
      FieldName = 'IDPRAZOPGTO'
      Origin = 'PRAZOPGTO.IDPRAZOPGTO'
    end
    object qryPrazoPagPRAZOPGTO: TFloatField
      FieldName = 'PRAZOPGTO'
      Origin = 'PRAZOPGTO.PRAZOPGTO'
    end
    object qryPrazoPagPERIODOPRAZO: TStringField
      FieldName = 'PERIODOPRAZO'
      Origin = 'PRAZOPGTO.PERIODOPRAZO'
      Size = 1
    end
    object qryPrazoPagDATAPGTO: TDateTimeField
      FieldName = 'DATAPGTO'
      Origin = 'PRAZOPGTO.DATAPGTO'
    end
    object qryPrazoPagPERCENT: TFloatField
      FieldName = 'PERCENT'
      Origin = 'PRAZOPGTO.PERCENT'
    end
  end
  object dsCalcCotacao: TwwDataSource
    DataSet = qryCalcCotacao
    Left = 686
    Top = 210
  end
  object qryAgreg: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    DataSource = dsCalcCotacao
    SQL.Strings = (
      'SELECT'
      '      VC.IDPROCXART,'
      '      VC.IDFORCLI,'
      '      VC.CODPROCESSO,'
      '      VC.PROPOSTA,'
      '      VC.CODTIPOCUSTAGREG,'
      '      VC.PERCENT,'
      '      VC.VALOR,'
      '      TA.FLGBASE,'
      '      TA.CODTRATFISCE'
      'FROM'
      '     VALORAGREGCOT VC,'
      '     TIPOAGRE TA'
      'WHERE'
      '     (VC.CODPROCESSO = :CODPROCESSO)'
      ' AND (VC.IDFORCLI    = :IDFORCLI)'
      ' AND (VC.IDPROCXART  = :IDPROCXART)'
      ' AND (VC.PROPOSTA    = :PROPOSTA)'
      ' AND (VC.CODTIPOCUSTAGREG = TA.CODTIPOCUSTAGREG)'
      'ORDER BY TA.FLGBASE DESC')
    ValidateWithMask = True
    Left = 684
    Top = 269
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDFORCLI'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPROCXART'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PROPOSTA'
        ParamType = ptUnknown
      end>
    object qryAgregIDPROCXART: TFloatField
      FieldName = 'IDPROCXART'
      Origin = 'VALORAGREGCOT.IDPROCXART'
    end
    object qryAgregIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = 'VALORAGREGCOT.IDFORCLI'
    end
    object qryAgregCODPROCESSO: TFloatField
      FieldName = 'CODPROCESSO'
      Origin = 'VALORAGREGCOT.CODPROCESSO'
    end
    object qryAgregPROPOSTA: TFloatField
      FieldName = 'PROPOSTA'
      Origin = 'VALORAGREGCOT.PROPOSTA'
    end
    object qryAgregCODTIPOCUSTAGREG: TFloatField
      FieldName = 'CODTIPOCUSTAGREG'
      Origin = 'VALORAGREGCOT.CODTIPOCUSTAGREG'
    end
    object qryAgregPERCENT: TFloatField
      FieldName = 'PERCENT'
      Origin = 'VALORAGREGCOT.PERCENT'
    end
    object qryAgregVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'VALORAGREGCOT.VALOR'
    end
    object qryAgregFLGBASE: TStringField
      FieldName = 'FLGBASE'
      Origin = '"CM.TIPOAGRE".FLGBASE'
      Size = 1
    end
    object qryAgregCODTRATFISCE: TStringField
      FieldName = 'CODTRATFISCE'
      Origin = '"CM.TIPOAGRE".CODTRATFISCE'
      Size = 1
    end
  end
  object UpdProcxArt: TUpdateSQL
    ModifySQL.Strings = (
      'update PROCXART'
      'set'
      '  JUSTIFICATIVA = :JUSTIFICATIVA'
      'where'
      '  CODPROCESSO = :OLD_CODPROCESSO and'
      '  IDPROCXART = :OLD_IDPROCXART')
    InsertSQL.Strings = (
      'insert into PROCXART'
      '  (JUSTIFICATIVA)'
      'values'
      '  (:JUSTIFICATIVA)')
    DeleteSQL.Strings = (
      'delete from PROCXART'
      'where'
      '  CODPROCESSO = :OLD_CODPROCESSO and'
      '  IDPROCXART = :OLD_IDPROCXART')
    Left = 183
    Top = 114
  end
  object qryVerifCotacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     STATUS'
      'FROM'
      '    COTACOES'
      'WHERE'
      '      (CODPROCESSO  = :CODPROCESSO)'
      '  AND (IDPROCXART   = :IDPROCXART)'
      '  AND ((STATUS = '#39'C'#39') OR (STATUS = '#39'U'#39'))'
      '')
    ValidateWithMask = True
    Left = 488
    Top = 128
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPROCXART'
        ParamType = ptUnknown
      end>
    object qryVerifCotacaoSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = '"CM.COTACOES".STATUS'
      Size = 1
    end
  end
  object qryVerifOC: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      C.IDPROCXART,'
      '      PXA.CODARTIGO,'
      
        '      SUBSTR(DECODE(PXA.IDPRODVARI,NULL,P.DESCPROD,PV.DESCPRODVA' +
        'RI),1,60) AS DESCRICAO'
      'FROM'
      '      COTACOES C,'
      '      PROCXART PXA,'
      '      PRODUTO P,'
      '      ARTIGO A,'
      '      PRODVARI PV'
      'WHERE'
      '      (C.CODPROCESSO = :pCODPROCESSO)'
      '  AND (C.IDPROCXART NOT IN ( SELECT IDPROCXART'
      '                             FROM   COTACOES'
      '                             WHERE (CODPROCESSO = :pCODPROCESSO)'
      
        '                               AND ((STATUS = '#39'C'#39') OR (STATUS = ' +
        #39'U'#39') ) ) )'
      '  AND (PXA.CODPROCESSO = C.CODPROCESSO)'
      '  AND (PXA.IDPROCXART  = C.IDPROCXART)'
      '  AND (PXA.CODARTIGO   = A.CODARTIGO)'
      '  AND (A.CODPRODUTO    = P.CODPRODUTO)'
      '  AND (PXA.IDPRODVARI  = PV.IDPRODVARI(+))'
      
        'GROUP BY C.IDPROCXART, PXA.CODARTIGO, DECODE(PXA.IDPRODVARI,NULL' +
        ',P.DESCPROD,PV.DESCPRODVARI)'
      'ORDER BY DECODE(PXA.IDPRODVARI,NULL,P.DESCPROD,PV.DESCPRODVARI)'
      ' ')
    ValidateWithMask = True
    Left = 488
    Top = 192
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pCODPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pCODPROCESSO'
        ParamType = ptUnknown
      end>
    object qryVerifOCIDPROCXART: TFloatField
      FieldName = 'IDPROCXART'
    end
    object qryVerifOCCODARTIGO: TStringField
      FieldName = 'CODARTIGO'
      Size = 14
    end
    object qryVerifOCDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
  end
  object qryWins: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      C.CODPROCESSO,'
      '      C.IDFORCLI,'
      '      C.PROPOSTA,'
      '      SC.IDPESSOA,'
      '      C.IDPROCXART,'
      '      PXA.CODARTIGO,'
      '      PXA.CODMEDIDA,'
      '      PXA.IDPRODVARI,'
      '      C.OBS,'
      '      PE.RAZAOSOCIAL,'
      '      C.IDITEMOC,'
      '      MAX(C.PRECO / CI.FATOR * CM.FATOR) AS VALOR,'
      
        '      SUM((C.QTDEFORNECIDA * CI.FATOR/CM.FATOR) * SCI.QTDESCI/ P' +
        'XA.QTDEPEDIDA ) AS QTDEOC,'
      '      MAX(IT.OBSITEMSOLIC) AS OBSITEMSOLIC,'
      '      P.DESCPROD,'
      '      P.CODGRUPOPROD,'
      '      C.CONTATO'
      'FROM'
      '      PESSOA PE,'
      '      COTACOES C,'
      '      PROCXART PXA,'
      '      ITEMSOLI IT,'
      '      SOLICOMP SC,'
      '      ARTIGO A,'
      '      PRODUTO P,'
      '      CONVER CM,'
      '      CONVER CI,'
      '      ('
      '       SELECT'
      '             SC.NUMSOLCOMPRA,'
      '             IT.IDITEMSOLI,'
      '             SC.IDPESSOA,'
      #9'     IT.IDPROCXART,'
      #9'    (IT.QTDEPEDIDA * CI.FATOR/CM.FATOR) AS QTDESCI'
      '       FROM'
      '           ITEMSOLI IT,'
      '           SOLICOMP SC,'
      #9'     ARTIGO A,'
      #9'     PRODUTO P,'
      #9'     CONVER CM,'
      #9'     CONVER CI'
      '       WHERE'
      '              (IT.CODPROCESSO  = :pCODPROCESSO)'
      '          AND (IT.NUMSOLCOMPRA = SC.NUMSOLCOMPRA)'
      '          AND (IT.CODARTIGO    = A.CODARTIGO)'
      '          AND (A.CODPRODUTO    = P.CODPRODUTO)'
      '          AND (CM.CODPRODUTO   = P.CODPRODUTO)'
      '          AND (CM.CODMEDIDA    = P.CODMEDCUSTO)'
      '          AND (CI.CODPRODUTO   = P.CODPRODUTO)'
      '          AND (CI.CODMEDIDA    = IT.CODMEDIDA)'
      '      ) SCI'
      'WHERE (C.CODPROCESSO = :pCODPROCESSO)'
      '  AND ((C.STATUS = '#39'C'#39') OR (C.STATUS = '#39'U'#39'))'
      '  AND (PXA.CODPROCESSO = C.CODPROCESSO)'
      '  AND (PXA.IDPROCXART  = C.IDPROCXART)'
      '  AND (PXA.IDPROCXART  = IT.IDPROCXART)'
      '  AND (PXA.CODPROCESSO = IT.CODPROCESSO)'
      '  AND (IT.NUMSOLCOMPRA = SC.NUMSOLCOMPRA)'
      '  AND (SCI.IDPESSOA    = SC.IDPESSOA)'
      '  AND (SCI.IDPROCXART  = PXA.IDPROCXART)'
      '  AND (SCI.NUMSOLCOMPRA = SC.NUMSOLCOMPRA)'
      '  AND (SCI.IDITEMSOLI   = IT.IDITEMSOLI)'
      '  AND (PXA.CODARTIGO   = A.CODARTIGO)'
      '  AND (A.CODPRODUTO    = P.CODPRODUTO)'
      '  AND (CM.CODPRODUTO   = P.CODPRODUTO)'
      '  AND (CM.CODMEDIDA    = P.CODMEDCUSTO)'
      '  AND (CI.CODPRODUTO   = P.CODPRODUTO)'
      '  AND (CI.CODMEDIDA    = C.CODMEDIDA)'
      '  AND (PE.IDPESSOA     = C.IDFORCLI)'
      'GROUP BY'
      '      PE.RAZAOSOCIAL,'
      '      C.CODPROCESSO,'
      '      C.IDFORCLI,'
      '      C.PROPOSTA,'
      '      SC.IDPESSOA,'
      '      C.IDPROCXART,'
      '      PXA.CODARTIGO,'
      '      PXA.CODMEDIDA,'
      '      PXA.IDPRODVARI,'
      '      C.OBS,'
      '      C.IDITEMOC,'
      '      P.CODGRUPOPROD,'
      '      P.DESCPROD,'
      '      C.CONTATO '
      'ORDER BY SC.IDPESSOA, C.IDFORCLI, C.PROPOSTA'
      ''
      ' ')
    UpdateObject = updWins
    ValidateWithMask = True
    Left = 296
    Top = 112
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pCODPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pCODPROCESSO'
        ParamType = ptUnknown
      end>
    object qryWinsCODPROCESSO: TFloatField
      FieldName = 'CODPROCESSO'
    end
    object qryWinsIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
    end
    object qryWinsPROPOSTA: TFloatField
      FieldName = 'PROPOSTA'
    end
    object qryWinsIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryWinsIDPROCXART: TFloatField
      FieldName = 'IDPROCXART'
    end
    object qryWinsCODARTIGO: TStringField
      FieldName = 'CODARTIGO'
      Size = 14
    end
    object qryWinsCODMEDIDA: TStringField
      FieldName = 'CODMEDIDA'
      Size = 4
    end
    object qryWinsIDPRODVARI: TFloatField
      FieldName = 'IDPRODVARI'
    end
    object qryWinsQTDEOC: TFloatField
      FieldName = 'QTDEOC'
    end
    object qryWinsOBS: TStringField
      FieldName = 'OBS'
      Size = 200
    end
    object qryWinsVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object qryWinsIDITEMOC: TFloatField
      FieldName = 'IDITEMOC'
    end
    object qryWinsRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object qryWinsOBSITEMSOLIC: TStringField
      FieldName = 'OBSITEMSOLIC'
      Size = 200
    end
    object qryWinsCODGRUPOPROD: TStringField
      FieldName = 'CODGRUPOPROD'
      Size = 10
    end
    object qryWinsCONTATO: TStringField
      FieldName = 'CONTATO'
      Size = 50
    end
    object qryWinsDESCPROD: TStringField
      FieldName = 'DESCPROD'
      Size = 40
    end
  end
  object qryWinPag: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     PRAZOPGTO,'
      '     PERIODOPRAZO,'
      '     DATAPGTO,'
      '     PERCENT'
      'FROM'
      '     PRAZOPGTO'
      'WHERE'
      '     (CODPROCESSO = :pCODPROCESSO)'
      ' AND (IDFORCLI    = :pIDFORCLI)'
      ' AND (IDPROCXART  = :pIDPROCXART)'
      ' AND (PROPOSTA    = :pPROPOSTA)'
      'ORDER BY DATAPGTO')
    ValidateWithMask = True
    Left = 294
    Top = 212
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pCODPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDFORCLI'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDPROCXART'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pPROPOSTA'
        ParamType = ptUnknown
      end>
    object qryWinPagPRAZOPGTO: TFloatField
      FieldName = 'PRAZOPGTO'
      Origin = 'PRAZOPGTO.PRAZOPGTO'
    end
    object qryWinPagPERIODOPRAZO: TStringField
      FieldName = 'PERIODOPRAZO'
      Origin = 'PRAZOPGTO.PERIODOPRAZO'
      Size = 1
    end
    object qryWinPagDATAPGTO: TDateTimeField
      FieldName = 'DATAPGTO'
      Origin = 'PRAZOPGTO.DATAPGTO'
    end
    object qryWinPagPERCENT: TFloatField
      FieldName = 'PERCENT'
      Origin = 'PRAZOPGTO.PERCENT'
    end
  end
  object qryWinAgreg: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      A.CODTIPOCUSTAGREG,'
      '      A.PERCENT,'
      '      A.VALOR,'
      '      A.BASECALCULO,'
      '      T.CODTRATFISCE'
      'FROM'
      '     VALORAGREGCOT A,'
      '     TIPOAGRE T'
      'WHERE'
      '     (A.CODPROCESSO = :pCODPROCESSO)'
      ' AND (A.IDFORCLI    = :pIDFORCLI)'
      ' AND (A.IDPROCXART  = :pIDPROCXART)'
      ' AND (A.PROPOSTA    = :pPROPOSTA)'
      ' AND (A.CODTIPOCUSTAGREG = T.CODTIPOCUSTAGREG)'
      '')
    ValidateWithMask = True
    Left = 292
    Top = 261
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pCODPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDFORCLI'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDPROCXART'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pPROPOSTA'
        ParamType = ptUnknown
      end>
    object qryWinAgregCODTIPOCUSTAGREG: TFloatField
      FieldName = 'CODTIPOCUSTAGREG'
      Origin = '"CM.VALORAGREGCOT".CODTIPOCUSTAGREG'
    end
    object qryWinAgregPERCENT: TFloatField
      FieldName = 'PERCENT'
      Origin = '"CM.VALORAGREGCOT".PERCENT'
    end
    object qryWinAgregVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = '"CM.VALORAGREGCOT".VALOR'
    end
    object qryWinAgregBASECALCULO: TFloatField
      FieldName = 'BASECALCULO'
      Origin = '"CM.VALORAGREGCOT".BASECALCULO'
    end
    object qryWinAgregCODTRATFISCE: TStringField
      FieldName = 'CODTRATFISCE'
      Origin = 'TIPOAGRE.CODTRATFISCE'
      Size = 1
    end
  end
  object qryWinEnt: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '       E.IDPRAZOENT,'
      '       E.QTDEENT,'
      '       E.CODMEDIDA,'
      '       E.PRAZOENT,'
      '       E.PERIODOPRAZO,'
      '       E.DATAENT,'
      '       C.QTDEFORNECIDA'
      'FROM'
      '       PRAZOENTREGA E, COTACOES C'
      'WHERE'
      '     (E.CODPROCESSO  = :pCODPROCESSO)'
      ' AND (E.IDFORCLI     = :pIDFORCLI)'
      ' AND (E.IDPROCXART   = :pIDPROCXART)'
      ' AND (E.PROPOSTA     = :pPROPOSTA)'
      ' AND (E.CODPROCESSO  = C.CODPROCESSO)'
      ' AND (E.IDFORCLI     = C.IDFORCLI)'
      ' AND (E.IDPROCXART   = C.IDPROCXART)'
      ' AND (E.PROPOSTA     = C.PROPOSTA)'
      'ORDER BY E.DATAENT')
    ValidateWithMask = True
    Left = 294
    Top = 165
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pCODPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDFORCLI'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDPROCXART'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pPROPOSTA'
        ParamType = ptUnknown
      end>
    object qryWinEntIDPRAZOENT: TFloatField
      FieldName = 'IDPRAZOENT'
      Origin = 'PRAZOENTREGA.IDPRAZOENT'
    end
    object qryWinEntQTDEENT: TFloatField
      FieldName = 'QTDEENT'
      Origin = 'PRAZOENTREGA.QTDEENT'
    end
    object qryWinEntCODMEDIDA: TStringField
      FieldName = 'CODMEDIDA'
      Origin = 'PRAZOENTREGA.CODMEDIDA'
      Size = 4
    end
    object qryWinEntPRAZOENT: TFloatField
      FieldName = 'PRAZOENT'
      Origin = 'PRAZOENTREGA.PRAZOENT'
    end
    object qryWinEntPERIODOPRAZO: TStringField
      FieldName = 'PERIODOPRAZO'
      Origin = 'PRAZOENTREGA.PERIODOPRAZO'
      Size = 1
    end
    object qryWinEntDATAENT: TDateTimeField
      FieldName = 'DATAENT'
      Origin = 'PRAZOENTREGA.DATAENT'
    end
    object qryWinEntQTDEFORNECIDA: TFloatField
      FieldName = 'QTDEFORNECIDA'
      Origin = 'COTACOES.QTDEFORNECIDA'
    end
  end
  object qryWinSCItemOC: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      SC.NUMSOLCOMPRA,'
      '      IT.IDITEMSOLI'
      'FROM'
      '      COTACOES C,'
      '      PROCXART PXA,'
      '      ITEMSOLI IT,'
      '      SOLICOMP SC'
      'WHERE'
      '      (C.CODPROCESSO  = :pCODPROCESSO)'
      '  AND (C.IDFORCLI     = :pIDFORCLI)'
      '  AND (C.IDPROCXART   = :pIDPROCXART)'
      '  AND (C.PROPOSTA     = :pPROPOSTA)'
      '  AND (PXA.CODPROCESSO = C.CODPROCESSO)'
      '  AND (PXA.IDPROCXART  = C.IDPROCXART)'
      '  AND (PXA.IDPROCXART  = IT.IDPROCXART)'
      '  AND (PXA.CODPROCESSO = IT.CODPROCESSO)'
      '  AND (IT.NUMSOLCOMPRA = SC.NUMSOLCOMPRA)'
      ' ')
    ValidateWithMask = True
    Left = 288
    Top = 312
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pCODPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDFORCLI'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDPROCXART'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pPROPOSTA'
        ParamType = ptUnknown
      end>
    object qryWinSCItemOCNUMSOLCOMPRA: TFloatField
      FieldName = 'NUMSOLCOMPRA'
      Origin = 'SOLICOMP.NUMSOLCOMPRA'
    end
    object qryWinSCItemOCIDITEMSOLI: TFloatField
      FieldName = 'IDITEMSOLI'
      Origin = 'ITEMSOLI.IDITEMSOLI'
    end
  end
  object updWins: TUpdateSQL
    ModifySQL.Strings = (
      'update COTACOES'
      'set'
      '  IDITEMOC = :IDITEMOC'
      'where'
      '  IDPROCXART = :OLD_IDPROCXART and'
      '  IDFORCLI = :OLD_IDFORCLI and'
      '  CODPROCESSO = :OLD_CODPROCESSO and'
      '  PROPOSTA = :OLD_PROPOSTA')
    InsertSQL.Strings = (
      'insert into COTACOES'
      '  (IDITEMOC)'
      'values'
      '  (:IDITEMOC)')
    DeleteSQL.Strings = (
      'delete from COTACOES'
      'where'
      '  IDPROCXART = :OLD_IDPROCXART and'
      '  IDFORCLI = :OLD_IDFORCLI and'
      '  CODPROCESSO = :OLD_CODPROCESSO and'
      '  PROPOSTA = :OLD_PROPOSTA')
    Left = 296
    Top = 80
  end
  object qryVerifRadSCI: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      SC.IDPROCESSO,'
      '      SC.NUMSOLCOMPRA'
      'FROM'
      '      COTACOES C,'
      '      PROCXART PXA,'
      '      ITEMSOLI IT,'
      '      SOLICOMP SC,'
      '      RADINSTPROCESSO RP'
      'WHERE (C.CODPROCESSO = :pCODPROCESSO)'
      '  AND ((C.STATUS = '#39'C'#39') OR (C.STATUS = '#39'U'#39'))'
      '  AND (PXA.CODPROCESSO = C.CODPROCESSO)'
      '  AND (PXA.IDPROCXART  = C.IDPROCXART)'
      '  AND (PXA.IDPROCXART  = IT.IDPROCXART)'
      '  AND (PXA.CODPROCESSO = IT.CODPROCESSO)'
      '  AND (IT.NUMSOLCOMPRA = SC.NUMSOLCOMPRA)'
      '  AND (RP.IDPROCESSO = SC.IDPROCESSO)'
      '  AND ((RP.FLGOK <> '#39'S'#39') OR (RP.FLGOK IS NULL))'
      'GROUP BY'
      '   SC.IDPROCESSO,'
      '   SC.NUMSOLCOMPRA'
      '')
    ValidateWithMask = True
    Left = 400
    Top = 208
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pCODPROCESSO'
        ParamType = ptUnknown
      end>
    object qryVerifRadSCIIDPROCESSO: TFloatField
      FieldName = 'IDPROCESSO'
      Origin = 'SOLICOMP.IDPROCESSO'
    end
    object qryVerifRadSCINUMSOLCOMPRA: TFloatField
      FieldName = 'NUMSOLCOMPRA'
      Origin = 'SOLICOMP.NUMSOLCOMPRA'
    end
  end
  object qrySCIOC: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      SC.IDPROCESSO,'
      '      SC.NUMSOLCOMPRA,'
      '      SC.IDRESERVAORCAMEN'
      'FROM'
      '      COTACOES C,'
      '      PROCXART PXA,'
      '      ITEMSOLI IT,'
      '      SOLICOMP SC'
      'WHERE (C.CODPROCESSO = :pCODPROCESSO)'
      '  AND (C.IDPROCXART  = :pIDPROCXART)'
      '  AND ((C.STATUS = '#39'C'#39') OR (C.STATUS = '#39'U'#39'))'
      '  AND (PXA.CODPROCESSO = C.CODPROCESSO)'
      '  AND (PXA.IDPROCXART  = C.IDPROCXART)'
      '  AND (PXA.IDPROCXART  = IT.IDPROCXART)'
      '  AND (PXA.CODPROCESSO = IT.CODPROCESSO)'
      '  AND (IT.NUMSOLCOMPRA = SC.NUMSOLCOMPRA)'
      '  AND (SC.IDRESERVAORCAMEN IS NOT NULL)'
      'GROUP BY'
      '   SC.IDPROCESSO,'
      '   SC.NUMSOLCOMPRA,'
      '   SC.IDRESERVAORCAMEN'
      ''
      ' ')
    ValidateWithMask = True
    Left = 528
    Top = 80
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pCODPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDPROCXART'
        ParamType = ptUnknown
      end>
    object qrySCIOCIDPROCESSO: TFloatField
      FieldName = 'IDPROCESSO'
      Origin = 'SOLICOMP.IDPROCESSO'
    end
    object qrySCIOCNUMSOLCOMPRA: TFloatField
      FieldName = 'NUMSOLCOMPRA'
      Origin = 'SOLICOMP.NUMSOLCOMPRA'
    end
    object qrySCIOCIDRESERVAORCAMEN: TFloatField
      FieldName = 'IDRESERVAORCAMEN'
      Origin = 'SOLICOMP.IDRESERVAORCAMEN'
    end
  end
  object qryTestaReservaOrc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDRESERVA'
      'FROM RESXCOMP'
      'WHERE (IDRESERVA = :IDRESERVAORCAMEN)'
      '')
    ValidateWithMask = True
    Left = 624
    Top = 88
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDRESERVAORCAMEN'
        ParamType = ptUnknown
      end>
  end
end
