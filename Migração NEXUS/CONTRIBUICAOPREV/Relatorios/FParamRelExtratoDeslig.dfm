inherited FrmParamRelExtratoDeslig: TFrmParamRelExtratoDeslig
  Left = 130
  Top = 106
  BorderIcons = []
  Caption = 'Extrato de Desligamento'
  ClientHeight = 356
  ClientWidth = 588
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 588
    Height = 317
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 586
      Height = 112
      Align = alTop
      Caption = '  Dados do Participante  '
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 12
        Width = 123
        Height = 13
        Caption = 'Nome do Participante'
      end
      object Label2: TLabel
        Left = 376
        Top = 12
        Width = 80
        Height = 13
        Caption = 'Patrocinadora'
      end
      object Label3: TLabel
        Left = 8
        Top = 56
        Width = 89
        Height = 13
        Caption = 'Nº de Inscrição'
      end
      object Label4: TLabel
        Left = 120
        Top = 56
        Width = 55
        Height = 13
        Caption = 'Matrícula'
      end
      object Label5: TLabel
        Left = 232
        Top = 56
        Width = 118
        Height = 13
        Caption = 'Plano Previdenciário'
      end
      object edtNomeParticip: TEdit
        Left = 8
        Top = 28
        Width = 361
        Height = 21
        CharCase = ecUpperCase
        Color = clInactiveCaption
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object edtNomePatro: TEdit
        Left = 376
        Top = 28
        Width = 202
        Height = 21
        CharCase = ecUpperCase
        Color = clInactiveCaption
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object edtInscricao: TEdit
        Left = 8
        Top = 72
        Width = 105
        Height = 21
        CharCase = ecUpperCase
        Color = clInactiveCaption
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object edtMatricula: TEdit
        Left = 120
        Top = 72
        Width = 105
        Height = 21
        CharCase = ecUpperCase
        Color = clInactiveCaption
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
      object edtNomePlano: TEdit
        Left = 232
        Top = 72
        Width = 202
        Height = 21
        CharCase = ecUpperCase
        Color = clInactiveCaption
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
      end
      object btnLocalizar: TBitBtn
        Left = 440
        Top = 53
        Width = 137
        Height = 55
        Caption = 'Buscar Participante'
        TabOrder = 5
        OnClick = btnLocalizarClick
        Glyph.Data = {
          76020000424D7602000000000000760000002800000020000000200000000100
          0400000000000002000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777770880880
          7777777770070077777777777088088077777777000000077777777770880880
          0070077708808807777777777088088000000077088088077777777770880880
          88088077088088077777777700888880080880770880880777777770B0888880
          B0088077088088077777770000003000000880770880880777777708808FFF80
          880880770880880777777708808FCF80880880770880880777777708808FCF80
          880880770880880777777708808FCF80880880700888880077777708808FCF80
          8808800B0888880B07777708808FCF80880880000003000000777708888F6F88
          8808808808FFF80880777708888FCF888800008808FCF8088077777000000000
          00FF808808FCF80880777777777708808FCF808808FCF8088077777777700080
          8FCF808808FCF808807777777703B3008FCF808808FCF80880777777770B3B00
          8FCF808888F6F888807777777703B3008FCF808888FCF8888077777777700088
          8F6F88000000000007777777777708888FCF8888077777777777777777777000
          0000000077000777777777777777777777777777703B30777777777777777777
          7000777770B3B077777777777777777703B30777703B30777777777777777777
          0B3B077777000777777777777777777703B30777777777777777777777777777
          7000777777777777777777777777777777777777777777777777}
        Layout = blGlyphTop
      end
    end
    object Panel1: TPanel
      Left = 192
      Top = 113
      Width = 395
      Height = 203
      Align = alRight
      TabOrder = 1
      object Panel2: TPanel
        Left = 1
        Top = 1
        Width = 393
        Height = 19
        Align = alTop
        Caption = 'Log da Operação'
        TabOrder = 0
      end
      object memResult: TMemo
        Left = 1
        Top = 20
        Width = 393
        Height = 182
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        OnChange = memResultChange
      end
    end
    object pnlEtapas: TPanel
      Left = 1
      Top = 113
      Width = 192
      Height = 203
      Align = alLeft
      TabOrder = 2
      object twEtapa: TTreeWzd
        Left = 1
        Top = 1
        Width = 190
        Height = 201
        Align = alClient
        Color = clGray
        BevelInner = bvSpace
        BevelOuter = bvNone
        BevelWidth = 2
        BorderStyle = bsSingle
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Etapa.Caption.Strings = (
          'Iniciando...'
          'Verificando extratos anteriores'
          'Processando dados'
          'Visualizando relatório'
          'Finalizando...')
        Etapa.Forma = stRoundSquare
        Etapa.LinhaWidth = 1
        Etapa.Top = 15
        Etapa.Espaco = 18
        Etapa.Quantidade = 5
        Etapa.BorderWidth = 1
        Etapa.Left = 10
        Etapa.Identacao = 35
        Etapa.Height = 20
        Etapa.Width = 25
        Etapa.BoderColor = clNavy
        Etapa.BrushColor = clWindow
        Etapa.Imagem.Data = {
          5A010000424D5A01000000000000760000002800000012000000130000000100
          040000000000E4000000CE0E0000C40E00001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777778877777
          7777770000007777844877777777770000007778444487777777770000007784
          4444487777777700000078444C4444877777770000007444C4C4448777777700
          00007C4C444C444877777700000078C44444C4448777770000008444C4444C44
          487777000000444C7C4448C4448777000000C4C777C4448C4448770000007C77
          777C4448C4448700000077777777C4448C4487000000777777777C4448C44700
          00007777777777C4448C7700000077777777777C444877000000777777777777
          C448770000007777777777777C447700000077777777777777C777000000}
        Etapa.Pos = 1
      end
    end
  end
  inherited Dock971: TDock97
    Top = 317
    Width = 588
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 11
    Top = 315
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
    Caption = 'Seleciona Participante'
    Colunas.Strings = (
      'EL.MATRICULA'
      'PE.NOME'
      'PP.INSCRICAONUMERO'
      'PJ.NOME'
      'PL.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Nome do Participante'
      'Nº de Inscrição'
      'Patrocinadora'
      'Plano Previdenciária')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA PE'
      'PESSOA PJ'
      'ELEGPATRO EL'
      'PARTPREVPLAN PP'
      'PLANPREV PL')
    CamposChave.Strings = (
      'EL.IDPESSOA'
      'EL.IDPESSJUR'
      'PP.IDPLANOPREV'
      'PE.NOME'
      'PJ.NOME'
      'PL.NOME'
      'PP.INSCRICAONUMERO'
      'EL.MATRICULA'
      'PP.SEQPROPOSTA'
      'EL.DATADEMISSAO')
    Filtro.Strings = (
      'EL.IDPESSOA = PP.IDPESSOA'
      'EL.IDPESSJUR = PP.IDPESSJUR'
      'PP.IDPESSOA = PE.IDPESSOA'
      'PP.IDPESSJUR = PJ.IDPESSOA'
      'PP.FLGDESATIVADO = 0'
      'PP.IDPLANOPREV = PL.IDPLANOPREV')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '13'
      '60'
      '10'
      '60'
      '50')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 545
    Top = 49
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 309
    Top = 146
  end
  object qryCfg: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CS.IDCFGSIMULADESLIG, CS.IDPLANOPREV, PP.NOME NOMEPLANO,'
      '       CS.IDEVENTOGERADOR, EG.NOME NOMEEVENTO, CS.FLGRODAELEG, '
      '       EG.FLGINTERNO,CS.ORDEM'
      'FROM CFGSIMULADESLIG CS, PLANPREV PP, EVENTOGERADOR EG'
      'WHERE CS.IDPLANOPREV     = :PIDPLANOPREV'
      '  AND CS.IDPLANOPREV     = PP.IDPLANOPREV'
      '  AND CS.IDEVENTOGERADOR = EG.IDEVENTOGERADOR'
      'ORDER BY CS.ORDEM'
      '')
    ControlType.Strings = (
      'FLGRODAELEG;CheckBox;1;0')
    ValidateWithMask = True
    Left = 231
    Top = 146
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object qryEvento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT EP.IDSITPLANOATUAL, EP.IDSITPLANONOVO,'
      '       EP.IDSITFUNCATUAL,  EP.IDSITFUNCNOVO,'
      '       EP.IDSITPARTATUAL,  EP.IDSITPARTNOVO,'
      '       EP.DATAEVENTO,      EP.DATAREGISTRO,'
      '       EG.FLGINTERNO'
      'FROM   EVENTOSPREV EP, EVENTOGERADOR EG'
      'WHERE  EP.IDPLANOPREV    = :PIDPLANOPREV'
      'AND    EP.IDPESSOA       = :PIDPESSOA'
      'AND    EP.IDPESSJUR      = :PIDPESSJUR'
      'AND    EG.IDEVENTOGERADOR = EP.IDEVENTOGERADOR'
      'AND    EG.FLGINTERNO      IN ('#39'DP'#39', '#39'DC'#39', '#39'DM'#39', '#39'DS'#39', '#39'DA'#39')'
      
        'AND    EP.DATAREGISTRO IN ( SELECT MAX(EP.DATAREGISTRO) FROM EVE' +
        'NTOSPREV EP, EVENTOGERADOR EV'
      
        '                            WHERE  EP.IDPLANOPREV    = :PIDPLANO' +
        'PREV'
      
        '                            AND    EP.IDPESSOA       = :PIDPESSO' +
        'A'
      
        '                            AND    EP.IDPESSJUR      = :PIDPESSJ' +
        'UR'
      
        '                            AND    EP.IDEVENTOGERADOR = EV.IDEVE' +
        'NTOGERADOR'
      
        '                            AND    EV.FLGINTERNO      IN ('#39'DP'#39', ' +
        #39'DC'#39', '#39'DM'#39', '#39'DS'#39', '#39'DA'#39') )'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 231
    Top = 258
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSJUR'
        ParamType = ptUnknown
      end>
  end
  object qryTitular: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.NOME, P1.NOME AS NOMEPATRO, PL.NOME AS NOMEPLANO,'
      '       PF.FLGISENTOIRRF,'
      '       PF.DATANASC, PF.DATAMORTE,'
      
        '       EL.MATRICULA, EL.DATAADMISSAO, EL.DATADEMISSAO, EL.TEMPOS' +
        'ERVANTERIOR,'
      
        '       EL.TEMPONAOCREDITADO, EL.TEMPOSITESPECIAL, EL.NIVEL, EL.I' +
        'DSITFUNC,'
      
        '       EL.TEMPOSERVTOTAL,   EL.TEMPOSERVTOTMES, EL.TEMPOSERVTOTD' +
        'IA,'
      
        '       PP.INSCRICAONUMERO, PP.INSCRICAODATA, PP.DATACANCELAMENTO' +
        ', PP.FLGDEVEEMPRESTIMO,'
      '       PP.FLGDEVEASSISTENC,'
      '       PP.FLGDEVEPREVIDENC, PP.IDSITPART, PP.IDSITPLANOPREV,'
      
        '       SPART.DESCRICAO AS NOMESITPART, SFUNC.DESCRICAO AS NOMESI' +
        'TFUNC,'
      '       SPLANO.DESCRICAO AS NOMESITPLANO, SPART.FLGINTERNO,'
      '       PP.SALPARTICIPACAO, PP.DTINICIOINSC'
      
        'FROM   PESSOA P, PESSOA P1, PLANPREV PL, PESSOAFISICA PF, ELEGPA' +
        'TRO EL,'
      
        '       PARTPREVPLAN PP, SITPART SPART, SITFUNC SFUNC, SITPLANOPR' +
        'EV SPLANO'
      'WHERE  PP.IDPESSOA    = :IDPESSOA'
      'AND    PP.SEQPROPOSTA = :SEQPROPOSTA'
      'AND    PP.IDPESSJUR   = :IDPESSJUR'
      'AND    PP.IDPLANOPREV = :IDPLANOPREV'
      'AND    EL.IDPESSOA    = :IDPESSOA'
      'AND    EL.IDPESSJUR   = :IDPESSJUR'
      'AND    P.IDPESSOA     = :IDPESSOA'
      '--AND    PP.FLGDESATIVADO = 0'
      'AND    P1.IDPESSOA = EL.IDPESSJUR'
      'AND    PF.IDPESSOA = EL.IDPESSOA'
      'AND    PP.IDPLANOPREV = PL.IDPLANOPREV'
      'AND    SFUNC.IDSITFUNC = EL.IDSITFUNC'
      'AND    SPART.IDSITPART = PP.IDSITPART'
      'AND    SPLANO.IDSITPLANOPREV = PP.IDSITPLANOPREV'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 395
    Top = 146
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryBeneficio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  B.IDBENEFICIO, B.TIPOBENEFICIO,'
      
        '        DECODE(BG.IDBENEFICIO, NULL, B.NOME, '#39'Grupo '#39'||G.DESCRIC' +
        'AO) AS NOME ,'
      '        B.NOME AS NOMEBENEFICIO,'
      
        '        DECODE(BG.IDGRUPOBENEF, NULL, -1, BG.IDGRUPOBENEF) AS ID' +
        'GRUPOBENEF,'
      '        B.FLGDESTBENEF, B.IDEVENTOGERADOR,'
      '        B.FLGRESGATE, B.FLGBENEFOBRIGATO, B.NUMORDEMEVENTO,'
      '        B.IDTPPAGTOBENEFIC, B.PRAZOPROVISORIO,'
      '        BP.IDREGRACALCULO,  BP.IDREGRASIMULA,'
      
        '        BP.IDREGRAPAGAMENTO, BP.IDREGRAELEGIBILI, BP.FLGACEITAOP' +
        'CAO,'
      '        BP.NOMEVALORBASE1, BP.NOMEVALORBASE2, BP.NOMEVALORBASE3,'
      
        '        BP.NUMOPCOES,BP.FLGEDITAOP1, BP.FLGEDITAOP2, BP.FLGEDITA' +
        'OP3,'
      
        '        BP.IDREGRAINICIO, BP.IDREGRAFIM, BP.IDREGRACALCINSS, BP.' +
        'IDBENEFREF,'
      
        '        BP.FLGQUITAPREVIDEN, BP.FLGQUITAEMPRESTI, BP.FLGQUITAASS' +
        'ISTEN,'
      '        BP.INDICEREAJBENEF, BP.FLGCALCTODOMES,'
      '        BP.IDREGRAPRIMPAGTO, BP.IDREGRAULTPAGTO,'
      
        '        BP.CODPORTFORMA,    BP.FLGOBRIGANPROC, B.FLGUSADTPREVISA' +
        'O,'
      
        '        BP.FLGREFERENCIA,  BP.FLGOBRIGAOP1, BP.FLGOBRIGAOP2, BP.' +
        'FLGOBRIGAOP3,'
      
        '        BP.FLGACEITAZERO, B.CODBENEFICIO, PL.FLGTIPOGRAVAINSS, B' +
        'P.IDRGPLANPREVCONT'
      
        'FROM   PLANPREV PL, BENEFICIO B, BENEFPLANPREV BP, BENEFXGRUPO B' +
        'G, GRUPOBENEF G'
      'WHERE  B.IDEVENTOGERADOR = :IDEVENTOGERADOR'
      'AND    BP.IDPLANOPREV    = :IDPLANOPREV'
      'AND    B.FLGDESTBENEF    <> '#39'B'#39
      'AND    BP.FLGREFERENCIA = 0'
      
        'AND    DECODE(BG.IDGRUPOBENEF, NULL, BP.IDBENEFICIO, BG.IDBENEFI' +
        'CIO) = B.IDBENEFICIO'
      'AND    BP.IDPLANOPREV   = BG.IDPLANOPREV(+)'
      'AND    BP.IDBENEFICIO   = BG.IDBENEFICIO(+)'
      'AND    BG.IDGRUPOBENEF  =  G.IDGRUPOBENEF(+)'
      'AND    PL.IDPLANOPREV   = BP.IDPLANOPREV'
      'ORDER BY BG.FLGPRINCIPAL DESC'
      ''
      ' ')
    ControlType.Strings = (
      'FLGBENEFOBRIGATO;CheckBox;1;0')
    ValidateWithMask = True
    Left = 309
    Top = 258
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDEVENTOGERADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object qryContribuicoes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CP.IDCONTRIBUICAO, C.NOME, HST.VALORESPERADO'
      'FROM CONTRIBPREVPARTP CP, HSTCONTRIBPREV HST, CONTRIBUICAO C'
      'WHERE CP.SEQPROPOSTA    = :PISEQPROPOSTA'
      '  AND CP.IDPESSJUR      = :PIIDPESSJUR'
      '  AND CP.IDPLANOPREV    = :PIIDPLANOPREV'
      '  AND CP.IDPESSOA       = :PIIDPESSOA'
      '  AND CP.DATAFINAL      = :PDDATAEVENTO'
      '  AND CP.SEQPROPOSTA    = HST.SEQPROPOSTA'
      '  AND CP.IDPESSJUR      = HST.IDPESSJUR'
      '  AND CP.IDPLANOPREV    = HST.IDPLANOPREV'
      '  AND CP.IDPESSOA       = HST.IDPESSOA'
      '  AND CP.IDCONTRIBUICAO = HST.IDCONTRIBUICAO'
      '  AND CP.IDCONTRIBUICAO = C.IDCONTRIBUICAO'
      '  AND HST.MESREFERENCIA = HST.MESCOBRANCA'
      '  AND HST.VALORESPERADO = HST.VALORRECEBIDO'
      '  AND HST.VALORRECEBIDO > 0'
      '  AND HST.MESCOBRANCA   = (SELECT MAX(H.MESCOBRANCA)'
      '                           FROM HSTCONTRIBPREV H'
      
        '                           WHERE H.SEQPROPOSTA   = HST.SEQPROPOS' +
        'TA'
      '                             AND H.IDPESSJUR     = HST.IDPESSJUR'
      
        '                             AND H.IDPLANOPREV   = HST.IDPLANOPR' +
        'EV'
      '                             AND H.IDPESSOA      = HST.IDPESSOA'
      '                             AND H.VALORRECEBIDO > 0'
      
        '                             AND (H.FLGINTEVENTO <> '#39'DP'#39' OR H.FL' +
        'GINTEVENTO IS NULL)'
      
        '                             AND H.MESREFERENCIA = H.MESCOBRANCA' +
        ')'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 395
    Top = 258
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PISEQPROPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIIDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIIDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PDDATAEVENTO'
        ParamType = ptUnknown
      end>
  end
  object qrySaldoReservas: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT 0 AS IDTIPORESERVA,'
      '       0.00 AS QTDCOTAS,'
      '       0.00 AS VALORCOTA,'
      '       0.00 AS SALDORESERVA'
      'FROM DUAL'
      ''
      ' '
      ' '
      ' ')
    UpdateObject = updSaldoReservas
    ValidateWithMask = True
    Left = 496
    Top = 146
  end
  object dsSaldoReservas: TwwDataSource
    DataSet = qrySaldoReservas
    Left = 496
    Top = 201
  end
  object updSaldoReservas: TUpdateSQL
    ModifySQL.Strings = (
      'update DUAL'
      'set'
      '  QTDCOTAS = :QTDCOTAS,'
      '  VALORCOTA = :VALORCOTA,'
      '  SALDORESERVA = :SALDORESERVA'
      'where'
      '  IDTIPORESERVA = :OLD_IDTIPORESERVA')
    InsertSQL.Strings = (
      'insert into DUAL'
      '  (QTDCOTAS, VALORCOTA, SALDORESERVA)'
      'values'
      '  (:QTDCOTAS, :VALORCOTA, :SALDORESERVA)')
    DeleteSQL.Strings = (
      'delete from DUAL'
      'where'
      '  IDTIPORESERVA = :OLD_IDTIPORESERVA')
    Left = 496
    Top = 258
  end
  object qryExe: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 309
    Top = 202
  end
end
