inherited FrmProvPerdasLote: TFrmProvPerdasLote
  Left = 385
  Top = 130
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Provisão para Perdas em Lote'
  ClientHeight = 473
  ClientWidth = 818
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 818
    Height = 434
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 816
      Height = 96
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object grpMesAnoRef: TGroupBox
        Left = 6
        Top = 8
        Width = 275
        Height = 49
        Caption = 'Mês e Ano de Cobrança (Competência)'
        TabOrder = 0
        object cmbMesCob: TComboBox
          Left = 6
          Top = 16
          Width = 187
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 0
          Items.Strings = (
            'janeiro'
            'fevereiro'
            'março'
            'abril'
            'maio'
            'junho'
            'julho'
            'agosto'
            'setembro '
            'outubro'
            'novembro'
            'dezembro')
        end
        object spedAnoCob: TSpinEdit
          Left = 198
          Top = 16
          Width = 55
          Height = 22
          MaxLength = 4
          MaxValue = 0
          MinValue = 0
          TabOrder = 1
          Value = 1998
        end
      end
      object bbtnEnviar: TBitBtn
        Left = 699
        Top = 1
        Width = 107
        Height = 38
        Anchors = [akTop, akRight]
        Caption = '&Processar '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = bbtnEnviarClick
        Glyph.Data = {
          06010000424D060100000000000076000000280000000B000000120000000100
          0400000000009000000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333333A
          000033833333333F00003088333333380000300883333337000030A088333338
          000030AA088333300000307A70883338000030AAAA08833F000030A7A7A08837
          000030AAAAAA03300000307A7A703338000030AAAA033338000030A7A0333330
          000030AA0333333800003070333333380000300333333338000030333333333F
          00003333333333300000}
        Margin = 12
        Spacing = 8
      end
      object bbtnDesfazer: TBitBtn
        Left = 699
        Top = 42
        Width = 107
        Height = 38
        Anchors = [akTop, akRight]
        Caption = '&Desfazer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = bbtnDesfazerClick
        Glyph.Data = {
          06010000424D060100000000000076000000280000000B000000120000000100
          0400000000009000000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333330
          0000333333338330000033333338803000003333338800300000333338809030
          0000333388099030000033388079703000003388099990300000388097979030
          0000330999999030000033307979703000003333099990300000333330979030
          0000333333099030000033333330703000003333333300300000333333333030
          00003333333333300000}
        Margin = 12
        Spacing = 8
      end
    end
    object pgctrlOpcoes: TPageControl
      Left = 1
      Top = 97
      Width = 816
      Height = 336
      ActivePage = tbsBasico
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object tbsBasico: TTabSheet
        Caption = 'Opções'
        object pnlTabSheet1: TPanel
          Left = 0
          Top = 0
          Width = 808
          Height = 308
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 0
          object Label7: TLabel
            Left = 6
            Top = 107
            Width = 107
            Height = 13
            Caption = 'Planos Previdenciários'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbPatro: TLabel
            Left = 6
            Top = 5
            Width = 71
            Height = 13
            Caption = 'Patrocinadoras'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object chklstPlano: TCheckListBox
            Left = 6
            Top = 120
            Width = 397
            Height = 116
            Columns = 2
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            ParentFont = False
            TabOrder = 1
          end
          object chklstPatro: TCheckListBox
            Left = 6
            Top = 19
            Width = 397
            Height = 81
            OnClickCheck = chklstPatroClickCheck
            Columns = 2
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            ParentFont = False
            TabOrder = 0
          end
        end
      end
      object tbsResultado: TTabSheet
        Caption = 'Resultado'
        object pnlTabResu: TPanel
          Left = 0
          Top = 0
          Width = 808
          Height = 308
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 0
          object bbtnSalvar: TBitBtn
            Left = 615
            Top = 5
            Width = 95
            Height = 35
            Caption = 'S&alvar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            OnClick = bbtnSalvarClick
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000010000000000000000000
              BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
              7777770000000000007770330770000330777033077000033077703307700003
              30777033000000033077703333333333307770330000000330777030FFFFFFF0
              30777030FCCCCFF030777030FFCCCFF030777037FCCCCFF000777077CCCFCFF0
              8077777CCC777700007777CCC77777777777777C777777777777}
          end
          object memResult: TMemo
            Left = 1
            Top = 1
            Width = 609
            Height = 306
            Align = alLeft
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            ScrollBars = ssBoth
            TabOrder = 1
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 434
    Width = 818
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        Visible = False
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
        'TMemo'
        'Text'
        0))
  end
  object qryPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.IDPESSOA, P.NOME'
      'FROM   PESSOA P, PATRO PT'
      'WHERE  PT.IDPESSOA = P.IDPESSOA'
      'AND    PT.IDFUNDACAO = :IDFUNDACAO'
      'ORDER BY P.NOME'
      ' ')
    ValidateWithMask = True
    Left = 24
    Top = 256
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
    object qryPatroIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.PESSOA.IDPESSOA'
    end
    object qryPatroNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PESSOA.NOME'
      Size = 60
    end
  end
  object qryPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPLANOPREV , NOME'
      'FROM PLANPREV')
    ValidateWithMask = True
    Left = 48
    Top = 320
    object qryPlanoIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.PLANPREV.IDPLANOPREV'
    end
    object qryPlanoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PLANPREV.NOME'
      Size = 50
    end
  end
  object updContribuicao: TUpdateSQL
    ModifySQL.Strings = (
      'update HSTCONTRIBPREV'
      'set'
      '  MESREFERENCIA = :MESREFERENCIA,'
      '  MESCOBRANCA = :MESCOBRANCA,'
      '  DATAPREVISAORECE = :DATAPREVISAORECE,'
      '  DATARECEBIMENTO = :DATARECEBIMENTO,'
      '  VALORESPERADO = :VALORESPERADO,'
      '  VALORRECEBIDO = :VALORRECEBIDO,'
      '  FLGSELECIONADO = :FLGSELECIONADO'
      'where'
      '  MESREFERENCIA = :OLD_MESREFERENCIA and'
      '  MESCOBRANCA = :OLD_MESCOBRANCA'
      ' ')
    InsertSQL.Strings = (
      'insert into HSTCONTRIBPREV'
      
        '  (MESREFERENCIA, MESCOBRANCA, DATAPREVISAORECE, DATARECEBIMENTO' +
        ', VALORESPERADO, '
      '   VALORRECEBIDO, FLGSELECIONADO)'
      'values'
      
        '  (:MESREFERENCIA, :MESCOBRANCA, :DATAPREVISAORECE, :DATARECEBIM' +
        'ENTO, :VALORESPERADO, '
      '   :VALORRECEBIDO, :FLGSELECIONADO)'
      ' ')
    DeleteSQL.Strings = (
      'delete from HSTCONTRIBPREV'
      'where'
      '  MESREFERENCIA = :OLD_MESREFERENCIA and'
      '  MESCOBRANCA = :OLD_MESCOBRANCA')
    Left = 491
    Top = 82
  end
  object qryContribuicao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT 0.00 AS FLGSELECIONADO,'
      
        '       D.NODOCUMENTO,        D.NOSSONUMERO,          C.NOMERESUM' +
        ','
      
        '       C.NOME,               HST.MESREFERENCIA,      HST.MESCOBR' +
        'ANCA,'
      '       HST.DATAPREVISAORECE,'
      
        '       HST.VALORESPERADO,    HST.VALORRECEBIDO,      HST.SITRECE' +
        'BIMENTO,'
      
        '       HST.IDLOTE,           HST.NUMRECEBIMENTO,     HST.FLGDEVO' +
        'LUCAO,'
      ''
      
        '       DECODE(NVL(HST.FLGDEVOLUCAO, 0), 1, '#39'devolução'#39', '#39#39') AS D' +
        'EVOLUCAO,'
      ''
      '       HST.IDMOTIVO,         HST.DATARECEBIMENTO,'
      '       HST.VALOROP1,'
      
        '       HST.VALOROP2,         HST.VALOROP3,           HST.CODDOCU' +
        'MENTOPREV,'
      '       HST.VALORCALCULADO,     HST.FLGDESCFOLHA,'
      
        '       HST.IDCONTRIBUICAO,   HST.IDPESSJUR,          HST.IDPLANO' +
        'PREV,'
      
        '       HST.IDPESSOA,         HST.SEQPROPOSTA,        HST.DATAINI' +
        'CIO,'
      
        '       HST.DATAFINAL,        HST.FLGSITFUNDACAO,     HST.FLGEVEN' +
        'TO,'
      
        '       HST.DATACANCELAMENTO, HST.DATAEMISSCOB,       HST.FLGCALC' +
        'RESERVA,'
      '       HST.PARCELA,'
      '       EL.MATRICULA,         CP.FLGPAGADOR,'
      
        '       CP.CODCENTROCUSTOC,   CP.CODCENTROCUSTOD,     PP.INSCRICA' +
        'ONUMERO,'
      
        '       CPP.FLGDESCFOLHA,     CPP.DIAVENCIMENTO,      CP.CODTIPRE' +
        'CDES,'
      
        '       CPP.PLANO,            CPP.PLACONTAC,          CPP.PLACONT' +
        'AD,'
      
        '       C.NOME  NOMECONTRIB,  CP.CODSUBCONTA ,        CP.CODCENTR' +
        'ORESPON,'
      '       PP.SALMANTIDO,        CP.UNIDNEGOC,'
      
        '       CPP.IDEMPRESA,        CPP.PLANO,              CPP.DATAINI' +
        'CIO,'
      '       CPP.TIPCODIGO,        CPP.CODTIPDOC,'
      '       NVL(HST.CODPORTFORMA,CPP.CODPORTFORMA) AS CODPORTFORMA,'
      
        '       CPP.PLANO13,          CPP.PLACONTAC13,        CPP.PLACONT' +
        'AD13,'
      
        '       CPP.CODCENTROCUSTOC13,CPP.IDEMPRESA13,        CPP.CODCENT' +
        'ROCUSTOD13,'
      
        '       CPP.UNIDNEGOC13,      CPP.IDEMPRESAPROP13,    CPP.CODCENT' +
        'RORESPON13,'
      
        '       CPP.CODSUBCONTA13,    CPP.RECPAG13,           CPP.CODTIPR' +
        'ECDES13,'
      
        '       CPP.TIPCODIGO13,      CPP.CODTIPDOC13,        CPP.CODPORT' +
        'FORMA13,'
      
        '       CPP.IDPLANPREVCONTAB, CPP.PLACONTADBANCO,     CPP.PLACONT' +
        'ADBANCO13,'
      
        '       CPP.CODTIPDESEMBDEVOL, CPP.CODCCUSTODEVOL, CPP.PLACONTADE' +
        'VOL,'
      
        '       PP.SALMANTIDO,        HST.FLGDEVOLUCAO,       CPP.DATAINI' +
        'CIO,'
      
        '       DECODE(HST.FLGDEVOLUCAO, 0, DECODE( HST.SITRECEBIMENTO, '#39 +
        '0'#39', '#39'Não enviada para cobrança'#39','
      
        '                                                               '#39 +
        '1'#39', '#39'Enviada e não recebida'#39','
      
        '                                                               '#39 +
        '2'#39', '#39'Recebida corretamente'#39','
      
        '                                                               '#39 +
        '3'#39', '#39'Recebida com divergência(NT)'#39','
      
        '                                                               '#39 +
        '4'#39', '#39'Atrasada e já tratada'#39','
      
        '                                                               '#39 +
        '5'#39', '#39'Divergência paga'#39','
      
        '                                                               '#39 +
        '6'#39', '#39'Divergência enviada e não recebida'#39','
      
        '                                                               '#39 +
        '7'#39', '#39'Financiada ou Renegociada'#39','
      
        '                                                               '#39 +
        '8'#39', '#39'Cancelada'#39','
      
        '                                                               '#39 +
        '9'#39', '#39'Cobrada na Folha de Benefício'#39'),'
      
        '                                   DECODE( HST.SITRECEBIMENTO, '#39 +
        '0'#39', '#39'Não enviada para devolução'#39','
      
        '                                                               '#39 +
        '1'#39', '#39'Enviada e não efetivamente paga'#39','
      
        '                                                               '#39 +
        '2'#39', '#39'Paga corretamente'#39','
      
        '                                                               '#39 +
        '3'#39', '#39'Paga com divergência(NT)'#39','
      
        '                                                               '#39 +
        '7'#39', '#39'Financiada ou Renegociada'#39','
      
        '                                                               '#39 +
        '8'#39', '#39'Cancelada'#39','
      
        '                                                               '#39 +
        '9'#39', '#39'Paga na Folha de Benefício'#39')) AS NOMESITUACAO,'
      '       CP.IDREGRACALCULO,    SP.FLGINTERNO,'
      '       0 AS SOMAALTERADORES,'
      '       0 AS TOTALESPERADO,'
      '       0 AS ALTERADORESRECEB,'
      
        '       0 AS TOTALRECEBIDO  , NVL(EL.IDPESSJURCEDIDO, EL.IDPESSJU' +
        'R) IDPESSJURCEDIDO,'
      
        '       HST.valorbase1 ,(SELECT PN.NOME from PLANPREVCONTABIL PN ' +
        'WHERE ( CPP.IDPLANPREVCONTAB= PN.IDPLANOPREV)) as NOMEPLANO,'
      '       D.RECPAG RECPAGDOC,'
      '       0 AS PLNCODIGO, 0 AS PERCINADIPLENTE,'
      '       HST.IDTITULAR,'
      '       0.0 AS PERCENTUAL,'
      '       0.0 AS VALORPROV,'
      '          0 AS DIASATRASO,'
      '          0 AS ESTAINADIPLENTE,'
      '       SYSDATE AS DATAPRIMEIRAINADIMPLENCIA,'
      '      0 AS FLGPROVISIONADO,'
      '      '#39'                '#39' AS DESCPROVISIONADO'
      'FROM   CONTRIBUICAO C,       CONTPREV CP, PATRO PT,  SITPART SP,'
      
        '       ELEGPATRO EL,         PARTPREVPLAN PP,  CONTRIBPREVPARTP ' +
        'CPP,'
      '       HSTCONTRIBPREV HST,   DOCUMENTO D'
      'WHERE  (HST.IDPESSOA    = :IDPESSOA )'
      'AND    (HST.IDPESSJUR   = :IDPESSJUR )'
      'AND    (HST.IDPLANOPREV = :IDPLANOPREV )'
      'AND    (HST.CODDOCUMENTOPREV = D.CODDOCUMENTO(+) )'
      'AND    (HST.IDCONTRIBUICAO = C.IDCONTRIBUICAO)'
      'AND    (CPP.IDPESSJUR      = HST.IDPESSJUR)'
      'AND    (CPP.IDPLANOPREV    = HST.IDPLANOPREV)'
      'AND    (CPP.IDPESSOA       = HST.IDPESSOA)'
      'AND    (CPP.SEQPROPOSTA    = HST.SEQPROPOSTA)'
      'AND    (CPP.IDCONTRIBUICAO = HST.IDCONTRIBUICAO)'
      'AND    (PP.IDPESSJUR       = CPP.IDPESSJUR)'
      'AND    (PP.IDPLANOPREV     = CPP.IDPLANOPREV)'
      'AND    (PP.IDPESSOA        = CPP.IDPESSOA)'
      'AND    (PP.SEQPROPOSTA     = CPP.SEQPROPOSTA)'
      'AND    (PT.IDPESSOA        = PP.IDPESSJUR)'
      'AND    (EL.IDPESSOA        = PP.IDPESSOA)'
      'AND    (EL.IDPESSJUR       = PP.IDPESSJUR)'
      'AND    (CP.IDCONTRIBUICAO  = CPP.IDCONTRIBUICAO)'
      'AND    (CP.IDPLANOPREV     = CPP.IDPLANOPREV)'
      'AND    (C.IDCONTRIBUICAO   = CP.IDCONTRIBUICAO)'
      'AND    (PP.IDSITPART       = SP.IDSITPART)'
      'ORDER BY HST.MESCOBRANCA DESC, HST.MESREFERENCIA'
      ' ')
    UpdateObject = updContribuicao
    ControlType.Strings = (
      'FLGSELECIONADO;CheckBox;1;0'
      'FLGDEVOLUCAO;CheckBox;1;0')
    ValidateWithMask = True
    Left = 491
    Top = 130
    ParamData = <
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
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
    object qryContribuicaoFLGSELECIONADO: TFloatField
      DisplayLabel = 'Selecionar'
      DisplayWidth = 9
      FieldName = 'FLGSELECIONADO'
    end
    object qryContribuicaoDEVOLUCAO: TStringField
      DisplayLabel = 'Devolução'
      DisplayWidth = 10
      FieldName = 'DEVOLUCAO'
      Size = 9
    end
    object qryContribuicaoMESREFERENCIA: TStringField
      DisplayLabel = 'Mês de ~Referência'
      DisplayWidth = 10
      FieldName = 'MESREFERENCIA'
      FixedChar = True
      Size = 7
    end
    object qryContribuicaoMESCOBRANCA: TStringField
      DisplayLabel = 'Mês de ~Cobrança'
      DisplayWidth = 10
      FieldName = 'MESCOBRANCA'
      FixedChar = True
      Size = 7
    end
    object qryContribuicaoPARCELA: TFloatField
      DisplayLabel = 'Parcela'
      DisplayWidth = 7
      FieldName = 'PARCELA'
    end
    object qryContribuicaoDATAPREVISAORECE: TDateTimeField
      DisplayLabel = 'Data Prev. ~para Pgmto.'
      DisplayWidth = 10
      FieldName = 'DATAPREVISAORECE'
    end
    object qryContribuicaoDATARECEBIMENTO: TDateTimeField
      DisplayLabel = 'Data Efet. ~do Pgmto.'
      DisplayWidth = 10
      FieldName = 'DATARECEBIMENTO'
    end
    object qryContribuicaoVALORESPERADO: TFloatField
      DisplayLabel = 'Valor ~Esperado'
      DisplayWidth = 10
      FieldName = 'VALORESPERADO'
    end
    object qryContribuicaoSOMAALTERADORES: TFloatField
      DisplayLabel = 'Alteradores'
      DisplayWidth = 10
      FieldName = 'SOMAALTERADORES'
    end
    object qryContribuicaoTOTALESPERADO: TFloatField
      DisplayLabel = 'Total~Esperado'
      DisplayWidth = 10
      FieldName = 'TOTALESPERADO'
    end
    object qryContribuicaoVALORRECEBIDO: TFloatField
      DisplayLabel = 'Valor ~Recebido'
      DisplayWidth = 10
      FieldName = 'VALORRECEBIDO'
    end
    object qryContribuicaoALTERADORESRECEB: TFloatField
      DisplayLabel = 'Alteradores'
      DisplayWidth = 10
      FieldName = 'ALTERADORESRECEB'
    end
    object qryContribuicaoTOTALRECEBIDO: TFloatField
      DisplayLabel = 'Total~Recebido'
      DisplayWidth = 10
      FieldName = 'TOTALRECEBIDO'
    end
    object qryContribuicaoTipoPgmto: TStringField
      DisplayLabel = 'Destino'
      DisplayWidth = 15
      FieldKind = fkCalculated
      FieldName = 'TipoPgmto'
      Calculated = True
    end
    object qryContribuicaoNODOCUMENTO: TFloatField
      DisplayLabel = 'Nº do ~Documento'
      DisplayWidth = 10
      FieldName = 'NODOCUMENTO'
    end
    object qryContribuicaoNOSSONUMERO: TStringField
      DisplayLabel = 'Nosso ~Número'
      DisplayWidth = 20
      FieldName = 'NOSSONUMERO'
    end
    object qryContribuicaoNOMERESUM: TStringField
      DisplayLabel = 'Nome Resum.'
      DisplayWidth = 11
      FieldName = 'NOMERESUM'
      Size = 10
    end
    object qryContribuicaoNOMESITUACAO: TStringField
      DisplayLabel = 'Situação'
      DisplayWidth = 34
      FieldName = 'NOMESITUACAO'
      Size = 34
    end
    object qryContribuicaoDATAEMISSCOB: TDateTimeField
      DisplayLabel = 'Data ~Emissão'
      DisplayWidth = 10
      FieldName = 'DATAEMISSCOB'
    end
    object qryContribuicaoDATACANCELAMENTO: TDateTimeField
      DisplayLabel = 'Data ~Cancel.'
      DisplayWidth = 10
      FieldName = 'DATACANCELAMENTO'
    end
    object qryContribuicaoNOMECONTRIB: TStringField
      DisplayLabel = 'Contribuição'
      DisplayWidth = 60
      FieldName = 'NOMECONTRIB'
      Size = 60
    end
    object qryContribuicaoVALORBASE1: TFloatField
      DisplayLabel = 'Percentual~Contribuição'
      DisplayWidth = 10
      FieldName = 'VALORBASE1'
    end
    object qryContribuicaoFLGDEVOLUCAO: TFloatField
      DisplayLabel = 'Devolução'
      DisplayWidth = 10
      FieldName = 'FLGDEVOLUCAO'
    end
    object qryContribuicaoNOMEPLANO: TStringField
      DisplayLabel = 'Plano Contábil'
      DisplayWidth = 20
      FieldName = 'NOMEPLANO'
      Size = 30
    end
    object qryContribuicaoCODTIPDESEMBDEVOL: TStringField
      DisplayWidth = 15
      FieldName = 'CODTIPDESEMBDEVOL'
      Visible = False
      FixedChar = True
      Size = 15
    end
    object qryContribuicaoPLACONTADEVOL: TStringField
      DisplayWidth = 18
      FieldName = 'PLACONTADEVOL'
      Visible = False
      FixedChar = True
      Size = 18
    end
    object qryContribuicaoCODCENTROCUSTOD: TStringField
      DisplayWidth = 10
      FieldName = 'CODCENTROCUSTOD'
      Visible = False
      FixedChar = True
      Size = 10
    end
    object qryContribuicaoCODTIPRECDES: TStringField
      DisplayWidth = 15
      FieldName = 'CODTIPRECDES'
      Visible = False
      FixedChar = True
      Size = 15
    end
    object qryContribuicaoNOME: TStringField
      FieldName = 'NOME'
      Visible = False
      Size = 60
    end
    object qryContribuicaoSITRECEBIMENTO: TStringField
      FieldName = 'SITRECEBIMENTO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryContribuicaoIDLOTE: TFloatField
      FieldName = 'IDLOTE'
      Visible = False
    end
    object qryContribuicaoNUMRECEBIMENTO: TFloatField
      FieldName = 'NUMRECEBIMENTO'
      Visible = False
    end
    object qryContribuicaoIDMOTIVO: TFloatField
      FieldName = 'IDMOTIVO'
      Visible = False
    end
    object qryContribuicaoCODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
      Visible = False
    end
    object qryContribuicaoVALOROP1: TFloatField
      FieldName = 'VALOROP1'
      Visible = False
    end
    object qryContribuicaoVALOROP2: TFloatField
      FieldName = 'VALOROP2'
      Visible = False
    end
    object qryContribuicaoVALOROP3: TFloatField
      FieldName = 'VALOROP3'
      Visible = False
    end
    object qryContribuicaoCODDOCUMENTOPREV: TFloatField
      FieldName = 'CODDOCUMENTOPREV'
      Visible = False
    end
    object qryContribuicaoVALORCALCULADO: TFloatField
      FieldName = 'VALORCALCULADO'
      Visible = False
    end
    object qryContribuicaoFLGDESCFOLHA: TFloatField
      FieldName = 'FLGDESCFOLHA'
      Visible = False
    end
    object qryContribuicaoIDCONTRIBUICAO: TFloatField
      FieldName = 'IDCONTRIBUICAO'
      Visible = False
    end
    object qryContribuicaoIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
      Visible = False
    end
    object qryContribuicaoIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Visible = False
    end
    object qryContribuicaoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object qryContribuicaoSEQPROPOSTA: TFloatField
      FieldName = 'SEQPROPOSTA'
      Visible = False
    end
    object qryContribuicaoDATAINICIO: TDateTimeField
      FieldName = 'DATAINICIO'
      Visible = False
    end
    object qryContribuicaoDATAFINAL: TDateTimeField
      FieldName = 'DATAFINAL'
      Visible = False
    end
    object qryContribuicaoFLGSITFUNDACAO: TStringField
      FieldName = 'FLGSITFUNDACAO'
      Visible = False
      FixedChar = True
      Size = 2
    end
    object qryContribuicaoFLGEVENTO: TFloatField
      FieldName = 'FLGEVENTO'
      Visible = False
    end
    object qryContribuicaoFLGCALCRESERVA: TFloatField
      FieldName = 'FLGCALCRESERVA'
      Visible = False
    end
    object qryContribuicaoMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Visible = False
      Size = 13
    end
    object qryContribuicaoFLGPAGADOR: TStringField
      FieldName = 'FLGPAGADOR'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryContribuicaoINSCRICAONUMERO: TFloatField
      FieldName = 'INSCRICAONUMERO'
      Visible = False
    end
    object qryContribuicaoFLGDESCFOLHA_1: TFloatField
      FieldName = 'FLGDESCFOLHA_1'
      Visible = False
    end
    object qryContribuicaoDIAVENCIMENTO: TFloatField
      FieldName = 'DIAVENCIMENTO'
      Visible = False
    end
    object qryContribuicaoPLANO: TFloatField
      FieldName = 'PLANO'
      Visible = False
    end
    object qryContribuicaoPLACONTAC: TStringField
      FieldName = 'PLACONTAC'
      Visible = False
      FixedChar = True
      Size = 18
    end
    object qryContribuicaoPLACONTAD: TStringField
      FieldName = 'PLACONTAD'
      Visible = False
      FixedChar = True
      Size = 18
    end
    object qryContribuicaoSALMANTIDO: TFloatField
      FieldName = 'SALMANTIDO'
      Visible = False
    end
    object qryContribuicaoDATAINICIO_1: TDateTimeField
      FieldName = 'DATAINICIO_1'
      Visible = False
    end
    object qryContribuicaoIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
      Visible = False
    end
    object r: TFloatField
      FieldName = 'PLANO_1'
      Visible = False
    end
    object qryContribuicaoTIPCODIGO: TStringField
      FieldName = 'TIPCODIGO'
      Visible = False
      FixedChar = True
      Size = 2
    end
    object qryContribuicaoCODTIPDOC: TFloatField
      FieldName = 'CODTIPDOC'
      Visible = False
    end
    object qryContribuicaoPLANO13: TFloatField
      FieldName = 'PLANO13'
      Visible = False
    end
    object qryContribuicaoPLACONTAC13: TStringField
      FieldName = 'PLACONTAC13'
      Visible = False
      FixedChar = True
      Size = 18
    end
    object qryContribuicaoPLACONTAD13: TStringField
      FieldName = 'PLACONTAD13'
      Visible = False
      FixedChar = True
      Size = 18
    end
    object qryContribuicaoCODCENTROCUSTOC13: TStringField
      FieldName = 'CODCENTROCUSTOC13'
      Visible = False
      FixedChar = True
      Size = 10
    end
    object qryContribuicaoIDEMPRESA13: TFloatField
      FieldName = 'IDEMPRESA13'
      Visible = False
    end
    object qryContribuicaoCODCENTROCUSTOD13: TStringField
      FieldName = 'CODCENTROCUSTOD13'
      Visible = False
      FixedChar = True
      Size = 10
    end
    object qryContribuicaoUNIDNEGOC13: TFloatField
      FieldName = 'UNIDNEGOC13'
      Visible = False
    end
    object qryContribuicaoIDEMPRESAPROP13: TFloatField
      FieldName = 'IDEMPRESAPROP13'
      Visible = False
    end
    object qryContribuicaoCODCENTRORESPON13: TStringField
      FieldName = 'CODCENTRORESPON13'
      Visible = False
      FixedChar = True
      Size = 10
    end
    object qryContribuicaoCODSUBCONTA13: TFloatField
      FieldName = 'CODSUBCONTA13'
      Visible = False
    end
    object qryContribuicaoRECPAG13: TStringField
      FieldName = 'RECPAG13'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryContribuicaoCODTIPRECDES13: TStringField
      FieldName = 'CODTIPRECDES13'
      Visible = False
      FixedChar = True
      Size = 15
    end
    object qryContribuicaoTIPCODIGO13: TStringField
      FieldName = 'TIPCODIGO13'
      Visible = False
      FixedChar = True
      Size = 2
    end
    object qryContribuicaoCODTIPDOC13: TFloatField
      FieldName = 'CODTIPDOC13'
      Visible = False
    end
    object qryContribuicaoCODPORTFORMA13: TFloatField
      FieldName = 'CODPORTFORMA13'
      Visible = False
    end
    object qryContribuicaoIDPLANPREVCONTAB: TFloatField
      FieldName = 'IDPLANPREVCONTAB'
      Visible = False
    end
    object qryContribuicaoPLACONTADBANCO: TStringField
      FieldName = 'PLACONTADBANCO'
      Visible = False
      FixedChar = True
      Size = 18
    end
    object qryContribuicaoPLACONTADBANCO13: TStringField
      FieldName = 'PLACONTADBANCO13'
      Visible = False
      FixedChar = True
      Size = 18
    end
    object qryContribuicaoSALMANTIDO_1: TFloatField
      FieldName = 'SALMANTIDO_1'
      Visible = False
    end
    object qryContribuicaoFLGDEVOLUCAO_1: TFloatField
      FieldName = 'FLGDEVOLUCAO_1'
      Visible = False
    end
    object qryContribuicaoDATAINICIO_2: TDateTimeField
      FieldName = 'DATAINICIO_2'
      Visible = False
    end
    object qryContribuicaoIDREGRACALCULO: TFloatField
      FieldName = 'IDREGRACALCULO'
      Visible = False
    end
    object qryContribuicaoFLGINTERNO: TStringField
      FieldName = 'FLGINTERNO'
      Visible = False
      FixedChar = True
      Size = 2
    end
    object qryContribuicaoCODCENTROCUSTOC: TStringField
      FieldName = 'CODCENTROCUSTOC'
      Visible = False
      FixedChar = True
      Size = 10
    end
    object qryContribuicaoCODSUBCONTA: TFloatField
      FieldName = 'CODSUBCONTA'
      Visible = False
    end
    object qryContribuicaoCODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      Visible = False
      FixedChar = True
      Size = 10
    end
    object qryContribuicaoUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Visible = False
    end
    object qryContribuicaoCODCCUSTODEVOL: TStringField
      FieldName = 'CODCCUSTODEVOL'
      Visible = False
      FixedChar = True
      Size = 10
    end
    object qryContribuicaoIDPESSJURCEDIDO: TFloatField
      FieldName = 'IDPESSJURCEDIDO'
      Visible = False
    end
    object qryContribuicaoPERCINADIPLENTE: TFloatField
      FieldName = 'PERCINADIPLENTE'
      Visible = False
    end
    object qryContribuicaoPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Visible = False
    end
    object qryContribuicaoRECPAGDOC: TStringField
      FieldName = 'RECPAGDOC'
      FixedChar = True
      Size = 1
    end
    object qryContribuicaoIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
    end
    object qryContribuicaoPERCENTUAL: TFloatField
      FieldName = 'PERCENTUAL'
    end
    object qryContribuicaoVALORPROV: TFloatField
      FieldName = 'VALORPROV'
    end
    object qryContribuicaoDIASATRASO: TFloatField
      FieldName = 'DIASATRASO'
    end
    object qryContribuicaoESTAINADIPLENTE: TFloatField
      FieldName = 'ESTAINADIPLENTE'
    end
    object qryContribuicaoDATAPRIMEIRAINADIMPLENCIA: TDateTimeField
      FieldName = 'DATAPRIMEIRAINADIMPLENCIA'
    end
    object qryContribuicaoFLGPROVISIONADO: TFloatField
      FieldName = 'FLGPROVISIONADO'
    end
    object qryContribuicaoDESCPROVISIONADO: TStringField
      FieldName = 'DESCPROVISIONADO'
      FixedChar = True
      Size = 16
    end
  end
  object qryContabil: TwwQuery
    AutoCalcFields = False
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT LC.PLACONTA, LC.CODSUBCONTA, LC.LACDEBCRE, LC.LACVALOR, L' +
        'C.LACVALHIST, LC.LACHIST1, LC.LACHIST2,'
      
        '                        LC.LACHIST3, LC.PLNCODIGO, LC.LACNUMLAN,' +
        ' LC.HITCODHIST, LC.IDPESSOA, LC.IDEMPRESA, LC.IDMODULO, '
      
        '                        LC.UNIDNEGOC, LC.IDUSUARIOINCLUSAO, LC.P' +
        'LANO, LC.LACTIPO, LC.LACNUMDOC, LC.LACHIST4, LC.LACHIST5, '
      
        '                        LC.LACTIPCONVOFICIAL, LC.LACVALOFICIAL, ' +
        'LC.LACTIPCONVGER, LC.LACVALGERENCIAL, '
      
        '                        LC.LACTIPCONVGEREN1, LC.LACVALGEREN1, LC' +
        '.LACTIPCONVGEREN2, LC.LACVALGEREN2, LC.LACATOUTMOEDA, '
      
        '                        LC.LACORIGEMAPLIC, LC.TIPCODIGO, LC.IDEL' +
        'EMDEMONSTRAT, LC.CODCENTROCUSTO, '
      
        '                        U.NOME,CC.NOME,CC.CODCENTROCUSTO, PL.PLN' +
        'DATDIA, -1.00 AS IDPESSJUR, -1.00 AS IDPLANOPREV '
      '                        '
      
        '                       ,'#39'                  '#39' AS PLACONTADEBITO -' +
        '-Helio - SOL Nº 253577/17819 PPM Nº 1104948'
      ''
      
        '                        FROM LANCAMENTO LC, UNIDNEGOCIO U, CENTC' +
        'UST CC, PLANILHA PL WHERE'
      '                        (LC.PLNCODIGO =  :plncodigo) AND'
      '                        (LC.PLNCODIGO = PL.PLNCODIGO) AND'
      
        '                        (CC.IDEMPRESA(+)      = LC.IDEMPRESA) AN' +
        'D'
      
        '                        (CC.CODCENTROCUSTO(+) = LC.CODCENTROCUST' +
        'O) AND'
      
        '                        (LC.IDPESSOA          = U.IDPESSOA(+)) A' +
        'ND'
      '                        (LC.UNIDNEGOC         = U.UNIDNEGOC(+))'
      ' ')
    UpdateObject = updContabil
    ValidateWithMask = True
    Left = 559
    Top = 132
    ParamData = <
      item
        DataType = ftInteger
        Name = 'plncodigo'
        ParamType = ptUnknown
      end>
    object qryContabilPLACONTA: TStringField
      DisplayLabel = 'Conta Contábil'
      DisplayWidth = 18
      FieldName = 'PLACONTA'
      Size = 18
    end
    object qryContabilCODSUBCONTA: TFloatField
      DisplayLabel = 'Sub-Conta'
      DisplayWidth = 10
      FieldName = 'CODSUBCONTA'
    end
    object qryContabilNOME_1: TStringField
      DisplayLabel = 'Centro de Custo'
      DisplayWidth = 20
      FieldName = 'NOME_1'
      Size = 30
    end
    object qryContabilNOME: TStringField
      DisplayLabel = 'Atividade'
      DisplayWidth = 20
      FieldName = 'NOME'
      Size = 25
    end
    object qryContabilLACDEBCRE: TStringField
      DisplayLabel = 'D/C'
      DisplayWidth = 1
      FieldName = 'LACDEBCRE'
      Size = 1
    end
    object qryContabilLACVALOR: TFloatField
      DisplayLabel = 'Valor Moeda Corrente'
      DisplayWidth = 10
      FieldName = 'LACVALOR'
      DisplayFormat = '#,##0.00'
    end
    object qryContabilLACVALHIST: TFloatField
      DisplayLabel = 'Valor Outra Moeda'
      DisplayWidth = 10
      FieldName = 'LACVALHIST'
    end
    object qryContabilLACHIST1: TStringField
      DisplayLabel = 'Histórico'
      DisplayWidth = 40
      FieldName = 'LACHIST1'
      Size = 40
    end
    object qryContabilLACHIST2: TStringField
      DisplayLabel = 'Histórico'
      DisplayWidth = 40
      FieldName = 'LACHIST2'
      Size = 40
    end
    object qryContabilLACHIST3: TStringField
      DisplayLabel = 'Histórico'
      DisplayWidth = 40
      FieldName = 'LACHIST3'
      Size = 40
    end
    object qryContabilPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Visible = False
    end
    object qryContabilLACNUMLAN: TFloatField
      FieldName = 'LACNUMLAN'
      Visible = False
    end
    object qryContabilHITCODHIST: TStringField
      FieldName = 'HITCODHIST'
      Visible = False
      Size = 4
    end
    object qryContabilIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object qryContabilIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
      Visible = False
    end
    object qryContabilIDMODULO: TFloatField
      FieldName = 'IDMODULO'
      Visible = False
    end
    object qryContabilUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Visible = False
    end
    object qryContabilIDUSUARIOINCLUSAO: TFloatField
      FieldName = 'IDUSUARIOINCLUSAO'
      Visible = False
    end
    object qryContabilCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Visible = False
      Size = 10
    end
    object qryContabilPLANO: TFloatField
      FieldName = 'PLANO'
      Visible = False
    end
    object qryContabilLACTIPO: TStringField
      FieldName = 'LACTIPO'
      Visible = False
      Size = 1
    end
    object qryContabilLACNUMDOC: TStringField
      FieldName = 'LACNUMDOC'
      Visible = False
      Size = 15
    end
    object qryContabilLACHIST4: TStringField
      FieldName = 'LACHIST4'
      Visible = False
      Size = 40
    end
    object qryContabilLACHIST5: TStringField
      FieldName = 'LACHIST5'
      Visible = False
      Size = 40
    end
    object qryContabilLACTIPCONVOFICIAL: TStringField
      FieldName = 'LACTIPCONVOFICIAL'
      Visible = False
      Size = 1
    end
    object qryContabilLACVALOFICIAL: TFloatField
      FieldName = 'LACVALOFICIAL'
      Visible = False
    end
    object qryContabilLACTIPCONVGER: TStringField
      FieldName = 'LACTIPCONVGER'
      Visible = False
      Size = 1
    end
    object qryContabilLACVALGERENCIAL: TFloatField
      FieldName = 'LACVALGERENCIAL'
      Visible = False
    end
    object qryContabilLACTIPCONVGEREN1: TStringField
      FieldName = 'LACTIPCONVGEREN1'
      Visible = False
      Size = 1
    end
    object qryContabilLACVALGEREN1: TFloatField
      FieldName = 'LACVALGEREN1'
      Visible = False
    end
    object qryContabilLACTIPCONVGEREN2: TStringField
      FieldName = 'LACTIPCONVGEREN2'
      Visible = False
      Size = 1
    end
    object qryContabilLACVALGEREN2: TFloatField
      FieldName = 'LACVALGEREN2'
      Visible = False
    end
    object qryContabilLACATOUTMOEDA: TStringField
      FieldName = 'LACATOUTMOEDA'
      Visible = False
      Size = 1
    end
    object qryContabilLACORIGEMAPLIC: TStringField
      FieldName = 'LACORIGEMAPLIC'
      Visible = False
      Size = 1
    end
    object qryContabilTIPCODIGO: TStringField
      FieldName = 'TIPCODIGO'
      Visible = False
      Size = 2
    end
    object qryContabilIDELEMDEMONSTRAT: TFloatField
      FieldName = 'IDELEMDEMONSTRAT'
      Visible = False
    end
    object qryContabilCODCENTROCUSTO_1: TStringField
      FieldName = 'CODCENTROCUSTO_1'
      Visible = False
      Size = 10
    end
    object qryContabilPLNDATDIA: TDateTimeField
      FieldName = 'PLNDATDIA'
    end
    object qryContabilIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
    end
    object qryContabilIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryContabilPLACONTADEBITO: TStringField
      FieldName = 'PLACONTADEBITO'
      FixedChar = True
      Size = 18
    end
  end
  object updContabil: TUpdateSQL
    ModifySQL.Strings = (
      'update LANCAMENTO'
      'set'
      '  PLACONTA = :PLACONTA,'
      '  CODSUBCONTA = :CODSUBCONTA,'
      '  LACDEBCRE = :LACDEBCRE,'
      '  LACVALOR = :LACVALOR,'
      '  LACVALHIST = :LACVALHIST,'
      '  LACHIST1 = :LACHIST1,'
      '  LACHIST2 = :LACHIST2,'
      '  LACHIST3 = :LACHIST3,'
      '  PLNCODIGO = :PLNCODIGO,'
      '  LACNUMLAN = :LACNUMLAN,'
      '  HITCODHIST = :HITCODHIST,'
      '  IDPESSOA = :IDPESSOA,'
      '  IDEMPRESA = :IDEMPRESA,'
      '  IDMODULO = :IDMODULO,'
      '  UNIDNEGOC = :UNIDNEGOC,'
      '  IDUSUARIOINCLUSAO = :IDUSUARIOINCLUSAO,'
      '  PLANO = :PLANO,'
      '  LACTIPO = :LACTIPO,'
      '  LACNUMDOC = :LACNUMDOC,'
      '  LACHIST4 = :LACHIST4,'
      '  LACHIST5 = :LACHIST5,'
      '  LACTIPCONVOFICIAL = :LACTIPCONVOFICIAL,'
      '  LACVALOFICIAL = :LACVALOFICIAL,'
      '  LACTIPCONVGER = :LACTIPCONVGER,'
      '  LACVALGERENCIAL = :LACVALGERENCIAL,'
      '  LACTIPCONVGEREN1 = :LACTIPCONVGEREN1,'
      '  LACVALGEREN1 = :LACVALGEREN1,'
      '  LACTIPCONVGEREN2 = :LACTIPCONVGEREN2,'
      '  LACVALGEREN2 = :LACVALGEREN2,'
      '  LACATOUTMOEDA = :LACATOUTMOEDA,'
      '  LACORIGEMAPLIC = :LACORIGEMAPLIC,'
      '  TIPCODIGO = :TIPCODIGO,'
      '  IDELEMDEMONSTRAT = :IDELEMDEMONSTRAT,'
      '  CODCENTROCUSTO = :CODCENTROCUSTO,'
      '  PLNDATDIA = :PLNDATDIA'
      'where'
      '  PLNCODIGO = :OLD_PLNCODIGO')
    InsertSQL.Strings = (
      'insert into LANCAMENTO'
      
        '  (PLACONTA, CODSUBCONTA, LACDEBCRE, LACVALOR, LACVALHIST, LACHI' +
        'ST1, LACHIST2, '
      
        '   LACHIST3, PLNCODIGO, LACNUMLAN, HITCODHIST, IDPESSOA, IDEMPRE' +
        'SA, IDMODULO, '
      
        '   UNIDNEGOC, IDUSUARIOINCLUSAO, PLANO, LACTIPO, LACNUMDOC, LACH' +
        'IST4, LACHIST5, '
      
        '   LACTIPCONVOFICIAL, LACVALOFICIAL, LACTIPCONVGER, LACVALGERENC' +
        'IAL, LACTIPCONVGEREN1, '
      
        '   LACVALGEREN1, LACTIPCONVGEREN2, LACVALGEREN2, LACATOUTMOEDA, ' +
        'LACORIGEMAPLIC, '
      '   TIPCODIGO, IDELEMDEMONSTRAT, CODCENTROCUSTO, PLNDATDIA)'
      'values'
      
        '  (:PLACONTA, :CODSUBCONTA, :LACDEBCRE, :LACVALOR, :LACVALHIST, ' +
        ':LACHIST1, '
      
        '   :LACHIST2, :LACHIST3, :PLNCODIGO, :LACNUMLAN, :HITCODHIST, :I' +
        'DPESSOA, '
      
        '   :IDEMPRESA, :IDMODULO, :UNIDNEGOC, :IDUSUARIOINCLUSAO, :PLANO' +
        ', :LACTIPO, '
      
        '   :LACNUMDOC, :LACHIST4, :LACHIST5, :LACTIPCONVOFICIAL, :LACVAL' +
        'OFICIAL, '
      
        '   :LACTIPCONVGER, :LACVALGERENCIAL, :LACTIPCONVGEREN1, :LACVALG' +
        'EREN1, '
      
        '   :LACTIPCONVGEREN2, :LACVALGEREN2, :LACATOUTMOEDA, :LACORIGEMA' +
        'PLIC, :TIPCODIGO, '
      '   :IDELEMDEMONSTRAT, :CODCENTROCUSTO, :PLNDATDIA)')
    DeleteSQL.Strings = (
      'delete from LANCAMENTO'
      'where'
      '  PLNCODIGO = :OLD_PLNCODIGO')
    Left = 561
    Top = 83
  end
  object updQryProvPerds: TUpdateSQL
    ModifySQL.Strings = (
      'update LANCAMENTO'
      'set'
      '  PLACONTA = :PLACONTA,'
      '  CODSUBCONTA = :CODSUBCONTA,'
      '  LACDEBCRE = :LACDEBCRE,'
      '  LACVALOR = :LACVALOR,'
      '  LACVALHIST = :LACVALHIST,'
      '  LACHIST1 = :LACHIST1,'
      '  LACHIST2 = :LACHIST2,'
      '  LACHIST3 = :LACHIST3,'
      '  PLNCODIGO = :PLNCODIGO,'
      '  LACNUMLAN = :LACNUMLAN,'
      '  HITCODHIST = :HITCODHIST,'
      '  IDPESSOA = :IDPESSOA,'
      '  IDEMPRESA = :IDEMPRESA,'
      '  IDMODULO = :IDMODULO,'
      '  UNIDNEGOC = :UNIDNEGOC,'
      '  IDUSUARIOINCLUSAO = :IDUSUARIOINCLUSAO,'
      '  PLANO = :PLANO,'
      '  LACTIPO = :LACTIPO,'
      '  LACNUMDOC = :LACNUMDOC,'
      '  LACHIST4 = :LACHIST4,'
      '  LACHIST5 = :LACHIST5,'
      '  LACTIPCONVOFICIAL = :LACTIPCONVOFICIAL,'
      '  LACVALOFICIAL = :LACVALOFICIAL,'
      '  LACTIPCONVGER = :LACTIPCONVGER,'
      '  LACVALGERENCIAL = :LACVALGERENCIAL,'
      '  LACTIPCONVGEREN1 = :LACTIPCONVGEREN1,'
      '  LACVALGEREN1 = :LACVALGEREN1,'
      '  LACTIPCONVGEREN2 = :LACTIPCONVGEREN2,'
      '  LACVALGEREN2 = :LACVALGEREN2,'
      '  LACATOUTMOEDA = :LACATOUTMOEDA,'
      '  LACORIGEMAPLIC = :LACORIGEMAPLIC,'
      '  TIPCODIGO = :TIPCODIGO,'
      '  IDELEMDEMONSTRAT = :IDELEMDEMONSTRAT,'
      '  CODCENTROCUSTO = :CODCENTROCUSTO,'
      '  PLNDATDIA = :PLNDATDIA'
      'where'
      '  PLNCODIGO = :OLD_PLNCODIGO')
    InsertSQL.Strings = (
      'insert into LANCAMENTO'
      
        '  (PLACONTA, CODSUBCONTA, LACDEBCRE, LACVALOR, LACVALHIST, LACHI' +
        'ST1, LACHIST2, '
      
        '   LACHIST3, PLNCODIGO, LACNUMLAN, HITCODHIST, IDPESSOA, IDEMPRE' +
        'SA, IDMODULO, '
      
        '   UNIDNEGOC, IDUSUARIOINCLUSAO, PLANO, LACTIPO, LACNUMDOC, LACH' +
        'IST4, LACHIST5, '
      
        '   LACTIPCONVOFICIAL, LACVALOFICIAL, LACTIPCONVGER, LACVALGERENC' +
        'IAL, LACTIPCONVGEREN1, '
      
        '   LACVALGEREN1, LACTIPCONVGEREN2, LACVALGEREN2, LACATOUTMOEDA, ' +
        'LACORIGEMAPLIC, '
      '   TIPCODIGO, IDELEMDEMONSTRAT, CODCENTROCUSTO, PLNDATDIA)'
      'values'
      
        '  (:PLACONTA, :CODSUBCONTA, :LACDEBCRE, :LACVALOR, :LACVALHIST, ' +
        ':LACHIST1, '
      
        '   :LACHIST2, :LACHIST3, :PLNCODIGO, :LACNUMLAN, :HITCODHIST, :I' +
        'DPESSOA, '
      
        '   :IDEMPRESA, :IDMODULO, :UNIDNEGOC, :IDUSUARIOINCLUSAO, :PLANO' +
        ', :LACTIPO, '
      
        '   :LACNUMDOC, :LACHIST4, :LACHIST5, :LACTIPCONVOFICIAL, :LACVAL' +
        'OFICIAL, '
      
        '   :LACTIPCONVGER, :LACVALGERENCIAL, :LACTIPCONVGEREN1, :LACVALG' +
        'EREN1, '
      
        '   :LACTIPCONVGEREN2, :LACVALGEREN2, :LACATOUTMOEDA, :LACORIGEMA' +
        'PLIC, :TIPCODIGO, '
      '   :IDELEMDEMONSTRAT, :CODCENTROCUSTO, :PLNDATDIA)')
    DeleteSQL.Strings = (
      'delete from LANCAMENTO'
      'where'
      '  PLNCODIGO = :OLD_PLNCODIGO')
    Left = 637
    Top = 85
  end
  object qryProvPerds: TwwQuery
    AutoCalcFields = False
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT 0.0 AS PERCENTUAL,'
      '       0.0 AS VALORPROV,'
      '         0 AS DIASATRASO,'
      '         0 AS ESTAINADIPLENTE'
      'FROM DUAL')
    UpdateObject = updQryProvPerds
    ValidateWithMask = True
    Left = 640
    Top = 133
    object qryProvPerdsPERCENTUAL: TFloatField
      FieldName = 'PERCENTUAL'
    end
    object qryProvPerdsVALORPROV: TFloatField
      FieldName = 'VALORPROV'
    end
    object qryProvPerdsDIASATRASO: TFloatField
      FieldName = 'DIASATRASO'
    end
    object qryProvPerdsESTAINADIPLENTE: TFloatField
      FieldName = 'ESTAINADIPLENTE'
    end
  end
  object SaveDlg: TSaveDialog
    DefaultExt = '.txt'
    Filter = 'Arquivos texto|*.txt|Todos os arquivos|*.*'
    InitialDir = 'c:\'
    Title = 'Salvar cálculo de contribuições'
    Left = 640
    Top = 184
  end
  object qryProvContribEnviadas: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT H.SITRECEBIMENTO, H.NUMRECEBIMENTO, EL.MATRICULA,'
      '       P.PERCENTUALPROVISAO AS PERCENTUAL,'
      '       P.VALORPROVISAO AS VALORPROV,'
      
        '       TRUNC(SYSDATE) - TRUNC(P.DATAPRIMEIRAINADIMPLENCIA) AS DI' +
        'ASATRASO,'
      '       1 AS ESTAINADIPLENTE,'
      '       P.VALORINADIMPLENCIA AS TOTALESPERADO,'
      '       H.IDTITULAR,'
      '       H.IDPESSOA,'
      '       H.IDPESSJUR,'
      '       H.IDCONTRIBUICAO,'
      '       H.IDPLANOPREV,'
      '       H.IDPLANPREVCONTAB,'
      '       H.NUMRECEBIMENTO,'
      '       CP.CODCENTROCUSTOD,'
      '       D.RECPAG AS RECPAGDOC,'
      '       PP.INSCRICAONUMERO,'
      '       H.MESREFERENCIA,'
      '       H.MESCOBRANCA,'
      '       H.DATAPREVISAORECE,'
      '       P.DATAPRIMEIRAINADIMPLENCIA'
      '       '
      '  FROM PROVISAOPERDASCONTRIBUICAO P'
      '  INNER JOIN HSTCONTRIBPREV H'
      '    ON H.NUMRECEBIMENTO = P.NUMRECEBIMENTO '
      '   AND H.MESCOBRANCA = P.MESCOBRANCA'
      '   AND H.MESREFERENCIA = P.MESREFERENCIA'
      '  INNER JOIN ELEGPATRO EL'
      '    ON EL.IDPESSOA = H.IDPESSOA'
      '    AND EL.IDPESSJUR = P.IDPESSJUR'
      '  INNER JOIN CONTPREV CP'
      '    ON CP.IDCONTRIBUICAO = H.IDCONTRIBUICAO'
      '    AND CP.IDPLANOPREV = H.IDPLANOPREV'
      '  INNER JOIN PARTPREVPLAN PP'
      '    ON PP.IDPESSJUR = H.IDPESSJUR'
      '    AND PP.IDPLANOPREV = H.IDPLANOPREV'
      '    AND PP.IDPESSOA = H.IDPESSOA'
      '    AND PP.SEQPROPOSTA = H.SEQPROPOSTA '
      '  LEFT JOIN DOCUMENTO D'
      '    ON D.CODDOCUMENTO = H.CODDOCUMENTOPREV  '
      '   WHERE P.FLGREVERSAO = 0'
      '   AND P.FLGATIVO = 1'
      '   AND H.SITRECEBIMENTO = 2 '
      '  AND 1 = 2')
    ControlType.Strings = (
      'FLGSELECIONADO;CheckBox;1;0'
      'FLGDEVOLUCAO;CheckBox;1;0')
    ValidateWithMask = True
    Left = 563
    Top = 250
    object qryProvContribEnviadasSITRECEBIMENTO: TStringField
      FieldName = 'SITRECEBIMENTO'
      FixedChar = True
      Size = 1
    end
    object qryProvContribEnviadasNUMRECEBIMENTO: TFloatField
      FieldName = 'NUMRECEBIMENTO'
    end
    object qryProvContribEnviadasMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 13
    end
    object qryProvContribEnviadasPERCENTUAL: TFloatField
      FieldName = 'PERCENTUAL'
    end
    object qryProvContribEnviadasVALORPROV: TFloatField
      FieldName = 'VALORPROV'
    end
    object qryProvContribEnviadasDIASATRASO: TFloatField
      FieldName = 'DIASATRASO'
    end
    object qryProvContribEnviadasESTAINADIPLENTE: TFloatField
      FieldName = 'ESTAINADIPLENTE'
    end
    object qryProvContribEnviadasTOTALESPERADO: TFloatField
      FieldName = 'TOTALESPERADO'
    end
    object qryProvContribEnviadasIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
    end
    object qryProvContribEnviadasIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryProvContribEnviadasIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
    end
    object qryProvContribEnviadasIDCONTRIBUICAO: TFloatField
      FieldName = 'IDCONTRIBUICAO'
    end
    object qryProvContribEnviadasIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryProvContribEnviadasIDPLANPREVCONTAB: TFloatField
      FieldName = 'IDPLANPREVCONTAB'
    end
    object qryProvContribEnviadasNUMRECEBIMENTO_1: TFloatField
      FieldName = 'NUMRECEBIMENTO_1'
    end
    object qryProvContribEnviadasCODCENTROCUSTOD: TStringField
      FieldName = 'CODCENTROCUSTOD'
      FixedChar = True
      Size = 10
    end
    object qryProvContribEnviadasRECPAGDOC: TStringField
      FieldName = 'RECPAGDOC'
      FixedChar = True
      Size = 1
    end
    object qryProvContribEnviadasINSCRICAONUMERO: TFloatField
      FieldName = 'INSCRICAONUMERO'
    end
    object qryProvContribEnviadasMESREFERENCIA: TStringField
      FieldName = 'MESREFERENCIA'
      FixedChar = True
      Size = 7
    end
    object qryProvContribEnviadasMESCOBRANCA: TStringField
      FieldName = 'MESCOBRANCA'
      FixedChar = True
      Size = 7
    end
    object qryProvContribEnviadasDATAPREVISAORECE: TDateTimeField
      FieldName = 'DATAPREVISAORECE'
    end
    object qryProvContribEnviadasDATAPRIMEIRAINADIMPLENCIA: TDateTimeField
      FieldName = 'DATAPRIMEIRAINADIMPLENCIA'
    end
  end
end
