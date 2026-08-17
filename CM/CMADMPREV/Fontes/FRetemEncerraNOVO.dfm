inherited frmRetemEncerraNOVO: TfrmRetemEncerraNOVO
  Left = 325
  Top = 127
  HelpContext = 160079
  Caption = 'Retenção e Encerramento de Benefícios'
  ClientHeight = 394
  ClientWidth = 768
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 768
    Height = 355
    object pnlTitular: TPanel
      Left = 1
      Top = 34
      Width = 766
      Height = 93
      Align = alTop
      TabOrder = 1
      object Label13: TLabel
        Left = 496
        Top = 10
        Width = 55
        Height = 13
        Caption = 'Matrícula'
      end
      object Label3: TLabel
        Left = 16
        Top = 50
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
        Left = 320
        Top = 50
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
        Left = 16
        Top = 10
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
      object pnlBotaoProcurar: TPanel
        Left = 621
        Top = 1
        Width = 144
        Height = 91
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 4
        object bbtnProcurar: TBitBtn
          Left = 32
          Top = 19
          Width = 85
          Height = 30
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
        Left = 16
        Top = 24
        Width = 465
        Height = 21
        Color = clMenu
        DataField = 'NOMETITULAR'
        DataSource = ds
        ReadOnly = True
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 16
        Top = 64
        Width = 289
        Height = 21
        Color = clMenu
        DataField = 'NOMEPLANO'
        DataSource = ds
        ReadOnly = True
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 496
        Top = 24
        Width = 121
        Height = 21
        Color = clMenu
        DataField = 'MATRICULA'
        DataSource = ds
        ReadOnly = True
        TabOrder = 2
      end
      object DBEdit4: TDBEdit
        Left = 320
        Top = 64
        Width = 297
        Height = 21
        Color = clMenu
        DataField = 'NOMEPATRO'
        DataSource = ds
        ReadOnly = True
        TabOrder = 3
      end
    end
    object pnlSubTitulo: TPanel
      Left = 1
      Top = 127
      Width = 766
      Height = 41
      Align = alTop
      TabOrder = 2
      object lblTitulo: TLabel
        Left = 7
        Top = 6
        Width = 151
        Height = 13
        Caption = 'Benefícios do Beneficiário'
      end
      object lblBeneficiario: TLabel
        Left = 92
        Top = 24
        Width = 33
        Height = 13
        Caption = 'XXXX'
      end
      object pnlBotoesRetemEncerra: TPanel
        Left = 453
        Top = 1
        Width = 312
        Height = 39
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 0
        object sbtnEncerramento: TSpeedButton
          Left = 120
          Top = 6
          Width = 81
          Height = 27
          Hint = 'Clique aqui para Encerrar o benefício ...'
          Caption = '&Encerrar'
          Enabled = False
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333FFFFF3333333333000003333333333F777773FF333333008877700
            33333337733FFF773F33330887000777033333733F777FFF73F330880F9F9F07
            703337F37733377FF7F33080F00000F07033373733777337F73F087F0091100F
            77037F3737333737FF7F08090919110907037F737F3333737F7F0F0F0999910F
            07037F737F3333737F7F0F090F99190908037F737FF33373737F0F7F00FF900F
            780373F737FFF737F3733080F00000F0803337F73377733737F330F80F9F9F08
            8033373F773337733733330F8700078803333373FF77733F733333300FFF8800
            3333333773FFFF77333333333000003333333333377777333333}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = sbtnEncerramentoClick
        end
        object sbtnRetencao: TSpeedButton
          Left = 24
          Top = 6
          Width = 81
          Height = 27
          Hint = 'Clique aqui para Reter o benefício ...'
          Caption = '&Reter'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
            5555555555FFFFF5555555555000005555555555F777775FF555555008877700
            55555557755FFF775F55550887000777055555755F777FFF75F550880FBFBF07
            705557F57755577FF7F55080F00000F07055575755777557F75F087F00B3300F
            77057F5757555757FF7F080B0B3B330B07057F757F5555757F7F0F0F0BBBB30F
            07057F757F5555757F7F0F0B0FBB3B0B08057F757FF55575757F0F7F00FFB00F
            780575F757FFF757F5755080F00000F0805557F75577755757F550F80FBFBF08
            8055575F775557755755550F8700078805555575FF77755F755555500FFF8800
            5555555775FFFF77555555555000005555555555577777555555}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = sbtnRetencaoClick
        end
        object sbtnAvanco: TSpeedButton
          Left = 215
          Top = 6
          Width = 81
          Height = 27
          Hint = 'Clique aqui para Encerrar o benefício ...'
          Caption = '&Avançar'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333FFFFF3333333333000003333333333F777773FF333333008877700
            33333337733FFF773F33330887000777033333733F777FFF73F330880F9F9F07
            703337F37733377FF7F33080F00000F07033373733777337F73F087F0091100F
            77037F3737333737FF7F08090919110907037F737F3333737F7F0F0F0999910F
            07037F737F3333737F7F0F090F99190908037F737FF33373737F0F7F00FF900F
            780373F737FFF737F3733080F00000F0803337F73377733737F330F80F9F9F08
            8033373F773337733733330F8700078803333373FF77733F733333300FFF8800
            3333333773FFFF77333333333000003333333333377777333333}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = sbtnAvancoClick
        end
      end
    end
    object dbgrdBeneficiarios: TwwDBGrid
      Left = 1
      Top = 168
      Width = 766
      Height = 186
      Selected.Strings = (
        'NOME'#9'28'#9'Beneficiário'
        'NOMEBENEFICIO'#9'28'#9'Benefício'
        'DATAINICIOFUND'#9'12'#9'DIB'
        'VALORATUAL'#9'10'#9'Valor ~Atual'
        'SITUACAOATUAL'#9'10'#9'Situação~Atual'
        'ULTMES'#9'7'#9'Último ~Pgmto Em'
        'NUMEROPROCESSO'#9'10'#9'Nº ~Processo'
        'PROCESSAR'#9'10'#9'Processar')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 7
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      KeyOptions = []
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      ParentFont = False
      TabOrder = 0
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 2
      TitleButtons = False
      OnDblClick = dbgrdBeneficiariosDblClick
      IndicatorColor = icBlack
      object dbgrdBeneficiariosIButton: TwwIButton
        Left = 0
        Top = 0
        Width = 13
        Height = 22
        AllowAllUp = True
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 766
      Height = 33
      Align = alTop
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -24
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      object fcLabel1: TfcLabel
        Left = 16
        Top = 8
        Width = 406
        Height = 24
        Caption = 'Retenção e Encerramento de Benefícios'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TextOptions.Alignment = taLeftJustify
        TextOptions.Style = fclsRaised
        TextOptions.VAlignment = vaTop
      end
    end
  end
  inherited Dock971: TDock97
    Top = 355
    Width = 768
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 24
    Top = 430
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'EL.MATRICULA'
      'DT.MATRICULA'
      'PES.NOME'
      'PD.NOME'
      'P.NUMEROPROCESSO'
      'BF.NOME'
      'P.DTEVENTO'
      'PP.INSCRICAONUMERO'
      'PD.NUMDOCUMENTO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'N'
      'C'
      'D'
      'N'
      'C')
    Descricao.Strings = (
      'Matrícula do Titular'
      'Matrícula Beneficiário'
      'Nome do Titular'
      'Nome Beneficiário'
      'Nº do Processo'
      'Nome do Benefício'
      'Data do Evento'
      'Nº Inscrição Titular'
      'CPF')
    SensivelACaixa.Strings = (
      'S'
      'S'
      'N'
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
      'B.IDPESSOA')
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
      'P.IDSITPROCESSO IN (1,2,9)'
      'PP.IDPESSJUR = EL.IDPESSJUR'
      'PP.IDPESSOA = EL.IDPESSOA'
      '((PP.FLGDESATIVADO = 0) OR (B.IDSITBENEFICIO IN (1,2)))'
      'DT.IDTITULAR = B.IDTITULAR'
      'DT.IDPESSOA  = B.IDPESSOA'
      'DT.IDPESSOA = PD.IDPESSOA'
      'B.FLGPROVISORIO = 1'
      'B.IDSITBENEFICIO <> 3'
      'PP.IDPLANOPREV = B.IDPLANOORIGEM')
    Mascaras.Strings = (
      ''
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
      '15'
      '10')
    OperComparador.Strings = (
      '1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    ApenasLetraENum.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    ComparaMaiuscula.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 448
  end
  object ds: TwwDataSource
    DataSet = qry
    Left = 96
    Top = 415
  end
  object qry: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT 0   AS PROCESSAR,'
      '       PTIT.NOME    AS NOMETITULAR,'
      '       PPATRO.NOME  AS NOMEPATRO,'
      '       PL.NOME      AS NOMEPLANO,'
      '       PRESP.NOME   AS NOMERESPONSAVEL,'
      '       DT.MATRICULA AS MATRICULADEP,'
      '       S.DESCRICAO  AS SITUACAOATUAL,'
      '       B.NOME       AS NOMEBENEFICIO,'
      '       EG.NOME      AS NOMEEVENTO,'
      '       BF.IDBENEFREFEREN AS IDBENEFREF,'
      '       PROC.IDEVENTOGERADOR,'
      '       PROC.DTEVENTO,'
      '       EG.FLGINTERNO AS FLGINTEVENTO,'
      '       EG.FLGINTERNO,'
      '       BF.fontepagadora,'
      '       BP.FLGREFERENCIA, NVL(BP.FLGPAGAINSS,0) AS FLGPAGAINSS,'
      '       PP.FLGSALVIRTBENEF,'
      
        '       EL.MATRICULA,           PT.IDRUBSALAUXDOENCA, PP.INSCRICA' +
        'ONUMERO,'
      
        '       BF.NUMEROPROCESSO,      BF.IDPESSJUR,       BF.IDPLANOPRE' +
        'V,    BF.IDTITULAR,'
      
        '       BF.IDPESSOA,            BF.SEQPROPOSTA,     BF.IDBENEFICI' +
        'O,    BF.IDPLANOORIGEM,'
      
        '       BF.FLGPROVISORIO,       BF.DATAINICIO,      BF.DATAINICIO' +
        'FUND, BF.DATAFINAL,'
      
        '       BF.DATAFINALPREVISTA,   BF.FLGDATAPREVISTA, BF.ULTMESPREP' +
        'ARO,  BF.VALORATUAL,'
      
        '       BF.VALORTOTAL,          BF.VALORCOTAS,      BF.IDSITBENEF' +
        'ICIO,'
      
        '       PF.DATANASC,            PF.SEXO,            BT.PRIORIDADE' +
        ',     BT.PERCENTUAL,'
      
        '       DT.NUMSEQUENCIA,        DT.IDDEPENDENCIA,   DT.FLGCONTAIM' +
        'POSTOR,'
      '       DT.FLGCONTASALARIOF,    DT.FLGBENEFICIARIO, D.DESCRICAO,'
      
        '       P.NOME,                 BT.IDRESPONSAVEL,   B.FLGBENEFTEM' +
        'P,'
      
        '       BP.FLGCALCTODOMES,      BF.DATAINICIOINSS,  BF.ULTMESREAJ' +
        'USTE,'
      
        '       BP.IDREGRAULTPAGTO,     BP.IDREGRACALCULO,  BF.VLRINFINSS' +
        ','
      
        '       BF.VLRBSTOTAL,          BF.VLRBSATUAL,      BF.VLRFABTOTA' +
        'L,'
      
        '       BF.VLRFABATUAL,         BF.VLRBASEDEFICIT,  BF.IDPERFILIN' +
        'VEST,'
      
        '       BP.FLGAPRESENTABSFAB,   BP.FLGAPRESENTADEFICIT, BF.IDPERF' +
        'ILINVEST,'
      
        '       DECODE(BF.FLGDATAPREVISTA,1,BF.DATAFINALPREVISTA,BF.DATAF' +
        'INAL) AS DATAFINALANT,'
      '       ULTPAGTO.ULTMES'
      
        'FROM   PROCESSOBENEF PROC, PESSOA PRESP, PESSOA PTIT, PESSOA PPA' +
        'TRO, PESSOA P, PESSOAFISICA PF,'
      
        '       BENEFICIO B, SITBENEFICIO S, BFCIARIOTITPLAN BT, BENEFBFC' +
        'IARIO BF,'
      '       DEPEN D, DEPENTIT DT, ELEGPATRO EL, PARTPREVPLAN PP,'
      
        '       PATRO PT, PLANPREV PL, BENEFPLANPREV BP, EVENTOGERADOR EG' +
        ','
      '       ( SELECT IDBENEFICIO, MAX(MESREFERENCIA) AS ULTMES'
      '         FROM   HSTBENEFBFCIARIO'
      '         WHERE  NUMEROPROCESSO = :NUMEROPROCESSO'
      '         AND    IDPESSOA = :IDPESSOA'
      '         AND    SUBSTR(MESREFERENCIA,6,2) <> '#39'13'#39
      '         AND    FLGDEVOLUCAO = 0'
      '         AND    VLBENEFPGTO IS NOT NULL'
      '         GROUP BY IDBENEFICIO ) ULTPAGTO'
      'WHERE  (BF.IDPESSOA = :IDPESSOA)'
      'AND    (BF.IDPLANOPREV = :IDPLANOPREV)'
      'AND    (BF.IDSITBENEFICIO <> 3)'
      'AND    (PROC.NUMEROPROCESSO = BF.NUMEROPROCESSO)'
      'AND    (EG.IDEVENTOGERADOR  = PROC.IDEVENTOGERADOR)'
      'AND    (BF.IDPESSOA       = P.IDPESSOA)'
      'AND    (PF.IDPESSOA       = P.IDPESSOA)'
      'AND    (BF.IDPESSOA       = BT.IDPESSOA)'
      'AND    (BF.IDTITULAR      = BT.IDTITULAR)'
      'AND    (BF.IDPESSJUR      = BT.IDPESSJUR)'
      'AND    (BF.IDPLANOPREV    = BT.IDPLANOPREV)'
      'AND    (BF.IDPLANOORIGEM  = BT.IDPLANOORIGEM)'
      'AND    (BF.IDBENEFICIO    = BT.IDBENEFICIO)'
      'AND    (BF.IDSITBENEFICIO = S.IDSITBENEFICIO)'
      'AND    (BT.IDPESSOA       = DT.IDPESSOA)'
      'AND    (BT.IDTITULAR      = DT.IDTITULAR)'
      'AND    (BT.IDRESPONSAVEL  = PRESP.IDPESSOA(+))'
      'AND    (DT.IDDEPENDENCIA  = D.IDDEPENDENCIA)'
      'AND    (B.IDBENEFICIO     = BF.IDBENEFICIO)'
      'AND    (BF.IDPESSJUR      = PT.IDPESSOA)'
      'AND    (PTIT.IDPESSOA     = BF.IDTITULAR)'
      'AND    (PPATRO.IDPESSOA   = BF.IDPESSJUR)'
      'AND    (BF.IDPLANOORIGEM  = PL.IDPLANOPREV)'
      'AND    (EL.IDPESSJUR      = BF.IDPESSJUR)'
      'AND    (EL.IDPESSOA       = BF.IDTITULAR)'
      'AND    (BP.IDPLANOPREV    = BF.IDPLANOPREV)'
      'AND    (BP.IDBENEFICIO    = BF.IDBENEFICIO)'
      '--AND    ( (BP.FLGREFERENCIA = 0) OR ((BP.FLGREFERENCIA = 1) AND'
      'AND    (PP.IDPESSJUR      = BF.IDPESSJUR)'
      'AND    (PP.IDPLANOPREV    = BF.IDPLANOORIGEM)'
      'AND    (PP.IDPESSOA       = BF.IDTITULAR)'
      'AND    (PP.SEQPROPOSTA    = BF.SEQPROPOSTA)'
      'AND    (ULTPAGTO.IDBENEFICIO(+) = BF.IDBENEFICIO)'
      'ORDER BY BF.IDPESSOA, BP.FLGREFERENCIA DESC, BF.IDBENEFICIO'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = upd
    ControlType.Strings = (
      'PROCESSAR;CheckBox;1;0')
    ValidateWithMask = True
    Left = 112
    Top = 176
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMEROPROCESSO'
        ParamType = ptUnknown
      end
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
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object upd: TUpdateSQL
    ModifySQL.Strings = (
      'update BENEFICIO'
      'set'
      '  NOME = :NOME'
      'where'
      '  IDBENEFICIO = :OLD_IDBENEFICIO')
    InsertSQL.Strings = (
      'insert into BENEFICIO'
      '  (NOME)'
      'values'
      '  (:NOME)')
    DeleteSQL.Strings = (
      'delete from BENEFICIO'
      'where'
      '  IDBENEFICIO = :OLD_IDBENEFICIO')
    Left = 96
    Top = 272
  end
  object qryGrava: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 240
    Top = 216
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 168
    Top = 216
  end
  object qryBenefRef: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT 1.00 AS FLGPROCESSA,  BF.IDPESSOA,         BF.IDTITULAR, ' +
        '       BF.IDPLANOPREV,'
      
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
      '       BF.VALORATUAL     AS VALORATUALANT,'
      '       BF.IDSITBENEFICIO AS IDSITANTERIOR,'
      '       BF.DATAINICIO     AS DATAINICIOANT,'
      
        '       DECODE(BF.FLGDATAPREVISTA, 1, BF.DATAFINALPREVISTA, BF.DA' +
        'TAFINAL) AS DATAFINALANT,'
      '       BF.FLGDATAPREVISTA AS FLGDATAPREVISTAANT,'
      '       BF.FLGDATAPREVISTA,'
      
        '       B.NOME,            BP.IDREGRACALCULO,   BP.FLGCALCTODOMES' +
        ',   BP.IDREGRAULTPAGTO,'
      
        '       DECODE(BF.IDBENEFREFEREN, NULL, BP.IDBENEFREF, BF.IDBENEF' +
        'REFEREN) AS IDBENEFREF,'
      '       BP.IDREGRAPRIMPAGTO,'
      
        '       BP.FLGOBRIGANPROC, BP.IDREGRABENEFICIA, BP.IDRGVALORTOTAL' +
        ',   B.FLGBENEFTEMP,'
      '       BF.DATAFINALPREVISTA, BF.FLGENCERRAPORFALE,'
      '       BP.FLGPAGAINTEG, BP.FLGREFERENCIA'
      
        'FROM   BENEFBFCIARIO BF, BENEFPLANOPART BPP, BENEFICIO B, BENEFP' +
        'LANPREV BP'
      'WHERE  (BF.NUMEROPROCESSO = :NUMEROPROCESSO)'
      'AND    (BF.IDPESSOA       = :IDPESSOA)'
      'AND    (BF.IDBENEFICIO    = :IDBENEFICIO)'
      'AND    (BF.IDBENEFICIO    = B.IDBENEFICIO)'
      'AND    (BF.IDPLANOPREV    = BP.IDPLANOPREV)'
      'AND    (BF.IDBENEFICIO    = BP.IDBENEFICIO)'
      'AND    (BPP.IDPESSOA(+)   = BF.IDTITULAR)'
      'AND    (BPP.IDPESSJUR(+)  = BF.IDPESSJUR)'
      'AND    (BPP.IDPLANOPREV(+) = BF.IDPLANOPREV)'
      'AND    (BPP.IDBENEFICIO(+) = BF.IDBENEFICIO)'
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    ControlType.Strings = (
      'FLGPROCESSA;CheckBox;1;0')
    ValidateWithMask = True
    Left = 304
    Top = 216
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMEROPROCESSO'
        ParamType = ptUnknown
        Value = 83
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDBENEFICIO'
        ParamType = ptUnknown
      end>
  end
  object qryBenefRecalculo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT 1.00 AS FLGPROCESSA,'
      
        '       BF.IDPESSOA,       BF.IDTITULAR,      BF.IDPLANOPREV,    ' +
        'BF.IDPLANOORIGEM ,'
      
        '       BF.SEQPROPOSTA,    BF.IDPESSJUR,      BF.IDBENEFICIO,    ' +
        'BF.NUMEROPROCESSO,'
      
        '       BF.NUMPROCINSS,    BF.VALORATUAL,     BF.VALORCALCULADO, ' +
        'BF.VALORCOTAS,'
      
        '       BF.VALORTOTAL,     BF.VLRCALCINSS,    BF.VLRINFINSS,     ' +
        'BF.DATAFINAL,'
      
        '       BF.DATAINICIO,     BF.DATAINICIOFUND, BF.DATAINICIOINSS, ' +
        'BF.DATAREQUERIMENTO,'
      '       BF.IDSITBENEFICIO, BF.IDTPPAGTOBENEFIC,'
      
        '       BF.ULTMESREAJUSTE, BF.CODPORTFORMA,   BF.VALORBASE1,     ' +
        'BF.VALORBASE2,'
      '       BF.VALORBASE3,'
      
        '       BF.FLGPROVISORIO, BF.PRAZOPROVISORIO, BF.PERCPROVISORIO, ' +
        'BF.IDPERFILINVEST,'
      '       B.NOME,'
      '       BTP.PERCENTUAL,'
      '       DP.IDDEPENDENCIA , BAUX.NUMBENEF,'
      '       BF.VLRBSTOTAL,     BF.VLRBSATUAL,        BF.VLRFABTOTAL,'
      
        '       BF.VLRFABATUAL,    BF.VLRBASEDEFICIT,    BF.IDPERFILINVES' +
        'T'
      
        'FROM   BENEFBFCIARIO BF, BFCIARIOTITPLAN BTP,  BENEFICIO B, DEPE' +
        'NTIT DP,'
      
        '       ( SELECT IDBENEFICIO, COUNT(DISTINCT IDPESSOA) AS NUMBENE' +
        'F'
      '         FROM   BENEFBFCIARIO'
      '         WHERE  NUMEROPROCESSO = :NUMEROPROCESSO'
      '         AND    IDPESSOA       <> :IDPESSOA'
      '         AND    IDSITBENEFICIO <> 3'
      '         GROUP BY IDBENEFICIO                 ) BAUX'
      'WHERE  (BF.NUMEROPROCESSO = :NUMEROPROCESSO)'
      'AND    (BF.IDPESSOA       <> :IDPESSOA)'
      'AND    (BF.IDSITBENEFICIO <> 3 )'
      'AND    (BF.IDBENEFICIO    = B.IDBENEFICIO)'
      'AND    (BTP.IDTITULAR     = BF.IDTITULAR)'
      'AND    (BTP.IDPESSOA      = BF.IDPESSOA)'
      'AND    (BTP.IDPESSJUR     = BF.IDPESSJUR)'
      'AND    (BTP.IDPLANOPREV   = BF.IDPLANOPREV)'
      'AND    (BTP.IDBENEFICIO   = BF.IDBENEFICIO)'
      'AND    (BF.IDTITULAR      = DP.IDTITULAR)'
      'AND    (BF.IDPESSOA       = DP.IDPESSOA)'
      'AND    (BAUX.IDBENEFICIO  = BF.IDBENEFICIO)'
      'ORDER BY BF.IDBENEFICIO, BF.IDPESSOA'
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updBenefRecalculo
    ValidateWithMask = True
    Left = 664
    Top = 216
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMEROPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'NUMEROPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryBenefRecalculoFLGPROCESSA: TFloatField
      FieldName = 'FLGPROCESSA'
    end
    object qryBenefRecalculoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryBenefRecalculoIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
    end
    object qryBenefRecalculoIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryBenefRecalculoSEQPROPOSTA: TFloatField
      FieldName = 'SEQPROPOSTA'
    end
    object qryBenefRecalculoIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
    end
    object qryBenefRecalculoIDBENEFICIO: TFloatField
      FieldName = 'IDBENEFICIO'
    end
    object qryBenefRecalculoNUMEROPROCESSO: TFloatField
      FieldName = 'NUMEROPROCESSO'
    end
    object qryBenefRecalculoNUMPROCINSS: TStringField
      FieldName = 'NUMPROCINSS'
      Size = 15
    end
    object qryBenefRecalculoVALORATUAL: TFloatField
      FieldName = 'VALORATUAL'
    end
    object qryBenefRecalculoVALORCALCULADO: TFloatField
      FieldName = 'VALORCALCULADO'
    end
    object qryBenefRecalculoVALORCOTAS: TFloatField
      FieldName = 'VALORCOTAS'
    end
    object qryBenefRecalculoVALORTOTAL: TFloatField
      FieldName = 'VALORTOTAL'
    end
    object qryBenefRecalculoVLRCALCINSS: TFloatField
      FieldName = 'VLRCALCINSS'
    end
    object qryBenefRecalculoVLRINFINSS: TFloatField
      FieldName = 'VLRINFINSS'
    end
    object qryBenefRecalculoDATAFINAL: TDateTimeField
      FieldName = 'DATAFINAL'
    end
    object qryBenefRecalculoDATAINICIO: TDateTimeField
      FieldName = 'DATAINICIO'
    end
    object qryBenefRecalculoDATAINICIOFUND: TDateTimeField
      FieldName = 'DATAINICIOFUND'
    end
    object qryBenefRecalculoDATAINICIOINSS: TDateTimeField
      FieldName = 'DATAINICIOINSS'
    end
    object qryBenefRecalculoDATAREQUERIMENTO: TDateTimeField
      FieldName = 'DATAREQUERIMENTO'
    end
    object qryBenefRecalculoIDSITBENEFICIO: TFloatField
      FieldName = 'IDSITBENEFICIO'
    end
    object qryBenefRecalculoIDTPPAGTOBENEFIC: TFloatField
      FieldName = 'IDTPPAGTOBENEFIC'
    end
    object qryBenefRecalculoULTMESREAJUSTE: TStringField
      FieldName = 'ULTMESREAJUSTE'
      FixedChar = True
      Size = 7
    end
    object qryBenefRecalculoCODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
    end
    object qryBenefRecalculoVALORBASE1: TFloatField
      FieldName = 'VALORBASE1'
    end
    object qryBenefRecalculoVALORBASE2: TFloatField
      FieldName = 'VALORBASE2'
    end
    object qryBenefRecalculoVALORBASE3: TFloatField
      FieldName = 'VALORBASE3'
    end
    object qryBenefRecalculoNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryBenefRecalculoIDPLANOORIGEM: TFloatField
      FieldName = 'IDPLANOORIGEM'
    end
    object qryBenefRecalculoPERCENTUAL: TFloatField
      FieldName = 'PERCENTUAL'
    end
    object qryBenefRecalculoIDDEPENDENCIA: TStringField
      FieldName = 'IDDEPENDENCIA'
      FixedChar = True
      Size = 3
    end
    object qryBenefRecalculoNUMBENEF: TFloatField
      FieldName = 'NUMBENEF'
    end
    object qryBenefRecalculoFLGPROVISORIO: TFloatField
      FieldName = 'FLGPROVISORIO'
    end
    object qryBenefRecalculoPRAZOPROVISORIO: TFloatField
      FieldName = 'PRAZOPROVISORIO'
    end
    object qryBenefRecalculoPERCPROVISORIO: TFloatField
      FieldName = 'PERCPROVISORIO'
    end
    object qryBenefRecalculoVLRBSTOTAL: TFloatField
      FieldName = 'VLRBSTOTAL'
    end
    object qryBenefRecalculoVLRBSATUAL: TFloatField
      FieldName = 'VLRBSATUAL'
    end
    object qryBenefRecalculoVLRFABTOTAL: TFloatField
      FieldName = 'VLRFABTOTAL'
    end
    object qryBenefRecalculoVLRFABATUAL: TFloatField
      FieldName = 'VLRFABATUAL'
    end
    object qryBenefRecalculoVLRBASEDEFICIT: TFloatField
      FieldName = 'VLRBASEDEFICIT'
    end
    object qryBenefRecalculoIDPERFILINVEST: TFloatField
      FieldName = 'IDPERFILINVEST'
    end
    object qryBenefRecalculoIDPERFILINVEST_1: TFloatField
      FieldName = 'IDPERFILINVEST_1'
    end
  end
  object updBenefRecalculo: TUpdateSQL
    ModifySQL.Strings = (
      'update BENEFBFCIARIO'
      'set'
      '  VALORATUAL = :VALORATUAL,'
      '  IDSITBENEFICIO = :IDSITBENEFICIO'
      'where'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  NUMEROPROCESSO = :OLD_NUMEROPROCESSO and'
      '  IDBENEFICIO = :OLD_IDBENEFICIO and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA ')
    InsertSQL.Strings = (
      'insert into BENEFBFCIARIO'
      '  (VALORATUAL, IDSITBENEFICIO)'
      'values'
      '  (:VALORATUAL, :IDSITBENEFICIO)')
    DeleteSQL.Strings = (
      'delete from BENEFBFCIARIO'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDBENEFICIO = :OLD_IDBENEFICIO and'
      '  NUMEROPROCESSO = :OLD_NUMEROPROCESSO')
    Left = 168
    Top = 272
  end
  object qryResultadoHst: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT P.NOME AS NOMEBENEFICIARIO,'
      '       PF.FLGISENTOIRRF,'
      '       BF.NUMEROPROCESSO,   BF.IDPESSJUR,      BF.IDPLANOPREV,'
      '       BF.IDTITULAR,        BF.IDPESSOA,       BF.SEQPROPOSTA'
      
        'FROM   PESSOA P, PESSOAFISICA PF, BENEFBFCIARIO BF, BENEFICIO B,' +
        ' BENEFPLANPREV BPL,'
      '       SITBENEFICIO S, BENEFPLANOPART BPART, PATRO PT'
      'WHERE  BF.NUMEROPROCESSO = :NUMEROPROCESSO'
      'AND    B.IDBENEFICIO     = BF.IDBENEFICIO'
      'AND    BPL.IDBENEFICIO   = BF.IDBENEFICIO'
      'AND    BPL.IDPLANOPREV   = BF.IDPLANOPREV'
      'AND    BF.IDPESSJUR      = PT.IDPESSOA'
      
        'AND    ((BPL.FLGREFERENCIA = 0) OR ((BPL.FLGREFERENCIA = 1) AND ' +
        '(BPL.FLGPAGAINSS = 1) ) )'
      'AND    BF.IDSITBENEFICIO = S.IDSITBENEFICIO'
      'AND    BF.IDTITULAR      = BPART.IDPESSOA(+)'
      'AND    BF.SEQPROPOSTA    = BPART.SEQPROPOSTA(+)'
      'AND    BF.IDPESSJUR      = BPART.IDPESSJUR(+)'
      'AND    BF.IDPLANOPREV    = BPART.IDPLANOPREV(+)'
      'AND    BF.IDBENEFICIO    = BPART.IDBENEFICIO(+)'
      'AND    P.IDPESSOA        = BF.IDPESSOA'
      'AND    PF.IDPESSOA       = BF.IDPESSOA'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ControlType.Strings = (
      'FLGPROVISORIO;CheckBox;1;0'
      'FLGPOSSUIACOMPINSS;CheckBox;1;0')
    PictureMasks.Strings = (
      
        'PERCPROVISORIO'#9'{{{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-' +
        ']#[#][#]]],({{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[#' +
        '][#]]]),[-]{{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[#]' +
        '[#]]]}'#9'T'#9'F')
    ValidateWithMask = True
    Left = 448
    Top = 192
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMEROPROCESSO'
        ParamType = ptUnknown
      end>
  end
  object qryResultado: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.NOME AS NOMEBENEFICIARIO,'
      
        '       DECODE(BF.FLGDATAPREVISTA,1,BF.DATAFINALPREVISTA,DATAFINA' +
        'L) AS DATAFINALPRINT,'
      '       PF.FLGISENTOIRRF,'
      '       BF.NUMEROPROCESSO,   BF.IDPESSJUR,      BF.IDPLANOPREV,'
      '       BF.IDTITULAR,        BF.IDPESSOA,       BF.SEQPROPOSTA,'
      '       BF.IDBENEFICIO,'
      '       BF.CODPORTFORMA,     BF.IDSITBENEFICIO, BF.IDDEPENDENCIA,'
      
        '       BF.IDTPPAGTOBENEFIC, BF.VALORATUAL,     BF.DATAREQUERIMEN' +
        'TO,'
      '       BF.DATAINICIO,       BF.DATAFINAL,'
      
        '       BF.FLGFORMAPAGTO,    BF.VALORCALCULADO, BF.DATAULTREAJUST' +
        'E,'
      
        '       BF.VLRCALCINSS,      BF.VLRINFINSS,     BF.DATAINICIOINSS' +
        ','
      '       BF.NUMPROCINSS,      BF.DATAINICIOFUND, BF.VALORCOTAS,'
      
        '       BF.DATACONCESSAO,    BF.FLGPROVISORIO,  BF.PERCPROVISORIO' +
        ','
      
        '       BF.PRAZOPROVISORIO,  BF.ULTMESREAJUSTE, BF.ULTVALORATUALR' +
        'EAJ,'
      '       BF.IDAGENCIARESGATE, BF.DATAFINALPREVISTA,'
      '       BF.FLGDATAPREVISTA,  BF.FLGTIPOINSS,    BF.DIBBENEFANT,'
      
        '       BF.VALORBENEFANT,    BF.VALORBINSSANT1, BF.VALORBINSSANT2' +
        ', BF.VALORBINSSANT3,'
      '       BF.VALORTOTAL,       BF.FLGPOSSUIACOMPINSS,'
      '       BF.VALORSRB,'
      '       BPL.FLGREFERENCIA,'
      '       B.NUMORDEMEVENTO,    B.NOME,            S.DESCRICAO,'
      '       B.FLGRESGATE,        BPART.VALORBASE1,  BPART.VALORBASE2,'
      '       BPART.VALORBASE3,    PT.IDRUBSALAUXDOENCA'
      
        'FROM   PESSOA P, PESSOAFISICA PF, BENEFBFCIARIO BF, BENEFICIO B,' +
        ' BENEFPLANPREV BPL,'
      '       SITBENEFICIO S, BENEFPLANOPART BPART, PATRO PT'
      'WHERE  B.IDBENEFICIO     = BF.IDBENEFICIO'
      'AND    BPL.IDBENEFICIO   = BF.IDBENEFICIO'
      'AND    BPL.IDPLANOPREV   = BF.IDPLANOPREV'
      'AND    BF.IDPESSJUR      = PT.IDPESSOA'
      
        'AND    ((BPL.FLGREFERENCIA = 0) OR ((BPL.FLGREFERENCIA = 1) AND ' +
        '(BPL.FLGPAGAINSS = 1) ) )'
      'AND    BF.IDSITBENEFICIO = S.IDSITBENEFICIO'
      'AND    BF.IDTITULAR      = BPART.IDPESSOA(+)'
      'AND    BF.SEQPROPOSTA    = BPART.SEQPROPOSTA(+)'
      'AND    BF.IDPESSJUR      = BPART.IDPESSJUR(+)'
      'AND    BF.IDPLANOPREV    = BPART.IDPLANOPREV(+)'
      'AND    BF.IDBENEFICIO    = BPART.IDBENEFICIO(+)'
      'AND    P.IDPESSOA        = BF.IDPESSOA'
      'AND    PF.IDPESSOA       = BF.IDPESSOA')
    ControlType.Strings = (
      'FLGPROVISORIO;CheckBox;1;0'
      'FLGPOSSUIACOMPINSS;CheckBox;1;0')
    PictureMasks.Strings = (
      
        'PERCPROVISORIO'#9'{{{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-' +
        ']#[#][#]]],({{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[#' +
        '][#]]]),[-]{{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[#]' +
        '[#]]]}'#9'T'#9'F')
    ValidateWithMask = True
    Left = 376
    Top = 216
    object qryResultadoIDBENEFICIO: TFloatField
      DisplayLabel = 'Cód.'
      DisplayWidth = 10
      FieldName = 'IDBENEFICIO'
      Origin = 'BENEFBFCIARIO.IDBENEFICIO'
    end
    object qryResultadoDESCRICAO: TStringField
      DisplayLabel = 'Situação'
      DisplayWidth = 20
      FieldName = 'DESCRICAO'
      Size = 40
    end
    object qryResultadoVALORTOTAL: TFloatField
      DisplayLabel = 'Valor ~Total(R$)'
      DisplayWidth = 10
      FieldName = 'VALORTOTAL'
    end
    object qryResultadoVALORATUAL: TFloatField
      DisplayLabel = 'Valor do ~Benefício(R$)'
      DisplayWidth = 10
      FieldName = 'VALORATUAL'
      Origin = 'BENEFBFCIARIO.VALORATUAL'
    end
    object qryResultadoFLGPROVISORIO: TFloatField
      DisplayLabel = 'Provisório'
      DisplayWidth = 10
      FieldName = 'FLGPROVISORIO'
    end
    object qryResultadoPERCPROVISORIO: TFloatField
      DisplayLabel = 'Perc.(%) ~Provisório'
      DisplayWidth = 10
      FieldName = 'PERCPROVISORIO'
    end
    object qryResultadoVALORCOTAS: TFloatField
      DisplayLabel = 'Valor do ~Benefício(Cotas)'
      DisplayWidth = 10
      FieldName = 'VALORCOTAS'
    end
    object qryResultadoVLRINFINSS: TFloatField
      DisplayLabel = 'Valor Inf. ~do INSS'
      DisplayWidth = 10
      FieldName = 'VLRINFINSS'
    end
    object qryResultadoVLRCALCINSS: TFloatField
      DisplayLabel = 'Valor Calc. ~do INSS'
      DisplayWidth = 10
      FieldName = 'VLRCALCINSS'
    end
    object qryResultadoDATAINICIO: TDateTimeField
      DisplayLabel = 'Data Início ~Pagto'
      DisplayWidth = 10
      FieldName = 'DATAINICIO'
      Origin = 'BENEFBFCIARIO.DATAINICIO'
    end
    object qryResultadoDATAFINALPREVISTA: TDateTimeField
      DisplayLabel = 'Data Final ~Prevista'
      DisplayWidth = 10
      FieldName = 'DATAFINALPREVISTA'
    end
    object qryResultadoDATAFINAL: TDateTimeField
      DisplayLabel = 'Data Final ~Efetiva'
      DisplayWidth = 10
      FieldName = 'DATAFINAL'
      Origin = 'BENEFBFCIARIO.DATAFINAL'
    end
    object qryResultadoDATAREQUERIMENTO: TDateTimeField
      DisplayLabel = 'Data de ~Requerimento'
      DisplayWidth = 10
      FieldName = 'DATAREQUERIMENTO'
      Origin = 'BENEFBFCIARIO.DATAREQUERIMENTO'
    end
    object qryResultadoDATAINICIOINSS: TDateTimeField
      DisplayLabel = 'Data de Início ~no INSS'
      DisplayWidth = 10
      FieldName = 'DATAINICIOINSS'
    end
    object qryResultadoDATAINICIOFUND: TDateTimeField
      DisplayLabel = 'Data de Início ~na Fundação'
      DisplayWidth = 10
      FieldName = 'DATAINICIOFUND'
    end
    object qryResultadoFLGPOSSUIACOMPINSS: TFloatField
      DisplayLabel = 'Possui Acomp. ~INSS'
      DisplayWidth = 10
      FieldName = 'FLGPOSSUIACOMPINSS'
    end
    object qryResultadoNOME: TStringField
      DisplayLabel = 'Benefício'
      DisplayWidth = 60
      FieldName = 'NOME'
      Origin = 'BENEFICIO.NOME'
      Size = 60
    end
    object qryResultadoVALORCALCULADO: TFloatField
      DisplayLabel = 'Valor Calc. ~do INSS'
      DisplayWidth = 10
      FieldName = 'VALORCALCULADO'
      Origin = 'BENEFBFCIARIO.VALORCALCULADO'
      Visible = False
    end
    object qryResultadoNUMEROPROCESSO: TFloatField
      DisplayLabel = 'Nº do ~Processo'
      DisplayWidth = 10
      FieldName = 'NUMEROPROCESSO'
      Origin = 'BENEFBFCIARIO.NUMEROPROCESSO'
      Visible = False
    end
    object qryResultadoFLGFORMAPAGTO: TStringField
      DisplayWidth = 1
      FieldName = 'FLGFORMAPAGTO'
      Origin = 'BENEFBFCIARIO.FLGFORMAPAGTO'
      Visible = False
      Size = 1
    end
    object qryResultadoDATAULTREAJUSTE: TDateTimeField
      DisplayWidth = 10
      FieldName = 'DATAULTREAJUSTE'
      Origin = 'BENEFBFCIARIO.DATAULTREAJUSTE'
      Visible = False
    end
    object qryResultadoIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
      Origin = 'BENEFBFCIARIO.IDPESSJUR'
      Visible = False
    end
    object qryResultadoIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BENEFBFCIARIO.IDPLANOPREV'
      Visible = False
    end
    object qryResultadoIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
      Origin = 'BENEFBFCIARIO.IDTITULAR'
      Visible = False
    end
    object qryResultadoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BENEFBFCIARIO.IDPESSOA'
      Visible = False
    end
    object qryResultadoSEQPROPOSTA: TFloatField
      FieldName = 'SEQPROPOSTA'
      Origin = 'BENEFBFCIARIO.SEQPROPOSTA'
      Visible = False
    end
    object qryResultadoCODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
      Origin = 'BENEFBFCIARIO.CODPORTFORMA'
      Visible = False
    end
    object qryResultadoIDSITBENEFICIO: TFloatField
      FieldName = 'IDSITBENEFICIO'
      Origin = 'BENEFBFCIARIO.IDSITBENEFICIO'
      Visible = False
    end
    object qryResultadoIDDEPENDENCIA: TStringField
      FieldName = 'IDDEPENDENCIA'
      Origin = 'BENEFBFCIARIO.IDDEPENDENCIA'
      Visible = False
      Size = 3
    end
    object qryResultadoIDTPPAGTOBENEFIC: TFloatField
      FieldName = 'IDTPPAGTOBENEFIC'
      Origin = 'BENEFBFCIARIO.IDTPPAGTOBENEFIC'
      Visible = False
    end
    object qryResultadoVALORBASE1: TFloatField
      FieldName = 'VALORBASE1'
      Origin = 'BENEFPLANOPART.VALORBASE1'
      Visible = False
    end
    object qryResultadoVALORBASE2: TFloatField
      FieldName = 'VALORBASE2'
      Origin = 'BENEFPLANOPART.VALORBASE2'
      Visible = False
    end
    object qryResultadoVALORBASE3: TFloatField
      FieldName = 'VALORBASE3'
      Origin = 'BENEFPLANOPART.VALORBASE3'
      Visible = False
    end
    object qryResultadoNUMPROCINSS: TStringField
      FieldName = 'NUMPROCINSS'
      Visible = False
      Size = 15
    end
    object qryResultadoNUMORDEMEVENTO: TFloatField
      FieldName = 'NUMORDEMEVENTO'
      Visible = False
    end
    object qryResultadoFLGRESGATE: TFloatField
      FieldName = 'FLGRESGATE'
      Visible = False
    end
    object qryResultadoDATACONCESSAO: TDateTimeField
      FieldName = 'DATACONCESSAO'
      Visible = False
    end
    object qryResultadoPRAZOPROVISORIO: TFloatField
      FieldName = 'PRAZOPROVISORIO'
      Visible = False
    end
    object qryResultadoULTMESREAJUSTE: TStringField
      FieldName = 'ULTMESREAJUSTE'
      Visible = False
      Size = 7
    end
    object qryResultadoULTVALORATUALREAJ: TFloatField
      FieldName = 'ULTVALORATUALREAJ'
      Visible = False
    end
    object qryResultadoIDAGENCIARESGATE: TFloatField
      FieldName = 'IDAGENCIARESGATE'
      Visible = False
    end
    object qryResultadoIDRUBSALAUXDOENCA: TFloatField
      FieldName = 'IDRUBSALAUXDOENCA'
      Visible = False
    end
    object qryResultadoFLGDATAPREVISTA: TFloatField
      FieldName = 'FLGDATAPREVISTA'
      Visible = False
    end
    object qryResultadoFLGTIPOINSS: TFloatField
      FieldName = 'FLGTIPOINSS'
      Visible = False
    end
    object qryResultadoDIBBENEFANT: TDateTimeField
      FieldName = 'DIBBENEFANT'
      Visible = False
    end
    object qryResultadoVALORBENEFANT: TFloatField
      FieldName = 'VALORBENEFANT'
      Visible = False
    end
    object qryResultadoFLGREFERENCIA: TFloatField
      FieldName = 'FLGREFERENCIA'
      Visible = False
    end
    object qryResultadoVALORBINSSANT1: TFloatField
      FieldName = 'VALORBINSSANT1'
      Visible = False
    end
    object qryResultadoVALORBINSSANT2: TFloatField
      FieldName = 'VALORBINSSANT2'
      Visible = False
    end
    object qryResultadoVALORBINSSANT3: TFloatField
      FieldName = 'VALORBINSSANT3'
      Visible = False
    end
    object qryResultadoVALORSRB: TFloatField
      FieldName = 'VALORSRB'
      Visible = False
    end
    object qryResultadoNOMEBENEFICIARIO: TStringField
      FieldName = 'NOMEBENEFICIARIO'
      Size = 60
    end
    object qryResultadoFLGISENTOIRRF: TFloatField
      FieldName = 'FLGISENTOIRRF'
    end
    object qryResultadoDATAFINALPRINT: TDateTimeField
      FieldName = 'DATAFINALPRINT'
    end
  end
  object qryTitular: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.NOME, P1.NOME AS NOMEPATRO, PL.NOME AS NOMEPLANO,'
      '       PF.DATANASC, PF.DATAMORTE,'
      
        '       EL.MATRICULA, EL.DATAADMISSAO, EL.DATADEMISSAO, EL.TEMPOS' +
        'ERVANTERIOR,'
      
        '       EL.TEMPOSERVTOTAL, EL.TEMPOSERVTOTMES, EL.TEMPOSERVTOTDIA' +
        ','
      
        '       EL.TEMPONAOCREDITADO, EL.TEMPOSITESPECIAL, EL.NIVEL, EL.I' +
        'DSITFUNC,'
      
        '       PP.INSCRICAONUMERO, PP.INSCRICAODATA, PP.FLGDEVEEMPRESTIM' +
        'O, PP.FLGDEVEASSISTENC,'
      '       PP.FLGDEVEPREVIDENC, PP.IDSITPART, PP.IDSITPLANOPREV,'
      
        '       SPART.DESCRICAO AS NOMESITPART, SFUNC.DESCRICAO AS NOMESI' +
        'TFUNC,'
      
        '       SPLANO.DESCRICAO AS NOMESITPLANO, SPART.FLGINTERNO, SFUNC' +
        '.TIPOSIT,'
      '       PP.IDPESSJUR,PP.IDPLANOPREV, PP.IDPESSOA, PP.SEQPROPOSTA,'
      '       PP.FLGSALVIRTBENEF'
      
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
      ' ')
    ValidateWithMask = True
    Left = 592
    Top = 216
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
  object qryBenefAUX: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT BF.NUMEROPROCESSO, BF.IDBENEFICIO,'
      '       BF.VALORATUAL, BF.IDPESSJUR, BF.IDPLANOPREV , '
      '       BF.IDPESSOA , BF.IDTITULAR , BF.SEQPROPOSTA ,'
      '       BF.FLGFORMAPAGTO , BF.IDSITBENEFICIO,'
      '       BF.DATAINICIO, BF.DATAFINAL,'
      '       BF.VLRCALCINSS,BF.VLRINFINSS,'
      '       BF.NUMPROCINSS, BF.VALORCOTAS, '
      '       BPART.VALORBASE1, BPART.VALORBASE2, BPART.VALORBASE3,'
      '       B.NUMORDEMEVENTO'
      'FROM   BENEFBFCIARIO BF, BENEFPLANOPART BPART, BENEFICIO B'
      'WHERE  BF.NUMEROPROCESSO = :NUMEROPROCESSO'
      'AND    B.IDBENEFICIO     = BF.IDBENEFICIO'
      'AND    BF.IDTITULAR      = BPART.IDPESSOA(+)'
      'AND    BF.SEQPROPOSTA    = BPART.SEQPROPOSTA(+)'
      'AND    BF.IDPESSJUR      = BPART.IDPESSJUR(+)'
      'AND    BF.IDPLANOPREV    = BPART.IDPLANOPREV(+)'
      'AND    BF.IDBENEFICIO    = BPART.IDBENEFICIO(+)'
      'ORDER BY B.NUMORDEMEVENTO DESC')
    ValidateWithMask = True
    Left = 520
    Top = 216
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMEROPROCESSO'
        ParamType = ptUnknown
      end>
  end
  object wwStoredProc1: TwwStoredProc
    DatabaseName = 'BaseDados'
    StoredProcName = 'pck_'
    ValidateWithMask = True
    Left = 145
    Top = 135
  end
  object StoredProc1: TStoredProc
    DatabaseName = 'BaseDados'
    Left = 233
    Top = 127
  end
end
