inherited frmRecebtoEmprestimoResgate: TfrmRecebtoEmprestimoResgate
  Left = 336
  Top = 113
  Caption = 'Recebimento de Empréstimo com Resgate'
  ClientHeight = 434
  ClientWidth = 724
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 724
    Height = 395
  end
  inherited Dock971: TDock97
    Top = 395
    Width = 724
    inherited tb97Fundo: TToolbar97
      Left = 552
      DockPos = 711
      inherited bbtnAjuda: TmaHelpBitBtn
        ClickHelpContext = 150019
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
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
    Width = 724
    Height = 395
    Align = alClient
    TabOrder = 2
    object TPage
      Left = 0
      Top = 0
      Caption = 'Default'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 724
        Height = 79
        Align = alTop
        TabOrder = 0
        object grp: TGroupBox
          Left = 16
          Top = 11
          Width = 280
          Height = 52
          Caption = 'Mês de Competência'
          TabOrder = 0
          object cboMes: TComboBox
            Left = 16
            Top = 22
            Width = 153
            Height = 21
            Style = csDropDownList
            DropDownCount = 12
            ItemHeight = 13
            TabOrder = 0
            Items.Strings = (
              'Janeiro'
              'Fevereiro'
              'Março'
              'Abril'
              'Maio'
              'Junho'
              'Julho'
              'Agosto'
              'Setembro'
              'Outubro'
              'Novembro'
              'Dezembro')
          end
          object DBspnAno: TwwDBSpinEdit
            Left = 172
            Top = 22
            Width = 65
            Height = 21
            Increment = 1
            MaxValue = 2500
            MinValue = 1850
            TabOrder = 1
            UnboundDataType = wwDefault
          end
        end
        object btnBuscaMatricula: TBitBtn
          Left = 262
          Top = 31
          Width = 24
          Height = 22
          Hint = 'Busca um Participante'
          Anchors = [akTop, akRight]
          TabOrder = 1
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
        object BitBtn5: TBitBtn
          Left = 668
          Top = 53
          Width = 21
          Height = 20
          Hint = 'Inverte a Seleção'
          TabOrder = 2
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
        object BitBtn6: TBitBtn
          Left = 693
          Top = 53
          Width = 22
          Height = 20
          Hint = 'Seleciona Todos'
          TabOrder = 3
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
      end
      object gridContrato: TwwDBGrid
        Left = 0
        Top = 79
        Width = 724
        Height = 316
        Selected.Strings = (
          'SELECIONA'#9'4'#9'  '
          'MATRICULA'#9'10'#9'Matrícula'#9'F'
          'NOME'#9'30'#9'Nome'
          'NODOCUMENTO'#9'12'#9'Nº Contrato'
          'DATACOBRANCA'#9'12'#9'Data Resgate'
          'VALOR'#9'12'#9'Valor Enviado'
          'VALORRECEBIDO'#9'13'#9'Valor Recebido')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
        Align = alClient
        DataSource = dsRecebe
        TabOrder = 1
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
    object TPage
      Left = 0
      Top = 0
      Caption = 'Resultado'
      object memResult: TMemo
        Left = 12
        Top = 36
        Width = 654
        Height = 310
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
        Left = 11
        Top = 9
        Width = 657
        Height = 27
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = 'Recebimento'
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
        Left = 551
        Top = 355
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
    Top = 387
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
  object qryRecebe: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT 0 Seleciona,'
      '       t.matricula,'
      '       p.nome,'
      '       t.nodocumento,'
      '       t.datacobranca,'
      '       t.valor,'
      '       nvl(t.valorrecebido, 0) valorrecebido,'
      '       t.sitenvio,'
      '       t.mesreferencia,'
      
        '   to_date(to_char(t.datarecebimento,'#39'dd/mm/yyyy'#39')) datarecebime' +
        'nto,'
      '       t.idtmpdesc,'
      '       con.idtipocontremptmo'
      '  FROM tmpdesc t'
      '       JOIN paramemptmo pt ON t.idprovento = pt.idprovento'
      '       JOIN pessoa p ON t.idpessoa = p.idpessoa'
      
        '       JOIN contratoemptmo con ON t.nodocumento = con.idcontrato' +
        'emptmo'
      'WHERE t.datarecebimento IS NOT NULL'
      '   AND t.valorrecebido IS NOT NULL'
      '   AND t.sitenvio IN ('#39'1'#39', '#39'2'#39')'
      '   AND t.mesreferencia = :MESREFERENCIA'
      'ORDER BY MATRICULA, NODOCUMENTO')
    ControlType.Strings = (
      'SELECIONA;CheckBox;1;0')
    ValidateWithMask = True
    Left = 592
    Top = 96
    ParamData = <
      item
        DataType = ftString
        Name = 'MESREFERENCIA'
        ParamType = ptInput
      end>
  end
  object dsRecebe: TwwDataSource
    DataSet = cdsRecebe
    Left = 592
    Top = 240
  end
  object qryParcelasAbertas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT HME.IDCONTRATOEMPTMO, '
      '       HME.HMEPARCELA, '
      '       SUM(HME.HMEVLRPREVISTO) VALOR_PARCELA, '
      '       COUNT(HME.HMEVLRPREVISTO) QTDE_ITENS_PARCELA '
      '  FROM HISTMOVEMPTMO HME'
      'WHERE ( HME.IDCONTRATOEMPTMO   = :PIDCONTRATOEMPTMO  )'
      '  AND ( NVL(HME.FLGBAIXADO, 1) = 0 )'
      '  AND ( HME.HMETIPOMOV NOT IN (5, 8) )'
      '  AND ( HME.HMEVLREFETIVO IS NULL )'
      '  AND ( HME.HMEDATAEFETIVA IS NULL )'
      '  AND ( (HME.HMECENTRALIZA = 1) OR ( HME.HMEDESTACADO = 1 ) )'
      '  AND ( NVL(HME.FLGESTORNADO, 0) = 0 )'
      '  AND ( NVL(HME.FLGQUITADO, 0) = 0 )'
      '  AND ( HME.HMETIPOMOV <> 3 )'
      'GROUP BY HME.IDCONTRATOEMPTMO, HME.HMEPARCELA'
      'ORDER BY HME.IDCONTRATOEMPTMO, HME.HMEPARCELA')
    ValidateWithMask = True
    Left = 288
    Top = 112
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
    object qryParcelasAbertasIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryParcelasAbertasHMEPARCELA: TFloatField
      FieldName = 'HMEPARCELA'
    end
    object qryParcelasAbertasVALOR_PARCELA: TFloatField
      FieldName = 'VALOR_PARCELA'
    end
    object qryParcelasAbertasQTDE_ITENS_PARCELA: TFloatField
      FieldName = 'QTDE_ITENS_PARCELA'
    end
  end
  object qryPagarParcelas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   HISTMOVEMPTMO HME'
      ' SET'
      '   HME.FLGBAIXADO       = NULL,'
      '   HME.HMEVLREFETIVO    = HME.HMEVLRPREVISTO,'
      '   HME.HMEDATAEFETIVA  = :PHMEDATAEFETIVA,'
      '   HME.IDTMPDESC             = :PIDTMPDESC,'
      '   HME.HMETIPOFOLHA     = '#39'B'#39','
      '   HME.HMEFORMACOBRANCA = '#39'F'#39
      'WHERE ( HME.IDCONTRATOEMPTMO   = :PIDCONTRATOEMPTMO  )'
      '  AND ( HME.HMEPARCELA       = :PHMEPARCELA )'
      '  AND ( NVL(HME.FLGBAIXADO, 1) = 0 )'
      '  AND ( HME.HMETIPOMOV NOT IN (5, 8) )'
      '  AND ( HME.HMEVLREFETIVO IS NULL )'
      '  AND ( HME.HMEDATAEFETIVA IS NULL )'
      '  AND ( (HME.HMECENTRALIZA = 1) OR ( HME.HMEDESTACADO = 1 ) )'
      '  AND ( NVL(HME.FLGESTORNADO, 0) = 0 )'
      '  AND ( NVL(HME.FLGQUITADO, 0) = 0 )'
      '  AND ( HME.HMETIPOMOV <> 3 )')
    ValidateWithMask = True
    Left = 408
    Top = 112
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'PHMEDATAEFETIVA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDTMPDESC'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEPARCELA'
        ParamType = ptInput
      end>
  end
  object qryItensParcelasAbertas: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsParcelasAbertas
    SQL.Strings = (
      'SELECT HME.IDCONTRATOEMPTMO, HME.HMEPARCELA, HME.HMEVLRPREVISTO'
      '  FROM HISTMOVEMPTMO HME'
      'WHERE ( HME.IDCONTRATOEMPTMO   = :IDCONTRATOEMPTMO  )'
      '  AND ( HME.HMEPARCELA = :HMEPARCELA  )'
      '  AND ( NVL(HME.FLGBAIXADO, 1) = 0 )'
      '  AND ( HME.HMETIPOMOV NOT IN (5, 8) )'
      '  AND ( HME.HMEVLREFETIVO IS NULL )'
      '  AND ( HME.HMEDATAEFETIVA IS NULL )'
      '  AND ( (HME.HMECENTRALIZA = 1) OR ( HME.HMEDESTACADO = 1 ) )'
      '  AND ( NVL(HME.FLGESTORNADO, 0) = 0 )'
      '  AND ( NVL(HME.FLGQUITADO, 0) = 0 )'
      '  AND ( HME.HMETIPOMOV <> 3 )')
    ValidateWithMask = True
    Left = 288
    Top = 208
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'HMEPARCELA'
        ParamType = ptInput
      end>
    object qryItensParcelasAbertasIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryItensParcelasAbertasHMEPARCELA: TFloatField
      FieldName = 'HMEPARCELA'
    end
    object qryItensParcelasAbertasHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
    end
  end
  object dsParcelasAbertas: TwwDataSource
    DataSet = qryParcelasAbertas
    Left = 288
    Top = 160
  end
  object qryTotalItens: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT HME.IDCONTRATOEMPTMO, '
      '        SUM(HME.HMEVLRPREVISTO) VALOR_TOTAL_ITENS_ABERTOS, '
      '       COUNT(HME.HMEVLRPREVISTO) QTDE_TOTAL_ITENS_ABERTOS '
      '  FROM HISTMOVEMPTMO HME'
      'WHERE ( HME.IDCONTRATOEMPTMO   = :PIDCONTRATOEMPTMO )'
      '  AND ( NVL(HME.FLGBAIXADO, 1) = 0 )'
      '  AND ( HME.HMETIPOMOV NOT IN (5, 8) )'
      '  AND ( HME.HMEVLREFETIVO IS NULL )'
      '  AND ( HME.HMEDATAEFETIVA IS NULL )'
      '  AND ( (HME.HMECENTRALIZA = 1) OR ( HME.HMEDESTACADO = 1 ) )'
      '  AND ( NVL(HME.FLGESTORNADO, 0) = 0 )'
      '  AND ( NVL(HME.FLGQUITADO, 0) = 0 )'
      '  AND ( HME.HMETIPOMOV <> 3 )'
      'GROUP BY HME.IDCONTRATOEMPTMO')
    ValidateWithMask = True
    Left = 408
    Top = 168
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
    object qryTotalItensIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryTotalItensVALOR_TOTAL_ITENS_ABERTOS: TFloatField
      FieldName = 'VALOR_TOTAL_ITENS_ABERTOS'
    end
    object qryTotalItensQTDE_TOTAL_ITENS_ABERTOS: TFloatField
      FieldName = 'QTDE_TOTAL_ITENS_ABERTOS'
    end
  end
  object qryContrato: TwwQuery
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
    Left = 408
    Top = 226
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
  object qryAtualizaTMPDESC: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE TMPDESC SET SITENVIO = 9'
      'WHERE IDTMPDESC = :IDTMPDESC')
    ValidateWithMask = True
    Left = 280
    Top = 272
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDTMPDESC'
        ParamType = ptInput
      end>
  end
  object cdsRecebe: TwwClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'MESREFERENCIA'
        ParamType = ptInput
      end>
    ProviderName = 'dspRecebe'
    ControlType.Strings = (
      'SELECIONA;CheckBox;1;0')
    ValidateWithMask = True
    Left = 592
    Top = 192
    object cdsRecebeSELECIONA: TFloatField
      DisplayLabel = '  '
      DisplayWidth = 4
      FieldName = 'SELECIONA'
    end
    object cdsRecebeMATRICULA: TStringField
      DisplayLabel = 'Matrícula'
      DisplayWidth = 10
      FieldName = 'MATRICULA'
      ReadOnly = True
      FixedChar = True
      Size = 13
    end
    object cdsRecebeNOME: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 30
      FieldName = 'NOME'
      ReadOnly = True
      Size = 60
    end
    object cdsRecebeNODOCUMENTO: TFloatField
      DisplayLabel = 'Nº Contrato'
      DisplayWidth = 12
      FieldName = 'NODOCUMENTO'
      ReadOnly = True
    end
    object cdsRecebeDATACOBRANCA: TDateTimeField
      DisplayLabel = 'Data Resgate'
      DisplayWidth = 12
      FieldName = 'DATACOBRANCA'
      ReadOnly = True
    end
    object cdsRecebeVALOR: TFloatField
      DisplayLabel = 'Valor Enviado'
      DisplayWidth = 12
      FieldName = 'VALOR'
      ReadOnly = True
    end
    object cdsRecebeVALORRECEBIDO: TFloatField
      DisplayLabel = 'Valor Recebido'
      DisplayWidth = 13
      FieldName = 'VALORRECEBIDO'
      ReadOnly = True
    end
    object cdsRecebeSITENVIO: TStringField
      DisplayWidth = 1
      FieldName = 'SITENVIO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsRecebeMESREFERENCIA: TStringField
      DisplayWidth = 7
      FieldName = 'MESREFERENCIA'
      Visible = False
      FixedChar = True
      Size = 7
    end
    object cdsRecebeDATARECEBIMENTO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATARECEBIMENTO'
      Visible = False
    end
    object cdsRecebeIDTMPDESC: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTMPDESC'
      Visible = False
    end
    object cdsRecebeIDTIPOCONTREMPTMO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOCONTREMPTMO'
      Visible = False
    end
  end
  object dspRecebe: TDataSetProvider
    DataSet = qryRecebe
    Constraints = True
    Left = 592
    Top = 144
  end
  object qryBaixaItem: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE '
      '   HISTMOVEMPTMO HME'
      'SET'
      '   HME.FLGBAIXADO = NULL,'
      '   HME.IDTMPDESC  = :PIDTMPDESC'
      'WHERE'
      '       HME.IDCONTRATOEMPTMO   = :PIDCONTRATOEMPTMO'
      '   AND HME.HMETIPOMOV IN (2,3)'
      '   AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) )')
    ValidateWithMask = True
    Left = 408
    Top = 280
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDTMPDESC'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
  end
end
