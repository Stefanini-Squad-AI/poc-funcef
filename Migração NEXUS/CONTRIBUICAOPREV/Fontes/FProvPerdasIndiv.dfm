inherited FrmProvPerdasIndiv: TFrmProvPerdasIndiv
  Left = 206
  Top = 23
  Caption = 'Provisão para Perdas Individual'
  ClientHeight = 600
  ClientWidth = 1144
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 1144
    Height = 561
    object pmlParticipante: TPanel
      Left = 1
      Top = 1
      Width = 1142
      Height = 122
      Align = alTop
      BevelOuter = bvLowered
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Label15: TLabel
        Left = 17
        Top = 25
        Width = 69
        Height = 13
        Caption = 'Participante'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label16: TLabel
        Left = 17
        Top = 57
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
      object Label17: TLabel
        Left = 392
        Top = 57
        Width = 55
        Height = 13
        Caption = 'Matrícula'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label18: TLabel
        Left = 17
        Top = 89
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
      object Label19: TLabel
        Left = 392
        Top = 89
        Width = 118
        Height = 13
        Caption = 'Número de Inscrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label20: TLabel
        Left = 392
        Top = 25
        Width = 129
        Height = 13
        Caption = 'Situação na Fundação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblParticipante: TLabel
        Left = 17
        Top = 40
        Width = 66
        Height = 13
        Caption = 'lblParticipante'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblPatrocinadora: TLabel
        Left = 17
        Top = 72
        Width = 76
        Height = 13
        Caption = 'lblPatrocinadora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblMatricula: TLabel
        Left = 392
        Top = 72
        Width = 53
        Height = 13
        Caption = 'lblMatricula'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblPlano: TLabel
        Left = 17
        Top = 103
        Width = 37
        Height = 13
        Caption = 'lblPlano'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblSituacao: TLabel
        Left = 392
        Top = 40
        Width = 52
        Height = 13
        Caption = 'lblSituacao'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblInscricao: TLabel
        Left = 392
        Top = 103
        Width = 53
        Height = 13
        Caption = 'lblInscricao'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object stxtProcesso: TStaticText
        Left = 1
        Top = 1
        Width = 1140
        Height = 26
        Align = alTop
        Caption = '   Informações do Participante'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 0
      end
      object Panel7: TPanel
        Left = 1036
        Top = 27
        Width = 105
        Height = 94
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 1
        object bbtnProcurar: TBitBtn
          Left = 0
          Top = 0
          Width = 97
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
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
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
      end
    end
    object pgctrlCobrancas: TPageControl
      Left = 1
      Top = 123
      Width = 1142
      Height = 437
      ActivePage = tbsGrid
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object tbsGrid: TTabSheet
        Caption = 'Contribuições do Participante'
        object dbgrdContribuicao: TwwDBGrid
          Left = 0
          Top = 0
          Width = 1134
          Height = 409
          Selected.Strings = (
            'FLGSELECIONADO'#9'9'#9'Selecionar'#9'F'
            'MESREFERENCIA'#9'10'#9'Mês de ~Referência'#9'F'
            'MESCOBRANCA'#9'10'#9'Mês de ~Cobrança'#9'F'
            'DATAPREVISAORECE'#9'10'#9'Data Prev. ~para Pgmto.'#9'F'
            'VALORESPERADO'#9'10'#9'Valor ~Esperado'#9'F'
            'SOMAALTERADORES'#9'10'#9'Alteradores'#9'F'
            'TOTALESPERADO'#9'10'#9'Total~Esperado'#9'F'
            'NOMECONTRIB'#9'60'#9'Contribuição'#9'F'
            'DATAEMISSCOB'#9'10'#9'Data ~Emissão'#9'F'
            'NOMEPLANO'#9'20'#9'Plano Contábil'#9'F'
            'NODOCUMENTO'#9'10'#9'Nº do ~Documento'#9'F'
            'PLNCODIGO'#9'10'#9'Nº da ~Planilha'#9'F'
            'DESCPROVISIONADO'#9'16'#9'Provisionado'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
          Align = alClient
          DataSource = dsContribuicao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyOptions = []
          ParentFont = False
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          TitleLines = 2
          TitleButtons = True
          OnCalcCellColors = dbgrdContribuicaoCalcCellColors
          OnTitleButtonClick = dbgrdContribuicaoTitleButtonClick
          IndicatorColor = icBlack
          OnFieldChanged = dbgrdContribuicaoFieldChanged
        end
      end
      object tbsResult: TTabSheet
        Caption = 'Resultado'
        object memResult: TMemo
          Left = 0
          Top = 0
          Width = 1032
          Height = 409
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ScrollBars = ssVertical
          TabOrder = 0
        end
        object Panel5: TPanel
          Left = 1032
          Top = 0
          Width = 103
          Height = 409
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 1
          object bbtnSalvar: TBitBtn
            Left = 7
            Top = 8
            Width = 90
            Height = 37
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
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 561
    Width = 1144
    inherited tb97Fundo: TToolbar97
      Left = 561
      DockPos = 561
      TabOrder = 2
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 360
      DockPos = 360
      TabOrder = 1
      inherited ToolbarSep971: TToolbarSep97
        Left = 89
      end
      inherited bbtnConfirmar: TBitBtn
        Width = 89
        Caption = '&Processar '
        OnClick = bbtnConfirmarClick
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
        NumGlyphs = 1
      end
      inherited bbtnCancelar: TBitBtn
        Left = 92
        OnClick = bbtnCancelarClick
      end
    end
    object Toolbar971: TToolbar97
      Left = 191
      Top = 0
      Caption = 'TB97oKCancelar'
      DockPos = 191
      TabOrder = 0
      object ToolbarSep972: TToolbarSep97
        Left = 81
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      object bbtnDesfaz: TBitBtn
        Left = 84
        Top = 0
        Width = 81
        Height = 33
        Cancel = True
        Caption = '&Desfazer'
        ModalResult = 2
        TabOrder = 0
        OnClick = bbtnDesfazClick
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
      end
      object BitBtn1: TBitBtn
        Left = 0
        Top = 0
        Width = 81
        Height = 33
        Caption = '&OK'
        Default = True
        ModalResult = 1
        TabOrder = 1
        Visible = False
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
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
  object MontaSelectPart: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'ELEGPATRO.MATRICULA'
      'PESSOA.NOME'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'PLANPREV.NOME'
      'PATRO.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Participante'
      'N° de Inscrição'
      'Plano Previdenciário'
      'Patrocinadora')
    SensivelACaixa.Strings = (
      'S'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'ELEGPATRO'
      'PARTPREVPLAN'
      'PESSOA PATRO'
      'PLANPREV'
      'SITFUNC'
      'SITPART'
      'SITPLANOPREV'
      'PESSOAFISICA')
    CamposChave.Strings = (
      'ELEGPATRO.IDPESSOA'
      'ELEGPATRO.IDPESSJUR'
      'PLANPREV.IDPLANOPREV'
      'PESSOA.NOME'
      'ELEGPATRO.MATRICULA'
      'PATRO.NOME AS PATRO'
      'PLANPREV.NOME AS PLANO'
      'SITFUNC.DESCRICAO'
      'SITPART.DESCRICAO'
      'SITPLANOPREV.DESCRICAO'
      'PESSOA.NUMDOCUMENTO'
      'PESSOAFISICA.DATANASC'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'PARTPREVPLAN.INSCRICAODATA'
      'ELEGPATRO.DATAINICIOAFAST'
      'ELEGPATRO.DATAFIMAFAST'
      'PARTPREVPLAN.SEQPROPOSTA'
      'PARTPREVPLAN.DTINICIOINSC')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = ELEGPATRO.IDPESSOA'
      'ELEGPATRO.IDPESSOA = PARTPREVPLAN.IDPESSOA'
      'ELEGPATRO.IDPESSJUR = PARTPREVPLAN.IDPESSJUR'
      'PARTPREVPLAN.IDPLANOPREV = PLANPREV.IDPLANOPREV'
      'PATRO.IDPESSOA = ELEGPATRO.IDPESSJUR'
      'ELEGPATRO.IDSITFUNC = SITFUNC.IDSITFUNC'
      'PARTPREVPLAN.IDSITPART = SITPART.IDSITPART'
      'PARTPREVPLAN.IDSITPLANOPREV = SITPLANOPREV.IDSITPLANOPREV'
      'PESSOA.IDPESSOA = PESSOAFISICA.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '50'
      '10'
      '20'
      '30')
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
    Left = 275
    Top = 439
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
    Left = 243
    Top = 42
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
    Left = 243
    Top = 90
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
    object qryContribuicaoDATAPREVISAORECE: TDateTimeField
      DisplayLabel = 'Data Prev. ~para Pgmto.'
      DisplayWidth = 10
      FieldName = 'DATAPREVISAORECE'
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
    object qryContribuicaoNOMECONTRIB: TStringField
      DisplayLabel = 'Contribuição'
      DisplayWidth = 60
      FieldName = 'NOMECONTRIB'
      Size = 60
    end
    object qryContribuicaoDATAEMISSCOB: TDateTimeField
      DisplayLabel = 'Data ~Emissão'
      DisplayWidth = 10
      FieldName = 'DATAEMISSCOB'
    end
    object qryContribuicaoNOMEPLANO: TStringField
      DisplayLabel = 'Plano Contábil'
      DisplayWidth = 20
      FieldName = 'NOMEPLANO'
      Size = 30
    end
    object qryContribuicaoNODOCUMENTO: TFloatField
      DisplayLabel = 'Nº do ~Documento'
      DisplayWidth = 10
      FieldName = 'NODOCUMENTO'
    end
    object qryContribuicaoPLNCODIGO: TFloatField
      DisplayLabel = 'Nº da ~Planilha'
      DisplayWidth = 10
      FieldName = 'PLNCODIGO'
    end
    object qryContribuicaoDESCPROVISIONADO: TStringField
      DisplayLabel = 'Provisionado'
      DisplayWidth = 16
      FieldName = 'DESCPROVISIONADO'
      FixedChar = True
      Size = 16
    end
    object qryContribuicaoDEVOLUCAO: TStringField
      DisplayLabel = 'Devolução'
      DisplayWidth = 10
      FieldName = 'DEVOLUCAO'
      Visible = False
      Size = 9
    end
    object qryContribuicaoPARCELA: TFloatField
      DisplayLabel = 'Parcela'
      DisplayWidth = 7
      FieldName = 'PARCELA'
      Visible = False
    end
    object qryContribuicaoDATARECEBIMENTO: TDateTimeField
      DisplayLabel = 'Data Efet. ~do Pgmto.'
      DisplayWidth = 10
      FieldName = 'DATARECEBIMENTO'
      Visible = False
    end
    object qryContribuicaoVALORRECEBIDO: TFloatField
      DisplayLabel = 'Valor ~Recebido'
      DisplayWidth = 10
      FieldName = 'VALORRECEBIDO'
      Visible = False
    end
    object qryContribuicaoALTERADORESRECEB: TFloatField
      DisplayLabel = 'Alteradores'
      DisplayWidth = 10
      FieldName = 'ALTERADORESRECEB'
      Visible = False
    end
    object qryContribuicaoTOTALRECEBIDO: TFloatField
      DisplayLabel = 'Total~Recebido'
      DisplayWidth = 10
      FieldName = 'TOTALRECEBIDO'
      Visible = False
    end
    object qryContribuicaoTipoPgmto: TStringField
      DisplayLabel = 'Destino'
      DisplayWidth = 15
      FieldKind = fkCalculated
      FieldName = 'TipoPgmto'
      Visible = False
      Calculated = True
    end
    object qryContribuicaoNOSSONUMERO: TStringField
      DisplayLabel = 'Nosso ~Número'
      DisplayWidth = 20
      FieldName = 'NOSSONUMERO'
      Visible = False
    end
    object qryContribuicaoNOMERESUM: TStringField
      DisplayLabel = 'Nome Resum.'
      DisplayWidth = 11
      FieldName = 'NOMERESUM'
      Visible = False
      Size = 10
    end
    object qryContribuicaoNOMESITUACAO: TStringField
      DisplayLabel = 'Situação'
      DisplayWidth = 34
      FieldName = 'NOMESITUACAO'
      Visible = False
      Size = 34
    end
    object qryContribuicaoDATACANCELAMENTO: TDateTimeField
      DisplayLabel = 'Data ~Cancel.'
      DisplayWidth = 10
      FieldName = 'DATACANCELAMENTO'
      Visible = False
    end
    object qryContribuicaoVALORBASE1: TFloatField
      DisplayLabel = 'Percentual~Contribuição'
      DisplayWidth = 10
      FieldName = 'VALORBASE1'
      Visible = False
    end
    object qryContribuicaoFLGDEVOLUCAO: TFloatField
      DisplayLabel = 'Devolução'
      DisplayWidth = 10
      FieldName = 'FLGDEVOLUCAO'
      Visible = False
    end
    object qryContribuicaoRECPAGDOC: TStringField
      DisplayWidth = 1
      FieldName = 'RECPAGDOC'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryContribuicaoIDTITULAR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTITULAR'
      Visible = False
    end
    object qryContribuicaoPERCENTUAL: TFloatField
      DisplayWidth = 10
      FieldName = 'PERCENTUAL'
      Visible = False
    end
    object qryContribuicaoVALORPROV: TFloatField
      DisplayWidth = 10
      FieldName = 'VALORPROV'
      Visible = False
    end
    object qryContribuicaoDIASATRASO: TFloatField
      DisplayWidth = 10
      FieldName = 'DIASATRASO'
      Visible = False
    end
    object qryContribuicaoESTAINADIPLENTE: TFloatField
      DisplayWidth = 10
      FieldName = 'ESTAINADIPLENTE'
      Visible = False
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
    object qryContribuicaoDATAPRIMEIRAINADIMPLENCIA: TDateTimeField
      FieldName = 'DATAPRIMEIRAINADIMPLENCIA'
      Visible = False
    end
    object qryContribuicaoFLGPROVISIONADO: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGPROVISIONADO'
      Visible = False
    end
  end
  object dsContribuicao: TwwDataSource
    DataSet = qryContribuicao
    Left = 243
    Top = 144
  end
  object qryTitular: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT PP.IDPESSOA,  PP.IDPESSOA AS IDTITULAR, PP.IDPESSJUR,    ' +
        '     PP.IDPLANOPREV, PP.SEQPROPOSTA,'
      '       P.NOME,       P1.NOME AS NOMEPATRO, PL.NOME AS NOMEPLANO,'
      '       PF.DATANASC,  PF.DATAMORTE,'
      
        '       EL.MATRICULA, EL.DATAADMISSAO, EL.DATADEMISSAO, EL.TEMPOS' +
        'ERVANTERIOR,'
      
        '       EL.TEMPONAOCREDITADO, EL.TEMPOSITESPECIAL, EL.NIVEL, EL.I' +
        'DSITFUNC,'
      
        '       EL.TEMPOSERVTOTAL, EL.TEMPOSERVTOTMES, EL.TEMPOSERVTOTDIA' +
        ','
      
        '       PP.INSCRICAONUMERO, PP.INSCRICAODATA, PP.FLGDEVEEMPRESTIM' +
        'O, PP.FLGDEVEASSISTENC,'
      
        '       PP.FLGDEVEPREVIDENC, PP.IDSITPART, PP.IDSITPLANOPREV,  PP' +
        '.SALMANTIDO,'
      
        '       SPART.DESCRICAO AS NOMESITPART, SFUNC.DESCRICAO AS NOMESI' +
        'TFUNC,'
      '       SPLANO.DESCRICAO AS NOMESITPLANO, SPART.FLGINTERNO,'
      
        '       PT.IDRUBSALMANUT, PT.IDRUBSALMANUTPARC, PT.IDRUBSALPARTIC' +
        'IP'
      
        'FROM   PESSOA P, PESSOA P1, PLANPREV PL, PESSOAFISICA PF, ELEGPA' +
        'TRO EL,'
      
        '       PARTPREVPLAN PP, SITPART SPART, SITFUNC SFUNC, SITPLANOPR' +
        'EV SPLANO,'
      '       PATRO PT'
      'WHERE  PP.IDPESSOA    = :IDPESSOA'
      'AND    PP.SEQPROPOSTA = :SEQPROPOSTA'
      'AND    PP.IDPESSJUR   = :IDPESSJUR'
      'AND    PP.IDPLANOPREV = :IDPLANOPREV'
      'AND    EL.IDPESSOA    = :IDPESSOA'
      'AND    EL.IDPESSJUR   = :IDPESSJUR'
      'AND    P.IDPESSOA     = :IDPESSOA'
      'AND    PP.IDPESSJUR   = PT.IDPESSOA'
      'AND    P1.IDPESSOA = EL.IDPESSJUR'
      'AND    PF.IDPESSOA = EL.IDPESSOA'
      'AND    PP.IDPLANOPREV = PL.IDPLANOPREV'
      'AND    SFUNC.IDSITFUNC = EL.IDSITFUNC'
      'AND    SPART.IDSITPART = PP.IDSITPART'
      'AND    SPLANO.IDSITPLANOPREV = PP.IDSITPLANOPREV'
      '')
    ValidateWithMask = True
    Left = 212
    Top = 291
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
    Left = 327
    Top = 148
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
    Left = 377
    Top = 155
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
    Left = 460
    Top = 227
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
  object updQryProvPerds: TUpdateSQL
    Left = 457
    Top = 179
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
      '   AND P.IDPESSJUR = :IDPESSJUR'
      '   AND P.IDPESSOA  = :IDPESSOA')
    ControlType.Strings = (
      'FLGSELECIONADO;CheckBox;1;0'
      'FLGDEVOLUCAO;CheckBox;1;0')
    ValidateWithMask = True
    Left = 563
    Top = 322
    ParamData = <
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
