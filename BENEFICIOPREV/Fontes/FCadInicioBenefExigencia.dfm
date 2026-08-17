inherited frmCadInicioBenefExigencia: TfrmCadInicioBenefExigencia
  Left = 500
  Top = 159
  HelpContext = 160081
  Caption = 'Liberação de Benefício  em Exigência'
  ClientHeight = 492
  ClientWidth = 752
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 752
    Height = 453
    object wwDBGrid1: TwwDBGrid
      Left = 1
      Top = 151
      Width = 750
      Height = 301
      Selected.Strings = (
        'FLGLIBERA'#9'7'#9'Liberar'#9'F'
        'NUMEROPROCESSO'#9'9'#9'Nº~Processo'#9'F'
        'NOMEBENEFICIO'#9'9'#9'Benefício'#9'F'
        'NOME'#9'11'#9'Benefíciario'#9'F'
        'IDDEPENDENCIA'#9'5'#9'Dep.'#9'F'
        'DATAINICIO'#9'10'#9'Data~Início'#9'F'
        'DATAFINALPREVISTA'#9'10'#9'Data Final~Prevista'#9'F'
        'DATAFINAL'#9'10'#9'Data Final~Efetiva'#9'F'
        'VALORATUAL'#9'7'#9'Valor~Atual'#9'F'
        'SITUACAO'#9'8'#9'Situação'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
      Align = alClient
      DataSource = dsBenef
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
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
      IndicatorColor = icBlack
    end
    object pnlTitular: TPanel
      Left = 1
      Top = 33
      Width = 750
      Height = 86
      Align = alTop
      BevelOuter = bvLowered
      TabOrder = 2
      object Label13: TLabel
        Left = 490
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
      object pnlBotaoProcurar: TPanel
        Left = 648
        Top = 1
        Width = 101
        Height = 84
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
          OnClick = ef
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
        Width = 477
        Height = 21
        Color = clMenu
        DataField = 'NOME'
        DataSource = dsTitular
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
        DataSource = dsTitular
        ReadOnly = True
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 490
        Top = 18
        Width = 121
        Height = 21
        Color = clMenu
        DataField = 'MATRICULA'
        DataSource = dsTitular
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
        DataSource = dsTitular
        ReadOnly = True
        TabOrder = 3
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 119
      Width = 750
      Height = 32
      Align = alTop
      BevelOuter = bvLowered
      Caption = 'Benefícios Retidos ou Em Exigência'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMenuText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 750
      Height = 32
      Align = alTop
      BevelOuter = bvLowered
      Caption = 'Liberação de Benefício Retido ou Em Exigência'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
  end
  inherited Dock971: TDock97
    Top = 453
    Width = 752
    inherited tb97Fundo: TToolbar97
      Left = 513
      DockPos = 513
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 344
      DockPos = 344
      inherited bbtnConfirmar: TBitBtn
        Caption = '&Liberar'
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 65520
    Top = 519
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 355
    Top = 208
  end
  object MontaSelectOLD2: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'ELEGPATRO.MATRICULA'
      'PESSOA.NOME'
      'PAR.INSCRICAONUMERO'
      'PLA.NOME'
      'PATRO.NOME'
      'PRC.NUMEROPROCESSO'
      'PRC.DTEVENTO')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'C'
      'C'
      'N'
      'D')
    Descricao.Strings = (
      'Matrícula'
      'Participante'
      'N° de Inscrição'
      'Plano Previdenciário'
      'Patrocinadora'
      'Número do Processo'
      'Dt. do Evento')
    SensivelACaixa.Strings = (
      'S'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'BENEFBFCIARIO BNF'
      'PROCESSOBENEF PRC'
      'PARTPREVPLAN PAR'
      'PLANPREV PLA          '
      'ELEGPATRO           '
      'PESSOA'
      'PESSOA PATRO')
    CamposChave.Strings = (
      'ELEGPATRO.IDPESSOA'
      'ELEGPATRO.IDPESSJUR'
      'PLA.IDPLANOPREV'
      'PESSOA.NOME'
      'PATRO.NOME AS PATRO'
      'PLA.NOME AS PLANO'
      'ELEGPATRO.MATRICULA'
      'PRC.DTEVENTO'
      'PRC.NUMEROPROCESSO'
      'ELEGPATRO.IDPESSOA')
    Filtro.Strings = (
      '(BNF.IDSITBENEFICIO  =  7) OR (BNF.IDSITBENEFICIO = 2)'
      'BNF.NUMEROPROCESSO  = PRC.NUMEROPROCESSO'
      'BNF.IDTITULAR           = PAR.IDPESSOA'
      'BNF.IDPESSJUR          = PAR.IDPESSJUR'
      'BNF.IDPLANOORIGEM   = PAR.IDPLANOPREV'
      'PAR.IDPLANOPREV     = PLA.IDPLANOPREV'
      'ELEGPATRO.IDPESSOA   = PAR.IDPESSOA'
      'ELEGPATRO.IDPESSJUR = PAR.IDPESSJUR'
      'PESSOA.IDPESSOA     = ELEGPATRO.IDPESSOA'
      'PATRO.IDPESSOA       = ELEGPATRO.IDPESSJUR'
      'PAR.FLGDESATIVADO = 0')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '10'
      '10'
      '10'
      '10'
      '10'
      '10')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 175
    Top = 345
  end
  object qryBenef: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT DISTINCT 1 AS FLGLIBERA, P.IDEVENTOGERADOR, PES.NOME,  DE' +
        'P.IDDEPENDENCIA, BF.IDSITBENEFICIO,'
      
        '       BF.IDPESSJUR, BF.IDPESSOA, BF.IDTITULAR, BF.SEQPROPOSTA, ' +
        'BF.IDBENEFICIO, BF.VALORSRB,'
      
        '       BF.IDPLANOPREV, BF.NUMEROPROCESSO, BF.ULTMESREAJUSTE, BP.' +
        'FLGPAGAINSS, BF.FLGPAGAINSS AS FLGPAGAINSSBENEF,'
      
        '       BF.DATAREQUERIMENTO, BF.DATAINICIOFUND,  BF.DATACONCESSAO' +
        ', BF.DATAINICIOINSS,'
      '       BF.FLGDATAPREVISTA,'
      ''
      
        '       NVL(BF.DATAFINALPREVISTA,BF.DATAFINAL) AS DATAFINALPREVIS' +
        'TA,      /*SIG124212*/   '
      ''
      '       BF.VLRINFINSS, BF.VLRCALCINSS,'
      
        '       BF.DATAINICIO, BF.DATAFINAL,  BF.VALORATUAL, BF.VALORCOTA' +
        'S, BF.VALORTOTAL,'
      
        '       B.NOME AS NOMEBENEFICIO,  B.FLGBENEFTEMP, PP.FLGSALVIRTBE' +
        'NEF,'
      
        '       BP.IDREGRACALCULO, BP.IDREGRAPRIMPAGTO, BP.IDREGRAULTPAGT' +
        'O,'
      
        '       B.IDTPPAGTOBENEFIC, BP.CODPORTFORMA, BP.FLGCALCTODOMES, B' +
        '.FLGRESGATE,'
      '       EG.FLGINTERNO, PP.IDSITPART, BP.FLGREFERENCIA,'
      
        '       DECODE(BF.FLGDATAPREVISTA,1, BF.DATAFINALPREVISTA, BF.DAT' +
        'AFINAL) AS DATAFINALANT,'
      '       Decode(BF.IDSITBENEFICIO, 1,'#39'Normal'#39','
      '                                 2,'#39'Retido'#39','
      '                                 3,'#39'Encerrado'#39','
      '                                 4,'#39'Pendente de Concessão'#39','
      
        '                                 5,'#39'Encerrado por Morte do Benef' +
        'iciário'#39','
      '                                 6,'#39'Nao Concedido'#39','
      
        '                                 7,'#39'Concedido em Exigência'#39') AS ' +
        'SITUACAO,'
      '       BFT.IDRESPONSAVEL, BF.FONTEPAGADORA,'
      '       NVL(BF.IDPERFILINVEST, -1) AS IDPERFILINVEST,'
      '       CAST(NULL AS DATE) AS DTINICIOLIBERACAO'
      
        'FROM  PROCESSOBENEF P, BENEFBFCIARIO BF, PARTPREVPLAN PP, BENEFP' +
        'LANPREV BP, PESSOA PES,'
      
        '      DEPENTIT DEP, BENEFICIO B, EVENTOGERADOR EG, BFCIARIOTITPL' +
        'AN BFT'
      'WHERE BF.IDTITULAR       = :IDTITULAR'
      '-- Thiago Melo'
      'AND   BF.IDPESSOA        = :IDBENEF'
      '-- Thiago Melo'
      'AND   BF.IDPESSJUR       = :IDPESSJUR'
      'AND   BF.IDPLANOORIGEM   = :IDPLANOPREV'
      
        'AND  ( BF.IDSITBENEFICIO IN (2,7) OR ( (BF.IDSITBENEFICIO = 1) A' +
        'ND (BP.FLGREFERENCIA = 1) AND (BF.FLGPAGAINSS = 0) ) )'
      'AND   BF.IDPESSOA = PES.IDPESSOA'
      'AND   DEP.IDTITULAR      = BF.IDTITULAR'
      'AND   DEP.IDPESSOA       = BF.IDPESSOA'
      'AND   BF.IDBENEFICIO     = B.IDBENEFICIO'
      'AND   BP.IDPLANOPREV     = BF.IDPLANOPREV'
      'AND   BP.IDBENEFICIO     = BF.IDBENEFICIO'
      'AND   P.NUMEROPROCESSO   = BF.NUMEROPROCESSO'
      'AND   PP.IDPESSJUR       = BF.IDPESSJUR'
      'AND   PP.IDPLANOPREV     = BF.IDPLANOORIGEM'
      'AND   PP.IDPESSOA        = BF.IDTITULAR'
      'AND   PP.SEQPROPOSTA     = BF.SEQPROPOSTA'
      'AND   EG.IDEVENTOGERADOR = P.IDEVENTOGERADOR'
      ''
      'AND   BF.IDPESSJUR       = BFT.IDPESSJUR'
      'AND   BF.IDTITULAR       = BFT.IDTITULAR'
      'AND   BF.IDPLANOORIGEM   = BFT.IDPLANOORIGEM'
      'AND   BF.IDPESSOA        = BFT.IDPESSOA'
      'AND   BF.SEQPROPOSTA     = BFT.SEQPROPOSTA'
      'AND   BF.IDPLANOPREV     = BFT.IDPLANOPREV'
      'AND   BF.IDBENEFICIO     = BFT.IDBENEFICIO'
      ''
      'ORDER BY B.NOME, PES.NOME'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updBenef
    ControlType.Strings = (
      'FLGLIBERA;CheckBox;1;0')
    ValidateWithMask = True
    Left = 12
    Top = 208
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDBENEF'
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
      end>
    object qryBenefFLGLIBERA: TFloatField
      DisplayLabel = 'Liberar'
      DisplayWidth = 7
      FieldName = 'FLGLIBERA'
    end
    object qryBenefNUMEROPROCESSO: TFloatField
      DisplayLabel = 'Nº~Processo'
      DisplayWidth = 9
      FieldName = 'NUMEROPROCESSO'
      ReadOnly = True
    end
    object qryBenefNOMEBENEFICIO: TStringField
      DisplayLabel = 'Benefício'
      DisplayWidth = 9
      FieldName = 'NOMEBENEFICIO'
      ReadOnly = True
      Size = 60
    end
    object qryBenefNOME: TStringField
      DisplayLabel = 'Benefíciario'
      DisplayWidth = 11
      FieldName = 'NOME'
      ReadOnly = True
      Size = 60
    end
    object qryBenefIDDEPENDENCIA: TStringField
      DisplayLabel = 'Dep.'
      DisplayWidth = 5
      FieldName = 'IDDEPENDENCIA'
      ReadOnly = True
      FixedChar = True
      Size = 3
    end
    object qryBenefDATAINICIO: TDateTimeField
      DisplayLabel = 'Data~Início'
      DisplayWidth = 10
      FieldName = 'DATAINICIO'
      ReadOnly = True
    end
    object qryBenefDATAFINALPREVISTA: TDateTimeField
      DisplayLabel = 'Data Final~Prevista'
      DisplayWidth = 10
      FieldName = 'DATAFINALPREVISTA'
      ReadOnly = True
    end
    object qryBenefDATAFINAL: TDateTimeField
      DisplayLabel = 'Data Final~Efetiva'
      DisplayWidth = 10
      FieldName = 'DATAFINAL'
      ReadOnly = True
    end
    object qryBenefVALORATUAL: TFloatField
      DisplayLabel = 'Valor~Atual'
      DisplayWidth = 7
      FieldName = 'VALORATUAL'
      ReadOnly = True
    end
    object qryBenefSITUACAO: TStringField
      DisplayLabel = 'Situação'
      DisplayWidth = 8
      FieldName = 'SITUACAO'
      ReadOnly = True
      Size = 35
    end
    object qryBenefDTINICIOLIBERACAO: TDateTimeField
      DisplayLabel = 'Data Início~Liberação Benef.'
      DisplayWidth = 16
      FieldName = 'DTINICIOLIBERACAO'
      Visible = False
      OnChange = qryBenefDTINICIOLIBERACAOChange
    end
    object qryBenefIDEVENTOGERADOR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDEVENTOGERADOR'
      Visible = False
    end
    object qryBenefIDSITBENEFICIO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDSITBENEFICIO'
      Visible = False
    end
    object qryBenefIDPESSJUR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSJUR'
      Visible = False
    end
    object qryBenefIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object qryBenefIDTITULAR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTITULAR'
      Visible = False
    end
    object qryBenefSEQPROPOSTA: TFloatField
      DisplayWidth = 10
      FieldName = 'SEQPROPOSTA'
      Visible = False
    end
    object qryBenefIDBENEFICIO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDBENEFICIO'
      Visible = False
    end
    object qryBenefVALORSRB: TFloatField
      DisplayWidth = 10
      FieldName = 'VALORSRB'
      Visible = False
    end
    object qryBenefIDPLANOPREV: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANOPREV'
      Visible = False
    end
    object qryBenefULTMESREAJUSTE: TStringField
      DisplayWidth = 7
      FieldName = 'ULTMESREAJUSTE'
      Visible = False
      FixedChar = True
      Size = 7
    end
    object qryBenefFLGPAGAINSS: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGPAGAINSS'
      Visible = False
    end
    object qryBenefFLGPAGAINSSBENEF: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGPAGAINSSBENEF'
      Visible = False
    end
    object qryBenefDATAREQUERIMENTO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATAREQUERIMENTO'
      Visible = False
    end
    object qryBenefDATAINICIOFUND: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATAINICIOFUND'
      Visible = False
    end
    object qryBenefDATACONCESSAO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATACONCESSAO'
      Visible = False
    end
    object qryBenefDATAINICIOINSS: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATAINICIOINSS'
      Visible = False
    end
    object qryBenefFLGDATAPREVISTA: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGDATAPREVISTA'
      Visible = False
    end
    object qryBenefVLRINFINSS: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRINFINSS'
      Visible = False
    end
    object qryBenefVLRCALCINSS: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRCALCINSS'
      Visible = False
    end
    object qryBenefVALORCOTAS: TFloatField
      DisplayWidth = 10
      FieldName = 'VALORCOTAS'
      Visible = False
    end
    object qryBenefVALORTOTAL: TFloatField
      DisplayWidth = 10
      FieldName = 'VALORTOTAL'
      Visible = False
    end
    object qryBenefFLGBENEFTEMP: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGBENEFTEMP'
      Visible = False
    end
    object qryBenefFLGSALVIRTBENEF: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGSALVIRTBENEF'
      Visible = False
    end
    object qryBenefIDREGRACALCULO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDREGRACALCULO'
      Visible = False
    end
    object qryBenefIDREGRAPRIMPAGTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDREGRAPRIMPAGTO'
      Visible = False
    end
    object qryBenefIDREGRAULTPAGTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDREGRAULTPAGTO'
      Visible = False
    end
    object qryBenefIDTPPAGTOBENEFIC: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTPPAGTOBENEFIC'
      Visible = False
    end
    object qryBenefCODPORTFORMA: TFloatField
      DisplayWidth = 10
      FieldName = 'CODPORTFORMA'
      Visible = False
    end
    object qryBenefFLGCALCTODOMES: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGCALCTODOMES'
      Visible = False
    end
    object qryBenefFLGRESGATE: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGRESGATE'
      Visible = False
    end
    object qryBenefFLGINTERNO: TStringField
      DisplayWidth = 2
      FieldName = 'FLGINTERNO'
      Visible = False
      FixedChar = True
      Size = 2
    end
    object qryBenefIDSITPART: TFloatField
      DisplayWidth = 10
      FieldName = 'IDSITPART'
      Visible = False
    end
    object qryBenefFLGREFERENCIA: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGREFERENCIA'
      Visible = False
    end
    object qryBenefDATAFINALANT: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATAFINALANT'
      Visible = False
    end
    object qryBenefIDRESPONSAVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDRESPONSAVEL'
      Visible = False
    end
    object qryBenefFONTEPAGADORA: TFloatField
      FieldName = 'FONTEPAGADORA'
    end
    object qryBenefIDPERFILINVEST: TFloatField
      FieldName = 'IDPERFILINVEST'
    end
  end
  object dsBenef: TwwDataSource
    DataSet = qryBenef
    Left = 12
    Top = 304
  end
  object updBenef: TUpdateSQL
    ModifySQL.Strings = (
      'update BENEFBFCIARIO'
      'set'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  IDTITULAR = :IDTITULAR,'
      '  IDPESSJUR = :IDPESSJUR,'
      '  IDBENEFICIO = :IDBENEFICIO,'
      '  IDPESSOA = :IDPESSOA,'
      '  SEQPROPOSTA = :SEQPROPOSTA,'
      '  IDDEPENDENCIA = :IDDEPENDENCIA,'
      '  IDSITBENEFICIO = :IDSITBENEFICIO,'
      '  DATAFINAL = :DATAFINAL,'
      '  VALORATUAL = :VALORATUAL,'
      '  DATAINICIO = :DATAINICIO'
      'where'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDBENEFICIO = :OLD_IDBENEFICIO and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA and'
      '  IDDEPENDENCIA = :OLD_IDDEPENDENCIA and'
      '  IDSITBENEFICIO = :OLD_IDSITBENEFICIO and'
      '  DATAFINAL = :OLD_DATAFINAL and'
      '  VALORATUAL = :OLD_VALORATUAL and'
      '  DATAINICIO = :OLD_DATAINICIO')
    InsertSQL.Strings = (
      'insert into BENEFBFCIARIO'
      
        '  (IDPLANOPREV, IDTITULAR, IDPESSJUR, IDBENEFICIO, IDPESSOA, SEQ' +
        'PROPOSTA, '
      
        '   IDDEPENDENCIA, IDSITBENEFICIO, DATAFINAL, VALORATUAL, DATAINI' +
        'CIO)'
      'values'
      
        '  (:IDPLANOPREV, :IDTITULAR, :IDPESSJUR, :IDBENEFICIO, :IDPESSOA' +
        ', :SEQPROPOSTA, '
      
        '   :IDDEPENDENCIA, :IDSITBENEFICIO, :DATAFINAL, :VALORATUAL, :DA' +
        'TAINICIO)')
    DeleteSQL.Strings = (
      'delete from BENEFBFCIARIO'
      'where'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDBENEFICIO = :OLD_IDBENEFICIO and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA and'
      '  IDDEPENDENCIA = :OLD_IDDEPENDENCIA and'
      '  IDSITBENEFICIO = :OLD_IDSITBENEFICIO and'
      '  DATAFINAL = :OLD_DATAFINAL and'
      '  VALORATUAL = :OLD_VALORATUAL and'
      '  DATAINICIO = :OLD_DATAINICIO')
    Left = 12
    Top = 255
  end
  object qryTitular: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.NOME, P1.NOME AS NOMEPATRO, PL.NOME AS NOMEPLANO,'
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
      '       PP.SALPARTICIPACAO'
      
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
      ' ')
    ValidateWithMask = True
    Left = 100
    Top = 208
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
  object qryContrib: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 276
    Top = 208
  end
  object QryBenefValidos: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT DISTINCT 1 AS FLGLIBERA, P.IDEVENTOGERADOR, PES.NOME,  DE' +
        'P.IDDEPENDENCIA, BF.IDSITBENEFICIO,'
      
        '       BF.IDPESSJUR, BF.IDPESSOA, BF.IDTITULAR, BF.SEQPROPOSTA, ' +
        'BF.IDBENEFICIO,'
      '       BF.IDPLANOPREV, BF.NUMEROPROCESSO, BF.ULTMESREAJUSTE,'
      
        '       BF.DATAREQUERIMENTO, BF.DATAINICIOFUND,  BF.DATACONCESSAO' +
        ', BF.DATAINICIOINSS,'
      
        '       BF.FLGDATAPREVISTA, BF.DATAFINALPREVISTA, BF.VLRINFINSS, ' +
        'BF.VLRCALCINSS,'
      
        '       BF.DATAINICIO, BF.DATAFINAL,  BF.VALORATUAL, BF.VALORCOTA' +
        'S, BF.VALORTOTAL,'
      
        '       B.NOME AS NOMEBENEFICIO,  B.FLGBENEFTEMP, PP.FLGSALVIRTBE' +
        'NEF,'
      
        '       BP.IDREGRACALCULO, BP.IDREGRAPRIMPAGTO, BP.IDREGRAULTPAGT' +
        'O,'
      
        '       B.IDTPPAGTOBENEFIC, BP.CODPORTFORMA, BP.FLGCALCTODOMES, B' +
        '.FLGRESGATE,'
      '       EG.FLGINTERNO, PP.IDSITPART,'
      
        '       DECODE(BF.FLGDATAPREVISTA,1, BF.DATAFINALPREVISTA, BF.DAT' +
        'AFINAL) AS DATAFINALANT,'
      '       Decode(BF.IDSITBENEFICIO, 1,'#39'Normal'#39','
      '                                 2,'#39'Retido'#39','
      '                                 3,'#39'Encerrado'#39','
      '                                 4,'#39'Pendente de Concessão'#39','
      
        '                                 5,'#39'Encerrado por Morte do Benef' +
        'iciário'#39','
      '                                 6,'#39'Nao Concedido'#39','
      
        '                                 7,'#39'Concedido em Exigência'#39') AS ' +
        'SITUACAO'
      
        'FROM  PROCESSOBENEF P, BENEFBFCIARIO BF, PARTPREVPLAN PP, BENEFP' +
        'LANPREV BP, PESSOA PES,'
      '      DEPENTIT DEP, BENEFICIO B, EVENTOGERADOR EG'
      'WHERE BF.NUMEROPROCESSO  = :NUMEROPROCESSO'
      'AND   BF.IDTITULAR       = :IDTITULAR'
      'AND   BF.IDPESSJUR       = :IDPESSJUR'
      'AND   BF.IDPLANOPREV     = :IDPLANOPREV'
      'AND   BF.IDSITBENEFICIO IN (2,7,1)'
      'AND   BF.IDPESSOA        = PES.IDPESSOA'
      'AND   DEP.IDTITULAR      = BF.IDTITULAR'
      'AND   DEP.IDPESSOA       = BF.IDPESSOA'
      'AND   BF.IDBENEFICIO     = B.IDBENEFICIO'
      'AND   BP.IDPLANOPREV     = BF.IDPLANOPREV'
      'AND   BP.IDBENEFICIO     = BF.IDBENEFICIO'
      'AND   P.NUMEROPROCESSO   = BF.NUMEROPROCESSO'
      'AND   PP.IDPESSJUR       = BF.IDPESSJUR'
      'AND   PP.IDPLANOPREV     = BF.IDPLANOPREV'
      'AND   PP.IDPESSOA        = BF.IDTITULAR'
      'AND   PP.SEQPROPOSTA     = BF.SEQPROPOSTA'
      'AND   EG.IDEVENTOGERADOR = P.IDEVENTOGERADOR'
      'ORDER BY B.NOME, PES.NOME'
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ControlType.Strings = (
      'FLGLIBERA;CheckBox;1;0')
    ValidateWithMask = True
    Left = 188
    Top = 208
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMEROPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
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
      end>
  end
  object MontaSelectOLD: TMontaSelect
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
      'PP.IDPLANOPREV = B.IDPLANOPREV'
      'PP.IDPESSJUR = EL.IDPESSJUR'
      'PP.IDPESSOA = EL.IDPESSOA'
      'PP.FLGDESATIVADO = 0'
      'DT.IDTITULAR = B.IDTITULAR'
      'DT.IDPESSOA  = B.IDPESSOA'
      'DT.IDPESSOA = PD.IDPESSOA'
      
        '( B.IDSITBENEFICIO IN (2,7) OR ( (B.IDSITBENEFICIO = 1) AND (BPL' +
        '.FLGREFERENCIA = 1) AND (B.FLGPAGAINSS = 0) ) )')
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
    LookupSQL.Strings = (
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
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 102
    Top = 337
  end
  object dsTitular: TwwDataSource
    DataSet = qryTitular
    Left = 100
    Top = 279
  end
  object qryHstBenefAntesLiberar: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MESREFERENCIA, IDPESSOA, IDBENEFICIO,'
      
        '       SUM(DECODE(FLGDEVOLUCAO,1,-(NVL(VLBENEFPGTO,VALORPREV)),(' +
        'NVL(VLBENEFPGTO,VALORPREV)) ) ) AS TOTALRETIDO'
      'FROM   HSTBENEFBFCIARIO'
      'WHERE  NUMEROPROCESSO = :NUMEROPROCESSO'
      'AND    FLGENVIADO     = 9'
      'GROUP  BY MESREFERENCIA, IDPESSOA, IDBENEFICIO'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 531
    Top = 208
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMEROPROCESSO'
        ParamType = ptUnknown
      end>
  end
  object qryBenefRecalculo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.NOME AS NOMEBENEFICIARIO,'
      
        '       BF.IDPESSOA,       BF.IDTITULAR,      BF.IDPLANOPREV,    ' +
        'BF.IDPLANOORIGEM ,'
      
        '       BF.SEQPROPOSTA,    BF.IDPESSJUR,      BF.IDBENEFICIO,    ' +
        'BF.NUMEROPROCESSO,'
      
        '       BF.NUMPROCINSS,    BF.VALORATUAL,     BF.VALORCALCULADO, ' +
        'BF.VALORCOTAS,'
      
        '       BF.VALORTOTAL,     BF.VLRCALCINSS,    BF.VLRINFINSS,     ' +
        'BF.DATAFINAL,'
      
        '       BF.DATAINICIO,     BF.DATAINICIOFUND, BF.DATAINICIOINSS, ' +
        'BF.DATAREQUERIMENTO,               '
      '       BF.IDSITBENEFICIO, BF.IDTPPAGTOBENEFIC,'
      '       NVL( BF.IDTITBENEF, -1 ) AS IDTITBENEF, '
      '       BF.VALORBASE1,     BF.VALORBASE2,'
      
        '       BF.VALORBASE3,     BF.FLGDATAPREVISTA,BF.ULTMESREAJUSTE, ' +
        'BF.VALORSRB,'
      
        '    --   DECODE(BF.FLGDATAPREVISTA,1,BF.DATAFINALPREVISTA,BF.DAT' +
        'AFINAL) AS DATAFINALREAL, -- Peterson Victor SOL 269297'
      '       BF.DATAFINAL AS DATAFINALREAL,'
      '       BF.DIBBENEFANT, BP.FLGREFERENCIA,BF.FLGPAGAINSS,'
      '       BF.FLGPROVISORIO, BF.PRAZOPROVISORIO, BF.PERCPROVISORIO,'
      '       B.NOME,'
      '       NVL(BF.CODPORTFORMA,BP.CODPORTFORMA) AS CODPORTFORMA,'
      '       BTP.PERCENTUAL, DP.MATRICULA,'
      
        '       DP.IDDEPENDENCIA , BAUX.NUMBENEF, BP.IDREGRAPRIMPAGTO, BP' +
        '.IDREGRAULTPAGTO,'
      '       BP.IDREGRACALCULO, BP.FLGCALCTODOMES,'
      '       -- Inicio -  edilaine - SOL 253577-18064 / PPM 1240079'
      '       BF.VLRBSTOTAL,'
      '       BF.VLRFABTOTAL,'
      '       --Inicio - Helio - SOL Nº 253577/17514 PPM Nº 971383'
      '       BF.VLRBSATUAL,'
      '       BF.VLRFABATUAL,'
      '       BF.VLRBASEDEFICIT,'
      '       BP.FLGAPRESENTABSFAB,'
      '       BP.FLGAPRESENTADEFICIT,'
      '       --Fim - Helio - SOL Nº 253577/17514 PPM Nº 971383'
      '       NVL(BF.IDPERFILINVEST, -1) AS IDPERFILINVEST,'
      
        '       MOVANT.VALORTOTALANT,  MOVANT.VALORATUALANT,       /*SIG1' +
        '21009*/'
      
        '       DECODE(B.IDEVENTOGERADOR, 8, 1, 366, 1, 370, 1, 0) AS FLG' +
        'INVALIDEZ     /*SIG121019*/'
      
        'FROM   PESSOA P, BENEFBFCIARIO BF, BFCIARIOTITPLAN BTP,  BENEFIC' +
        'IO B,  BENEFPLANPREV BP, DEPENTIT DP,'
      
        '       ( SELECT IDBENEFICIO, COUNT(DISTINCT IDPESSOA) AS NUMBENE' +
        'F'
      '         FROM   BENEFBFCIARIO'
      '         WHERE  NUMEROPROCESSO = :NUMEROPROCESSO'
      '         AND    IDSITBENEFICIO <> 3'
      '         GROUP BY IDBENEFICIO                 ) BAUX,'
      '       /*SIG121009*/'
      
        '       (SELECT M.VALORTOTAL AS VALORTOTALANT, M.VALORATUAL AS VA' +
        'LORATUALANT, M.IDBENEFICIO'
      '          FROM MOVBENEF M'
      '         WHERE M.NUMEROPROCESSO = :NUMEROPROCESSO'
      '           AND M.TIPOMOV IN (3,4,13)'
      '           AND M.IDMOVBENEF = (SELECT MAX(M1.IDMOVBENEF)'
      '                                 FROM MOVBENEF M1'
      
        '                                WHERE M1.NUMEROPROCESSO = :NUMER' +
        'OPROCESSO'
      '                                  /*WO39059 Leandro */'
      
        '                                  AND to_char(M1.DATAMOV,'#39'yyyy/m' +
        'm'#39') < to_char(:DATA_LIBERACAO,'#39'yyyy/mm'#39')'
      '                                  /*WO39059 Leandro */'
      '                                  AND M1.TIPOMOV IN (3,4,13)'
      '                              )'
      '       ) MOVANT'
      '       /*SIG121009*/'
      'WHERE  (BF.NUMEROPROCESSO = :NUMEROPROCESSO)'
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
      'AND    (BP.IDPLANOPREV    = BF.IDPLANOPREV)'
      'AND    (BP.IDBENEFICIO    = BF.IDBENEFICIO)'
      'AND    (P.IDPESSOA        = BF.IDPESSOA)'
      'AND    (MOVANT.IDBENEFICIO  = BF.IDBENEFICIO)     /*SIG121009*/'
      'ORDER BY BF.IDBENEFICIO, BF.IDPESSOA'
      ' '
      ' '
      ' '
      ' '
      ' '
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
    Left = 627
    Top = 248
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NUMEROPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NUMEROPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NUMEROPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATA_LIBERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
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
      ''
      ''
      ''
      ''
      ''
      '')
    ControlType.Strings = (
      'FLGPROVISORIO;CheckBox;1;0'
      'FLGPOSSUIACOMPINSS;CheckBox;1;0')
    PictureMasks.Strings = (
      
        'PERCPROVISORIO'#9'{{{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-' +
        ']#[#][#]]],({{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[#' +
        '][#]]]),[-]{{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[#]' +
        '[#]]]}'#9'T'#9'F')
    ValidateWithMask = True
    Left = 427
    Top = 208
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMEROPROCESSO'
        ParamType = ptUnknown
      end>
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
      'PP.IDPLANOPREV = B.IDPLANOORIGEM'
      'PP.IDPESSJUR = EL.IDPESSJUR'
      'PP.IDPESSOA = EL.IDPESSOA'
      'DT.IDTITULAR = B.IDTITULAR'
      'DT.IDPESSOA  = B.IDPESSOA'
      'DT.IDPESSOA = PD.IDPESSOA'
      
        '( B.IDSITBENEFICIO IN (2,7) OR ( (B.IDSITBENEFICIO = 1) AND (BPL' +
        '.FLGREFERENCIA = 1) AND (B.FLGPAGAINSS = 0) ) )'
      'P.IDSITPROCESSO IN (1,2,9,3)')
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
      '-1'
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
    Left = 46
    Top = 353
  end
  object qryVirtual: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select  '#39'                                '#39' as NUMEROPROCESSO,'
      '        '#39'                                '#39' as IDPLANOPREV,'
      '        '#39'                                '#39' as IDTITULAR,'
      '        '#39'                                '#39' as IDPESSJUR,'
      '        '#39'                                '#39' as IDBENEFICIO,'
      '        '#39'                                '#39' as IDPESSOA,'
      '        '#39'                                '#39' as SEQPROPOSTA,'
      '        '#39'                                '#39' as DTINICIOLIBERACAO'
      'FROM DUAL      '
      ' ')
    UpdateObject = updVirtual
    ControlType.Strings = (
      'FLGLIBERA;CheckBox;1;0')
    ValidateWithMask = True
    Left = 180
    Top = 280
    object qryVirtualNUMEROPROCESSO: TStringField
      FieldName = 'NUMEROPROCESSO'
      FixedChar = True
      Size = 32
    end
    object qryVirtualIDPLANOPREV: TStringField
      FieldName = 'IDPLANOPREV'
      FixedChar = True
      Size = 32
    end
    object qryVirtualIDTITULAR: TStringField
      FieldName = 'IDTITULAR'
      FixedChar = True
      Size = 32
    end
    object qryVirtualIDPESSJUR: TStringField
      FieldName = 'IDPESSJUR'
      FixedChar = True
      Size = 32
    end
    object qryVirtualIDBENEFICIO: TStringField
      FieldName = 'IDBENEFICIO'
      FixedChar = True
      Size = 32
    end
    object qryVirtualIDPESSOA: TStringField
      FieldName = 'IDPESSOA'
      FixedChar = True
      Size = 32
    end
    object qryVirtualSEQPROPOSTA: TStringField
      FieldName = 'SEQPROPOSTA'
      FixedChar = True
      Size = 32
    end
    object qryVirtualDTINICIOLIBERACAO: TStringField
      FieldName = 'DTINICIOLIBERACAO'
      FixedChar = True
      Size = 32
    end
  end
  object dsVirtual: TwwDataSource
    DataSet = qryVirtual
    Left = 324
    Top = 288
  end
  object updVirtual: TUpdateSQL
    ModifySQL.Strings = (
      ''
      ' ')
    InsertSQL.Strings = (
      'insert into dual (NUMEROPROCESSO,'
      '       IDPLANOPREV,'
      '       IDTITULAR,'
      '       IDPESSJUR,'
      '       IDBENEFICIO,'
      '       IDPESSOA,'
      '       SEQPROPOSTA,'
      '       DTINICIOLIBERACAO)'
      'values (:NUMEROPROCESSO, '
      '       :IDPLANOPREV,'
      '       :IDTITULAR,'
      '       :IDPESSJUR,'
      '       :IDBENEFICIO,'
      '       :IDPESSOA,'
      '       :SEQPROPOSTA,'
      '       :DTINICIOLIBERACAO)'
      ' ')
    Left = 252
    Top = 279
  end
  object qryHstbenef: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BASEDADOS'
    RequestLive = True
    SQL.Strings = (
      
        'SELECT  IDTITULAR,IDPESSJUR, IDPLANOPREV, IDBENEFICIO, IDMOTIVO,' +
        ' IDPESSOA, NUMEROPROCESSO, MES,'
      
        '        VLBENEFPGTO, IDREGRAABATERESE, IDRETROATIVO, SEQBENEFICI' +
        'O, SEQPROPOSTA, IDREGRACALCULO, '
      
        '        IDLOTE, DTEFETPGTO, VALORPREV, DATAPAGAMENTO, CODPORTFOR' +
        'MA, VALORBASE1, VALORBASE2, '
      
        '        VALORBASE3, VALORBASE4, VALORBASE5, VALORCALCULADO, FLGA' +
        'CERTODESFEITO, VALOROP1, VALOROP2, '
      
        '        VALOROP3, CODREFERENCIA, FLGENVIADO, MESREFERENCIA, VLRT' +
        'OTRETROATIVO, VLRDIFRETROATIVO, '
      
        '        FLGCONCESSAO, FLGDEVOLUCAO, FLGFORMAPAGTO, VALORTOTAL, F' +
        'ONTEPAGADORA, CODDOCUMENTO, '
      
        '        TRGDTINCLUSAO, TRGUSERINCLUSAO, IDAGENCIARESGATE, VALORI' +
        'NTEGRAL, VALORPREVMIN, '
      
        '        IDREGRABENEFMIN, IDHSTFOLHABENEF, FLGDESCIRMES, VALORSRB' +
        ', PERCPROVISORIO, FLGMANUAL, '
      
        '        IDPLANOORIGEM, FLGPROVISORIO, IDTITBENEF, VALORACERTO, I' +
        'DSEQINTERNOFB, IDMOVBENEF, PERCENTUAL, '
      
        '        FLGTIPOREGISTRO, FLGALIMRESERVA, LOTEORIGINAL, MESCOMPRE' +
        'EM'
      '   FROM HSTBENEFBFCIARIO'
      '  WHERE IDPLANOPREV    =  :p_idplanoprev'
      '    AND IDBENEFICIO    =  :p_idbeneficio'
      '    AND MES            >= :P_MES '
      '    AND NUMEROPROCESSO =  :p_numeroprocesso '
      '    AND IDPESSJUR      =  :P_IDPESSJUR'
      '    AND IDTITULAR      =  :P_IDTITULAR '
      '    AND IDPESSOA       =  :P_IDPESSOA'
      '    AND SEQPROPOSTA    =  :P_SEQPROPOSTA'
      '    AND (FLGENVIADO    =  9) '
      '    ')
    UpdateObject = updHstBenef
    ValidateWithMask = True
    Left = 424
    Top = 288
    ParamData = <
      item
        DataType = ftString
        Name = 'p_idplanoprev'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'p_idbeneficio'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'P_MES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'p_numeroprocesso'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'P_IDPESSJUR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'P_IDTITULAR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'P_IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'P_SEQPROPOSTA'
        ParamType = ptInput
      end>
    object qryHstbenefIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
      Origin = 'BASEDADOS.HSTBENEFBFCIARIO.IDTITULAR'
    end
    object qryHstbenefIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
      Origin = 'BASEDADOS.HSTBENEFBFCIARIO.IDPESSJUR'
    end
    object qryHstbenefIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.HSTBENEFBFCIARIO.IDPLANOPREV'
    end
    object qryHstbenefIDBENEFICIO: TFloatField
      FieldName = 'IDBENEFICIO'
      Origin = 'BASEDADOS.HSTBENEFBFCIARIO.IDBENEFICIO'
    end
    object qryHstbenefIDMOTIVO: TFloatField
      FieldName = 'IDMOTIVO'
      Origin = 'BASEDADOS.HSTBENEFBFCIARIO.IDMOTIVO'
    end
    object qryHstbenefIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.HSTBENEFBFCIARIO.IDPESSOA'
    end
    object qryHstbenefNUMEROPROCESSO: TFloatField
      FieldName = 'NUMEROPROCESSO'
      Origin = 'BASEDADOS.HSTBENEFBFCIARIO.NUMEROPROCESSO'
    end
    object qryHstbenefMES: TStringField
      FieldName = 'MES'
      Origin = 'BASEDADOS.HSTBENEFBFCIARIO.MES'
      FixedChar = True
      Size = 7
    end
    object qryHstbenefVLBENEFPGTO: TFloatField
      FieldName = 'VLBENEFPGTO'
      Origin = 'BASEDADOS.HSTBENEFBFCIARIO.VLBENEFPGTO'
    end
    object qryHstbenefIDREGRAABATERESE: TFloatField
      FieldName = 'IDREGRAABATERESE'
      Origin = 'BASEDADOS.HSTBENEFBFCIARIO.IDREGRAABATERESE'
    end
    object qryHstbenefIDRETROATIVO: TFloatField
      FieldName = 'IDRETROATIVO'
      Origin = 'BASEDADOS.HSTBENEFBFCIARIO.IDRETROATIVO'
    end
    object qryHstbenefSEQBENEFICIO: TFloatField
      FieldName = 'SEQBENEFICIO'
      Origin = 'BASEDADOS.HSTBENEFBFCIARIO.SEQBENEFICIO'
    end
    object qryHstbenefSEQPROPOSTA: TFloatField
      FieldName = 'SEQPROPOSTA'
      Origin = 'BASEDADOS.HSTBENEFBFCIARIO.SEQPROPOSTA'
    end
    object qryHstbenefIDREGRACALCULO: TFloatField
      FieldName = 'IDREGRACALCULO'
      Origin = 'BASEDADOS.HSTBENEFBFCIARIO.IDREGRACALCULO'
    end
    object qryHstbenefIDLOTE: TFloatField
      FieldName = 'IDLOTE'
      Origin = 'BASEDADOS.HSTBENEFBFCIARIO.IDLOTE'
    end
    object qryHstbenefDTEFETPGTO: TDateTimeField
      FieldName = 'DTEFETPGTO'
      Origin = 'BASEDADOS.HSTBENEFBFCIARIO.DTEFETPGTO'
    end
    object qryHstbenefVALORPREV: TFloatField
      FieldName = 'VALORPREV'
      Origin = 'BASEDADOS.HSTBENEFBFCIARIO.VALORPREV'
    end
    object qryHstbenefDATAPAGAMENTO: TDateTimeField
      FieldName = 'DATAPAGAMENTO'
      Origin = 'BASEDADOS.HSTBENEFBFCIARIO.DATAPAGAMENTO'
    end
    object qryHstbenefCODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
      Origin = 'BASEDADOS.HSTBENEFBFCIARIO.CODPORTFORMA'
    end
    object qryHstbenefVALORBASE1: TFloatField
      FieldName = 'VALORBASE1'
      Origin = 'BASEDADOS.HSTBENEFBFCIARIO.VALORBASE1'
    end
    object qryHstbenefVALORBASE2: TFloatField
      FieldName = 'VALORBASE2'
      Origin = 'BASEDADOS.HSTBENEFBFCIARIO.VALORBASE2'
    end
    object qryHstbenefVALORBASE3: TFloatField
      FieldName = 'VALORBASE3'
      Origin = 'BASEDADOS.HSTBENEFBFCIARIO.VALORBASE3'
    end
    object qryHstbenefVALORBASE4: TFloatField
      FieldName = 'VALORBASE4'
      Origin = 'BASEDADOS.HSTBENEFBFCIARIO.VALORBASE4'
    end
    object qryHstbenefVALORBASE5: TFloatField
      FieldName = 'VALORBASE5'
      Origin = 'BASEDADOS.HSTBENEFBFCIARIO.VALORBASE5'
    end
    object qryHstbenefVALORCALCULADO: TFloatField
      FieldName = 'VALORCALCULADO'
      Origin = 'BASEDADOS.HSTBENEFBFCIARIO.VALORCALCULADO'
    end
    object qryHstbenefFLGACERTODESFEITO: TFloatField
      FieldName = 'FLGACERTODESFEITO'
      Origin = 'BASEDADOS.HSTBENEFBFCIARIO.FLGACERTODESFEITO'
    end
    object qryHstbenefVALOROP1: TFloatField
      FieldName = 'VALOROP1'
      Origin = 'BASEDADOS.HSTBENEFBFCIARIO.VALOROP1'
    end
    object qryHstbenefVALOROP2: TFloatField
      FieldName = 'VALOROP2'
      Origin = 'BASEDADOS.HSTBENEFBFCIARIO.VALOROP2'
    end
    object qryHstbenefVALOROP3: TFloatField
      FieldName = 'VALOROP3'
      Origin = 'BASEDADOS.HSTBENEFBFCIARIO.VALOROP3'
    end
    object qryHstbenefCODREFERENCIA: TStringField
      FieldName = 'CODREFERENCIA'
      Origin = 'BASEDADOS.HSTBENEFBFCIARIO.CODREFERENCIA'
      Size = 30
    end
    object qryHstbenefFLGENVIADO: TFloatField
      FieldName = 'FLGENVIADO'
      Origin = 'BASEDADOS.HSTBENEFBFCIARIO.FLGENVIADO'
    end
    object qryHstbenefMESREFERENCIA: TStringField
      FieldName = 'MESREFERENCIA'
      Origin = 'BASEDADOS.HSTBENEFBFCIARIO.MESREFERENCIA'
      FixedChar = True
      Size = 7
    end
    object qryHstbenefVLRTOTRETROATIVO: TFloatField
      FieldName = 'VLRTOTRETROATIVO'
      Origin = 'BASEDADOS.HSTBENEFBFCIARIO.VLRTOTRETROATIVO'
    end
    object qryHstbenefVLRDIFRETROATIVO: TFloatField
      FieldName = 'VLRDIFRETROATIVO'
      Origin = 'BASEDADOS.HSTBENEFBFCIARIO.VLRDIFRETROATIVO'
    end
    object qryHstbenefFLGCONCESSAO: TFloatField
      FieldName = 'FLGCONCESSAO'
      Origin = 'BASEDADOS.HSTBENEFBFCIARIO.FLGCONCESSAO'
    end
    object qryHstbenefFLGDEVOLUCAO: TFloatField
      FieldName = 'FLGDEVOLUCAO'
      Origin = 'BASEDADOS.HSTBENEFBFCIARIO.FLGDEVOLUCAO'
    end
    object qryHstbenefFLGFORMAPAGTO: TStringField
      FieldName = 'FLGFORMAPAGTO'
      Origin = 'BASEDADOS.HSTBENEFBFCIARIO.FLGFORMAPAGTO'
      FixedChar = True
      Size = 1
    end
    object qryHstbenefVALORTOTAL: TFloatField
      FieldName = 'VALORTOTAL'
      Origin = 'BASEDADOS.HSTBENEFBFCIARIO.VALORTOTAL'
    end
    object qryHstbenefFONTEPAGADORA: TFloatField
      FieldName = 'FONTEPAGADORA'
      Origin = 'BASEDADOS.HSTBENEFBFCIARIO.FONTEPAGADORA'
    end
    object qryHstbenefCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Origin = 'BASEDADOS.HSTBENEFBFCIARIO.CODDOCUMENTO'
    end
    object qryHstbenefTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.HSTBENEFBFCIARIO.TRGDTINCLUSAO'
    end
    object qryHstbenefTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.HSTBENEFBFCIARIO.TRGUSERINCLUSAO'
      Size = 30
    end
    object qryHstbenefIDAGENCIARESGATE: TFloatField
      FieldName = 'IDAGENCIARESGATE'
      Origin = 'BASEDADOS.HSTBENEFBFCIARIO.IDAGENCIARESGATE'
    end
    object qryHstbenefVALORINTEGRAL: TFloatField
      FieldName = 'VALORINTEGRAL'
      Origin = 'BASEDADOS.HSTBENEFBFCIARIO.VALORINTEGRAL'
    end
    object qryHstbenefVALORPREVMIN: TFloatField
      FieldName = 'VALORPREVMIN'
      Origin = 'BASEDADOS.HSTBENEFBFCIARIO.VALORPREVMIN'
    end
    object qryHstbenefIDREGRABENEFMIN: TFloatField
      FieldName = 'IDREGRABENEFMIN'
      Origin = 'BASEDADOS.HSTBENEFBFCIARIO.IDREGRABENEFMIN'
    end
    object qryHstbenefIDHSTFOLHABENEF: TFloatField
      FieldName = 'IDHSTFOLHABENEF'
      Origin = 'BASEDADOS.HSTBENEFBFCIARIO.IDHSTFOLHABENEF'
    end
    object qryHstbenefFLGDESCIRMES: TFloatField
      FieldName = 'FLGDESCIRMES'
      Origin = 'BASEDADOS.HSTBENEFBFCIARIO.FLGDESCIRMES'
    end
    object qryHstbenefVALORSRB: TFloatField
      FieldName = 'VALORSRB'
      Origin = 'BASEDADOS.HSTBENEFBFCIARIO.VALORSRB'
    end
    object qryHstbenefPERCPROVISORIO: TFloatField
      FieldName = 'PERCPROVISORIO'
      Origin = 'BASEDADOS.HSTBENEFBFCIARIO.PERCPROVISORIO'
    end
    object qryHstbenefFLGMANUAL: TFloatField
      FieldName = 'FLGMANUAL'
      Origin = 'BASEDADOS.HSTBENEFBFCIARIO.FLGMANUAL'
    end
    object qryHstbenefIDPLANOORIGEM: TFloatField
      FieldName = 'IDPLANOORIGEM'
      Origin = 'BASEDADOS.HSTBENEFBFCIARIO.IDPLANOORIGEM'
    end
    object qryHstbenefFLGPROVISORIO: TFloatField
      FieldName = 'FLGPROVISORIO'
      Origin = 'BASEDADOS.HSTBENEFBFCIARIO.FLGPROVISORIO'
    end
    object qryHstbenefIDTITBENEF: TFloatField
      FieldName = 'IDTITBENEF'
      Origin = 'BASEDADOS.HSTBENEFBFCIARIO.IDTITBENEF'
    end
    object qryHstbenefVALORACERTO: TFloatField
      FieldName = 'VALORACERTO'
      Origin = 'BASEDADOS.HSTBENEFBFCIARIO.VALORACERTO'
    end
    object qryHstbenefIDSEQINTERNOFB: TFloatField
      FieldName = 'IDSEQINTERNOFB'
      Origin = 'BASEDADOS.HSTBENEFBFCIARIO.IDSEQINTERNOFB'
    end
    object qryHstbenefIDMOVBENEF: TFloatField
      FieldName = 'IDMOVBENEF'
      Origin = 'BASEDADOS.HSTBENEFBFCIARIO.IDMOVBENEF'
    end
    object qryHstbenefPERCENTUAL: TFloatField
      FieldName = 'PERCENTUAL'
      Origin = 'BASEDADOS.HSTBENEFBFCIARIO.PERCENTUAL'
    end
    object qryHstbenefFLGTIPOREGISTRO: TFloatField
      FieldName = 'FLGTIPOREGISTRO'
      Origin = 'BASEDADOS.HSTBENEFBFCIARIO.FLGTIPOREGISTRO'
    end
    object qryHstbenefFLGALIMRESERVA: TFloatField
      FieldName = 'FLGALIMRESERVA'
      Origin = 'BASEDADOS.HSTBENEFBFCIARIO.FLGALIMRESERVA'
    end
    object qryHstbenefLOTEORIGINAL: TFloatField
      FieldName = 'LOTEORIGINAL'
      Origin = 'BASEDADOS.HSTBENEFBFCIARIO.LOTEORIGINAL'
    end
    object qryHstbenefMESCOMPREEM: TStringField
      FieldName = 'MESCOMPREEM'
      Origin = 'BASEDADOS.HSTBENEFBFCIARIO.MESCOMPREEM'
      FixedChar = True
      Size = 7
    end
  end
  object updHstBenef: TUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO HSTBENEFI'
      '      ( IDTITULAR,'
      '        IDPESSJUR,'
      '        IDPLANOPREV,'
      '        IDBENEFICIO,'
      '        IDMOTIVO,'
      '        IDPESSOA,'
      '        NUMEROPROCESSO,'
      '        MES,'
      '        VLBENEFPGTO,'
      '        IDREGRAABATERESE,'
      '        IDRETROATIVO,'
      '        SEQBENEFICIO,'
      '        SEQPROPOSTA,'
      '        IDREGRACALCULO,'
      '        IDLOTE,'
      '        DTEFETPGTO,'
      '        VALORPREV,'
      '        DATAPAGAMENTO,'
      '        CODPORTFORMA,'
      '        VALORBASE1,'
      '        VALORBASE2,'
      '        VALORBASE3,'
      '        VALORBASE4,'
      '        VALORBASE5,'
      '        VALORCALCULADO,'
      '        FLGACERTODESFEITO,'
      '        VALOROP1,'
      '        VALOROP2,'
      '        VALOROP3,'
      '        CODREFERENCIA,'
      '        FLGENVIADO,'
      '        MESREFERENCIA,'
      '        VLRTOTRETROATIVO,'
      '        VLRDIFRETROATIVO,'
      '        FLGCONCESSAO,'
      '        FLGDEVOLUCAO,'
      '        FLGFORMAPAGTO,'
      '        VALORTOTAL,'
      '        FONTEPAGADORA,'
      '        CODDOCUMENTO,'
      '        TRGDTINCLUSAO,'
      '        TRGUSERINCLUSAO,'
      '        IDAGENCIARESGATE,'
      '        VALORINTEGRAL,'
      '        VALORPREVMIN,'
      '        IDREGRABENEFMIN,'
      '        IDHSTFOLHABENEF,'
      '        FLGDESCIRMES,'
      '        VALORSRB,'
      '        PERCPROVISORIO,'
      '        FLGMANUAL,'
      '        IDPLANOORIGEM,'
      '        FLGPROVISORIO,'
      '        IDTITBENEF,'
      '        VALORACERTO,'
      '        IDSEQINTERNOFB,'
      '        IDMOVBENEF,'
      '        PERCENTUAL,'
      '        FLGTIPOREGISTRO,'
      '        FLGALIMRESERVA,'
      '        LOTEORIGINAL,'
      '        MESCOMPREEM )'
      'values ( :IDTITULAR,'
      '              :IDPESSJUR,'
      '              :IDPLANOPREV,'
      '              :IDBENEFICIO,'
      '              :IDMOTIVO,'
      '              :IDPESSOA,'
      '              :NUMEROPROCESSO,'
      '              :MES,'
      '              :VLBENEFPGTO,'
      '              :IDREGRAABATERESE,              '
      '              :IDRETROATIVO,'
      '              :SEQBENEFICIO,'
      '              :SEQPROPOSTA,'
      '              :IDREGRACALCULO,'
      '              :IDLOTE,'
      '              :DTEFETPGTO,'
      '              :VALORPREV,'
      '              :DATAPAGAMENTO,'
      '              :CODPORTFORMA,'
      '              :VALORBASE1,'
      '              :VALORBASE2,'
      '              :VALORBASE3,'
      '              :VALORBASE4,'
      '              :VALORBASE5,'
      '              :VALORCALCULADO,'
      '              :FLGACERTODESFEITO,'
      '              :VALOROP1,'
      '              :VALOROP2,'
      '              :VALOROP3,'
      '              :CODREFERENCIA,'
      '              :FLGENVIADO,'
      '              :MESREFERENCIA,'
      '              :VLRTOTRETROATIVO,'
      '              :VLRDIFRETROATIVO,'
      '              :FLGCONCESSAO,'
      '              :FLGDEVOLUCAO,'
      '              :FLGFORMAPAGTO,'
      '              :VALORTOTAL,'
      '              :FONTEPAGADORA,'
      '              :CODDOCUMENTO,'
      '              :TRGDTINCLUSAO,'
      '              :TRGUSERINCLUSAO,'
      '              :IDAGENCIARESGATE,'
      '              :VALORINTEGRAL,'
      '              :VALORPREVMIN,'
      '              :IDREGRABENEFMIN,'
      '              :IDHSTFOLHABENEF,'
      '              :FLGDESCIRMES,'
      '              :VALORSRB,'
      '              :PERCPROVISORIO,'
      '              :FLGMANUAL,'
      '              :IDPLANOORIGEM,'
      '              :FLGPROVISORIO,'
      '              :IDTITBENEF,'
      '              :VALORACERTO,'
      '              :IDSEQINTERNOFB,'
      '              :IDMOVBENEF,'
      '              :PERCENTUAL,'
      '              :FLGTIPOREGISTRO,'
      '              :FLGALIMRESERVA,'
      '              :LOTEORIGINAL,'
      '              :MESCOMPREEM)'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM HSTBENEFBFCIARIO'
      '  WHERE IDPLANOPREV    =  :p_idplanoprev'
      '    AND IDBENEFICIO    =  :p_idbeneficio'
      '    AND MES            >= :P_MES '
      '    AND NUMEROPROCESSO =  :p_numeroprocesso '
      '    AND IDPESSJUR      =  :P_IDPESSJUR'
      '    AND IDTITULAR      =  :P_IDTITULAR '
      '    AND IDPESSOA       =  :P_IDPESSOA'
      '    AND SEQPROPOSTA    =  :P_SEQPROPOSTA'
      '    AND FLGENVIADO     =  9'
      '    ')
    Left = 488
    Top = 288
  end
  object dsHstbenef: TwwDataSource
    DataSet = qryHstbenef
    Left = 560
    Top = 288
  end
  object qryWork: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 355
    Top = 152
  end
end
