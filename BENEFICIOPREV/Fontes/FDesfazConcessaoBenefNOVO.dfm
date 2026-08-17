inherited frmDesfazConcessaoBeneficioNOVO: TfrmDesfazConcessaoBeneficioNOVO
  Left = 304
  Top = 173
  HelpContext = 160084
  Caption = 'Desfazer Operações de Benefícios'
  ClientHeight = 400
  ClientWidth = 724
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 724
    Height = 361
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 722
      Height = 32
      Align = alTop
      BevelOuter = bvLowered
      Caption = 'Desfazer Operações de Benefícios'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -24
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object pnlTitular: TPanel
      Left = 1
      Top = 33
      Width = 722
      Height = 123
      Align = alTop
      BevelOuter = bvLowered
      TabOrder = 1
      object Label13: TLabel
        Left = 311
        Top = 4
        Width = 55
        Height = 13
        Caption = 'Matrícula'
      end
      object Label3: TLabel
        Left = 7
        Top = 43
        Width = 118
        Height = 13
        Caption = 'Plano Previdenciário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 311
        Top = 43
        Width = 80
        Height = 13
        Caption = 'Patrocinadora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 7
        Top = 4
        Width = 37
        Height = 13
        Caption = 'Titular'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 465
        Top = 4
        Width = 77
        Height = 13
        Caption = 'Processo No.'
      end
      object Label6: TLabel
        Left = 7
        Top = 79
        Width = 150
        Height = 13
        Caption = 'Última Operação Efetuada'
      end
      object Label17: TLabel
        Left = 311
        Top = 79
        Width = 73
        Height = 13
        Caption = 'Efetuada Em'
      end
      object Label18: TLabel
        Left = 412
        Top = 79
        Width = 44
        Height = 13
        Caption = 'Usuário'
      end
      object Label19: TLabel
        Left = 513
        Top = 79
        Width = 26
        Height = 13
        Caption = 'Lote'
      end
      object pnlBotaoProcurar: TPanel
        Left = 620
        Top = 1
        Width = 101
        Height = 121
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 4
        object bbtnProcurar: TBitBtn
          Left = 8
          Top = 19
          Width = 90
          Height = 37
          Hint = 'Procurar participante'
          Caption = '&Procurar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnClick = bbtnProcurarClick
          Glyph.Data = {
            4E010000424D4E01000000000000760000002800000012000000120000000100
            040000000000D800000000000000000000001000000010000000000000000000
            BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
            DDDDDD000000DDDDDDDDDDDDDDDDDD000000D000000000000DD00D000000D0FF
            FFFFFFFF0D000D000000D0FFFFFFF0000800DD000000D0FFFFFF0877808DDD00
            0000D0FFFFF0877E880DDD000000D0FFFFF07777870DDD000000D0FFFFF07E77
            870DDD000000D0FFFFF08EE7880DDD000000D0FFFFFF087780DDDD000000D0FF
            FFFFF0000DDDDD000000D0FFFFFFFFFF0DDDDD000000D0FFFFFFF0000DDDDD00
            0000D0FFFFFFF070DDDDDD000000D0FFFFFFF00DDDDDDD000000DD00000000DD
            DDDDDD000000DDDDDDDDDDDDDDDDDD000000}
        end
      end
      object DBEdit1: TDBEdit
        Left = 7
        Top = 18
        Width = 300
        Height = 21
        Color = clMenu
        DataField = 'NOMETITULAR'
        DataSource = ds
        ReadOnly = True
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 7
        Top = 57
        Width = 300
        Height = 21
        Color = clMenu
        DataField = 'NOMEPLANO'
        DataSource = ds
        ReadOnly = True
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 311
        Top = 18
        Width = 146
        Height = 21
        Color = clMenu
        DataField = 'MATRICULA'
        DataSource = ds
        ReadOnly = True
        TabOrder = 2
      end
      object DBEdit4: TDBEdit
        Left = 311
        Top = 57
        Width = 300
        Height = 21
        Color = clMenu
        DataField = 'NOMEPATRO'
        DataSource = ds
        ReadOnly = True
        TabOrder = 3
      end
      object DBEdit5: TDBEdit
        Left = 465
        Top = 18
        Width = 146
        Height = 21
        Color = clMenu
        DataField = 'NUMEROPROCESSO'
        DataSource = dsMovimentos
        ReadOnly = True
        TabOrder = 5
      end
      object edDescUltOperacao: TEdit
        Left = 7
        Top = 93
        Width = 300
        Height = 21
        Color = clMenu
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
      end
      object edDataUltOperacao: TEdit
        Left = 311
        Top = 93
        Width = 98
        Height = 21
        Color = clMenu
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 7
      end
      object edUsuarioUltOperacao: TEdit
        Left = 412
        Top = 93
        Width = 98
        Height = 21
        Color = clMenu
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 8
      end
      object edLoteUltOperacao: TEdit
        Left = 513
        Top = 93
        Width = 98
        Height = 21
        Color = clMenu
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 9
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 156
      Width = 722
      Height = 32
      Align = alTop
      BevelOuter = bvLowered
      Caption = 'Operações / Beneficiários a serem desfeitos ...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -24
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object dbgrdMovimentos: TwwDBGrid
      Left = 1
      Top = 188
      Width = 722
      Height = 172
      Selected.Strings = (
        'DESCOPERACAO'#9'20'#9'Operação'
        'NOMEBENEFICIO'#9'30'#9'Benefício'
        'NOMEBENEFICIARIO'#9'30'#9'Beneficiário'
        'DATAMOV'#9'14'#9'Data ~Operação'
        'DATAINICIO'#9'14'#9'Voltar Data ~Início De ...'
        'DATAINICIOANT'#9'14'#9'~Para'
        'DATAFINAL'#9'14'#9'Voltar Data ~Final De ...'
        'DATAFINALANT'#9'14'#9'~Para'#9'F'
        'VALORATUAL'#9'10'#9'Voltar Valor ~Atual De ...'
        'VALORATUALANT'#9'10'#9'~Para')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = dsMovimentos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      KeyOptions = []
      ParentFont = False
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
    Top = 361
    Width = 724
    inherited tb97Fundo: TToolbar97
      Left = 552
      DockPos = 663
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 383
      DockPos = 494
      inherited bbtnConfirmar: TBitBtn
        Caption = '&Desfazer'
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 3
    Top = 414
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 691
    Top = 165
  end
  object dsBenefBeneficiario: TwwDataSource
    DataSet = qryBenefBeneficiario
    Left = 306
    Top = 295
  end
  object qryBenefBeneficiario: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT 1 AS FLGPROCESSA,  BF.IDPESSOA,         BF.IDTITULAR,    ' +
        '    BF.IDPLANOPREV, BF.IDPLANOORIGEM,'
      
        '       BF.SEQPROPOSTA,    BF.IDPESSJUR,        BF.IDBENEFICIO,  ' +
        '    BF.NUMEROPROCESSO,'
      
        '       BF.NUMPROCINSS,    BF.VALORATUAL,       BF.VALORCALCULADO' +
        ',   BF.VALORCOTAS,'
      
        '       BF.VALORTOTAL,     BF.VLRCALCINSS,      BF.VLRINFINSS,   ' +
        '    BF.DATAFINAL,'
      
        '       BF.DATAINICIO,     BF.DATAINICIOFUND,   BF.DATAINICIOINSS' +
        ',   BF.DATAREQUERIMENTO,'
      '       BF.IDSITBENEFICIO, BF.IDTPPAGTOBENEFIC,'
      
        '       BF.ULTMESREAJUSTE, BPP.VALORBASE1,      BPP.VALORBASE2,  ' +
        '    BPP.VALORBASE3,'
      
        '       B.NOME,            BP.FLGREFERENCIA,    BP.IDREGRACALCULO' +
        ',   BP.FLGCALCTODOMES,'
      '       BP.IDREGRAULTPAGTO, BP.FLGPAGAINSS,'
      '       BP.IDBENEFREF,     BP.IDREGRAPRIMPAGTO,'
      
        '       BP.FLGOBRIGANPROC, BP.IDREGRABENEFICIA, BP.IDRGVALORTOTAL' +
        ',   B.FLGBENEFTEMP,'
      
        '       BF.DATAFINALPREVISTA, P.NOME, PR.IDEVENTOGERADOR  , BF.FL' +
        'GDATAPREVISTA  ,'
      '       BF.ULTVALORATUALREAJ,  BF.DATACONCESSAO,'
      
        '       PT.IDRUBSALAUXDOENCA, PP.FLGSALVIRTBENEF, BTIT.IDNUCLEOFA' +
        'MILIAR,'
      
        '       DECODE(NF.IDRESPNUCLEO, NULL, BF.IDPESSOA, NF.IDRESPNUCLE' +
        'O) AS IDRESPCONTRIBUICAO,'
      '       --BRUNO AZEVEDO SOL 189714 KINTANA 1791085'
      '   bf.Fontepagadora,'
      '       --BRUNO AZEVEDO SOL 189714 KINTANA 1791085'
      '   BF.IDPLANPREVCONTAB'
      'FROM   PESSOA P, PATRO PT, PROCESSOBENEF PR, PARTPREVPLAN PP,'
      
        '       BENEFBFCIARIO BF, BENEFPLANOPART BPP, BENEFICIO B, BENEFP' +
        'LANPREV BP,'
      '       BFCIARIOTITPLAN BTIT, NUCLEOFAMILIAR NF'
      
        'WHERE  ((NVL(B.FLGRESGATE,0) = 0 AND BF.NUMEROPROCESSO = :NUMERO' +
        'PROCESSO) OR   /*20491*/'
      
        '        (NVL(B.FLGRESGATE,0) = 1 AND NVL(PR.NUMPROCESSOPAI,BF.NU' +
        'MEROPROCESSO) = :NUMEROPROCESSO))     /*20491 - 131183*/'
      'AND    (BF.IDPESSOA       = P.IDPESSOA)'
      'AND    (BF.IDBENEFICIO    = B.IDBENEFICIO)'
      'AND    (BF.IDPLANOPREV    = BP.IDPLANOPREV)'
      'AND    (BF.IDBENEFICIO    = BP.IDBENEFICIO)'
      'AND    (PR.NUMEROPROCESSO = BF.NUMEROPROCESSO)'
      'AND    (BPP.IDPESSOA(+)   = BF.IDTITULAR)'
      'AND    (BPP.IDPESSJUR(+)  = BF.IDPESSJUR)'
      'AND    (BPP.IDPLANOPREV(+) = BF.IDPLANOPREV)'
      'AND    (BPP.IDBENEFICIO(+) = BF.IDBENEFICIO)'
      'AND    (PT.IDPESSOA        = BF.IDPESSJUR)'
      'AND    (PP.IDPESSJUR       = BF.IDPESSJUR)'
      'AND    (PP.IDPLANOPREV     = BF.IDPLANOORIGEM)'
      'AND    (PP.IDPESSOA        = BF.IDTITULAR)'
      'AND    (PP.SEQPROPOSTA     = BF.SEQPROPOSTA)'
      'AND    (BTIT.IDPESSJUR      = BF.IDPESSJUR)'
      'AND    (BTIT.IDTITULAR      = BF.IDTITULAR)'
      
        '/*AND    (BTIT.IDPLANOPREV    = BF.IDPLANOORIGEM)    --SIG99863 ' +
        '*/'
      
        'AND    (BTIT.IDPLANOORIGEM    = BF.IDPLANOORIGEM)    /*SIG99863 ' +
        '*/ '
      'AND    (BTIT.IDPESSOA       = BF.IDPESSOA)'
      'AND    (BTIT.SEQPROPOSTA    = BF.SEQPROPOSTA)'
      'AND    (BTIT.IDPLANOPREV    = BF.IDPLANOPREV)'
      'AND    (BTIT.IDBENEFICIO    = BF.IDBENEFICIO)'
      'AND    (NF.IDNUCLEOFAMILIAR(+) = BTIT.IDNUCLEOFAMILIAR)'
      'AND    (NF.IDTITULAR(+)        = BTIT.IDTITULAR)'
      ''
      'ORDER BY BP.FLGREFERENCIA'
      ''
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
    Left = 298
    Top = 195
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMEROPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'NUMEROPROCESSO'
        ParamType = ptUnknown
      end>
  end
  object qryLogOcorrInicioOld: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT P.NOME AS NOMEBENEFICIARIO, B.NOME AS NOMEBENEFICIO,'
      
        '       M.IDMOVBENEF, M.IDPLANOPREV, M.IDTITULAR, M.NUMEROPROCESS' +
        'O, M.SEQPROPOSTA,  M.DATAMOV,'
      
        '       M.VALORTOTAL, M.DATAINICIO,  M.IDPESSJUR, M.IDBENEFICIO, ' +
        '   M.IDPESSOA,     M.TIPOMOV,'
      
        '       M.VALORATUAL, M.VALORCOTAS,  M.DATAFINAL,M.DATAINICIOANT,' +
        '   M.DATAFINALANT, M.VALORATUALANT,'
      
        '       M.IDSITANTERIOR, M.TRGDTINCLUSAO, M.MOTRETENC, M.IDLOTEMO' +
        'V,'
      '       DECODE(M.TIPOMOV,'
      '                       0, '#39'Renovação de Benefício'#39','
      '                       1 , '#39'Reabertura de Benefício'#39','
      '                       2 , '#39'Prorrogação de Benefício'#39','
      '                       3 , '#39'Retenção  de Benefício'#39','
      '                       4 , '#39'Encerramento de Benefício'#39','
      '                       5 , '#39'Desdobramento de Benefício'#39','
      '                       6 , '#39'Reajuste Judicial de Benefício'#39','
      '                       7 , '#39'Concessão de Benefício'#39','
      '                       8 , '#39'Recálculo de Benefício Provisório'#39','
      
        '                       9 , '#39'Registro de Falecimento de Beneficiá' +
        'rio'#39','
      
        '                      11 , '#39'Registro Liberação de Benefício Prov' +
        'isório para Pagmto. Integral'#39','
      '                      12 , '#39'Liberação de Benefício Retido'#39','
      '                      13 , '#39'Revisão de Benefícios'#39','
      
        '                      14 , '#39'Alteracao de Tipo de Beneficio'#39' ) DE' +
        'SCOPERACAO'
      'FROM   PESSOA P, MOVBENEF M, BENEFICIO B'
      'WHERE  M.IDMOVBENEF = (SELECT MAX(IDMOVBENEF)'
      '                       FROM   MOVBENEF'
      '                       WHERE  IDPESSJUR       = :IDPESSJUR'
      '                       AND    IDPLANOPREV     = :IDPLANOPREV'
      '                       AND    IDTITULAR       = :IDTITULAR'
      '                       AND    SEQPROPOSTA     = :SEQPROPOSTA'
      '                       AND    NUMEROPROCESSO  = :NUMEROPROCESSO'
      '                       AND    TIPOMOV         <> 10'
      '                       AND    IDDESFAZER IS NULL )'
      'AND P.IDPESSOA = M.IDPESSOA'
      'AND B.IDBENEFICIO = M.IDBENEFICIO'
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 416
    Top = 311
    ParamData = <
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
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'NUMEROPROCESSO'
        ParamType = ptUnknown
      end>
  end
  object qryLogOcorrencia: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      
        'SELECT IDMOVBENEF, IDPLANOPREV, IDTITULAR, NUMEROPROCESSO, SEQPR' +
        'OPOSTA,  DATAMOV,'
      
        '       VALORTOTAL, DATAINICIO,  IDPESSJUR, IDBENEFICIO,    IDPES' +
        'SOA,     TIPOMOV,'
      
        '       VALORATUAL, VALORCOTAS,  DATAFINAL, DATAINICIOANT,   DATA' +
        'FINALANT, VALORATUALANT,'
      '       VALORTOTALANT,'
      
        '       IDSITANTERIOR,  FLGDATAPREVANT, IDLOTEMOV, IDCALCULO, TRG' +
        'DTINCLUSAO, TIPOMOV'
      'FROM   MOVBENEF'
      'WHERE  IDMOVBENEF = (SELECT MAX(IDMOVBENEF)'
      '                     FROM   MOVBENEF'
      '                     WHERE  IDPESSJUR       = :IDPESSJUR'
      '                     AND    IDPLANOPREV     = :IDPLANOPREV'
      '                     AND    IDTITULAR       = :IDTITULAR'
      '                     AND    SEQPROPOSTA     = :SEQPROPOSTA'
      '                     AND    IDPESSOA        = :IDPESSOA'
      '                     AND    IDBENEFICIO     = :IDBENEFICIO'
      '                     AND    NUMEROPROCESSO  = :NUMEROPROCESSO'
      '                     AND    IDPLANOORIGEM   = :IDPLANOORIGEM'
      '                     AND    TIPOMOV         <> 10'
      '                     AND    IDDESFAZER IS NULL)'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 414
    Top = 199
    ParamData = <
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
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDBENEFICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'NUMEROPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOORIGEM'
        ParamType = ptUnknown
      end>
  end
  object qryAux2: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 691
    Top = 114
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Pessoa a Reter/Encerrar Benefícios'
    Colunas.Strings = (
      'EL.MATRICULA'
      'DT.MATRICULA'
      'PES.NOME'
      'PD.NOME'
      'P.NUMEROPROCESSO'
      'BF.NOME'
      'P.DTEVENTO'
      'PP.INSCRICAONUMERO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'N'
      'C'
      'D'
      'N')
    Descricao.Strings = (
      'Matrícula do Titular'
      'Matrícula Beneficiário'
      'Nome do Titular'
      'Nome Beneficiário'
      'Nº do Processo'
      'Nome do Benefício'
      'Data do Evento'
      'Nº Inscrição Titular')
    SensivelACaixa.Strings = (
      'S'
      'S'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PROCESSOBENEF P'
      'BENEFBFCIARIO B'
      'BENEFPLANPREV BPL'
      'BENEFICIO BF'
      'PESSOA PES'
      'ELEGPATRO EL'
      'PARTPREVPLAN PP'
      'DEPENTIT DT'
      'PESSOA PD')
    CamposChave.Strings = (
      'P.NUMEROPROCESSO'
      'B.IDTITULAR'
      'B.SEQPROPOSTA'
      'B.IDPESSJUR'
      'B.IDPLANOPREV'
      'EL.MATRICULA'
      'B.IDPLANOORIGEM'
      'B.IDPESSOA'
      'P.NUMPROCESSOPAI'
      'BF.FLGRESGATE')
    Filtro.Strings = (
      'P.NUMEROPROCESSO = B.NUMEROPROCESSO'
      'B.IDTITULAR = PES.IDPESSOA'
      'BF.IDBENEFICIO = B.IDBENEFICIO'
      'BPL.IDBENEFICIO = B.IDBENEFICIO'
      'BPL.IDPLANOPREV = B.IDPLANOPREV'
      
        '((BPL.FLGREFERENCIA = 0) OR ((BPL.FLGREFERENCIA = 1) AND (BPL.FL' +
        'GPAGAINSS = 1)))'
      'EL.IDPESSOA = B.IDTITULAR'
      'EL.IDPESSJUR = B.IDPESSJUR'
      'PP.IDPESSJUR = EL.IDPESSJUR'
      'PP.IDPESSOA = EL.IDPESSOA'
      
        '(( PP.FLGDESATIVADO = 0 ) OR (BF.FLGRESGATE = 1 AND BF.TIPOBENEF' +
        'ICIO = 6))'
      'DT.IDTITULAR = B.IDTITULAR'
      'DT.IDPESSOA  = B.IDPESSOA'
      'DT.IDPESSOA = PD.IDPESSOA'
      'B.IDSITBENEFICIO IN (1,2,3,5)  ')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '15'
      '15'
      '30'
      '30'
      '15'
      '20'
      '10'
      '15')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
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
    Left = 691
    Top = 5
  end
  object qry: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PTIT.NOME    AS NOMETITULAR,'
      '       PPATRO.NOME  AS NOMEPATRO,'
      '       PL.NOME      AS NOMEPLANO,'
      '       PP.FLGSALVIRTBENEF,'
      '       EL.MATRICULA,'
      '       PP.INSCRICAONUMERO'
      
        'FROM   PESSOA PTIT, PESSOA PPATRO,  ELEGPATRO EL, PARTPREVPLAN P' +
        'P, PLANPREV PL'
      'WHERE  PP.IDPESSJUR   = :IDPESSJUR'
      'AND    PP.IDPLANOPREV = :IDPLANOPREV'
      'AND    PP.IDPESSOA    = :IDPESSOA'
      'AND    PP.SEQPROPOSTA = 1'
      'AND    EL.IDPESSJUR   = PP.IDPESSJUR'
      'AND    EL.IDPESSOA    = PP.IDPESSOA'
      'AND    PL.IDPLANOPREV = PP.IDPLANOPREV'
      'AND    PTIT.IDPESSOA  = PP.IDPESSOA'
      'AND    PPATRO.IDPESSOA= PP.IDPESSJUR')
    ControlType.Strings = (
      'PROCESSAR;CheckBox;1;0')
    ValidateWithMask = True
    Left = 570
    Top = 3
    ParamData = <
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
      end>
  end
  object ds: TwwDataSource
    DataSet = qry
    Left = 609
    Top = 1
  end
  object dsLogOcorrInicio: TwwDataSource
    DataSet = qryLogOcorrInicioOld
    Left = 414
    Top = 255
  end
  object qryMovimentos: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT'
      '  P.NOME AS NOMEBENEFICIARIO, B.NOME AS NOMEBENEFICIO,'
      ''
      
        '  M.IDMOVBENEF,    M.IDPLANOPREV,   M.IDTITULAR, M.NUMEROPROCESS' +
        'O, M.SEQPROPOSTA,  M.DATAMOV,'
      
        '  M.VALORTOTAL,    M.DATAINICIO,    M.IDPESSJUR, M.IDBENEFICIO, ' +
        '   M.IDPESSOA,     M.TIPOMOV,'
      
        '  M.VALORATUAL,    M.VALORCOTAS,    M.DATAFINAL, M.DATAINICIOANT' +
        ',  M.DATAFINALANT, M.VALORATUALANT,'
      
        '  M.IDSITANTERIOR, M.TRGDTINCLUSAO, M.MOTRETENC, M.IDLOTEMOV,   ' +
        '   M.IDCALCULO, '
      '  DECODE(M.TIPOMOV, 0, '#39'Renovação de Benefício'#39','
      '                    1 , '#39'Reabertura de Benefício'#39','
      '                    2 , '#39'Prorrogação de Benefício'#39','
      '                    3 , '#39'Retenção  de Benefício'#39','
      '                    4 , '#39'Encerramento de Benefício'#39','
      '                    5 , '#39'Desdobramento de Benefício'#39','
      '                    6 , '#39'Reajuste Judicial de Benefício'#39','
      '                    7 , '#39'Concessão de Benefício'#39','
      '                    8 , '#39'Recálculo de Benefício Provisório'#39','
      
        '                    9 , '#39'Registro de Falecimento de Beneficiário' +
        #39','
      
        '                   11 , '#39'Registro Liberação de Benefício Provisó' +
        'rio para Pagmto. Integral'#39','
      '                   12 , '#39'Liberação de Benefício Retido'#39','
      '                   13 , '#39'Revisão de Benefícios'#39','
      '                   14 , '#39'Alteracao de Tipo de Beneficio'#39','
      
        '                   16, '#39'Reversão de Cotas'#39',  /*Robson.andrade - ' +
        'SOL 253577-17489 / PPM 962708*/'
      
        '                   17, '#39'Alteração Manual'#39'  ) DESCOPERACAO /* Mar' +
        'cio Sanches Spinosa SOL 249832 PPM 699434 */'
      'FROM'
      '  PESSOA P, MOVBENEF M, BENEFICIO B,'
      '  PROCESSOBENEF PB    /*20491*/'
      'WHERE'
      '     NVL(M.IDLOTEMOV,0) = :IDLOTEMOV'
      
        ' AND ((NVL(B.FLGRESGATE,0) = 0 AND M.NUMEROPROCESSO = :NUMEROPRO' +
        'CESSO ) OR    /*20491*/'
      
        '      (NVL(B.FLGRESGATE,0) = 1 AND NVL(PB.NUMPROCESSOPAI,PB.NUME' +
        'ROPROCESSO) = :NUMEROPROCESSO ))     /*20491 - 131183*/'
      ' AND M.TIPOMOV     <> 10'
      ' AND M.IDDESFAZER  IS NULL'
      ' AND P.IDPESSOA    = M.IDPESSOA'
      ' AND B.IDBENEFICIO = M.IDBENEFICIO'
      ' AND M.NUMEROPROCESSO = PB.NUMEROPROCESSO    /*20491*/'
      'ORDER BY'
      '  M.DATAMOV DESC, M.IDMOVBENEF, B.NOME, P.NOME'
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 673
    Top = 273
    ParamData = <
      item
        DataType = ftString
        Name = 'IDLOTEMOV'
        ParamType = ptUnknown
        Value = '9872'
      end
      item
        DataType = ftInteger
        Name = 'NUMEROPROCESSO'
        ParamType = ptUnknown
        Value = '78694'
      end
      item
        DataType = ftInteger
        Name = 'NUMEROPROCESSO'
        ParamType = ptUnknown
      end>
  end
  object dsMovimentos: TwwDataSource
    DataSet = qryMovimentos
    Left = 678
    Top = 229
  end
  object qryLogOcorrenciaAux: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      
        'SELECT IDMOVBENEF, IDPLANOPREV, IDTITULAR, NUMEROPROCESSO, SEQPR' +
        'OPOSTA,  DATAMOV,'
      
        '       VALORTOTAL, DATAINICIO,  IDPESSJUR, IDBENEFICIO,    IDPES' +
        'SOA,     TIPOMOV,'
      
        '       VALORATUAL, VALORCOTAS,  DATAFINAL, DATAINICIOANT,   DATA' +
        'FINALANT, VALORATUALANT,'
      
        '       IDSITANTERIOR, FLGDATAPREVANT, IDLOTEMOV, IDCALCULO, TRGD' +
        'TINCLUSAO, VALORTOTALANT, '
      '      VALORSRBANT, TIPOMOV, IDSITANTERIOR '
      'FROM   MOVBENEF'
      'WHERE  IDMOVBENEF = (SELECT MAX(IDMOVBENEF)'
      '                     FROM   MOVBENEF'
      '                     WHERE  IDPESSJUR       = :IDPESSJUR'
      '                     AND    IDPLANOPREV     = :IDPLANOPREV'
      '                     AND    IDTITULAR       = :IDTITULAR'
      '                     AND    SEQPROPOSTA     = :SEQPROPOSTA'
      '                     AND    IDPESSOA        = :IDPESSOA'
      '                     AND    IDBENEFICIO     = :IDBENEFICIO'
      '                     AND    NUMEROPROCESSO  = :NUMEROPROCESSO'
      '                     AND    IDPLANOORIGEM   = :IDPLANOORIGEM'
      '                     AND    TIPOMOV         <> 10'
      '                     AND    IDDESFAZER IS NULL)'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 294
    Top = 239
    ParamData = <
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
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDBENEFICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'NUMEROPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOORIGEM'
        ParamType = ptUnknown
      end>
  end
end
