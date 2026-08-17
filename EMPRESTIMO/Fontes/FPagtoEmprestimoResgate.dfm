inherited frmPagtoEmprestimoResgate: TfrmPagtoEmprestimoResgate
  Left = 326
  Top = 79
  Caption = 'Pagamento de Emprestimo com Resgate'
  ClientHeight = 500
  ClientWidth = 742
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 742
    Height = 461
  end
  inherited Dock971: TDock97
    Top = 461
    Width = 742
    inherited tb97Fundo: TToolbar97
      Left = 567
      DockPos = 567
      inherited bbtnAjuda: TmaHelpBitBtn
        ClickHelpContext = 150019
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 128
      DockPos = 128
      Visible = False
    end
    object btnProcessar: TButton
      Left = 410
      Top = 4
      Width = 129
      Height = 29
      Caption = 'Processar'
      Enabled = False
      TabOrder = 2
      OnClick = btnProcessarClick
    end
  end
  object ntb: TNotebook [2]
    Left = 0
    Top = 0
    Width = 742
    Height = 461
    Align = alClient
    TabOrder = 2
    object TPage
      Left = 0
      Top = 0
      Caption = 'Default'
      object lblDataResgate: TLabel
        Left = 16
        Top = 421
        Width = 97
        Height = 13
        Caption = 'Data de Resgate'
      end
      object Label1: TLabel
        Left = 25
        Top = 9
        Width = 55
        Height = 13
        Caption = 'Matrícula'
      end
      object btnBuscaMatricula: TBitBtn
        Left = 121
        Top = 23
        Width = 24
        Height = 22
        Hint = 'Busca um Participante'
        Anchors = [akTop, akRight]
        TabOrder = 0
        OnClick = btnBuscaMatriculaClick
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
        NumGlyphs = 2
      end
      object grpContratos: TGroupBox
        Left = 7
        Top = 101
        Width = 730
        Height = 297
        Caption = 'Contratos'
        TabOrder = 1
        object gridContrato: TwwDBGrid
          Left = 2
          Top = 15
          Width = 726
          Height = 280
          Selected.Strings = (
            'Seleciona'#9'4'#9'  '#9'F'
            'IDCONTRATOEMPTMO'#9'14'#9'Nº Contrato'#9'F'
            'MODALIDADE'#9'30'#9'Modalidade'#9'F'
            'DATACREDITO'#9'13'#9'Data Crédito'#9'F'
            'HMESALDODEV'#9'13'#9'Saldo Devedor'#9'F'
            'VALOR_TOTAL_ABERTO'#9'13'#9'Valor em Aberto'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
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
          IndicatorColor = icBlack
        end
      end
      object dtpDataResgate: TwwDBDateTimePicker
        Left = 117
        Top = 416
        Width = 132
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        Epoch = 1950
        ButtonWidth = 21
        ButtonGlyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          88888888888888888888800000000000000880FFFFFFFFFFFF0880F878787978
          7F0880F7878797978F0880F8787879787F0880F7878787878F0880F878787878
          7F0880F7878787878F0880FFFFFFFFFFFF0880F4C4C4C7777F0880FC4C4C4777
          7F0880FFFFFFFFFFFF0880000000000000088888888888888888}
        ShowButton = True
        TabOrder = 2
        UnboundDataType = wwDTEdtDate
        DisplayFormat = 'dd/mm/yyyy'
      end
      object btnCarregarMatriculas: TButton
        Left = 22
        Top = 64
        Width = 130
        Height = 25
        Caption = 'Carregar Matrículas'
        TabOrder = 3
        OnClick = btnCarregarMatriculasClick
      end
      object BitBtn6: TBitBtn
        Left = 711
        Top = 92
        Width = 22
        Height = 20
        Hint = 'Seleciona Todos'
        TabOrder = 4
        OnClick = BitBtn6Click
        Glyph.Data = {
          D6000000424DD60000000000000076000000280000000C0000000C0000000100
          0400000000006000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888848888888
          0000888224888888000088222248888800008822822488880000882848224888
          0000888224822488000088222248228800008822822482880000882888224888
          0000888888822488000088888888228800008888888882880000}
      end
      object BitBtn5: TBitBtn
        Left = 690
        Top = 92
        Width = 21
        Height = 20
        Hint = 'Inverte a Seleção'
        TabOrder = 5
        OnClick = BitBtn5Click
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888488888888888888844888888888888444448888888888444444488
          1888884444444888118884448844888881188448884888888118844888888188
          8118844888881188111888448881111111888884881111111888888888811111
          8888888888881188888888888888818888888888888888888888}
      end
      object edtMatricula: TEdit
        Left = 13
        Top = 24
        Width = 102
        Height = 21
        ReadOnly = True
        TabOrder = 6
      end
      object edtNome: TEdit
        Left = 150
        Top = 14
        Width = 548
        Height = 32
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 7
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'Resultado'
      object memResult: TMemo
        Left = 13
        Top = 34
        Width = 713
        Height = 359
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object Panel3: TPanel
        Left = 13
        Top = 8
        Width = 713
        Height = 27
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = 'Resultado do Envio'
        Color = clNavy
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
      object btnVoltar: TfcShapeBtn
        Left = 576
        Top = 411
        Width = 89
        Height = 29
        Caption = 'Voltar'
        Color = clBtnFace
        DitherColor = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888888888888888888000008888888888F777778FF88888800BBBBB00
          88888887788888778F88887BBBBBBBBB088888788888888878F887FBBBBBBBBB
          B08887F8888F888887F887FBBB0BBBBBB0888788887F888887887FBBB00BBBBB
          BB087F88877FFFFFF8787FBB00000000BB087F8877777777F8787FB000000000
          BB087F8777777777F8787FBB00000000BB087F887777777788787FBBB00BBBBB
          BB0878F8877F8888887887FBBB0BBBBBB08887F88878888887F887FBBBBBBBBB
          B088878F888888888788887FFBBBBBBB08888878FF88888F788888877FFFFF77
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
        Options = [boFocusable, boFocusRect]
        Offsets.GlyphY = 1
        Offsets.TextDownX = 2
        Offsets.TextDownY = 2
        ParentClipping = True
        ParentFont = False
        RoundRectBias = 25
        ShadeStyle = fbsHighlight
        TabOrder = 2
        TabStop = True
        TextOptions.Alignment = taCenter
        TextOptions.ExtrudeEffects.Depth = 4
        TextOptions.ExtrudeEffects.Orientation = fcTopRight
        TextOptions.VAlignment = vaVCenter
        OnClick = btnVoltarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 19
    Top = 456
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'D.MATRICULA'
      'P.NUMDOCUMENTO'
      'P.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'CPF'
      'Nome')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA P'
      'DEPENTIT D')
    CamposChave.Strings = (
      'D.MATRICULA'
      'P.NUMDOCUMENTO'
      'P.NOME')
    Filtro.Strings = (
      'P.IDPESSOA = D.IDPESSOA'
      'P.TIPO = '#39'F'#39)
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '15'
      '18'
      '60')
    OperComparador.Strings = (
      '1'
      '1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      '')
    Left = 80
    Top = 457
  end
  object qryDetalhe: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsMatricula
    SQL.Strings = (
      'SELECT DEP.MATRICULA,'
      '       CON.IDCONTRATOEMPTMO, '
      '       TCE.TCEDESCRICAO MODALIDADE, '
      '       CON.DATACREDITO, '
      '       CON.IDPATRO, '
      '       JUR.NOME PATRO, '
      '       SALDODEV.HMESALDODEV,'
      '       NVL(EM_ABERTO.VALOR_TOTAL_ABERTO,0) VALOR_TOTAL_ABERTO,'
      '      CON.IDPLANOORIGEM'
      '  FROM TIPOCONTREMPTMO TCE, '
      '       CONTRATOEMPTMO CON, '
      '       PESSOA JUR,'
      '       DEPENTIT DEP,'
      '       ('
      '          SELECT '
      '                 IDCONTRATOEMPTMO,'
      '                 HMESALDODEV'
      '            FROM'
      '                 HISTMOVEMPTMO HME,'
      '                 ('
      ''
      '                    SELECT '
      
        '                        MAX(HME.IDHISTMOVEMPTMO) AS IDHISTMOVEMP' +
        'TMO '
      '                     FROM'
      '                        HISTMOVEMPTMO   HME,'
      '                        CONTRATOEMPTMO  CON,'
      '                        ITEMXTIPOCONTR  ITC,'
      '                        TIPOCONTREMPTMO TCE'
      '                     WHERE'
      
        '                            ( CON.IDCONTRATOEMPTMO   = :IDCONTRA' +
        'TOEMPTMO)'
      '                        AND ( ITC.ITCTRATASALDODEV  <> 0 )'
      
        '                        AND ( (HME.FLGESTORNADO      = 0) OR (HM' +
        'E.FLGESTORNADO IS NULL) )'
      '                        AND ( HME.HMEDATAATUALIZA  ='
      '                              ('
      '                              SELECT '
      
        '                                MAX(H.HMEDATAATUALIZA) AS HMEDAT' +
        'AATUALIZA'
      '                              FROM'
      '                                 HISTMOVEMPTMO   H,'
      '                                 CONTRATOEMPTMO  C,'
      '                                 ITEMXTIPOCONTR  I'
      '                              WHERE'
      
        '                                     ( C.IDCONTRATOEMPTMO   = :I' +
        'DCONTRATOEMPTMO)'
      
        '                                 AND ( H.HMEDATAATUALIZA   < SYS' +
        'DATE)'
      
        '                                 AND ( I.ITCTRATASALDODEV  <> 0 ' +
        ')'
      
        '                                 AND ( (H.FLGESTORNADO      = 0)' +
        ' OR (H.FLGESTORNADO IS NULL) )'
      
        '                                 AND ( H.IDCONTRATOEMPTMO   = C.' +
        'IDCONTRATOEMPTMO ) AND ( C.IDTIPOCONTREMPTMO  = I.IDTIPOCONTREMP' +
        'TMO )'
      
        '                                 AND ( H.IDITEMEMPTMO       = I.' +
        'IDITEMEMPTMO )'
      '                              )'
      '                            )'
      
        '                        AND ( HME.IDCONTRATOEMPTMO   = CON.IDCON' +
        'TRATOEMPTMO )'
      
        '                        AND ( CON.IDTIPOCONTREMPTMO  = TCE.IDTIP' +
        'OCONTREMPTMO )'
      
        '                        AND ( TCE.IDTIPOCONTREMPTMO  = ITC.IDTIP' +
        'OCONTREMPTMO )'
      
        '                        AND ( HME.IDITEMEMPTMO       = ITC.IDITE' +
        'MEMPTMO )'
      '                  ) MAXI'
      '           WHERE ( HME.IDHISTMOVEMPTMO = MAXI.IDHISTMOVEMPTMO )'
      '       ) SALDODEV,'
      '       ('
      
        '         SELECT HME.IDCONTRATOEMPTMO, SUM(NVL(HME.HMEVLRPREVISTO' +
        ', 0)) AS VALOR_TOTAL_ABERTO'
      '           FROM HISTMOVEMPTMO HME'
      '          WHERE ( HME.FLGBAIXADO     = 0 )'
      '            AND ( HME.HMEVLREFETIVO  IS NULL )'
      '            AND ( HME.HMEDATAEFETIVA IS NULL )'
      '            AND ( HME.HMETIPOMOV      IN (1, 2, 3, 4, 6, 7) )'
      
        '            AND ( (HME.HMECENTRALIZA = 1) OR (HME.HMEDESTACADO  ' +
        '   = 1) )'
      
        '            AND ( (HME.FLGQUITADO    IS NULL) OR (HME.FLGQUITADO' +
        '   = 0) )'
      
        '            AND ( (HME.FLGABONADO    IS NULL) OR (HME.FLGABONADO' +
        '   = 0) )   '
      
        '            AND ( (HME.FLGESTORNADO  IS NULL) OR (HME.FLGESTORNA' +
        'DO = 0) )'
      '            AND ( HME.IDCONTRATOEMPTMO = :IDCONTRATOEMPTMO)'
      
        '            AND ( HME.HMEDATAVENCTO <= TO_DATE( :DATARESGATE ,'#39'D' +
        'D/MM/YYYY'#39') )'
      '          GROUP BY HME.IDCONTRATOEMPTMO           '
      '       ) EM_ABERTO  '
      '               '
      ' WHERE ( CON.IDTIPOCONTREMPTMO  = TCE.IDTIPOCONTREMPTMO )'
      '   AND ( CON.IDPATRO = JUR.IDPESSOA )'
      '   AND ( CON.IDPESSOA = DEP.IDTITULAR )'
      '   AND ( CON.IDBENEF = DEP.IDPESSOA )'
      '   AND ( CON.IDCONTRATOEMPTMO = SALDODEV.IDCONTRATOEMPTMO)'
      '   AND ( CON.IDCONTRATOEMPTMO = EM_ABERTO.IDCONTRATOEMPTMO (+))'
      '   AND ( CON.IDCONTRATOEMPTMO = :IDCONTRATOEMPTMO)')
    ControlType.Strings = (
      'SELECIONA;CheckBox;1;0')
    ValidateWithMask = True
    Left = 688
    Top = 16
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'DATARESGATE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
    object qryDetalheMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 15
    end
    object qryDetalheIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryDetalheMODALIDADE: TStringField
      FieldName = 'MODALIDADE'
      Size = 60
    end
    object qryDetalheDATACREDITO: TDateTimeField
      FieldName = 'DATACREDITO'
    end
    object qryDetalheIDPATRO: TFloatField
      FieldName = 'IDPATRO'
    end
    object qryDetalhePATRO: TStringField
      FieldName = 'PATRO'
      Size = 60
    end
    object qryDetalheHMESALDODEV: TFloatField
      FieldName = 'HMESALDODEV'
    end
    object qryDetalheVALOR_TOTAL_ABERTO: TFloatField
      FieldName = 'VALOR_TOTAL_ABERTO'
    end
    object qryDetalheIDPLANOORIGEM: TFloatField
      FieldName = 'IDPLANOORIGEM'
    end
  end
  object dsContrato: TwwDataSource
    DataSet = cdsContrato
    Left = 488
    Top = 55
  end
  object qryContratoParaCalculo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   INS.IDINSCRICAOEMPTMO AS INSCRICAO,'
      '   INS.FLGINTERNET,'
      '   NVL(CON.FLGEXCEPCIONAL,0) AS FLGEXCEPCIONAL, -- SOL114613'
      '   PPP.INSCRICAONUMERO,'
      '   DECODE(CON.FLGSITUACAO,'#39'A'#39', '#39'Contrato Ativo'#39','
      '                          '#39'C'#39', '#39'Contrato Cancelado'#39','
      '                          '#39'E'#39', '#39'Contrato Encerrado'#39','
      '                          '#39'Q'#39', '#39'Contrato Quitado'#39','
      '                          '#39'R'#39', '#39'Contrato Refinanciado'#39','
      '                          '#39'S'#39', '#39'Contrato Suspenso'#39','
      '                          '#39'P'#39', '#39'Contrato Pendente de Liberação'#39','
      
        '                          '#39'K'#39', '#39'Contrato Pendente de Quitação'#39') ' +
        'AS DESCSITCONTRATO,'
      '   DECODE(CON.FLGFORMAPAG,'#39'C'#39', '#39'Contas a Pagar'#39','
      
        '                          '#39'F'#39', '#39'Folha de Pagamento'#39') AS DESCFLGF' +
        'ORMAPAG,'
      '   DECODE(CON.FLGFORMAREC,'#39'C'#39', '#39'Contas a Receber'#39','
      
        '                          '#39'F'#39', '#39'Folha de Pagamento'#39') AS DESCFLGF' +
        'ORMAREC,'
      '   FRP.DESCRICAO AS DESCCODFORMAPAG,'
      '   PFP.DESCRICAO AS DESCPORTFORMAPAG,'
      '   PFR.DESCRICAO AS DESCPORTFORMAREC,'
      '   SIT.FLGINTERNO,'
      '   PLV.NOME      AS PLANOPREV,'
      '   PPC.NOME      AS PLANOORIGEM,'
      '   JUR.NOME      AS PATRO,'
      
        '   DECODE(DEP.IDTITULAR, NULL, '#39#39#39#39', DEP.IDPESSOA, ELP.MATRICULA' +
        ', DEP.MATRICULA) AS MATRICULA,'
      '   TIT.NOME      AS TITULAR,'
      '   BEN.NOME      AS BENEFICIARIO,'
      '   CED.NOME AS CEDIDO,'
      '   TCE.TCEDESCRICAO, TCE.IDTIPOEMPTMO,'
      '   TCE.TCELEGENDAEXIBE, TCE.TCELEGENDACALC,'
      '   TEP.DESCTIPOEMPTMO,'
      '   INS.DATAINSC,'
      '   BAN.NOME AS BANCO,'
      '   CTB.CONTACORRENTE, AGB.NUMAGENCIA,'
      '   DECODE(CON.IDCBANCARIA, NULL, '#39#39','
      
        '          DECODE(CON.IDFORNCRED, NULL, BEN.NOME, FRN.NOME )) AS ' +
        'FORNCREDITO,'
      
        '   CON.IDCONTRATOEMPTMO , CON.IDCONTRQUITACAO, CON.IDPESSOA     ' +
        '  , CON.IDVERBA     ,'
      
        '   CON.IDTIPOCONTREMPTMO, CON.IDPLANOPREV    , CON.IDPATRO      ' +
        '  , CON.NUMPARCELAS ,'
      
        '   CON.IDINSCRICAOEMPTMO, CON.IDBENEF        , CON.IDCBANCARIA  ' +
        '  , CON.IDCBANCARIADEB,'
      
        '   CON.CODFORMAPAG      , CON.PORTFORMAPAG   , CON.PORTFORMAREC ' +
        '  , CON.DATACANC    ,'
      
        '   CON.DATACREDITO      , CON.DATASITUACAO   , CON.DATAASSINATUR' +
        'A , CON.DATAPRIMPARC,'
      
        '   CON.VLRCONTRATO      , CON.VLRPARCELA     , CON.TXJUROS      ' +
        '  , CON.FLGSITUACAO ,'
      
        '   CON.FLGFORMAREC      , CON.FLGFORMAPAG    , CON.VLRSALBASE   ' +
        '  , CON.VLRMARGEM   , CON.VLRMAXPERMIT,'
      '   CON.NUMPROTOCOLO AS NUP, ----MONICA SOL172525'
      
        '   CON.MOECODIGO        , CON.IDTIPOSUSPEMPTMO, CON.DATAINICIOSU' +
        'SP, CON.DATAFIMSUSP,'
      
        '   CON.ANOSUSPENSAO     , CON.MESSUSPENSAO    , CON.IDPLANOORIGE' +
        'M , CON.CODAUTOEMP,'
      '   MOE.MOESIGLA         ,'
      '   TSE.TSEDESCRICAO     ,'
      '   RES.NOME AS NOMERESPONSAVEL,'
      '   MUT.DATAMORTE, ---------------CAMPO DATA DE FALECIMENTO'
      '   BDB.NOME AS BANCODEB,'
      
        '   CTD.CONTACORRENTE AS CONTACORRENTEDEB, AGD.NUMAGENCIA AS NUMA' +
        'GENCIADEB,'
      
        '   DECODE(CON.NUMPARCDESCONTO, NULL, 0, CON.NUMPARCDESCONTO) AS ' +
        'NUMPARCDESCONTO,'
      '   SIT.IDSITPART,'
      '   SIT.FLGINTERNO AS SITUACAO_INT,'
      '   SPP.FLGINTERNO AS SITUACAO_INT_PLANO,'
      '   SFU.TIPOSIT    AS SITUACAO_INT_FUNC,'
      '   SIT.DESCRICAO AS SITUACAO,'
      '   SPP.DESCRICAO AS SITUACAO_PLANO,'
      '   SFU.DESCRICAO AS SITUACAO_FUNC,'
      '   CON.FLGUSAMARGEMALT,'
      '   TO_CHAR(VLR.VALORMAX, '#39'999999990D99'#39') AS VALORMAX,'
      '   VLR.DATAINICIO AS DATAINICIO,'
      '   VLR.DATAFIM AS DATAFIM,'
      '   CON.VLRMAXPERMIT'
      ' , NVL(CON.TSEMESES,0) AS QtdeMesSusp'
      ' ,(SELECT COUNT(1) from contratoemptmo '
      
        '   where  IDCONTRQUITACAO = CON.IDCONTRATOEMPTMO ) AS QtdeContQu' +
        'itado'
      'FROM'
      
        '    PESSOA             JUR, PESSOA TIT, PESSOA BEN, PESSOA BAN, ' +
        'PESSOA BDB, PESSOA CED, PESSOA FRN,'
      '    INSCRICAOEMPTMO    INS,'
      '    CONTRATOEMPTMO     CON,'
      '    PARTPREVPLAN       PPP,'
      '    ELEGPATRO          ELP,'
      '    MOEDA              MOE,'
      '    AGENCIABANCARIA    AGB,'
      '    CONTABANCARIA      CTB,'
      '    AGENCIABANCARIA    AGD,'
      '    CONTABANCARIA      CTD,'
      '    TIPOCONTREMPTMO    TCE,'
      '    TIPOEMPTMO         TEP,'
      '    SITPART            SIT,'
      '    SITPLANOPREV       SPP,'
      '    SITFUNC            SFU,'
      '    PLANPREV           PLV,'
      '    PLANPREVCONTABIL   PPC,'
      '    FORMARECPAG        FRP,'
      '    PORTADORFORMA      PFP,'
      '    PORTADORFORMA      PFR,'
      '    TIPOSUSPEMPTMO     TSE,'
      '    PESSOA             RES,'
      '    PESSOAFISICA       PEF,'
      '    PESSOAFISICA       MUT,'
      '    VALORMAXPRESTEP    VLR,'
      '    DEPENTIT           DEP'
      ''
      'WHERE'
      '   CON.IDPESSOA           = PPP.IDPESSOA'
      '   AND CON.IDPLANOPREV        = PLV.IDPLANOPREV'
      '   AND CON.IDPLANOORIGEM      = PPC.IDPLANOPREV'
      '   AND CON.IDPATRO            = JUR.IDPESSOA'
      '   AND CON.IDPESSOA           = ELP.IDPESSOA'
      '   AND CON.IDPATRO            = ELP.IDPESSJUR'
      '   AND CON.IDPESSOA           = TIT.IDPESSOA'
      '   AND CON.IDBENEF            = BEN.IDPESSOA'
      '   AND CON.IDBENEF            = MUT.IDPESSOA'
      '   AND CON.IDTIPOCONTREMPTMO  = TCE.IDTIPOCONTREMPTMO'
      '   AND TCE.IDTIPOEMPTMO       = TEP.IDTIPOEMPTMO'
      '   AND CON.IDINSCRICAOEMPTMO  = INS.IDINSCRICAOEMPTMO(+)'
      
        '   AND CON.IDCONTRATOEMPTMO  = VLR.IDCONTRATOEMPTMO(+)  -- SOL16' +
        '3624'
      '   AND DEP.IDPESSOA           = BEN.IDPESSOA(+)'
      '   AND DEP.IDTITULAR          = CON.IDPESSOA'
      '   AND CON.IDFORNCRED         = FRN.IDPESSOA(+)'
      '   AND CON.IDCBANCARIA        = CTB.IDCBANCARIA(+)'
      '   AND AGB.IDBANCO            = BAN.IDPESSOA(+)'
      '   AND CTB.IDAGENCIA          = AGB.IDPESSOA(+)'
      '   AND AGB.IDBANCO            = BAN.IDPESSOA(+)'
      '   AND CON.IDCBANCARIADEB     = CTD.IDCBANCARIA(+)'
      '   AND AGD.IDBANCO            = BDB.IDPESSOA(+)'
      '   AND CTD.IDAGENCIA          = AGD.IDPESSOA(+)'
      '   AND AGD.IDBANCO            = BDB.IDPESSOA(+)'
      '   AND CON.CODFORMAPAG        = FRP.CODFORMA(+)'
      '   AND CON.PORTFORMAPAG       = PFP.CODPORTFORMA(+)'
      '   AND CON.PORTFORMAREC       = PFR.CODPORTFORMA(+)'
      '   AND CON.MOECODIGO          = MOE.MOECODIGO(+)'
      '   AND CON.IDTIPOSUSPEMPTMO   = TSE.IDTIPOSUSPEMPTMO(+)'
      '   AND CON.IDRESPONSAVEL      = RES.IDPESSOA(+)'
      '   AND PPP.IDSITPART          = SIT.IDSITPART'
      '   AND PPP.IDSITPLANOPREV     = SPP.IDSITPLANOPREV'
      '   AND ELP.IDSITFUNC          = SFU.IDSITFUNC'
      '   AND PEF.IDPESSOA           = PPP.IDPESSOA'
      '   AND (ppp.idplanoprev = (SELECT MAX(ppp2.idplanoprev)'
      '                             FROM partprevplan ppp2'
      '                            WHERE ppp2.flgdesativado = 0'
      
        '                              AND ppp2.idpessoa = ppp.idpessoa) ' +
        'OR (PPP.FLGDESATIVADO = 1 '
      
        '                              AND NOT EXISTS (SELECT 1 FROM part' +
        'prevplan ppp1'
      
        '                            WHERE ppp1.idpessoa = ppp.idpessoa A' +
        'ND ppp1.flgdesativado = 0) '
      '                              AND (ppp.idsitplanoprev = 25 '
      
        '                               OR (ppp.idplanoprev = (SELECT MAX' +
        '(ppp1.idplanoprev) '
      
        '                                                        FROM par' +
        'tprevplan ppp1'
      
        '                                                       WHERE ppp' +
        '1.idpessoa = ppp.idpessoa'
      
        '                                                         AND nvl' +
        '(ppp1.datacancelamento, '
      
        '                                                          TRIM(S' +
        'YSDATE)) = (SELECT nvl(MAX(ppp2.datacancelamento),TRIM(SYSDATE))'
      
        '                                                                ' +
        '       FROM partprevplan ppp2'
      
        '                                                                ' +
        '       WHERE ppp2.idpessoa = ppp1.idpessoa)'
      
        '                                        AND   NOT EXISTS (SELECT' +
        ' 1 FROM partprevplan ppp2'
      
        '                                                          WHERE ' +
        'ppp2.idpessoa = ppp1.idpessoa'
      
        '                                                          AND   ' +
        'ppp2.idsitplanoprev = 25))))))'
      'AND ELP.IDPESSJURCEDIDO    = CED.IDPESSOA(+)'
      'AND DEP.MATRICULA =  :PMATRICULA'
      'AND CON.IDCONTRATOEMPTMO = :PIDCONTRATOEMPTMO')
    ValidateWithMask = True
    Left = 632
    Top = 410
    ParamData = <
      item
        DataType = ftString
        Name = 'PMATRICULA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
  end
  object qryMatricula: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '')
    ValidateWithMask = True
    Left = 624
    Top = 9
    object qryMatriculaMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 15
    end
    object qryMatriculaIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryMatriculaDATARESGATE: TStringField
      FieldName = 'DATARESGATE'
      FixedChar = True
      Size = 1
    end
  end
  object cdsContrato: TwwClientDataSet
    Aggregates = <>
    Filter = 'SELECIONA = True'
    FieldDefs = <
      item
        Name = 'Seleciona'
        DataType = ftBoolean
      end
      item
        Name = 'IDCONTRATOEMPTMO'
        DataType = ftFloat
      end
      item
        Name = 'MODALIDADE'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'DATACREDITO'
        DataType = ftDateTime
      end
      item
        Name = 'HMESALDODEV'
        DataType = ftFloat
      end
      item
        Name = 'VALOR_TOTAL_ABERTO'
        DataType = ftFloat
      end
      item
        Name = 'MATRICULA'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'IDPATRO'
        DataType = ftFloat
      end
      item
        Name = 'PATRO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'IDPLANOORIGEM'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    ControlType.Strings = (
      'Seleciona;CheckBox;True;False')
    ValidateWithMask = True
    Left = 418
    Top = 56
    object cdsContratoSeleciona: TBooleanField
      DisplayLabel = '  '
      DisplayWidth = 4
      FieldName = 'Seleciona'
    end
    object cdsContratoIDCONTRATOEMPTMO: TFloatField
      DisplayLabel = 'Nº Contrato'
      DisplayWidth = 14
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object cdsContratoMODALIDADE: TStringField
      DisplayLabel = 'Modalidade'
      DisplayWidth = 30
      FieldName = 'MODALIDADE'
      Size = 60
    end
    object cdsContratoDATACREDITO: TDateTimeField
      DisplayLabel = 'Data Crédito'
      DisplayWidth = 13
      FieldName = 'DATACREDITO'
    end
    object cdsContratoHMESALDODEV: TFloatField
      DisplayLabel = 'Saldo Devedor'
      DisplayWidth = 13
      FieldName = 'HMESALDODEV'
      currency = True
    end
    object cdsContratoVALOR_TOTAL_ABERTO: TFloatField
      DisplayLabel = 'Valor em Aberto'
      DisplayWidth = 13
      FieldName = 'VALOR_TOTAL_ABERTO'
      currency = True
    end
    object cdsContratoMATRICULA: TStringField
      DisplayWidth = 15
      FieldName = 'MATRICULA'
      Visible = False
      Size = 15
    end
    object cdsContratoIDPATRO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPATRO'
      Visible = False
    end
    object cdsContratoPATRO: TStringField
      DisplayWidth = 60
      FieldName = 'PATRO'
      Visible = False
      Size = 60
    end
    object cdsContratoIDPLANOORIGEM: TIntegerField
      FieldName = 'IDPLANOORIGEM'
    end
  end
  object dsMatricula: TwwDataSource
    DataSet = qryMatricula
    Left = 624
    Top = 57
  end
  object OpenDialog: TOpenDialog
    Left = 209
    Top = 56
  end
  object qrySeProcessado: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 337
    Top = 56
  end
  object qryGeraResgate: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT distinct'
      
        '   0 HMEPARCELA, HME.IDCONTRATOEMPTMO, 0 IDHISTMOVEMPTMO, 1 HMEN' +
        'UMPARCELAS,  0 HMEVLRPREVISTO, '#39'R'#39' HMERECPAG,'
      
        '   '#39'F'#39' HMEFORMACOBRANCA, '#39'B'#39' HMETIPOFOLHA, 0 HMETIPOMOV, '#39'Valor ' +
        'calculado para quitacao '#39' ITEDESCRICAO, '#39'Normal'#39' AS FLGTIPODESC,' +
        ' '
      
        '   0 IDRUBRICA,  0 IDITEMEMPTMO, 0 HMESALDODEV, '#39'00/0000'#39' ANOMES' +
        'COMPETENCIA, CON.IDPATRO, '
      
        '   CON.IDEMPRESAPROP, CON.IDTIPOCONTREMPTMO, CON.IDPESSOA, CON.I' +
        'DBENEF, '
      '   CON.IDPLANOPREV, 0 IDPLANOORIGEM,'
      '   0 ITCPRIORIDADE, 0 TIPCODIGO, 0 PLANO, 0 ITCTRATASALDODEV, '
      
        '   CON.INSCRICAONUMERO, CON.MATRICULA_TIT AS MATRICULA, CON.FLGI' +
        'NTERNO, '
      
        '   0 AS FLGATUALSALDOENV, -1 AS IDREGRAENVIOPARC, CON.IDTIPOSUSP' +
        'EMPTMO,'
      '   sysdate HMEDATAVENCTO'
      'FROM '
      '  HISTMOVEMPTMO   HME,   '
      '  ( '
      '  SELECT '
      
        '     CON.IDCONTRATOEMPTMO,      CON.IDINSCRICAOEMPTMO,        CO' +
        'N.IDCONTRQUITACAO, '
      '     CON.IDVERBA,               CON.FLGSITUACAO, '
      '     CON.NUMPARCELAS               AS PRAZO, '
      
        '     CON.VLRCONTRATO,           CON.VLRPARCELA,               CO' +
        'N.TXJUROS, '
      
        '     DECODE(ELP.IDPESSJURCEDIDO, NULL, CON.IDPATRO, ELP.IDPESSJU' +
        'RCEDIDO) AS IDPATRO, '
      '     TEP.IDEMPRESAPROP, '
      
        '     CON.IDPLANOPREV, NVL(CON.IDPLANOORIGEM, CON.IDPLANOPREV) AS' +
        ' IDPLANOORIGEM, '
      '     CON.IDTIPOCONTREMPTMO,     TCE.TCEDESCRICAO, '
      '     TCE.IDTIPOEMPTMO,          TEP.DESCTIPOEMPTMO, '
      
        '     CON.IDPESSOA,              CON.IDBENEF,                  CO' +
        'N.IDCBANCARIA, '
      '     CON.MOECODIGO, CON.IDCBANCARIADEB, '
      
        '     DECODE(DEP.MATRICULA, NULL, ELP.MATRICULA, DEP.MATRICULA) A' +
        'S MATRICULA_TIT, '
      '     CON.FLGSUSPENSAOAUTO,      CON.IDTIPOSUSPEMPTMO, '
      '     PPP.INSCRICAONUMERO, '
      '     NVL(PPP.SALPARTICIPACAO, 0)   AS SALPARTICIPACAO, '
      '     NVL(PPP.SALMANTIDO, 0)        AS SALMANTIDO, '
      '     NVL(PPP.SALAUXDOENCA, 0)      AS SALAUXDOENCA, '
      '     SIT.IDSITPART,             SIT.FLGINTERNO, '
      '     SIT.DESCRICAO              AS SIT_TITULAR, '
      
        '     DECODE(CON.IDBENEF, CON.IDPESSOA, SIT.DESCRICAO, '#39'Pensionis' +
        'ta'#39') AS SITDESCRICAO '
      '  FROM '
      '     CONTRATOEMPTMO  CON, '
      '     PARTPREVPLAN    PPP, '
      '     ELEGPATRO       ELP, '
      '     DEPENTIT        DEP, '
      '     PATRO           PTR, '
      '     TIPOCONTREMPTMO TCE, '
      '     TIPOEMPTMO      TEP, '
      '     SITPART         SIT, '
      '     SITPLANOPREV    SPP  '
      '  WHERE '
      '         TEP.IDEMPRESAPROP     = 1'
      '     AND CON.IDPATRO           = PTR.IDPESSOA '
      '     AND CON.IDPATRO           = PTR.IDPESSOA '
      '     AND CON.IDPESSOA          = ELP.IDPESSOA '
      '     AND CON.IDPESSOA          = PPP.IDPESSOA '
      '     AND CON.IDPESSOA          = DEP.IDTITULAR '
      '     AND CON.IDBENEF           = DEP.IDPESSOA '
      '     AND PTR.IDPESSOA          = ELP.IDPESSJUR '
      '     AND CON.IDPATRO           = PPP.IDPESSJUR '
      '     AND CON.IDTIPOCONTREMPTMO = TCE.IDTIPOCONTREMPTMO '
      '     AND TCE.IDTIPOEMPTMO      = TEP.IDTIPOEMPTMO '
      '     AND PPP.IDSITPART         = SIT.IDSITPART '
      '     AND PPP.IDSITPLANOPREV    = SPP.IDSITPLANOPREV '
      '  ) CON'
      'WHERE  ( CON.IDCONTRATOEMPTMO   = :PIDCONTRATOEMPTMO )'
      '   AND ( CON.IDCONTRATOEMPTMO  = HME.IDCONTRATOEMPTMO ) '
      '   AND ROWNUM = 1 '
      'ORDER BY '
      '   HME.IDCONTRATOEMPTMO ')
    UpdateObject = updGeraResgate
    ValidateWithMask = True
    Left = 280
    Top = 410
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
  end
  object updGeraResgate: TUpdateSQL
    Left = 367
    Top = 405
  end
end
