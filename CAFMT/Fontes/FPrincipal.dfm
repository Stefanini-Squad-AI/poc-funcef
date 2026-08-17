inherited frmPrincipal: TfrmPrincipal
  Left = 3
  Top = 120
  Caption = 'Controle do Ativo Fixo'
  ClientHeight = 404
  ClientWidth = 787
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblAutorizaTemp: TLabel [0]
    Left = 1
    Top = 31
    Width = 10
    Height = 10
    AutoSize = False
    OnClick = lblAutorizaTempClick
  end
  inherited Dock97Top: TDock97
    Width = 787
    inherited tb97Atalho: TToolbar97
      Left = 0
      DockPos = 0
    end
  end
  inherited tb97FluxOper: TToolWindow97
    Left = 191
    Top = 86
    ClientAreaHeight = 149
    ClientAreaWidth = 408
    inherited pnlTextoFluxOper: TPanel
      Width = 408
      Height = 118
      inherited Bevel1: TBevel
        Width = 408
      end
      inherited Panel1: TPanel
        Width = 408
        Height = 90
        inherited DBMemo1: TDBMemo
          Width = 402
          Height = 84
        end
      end
      inherited pnldbEditFluxo: TPanel
        Width = 408
      end
    end
    inherited Panel2: TPanel
      Width = 408
    end
  end
  inherited stbarStatusBar: TfcStatusBar
    Top = 384
    Width = 787
    Panels = <
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Name = 'Panel0'
        Tag = 0
        Text = 'Empresa'
        TextOptions.Alignment = taLeftJustify
        TextOptions.VAlignment = vaVCenter
        Width = '300'
      end
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Name = 'Panel1'
        Tag = 0
        Text = 'Usuário'
        TextOptions.Alignment = taLeftJustify
        TextOptions.VAlignment = vaVCenter
        Width = '300'
      end
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Name = 'Panel2'
        Style = psDate
        Tag = 0
        Text = '15/03/2003'
        TextOptions.Alignment = taLeftJustify
        TextOptions.VAlignment = vaVCenter
        Width = '30'
      end>
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 608
    Top = 312
  end
  inherited mnu: TMainMenu
    Left = 688
    Top = 40
    inherited mnuSistema: TMenuItem
      GroupIndex = 3
      inherited mnuConfiguracao: TMenuItem
        inherited nmuConfigParametros: TMenuItem
          OnClick = nmuConfigParametrosClick
        end
      end
      inherited mnuUtilitario: TMenuItem
        object N15: TMenuItem
          Caption = '-'
          Visible = False
        end
        object mnuReconstruirSaldo: TMenuItem
          Caption = '&Reconstruir Saldo Contábil'
          OnClick = mnuReconstruirSaldoClick
        end
        object N16: TMenuItem
          Caption = '-'
        end
        object mnuExportacao: TMenuItem
          Caption = '&Exportação de Dados'
          object mnuUtilExpPlacas: TMenuItem
            Caption = '&Placas de Patrimonio'
            OnClick = mnuUtilExpPlacasClick
          end
          object mnuExpContab: TMenuItem
            Caption = '&Dados Contábeis'
          end
        end
        object Importar1: TMenuItem
          Caption = 'Im&portação de Dados'
          Visible = False
        end
      end
    end
    inherited Edit1: TMenuItem
      GroupIndex = 3
    end
    inherited mnuCadastro: TMenuItem
      GroupIndex = 3
      object Situacoes11: TMenuItem
        Caption = '&Situações Físicas'
        OnClick = Situacoes11Click
      end
      object Tiposdeareas1: TMenuItem
        Caption = 'Tipos de Áre&as'
        OnClick = Tiposdeareas1Click
      end
      object TipodeDespesaparaAcrescimodeValor1: TMenuItem
        Caption = 'Tipos de &Despesas para Acréscimo de Valor'
        OnClick = TipodeDespesaparaAcrescimodeValor1Click
      end
      object MotivosdeBaixadeBens1: TMenuItem
        Caption = '&Motivos para Bai&xa de Bens'
        OnClick = MotivosdeBaixadeBens1Click
      end
      object mnuCadTipoSaidaTemp: TMenuItem
        Caption = '&Motivos para Saída Temporária'
        OnClick = mnuCadTipoSaidaTempClick
      end
      object mnuEtapasdeObras: TMenuItem
        Caption = '&Etapas de Obras'
        OnClick = mnuEtapasdeObrasClick
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object Responsaveis1: TMenuItem
        Caption = '&Responsáveis'
        OnClick = Responsaveis1Click
      end
      object Terceiros1: TMenuItem
        Caption = '&Terceiros'
        OnClick = Terceiro1Click
      end
      object DestinatriosdeBensAlienados1: TMenuItem
        Caption = '&Destinatários de Bens Alienados'
        OnClick = DestinatriosdeBensAlienados1Click
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object LocalizaesdosBens1: TMenuItem
        Caption = 'L&ocalizações'
        Hint = 'Setores, Departamentos ...'
        OnClick = Localizacoes1Click
      end
      object GruposdeBens1: TMenuItem
        Caption = '&Grupos Contábeis'
        Hint = 'Grupos Contábeis dos Bens'
        OnClick = GruposdeBens1Click
      end
      object ClassesdeBens1: TMenuItem
        Caption = '&Classes de Bens'
        Hint = 'Classificação Física dos Bens'
        OnClick = ClassesdeBens1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object ContasMovimentoporGrupos1: TMenuItem
        Caption = '&Parametrização Contábil'
        OnClick = ContasMovimentoporGrupos1Click
      end
      object N7: TMenuItem
        Caption = '-'
      end
      object ConjuntosdeBens1: TMenuItem
        Caption = '&Conjuntos de Bens'
        OnClick = ConjuntosdeBens1Click
      end
      object mnuCadBens: TMenuItem
        Caption = '&Bens'
        OnClick = mnuCadBensClick
      end
    end
    object mnuInventario: TMenuItem [3]
      Caption = '&Inventário'
      GroupIndex = 3
      object mnuInvGeracao: TMenuItem
        Caption = '&Geração'
        OnClick = mnuInvGeracaoClick
      end
      object mnuInvCadastramento: TMenuItem
        Caption = '&Registra Resultado'
        OnClick = mnuInvCadastramentoClick
      end
      object mnuInvProcessamento: TMenuItem
        Caption = '&Processamento'
        OnClick = mnuInvProcessamentoClick
      end
    end
    object Bens1: TMenuItem [4]
      Caption = '&Movimentações'
      GroupIndex = 3
      object mnuBensPendentesAlmox: TMenuItem
        Caption = '&Entrada de Bens Pendentes'
        OnClick = mnuBensPendentesAlmoxClick
      end
      object mnuMovControleTotal: TMenuItem
        Caption = '&Controle Total'
        OnClick = mnuMovControleTotalClick
      end
      object N12: TMenuItem
        Caption = '-'
      end
      object mnuSelTransf: TMenuItem
        Caption = 'Se&leção para Transferência'
        OnClick = mnuSelTransfClick
      end
      object mnuTransfBens: TMenuItem
        Caption = '&Transferência de Bens'
        OnClick = mnuTransfBensClick
      end
      object N13: TMenuItem
        Caption = '-'
      end
      object mnuSelBaixa1: TMenuItem
        Caption = '&Seleção para Baixa'
        OnClick = mnuSelBaixa1Click
      end
      object mnuMovBaixa: TMenuItem
        Caption = '&Baixa de Bens'
        OnClick = mnuMovBaixaClick
      end
      object N18: TMenuItem
        Caption = '-'
      end
      object mnuSaidaTemporaria: TMenuItem
        Caption = 'Saída Tem&porária'
        object mnuMovSaidaTemp: TMenuItem
          Caption = '&Cadastro de Termos'
          OnClick = mnuMovSaidaTempClick
        end
        object mnuMovExecSaidaTemp: TMenuItem
          Caption = '&Executa Termo'
          OnClick = mnuMovExecSaidaTempClick
        end
        object mnuMovRetSaidaTemp: TMenuItem
          Caption = '&Retorno dos Bens'
          OnClick = mnuMovRetSaidaTempClick
        end
      end
      object mnuTrocadePlaca1: TMenuItem
        Caption = 'Troca da &Placa de Tombamento'
        OnClick = mnuTrocadePlaca1Click
      end
      object N10: TMenuItem
        Caption = '-'
      end
      object mnuMovAcrescimo: TMenuItem
        Caption = '&Acréscimo de Valor'
        OnClick = mnuMovAcrescimoClick
      end
      object mnuMovReavaliacao: TMenuItem
        Caption = '&Reavaliação Patrimonial'
        OnClick = mnuMovReavaliacaoClick
      end
      object mnuMovDesmembramento: TMenuItem
        Caption = 'Desmem&bramento'
        OnClick = mnuMovDesmembramentoClick
      end
      object mnuMovRemembramento: TMenuItem
        Caption = 'Re&membramento'
        Enabled = False
        Visible = False
        OnClick = mnuMovRemembramentoClick
      end
      object N9: TMenuItem
        Caption = '-'
      end
      object OutrasMovimentaes1: TMenuItem
        Caption = 'Estornar &Movimentações'
        OnClick = Estornar1Click
      end
    end
    object mnuObras: TMenuItem [5]
      Caption = '&Obras'
      GroupIndex = 3
      object mnuCadObra: TMenuItem
        Caption = '&Cadastramento de Obra'
        OnClick = mnuCadObraClick
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object mnuLancamentosObra: TMenuItem
        Caption = '&Lançamentos em Obra'
        OnClick = mnuLancamentosObraClick
      end
      object mnuEstornaLancamentos: TMenuItem
        Caption = '&Estorna Lançamentos'
        OnClick = mnuEstornaLancamentosClick
      end
      object N11: TMenuItem
        Caption = '-'
      end
      object mnuEncerramentoObra: TMenuItem
        Caption = '&Encerramento'
        OnClick = mnuEncerramentoObraClick
      end
    end
    object mnuFechamento1: TMenuItem [6]
      Caption = '&Fechamento'
      GroupIndex = 3
      object Depreciao1: TMenuItem
        Caption = '&Executar'
        OnClick = Depreciacao1Click
      end
      object N8: TMenuItem
        Caption = '-'
      end
      object Depreciao2: TMenuItem
        Caption = 'Esto&rnar'
        OnClick = Depreciacao2Click
      end
    end
    inherited mnuConsulta: TMenuItem
      GroupIndex = 3
      object mnuConsultBens1: TMenuItem [0]
        Caption = 'Cadastro de &Bens'
        OnClick = mnuConsultBens1Click
      end
      object mnuConsSldCtb: TMenuItem [1]
        Caption = '&Saldo Contábil por Bem'
        OnClick = mnuConsSldCtbClick
      end
      object Movimentacoes1: TMenuItem [2]
        Caption = '&Histórico das Movimentações'
        OnClick = Movimentacoes1Click
      end
      object N17: TMenuItem [3]
        Caption = '-'
      end
      object mnuSaldoContabilporGrupo1: TMenuItem [4]
        Caption = 'Saldo Contábil por &Grupo'
        OnClick = mnuSaldoContabilporGrupo1Click
      end
      object mnuConsParamContab: TMenuItem [5]
        Caption = '&Parametrização Contábil'
        OnClick = mnuConsParamContabClick
      end
      object N20: TMenuItem [6]
        Caption = '-'
      end
      object mnuConsLevInvent: TMenuItem [7]
        Caption = '&Levantamento de Inventário'
        OnClick = mnuConsLevInventClick
      end
      object N19: TMenuItem [8]
        Caption = '-'
      end
      object mnuConsultCafObras: TMenuItem [9]
        Caption = '&Obras'
        OnClick = mnuConsultCafObrasClick
      end
      object N5: TMenuItem [10]
        Caption = '-'
      end
      object N6: TMenuItem [12]
        Caption = '-'
        Visible = False
      end
    end
    inherited mnuRAD: TMenuItem
      GroupIndex = 3
    end
    inherited mnuJanela: TMenuItem
      GroupIndex = 3
    end
    inherited mnuAjuda: TMenuItem
      GroupIndex = 3
    end
  end
  inherited IvDicionario: TIvBinaryDictionary
    Left = 552
    Top = 312
  end
  inherited ImlPadrao: TImageList
    Left = 384
    Top = 312
  end
  inherited AclPadrao: TActionList
    Left = 496
    Top = 312
  end
  inherited AppPadrao: TCMApplicationEvents
    OnPrintReportPadrao = AppPadraoPrintReportPadrao
    Left = 96
    Top = 128
  end
  inherited Skt: TSocketConnection
    Left = 544
    Top = 256
  end
  inherited Dcom: TDCOMConnection
    Left = 496
    Top = 256
  end
  inherited Web: TWebConnection
    Left = 448
    Top = 256
  end
  inherited CorreioCM: TCorreioCM
    Left = 664
    Top = 312
  end
  object qryTipoMov: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT * FROM TIPOMOVIMENTACAO')
    UpdateObject = updTipoMov
    ValidateWithMask = True
    Left = 232
    Top = 285
    object qryTipoMovIDTIPOMOVIMENTACAO: TFloatField
      FieldName = 'IDTIPOMOVIMENTACAO'
      Origin = 'TIPOMOVIMENTACAO.IDTIPOMOVIMENTACAO'
    end
    object qryTipoMovDESCTIPOMOVIMENTACAO: TStringField
      FieldName = 'DESCTIPOMOVIMENTACAO'
      Origin = 'TIPOMOVIMENTACAO.DESCTIPOMOVIMENTACAO'
      Size = 40
    end
    object qryTipoMovLANCAMENTO: TStringField
      FieldName = 'LANCAMENTO'
      Origin = 'TIPOMOVIMENTACAO.LANCAMENTO'
      Size = 1
    end
    object qryTipoMovIDCONTAB: TFloatField
      FieldName = 'IDCONTAB'
      Origin = 'TIPOMOVIMENTACAO.IDCONTAB'
    end
  end
  object updTipoMov: TUpdateSQL
    ModifySQL.Strings = (
      'update TIPOMOVIMENTACAO'
      'set'
      '  IDTIPOMOVIMENTACAO = :IDTIPOMOVIMENTACAO,'
      '  DESCTIPOMOVIMENTACAO = :DESCTIPOMOVIMENTACAO,'
      '  LANCAMENTO = :LANCAMENTO,'
      '  IDCONTAB = :IDCONTAB'
      'where'
      '  IDTIPOMOVIMENTACAO = :OLD_IDTIPOMOVIMENTACAO')
    InsertSQL.Strings = (
      'insert into TIPOMOVIMENTACAO'
      '  (IDTIPOMOVIMENTACAO, DESCTIPOMOVIMENTACAO, LANCAMENTO, '
      'IDCONTAB)'
      'values'
      '  (:IDTIPOMOVIMENTACAO, :DESCTIPOMOVIMENTACAO, :LANCAMENTO, '
      ':IDCONTAB)')
    DeleteSQL.Strings = (
      'delete from TIPOMOVIMENTACAO'
      'where'
      '  IDTIPOMOVIMENTACAO = :OLD_IDTIPOMOVIMENTACAO')
    Left = 232
    Top = 272
  end
  object timBensPendentes: TTimer
    Enabled = False
    Interval = 600000
    OnTimer = timBensPendentesTimer
    Left = 40
    Top = 285
  end
  object qryVerBensPend: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT COUNT(IDBENSPENDENTES) AS QTDBENSPEND'
      'FROM BENSPENDENTES'
      'WHERE (IDPESSOA = :PIDPESSOA)')
    ValidateWithMask = True
    Left = 40
    Top = 272
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryVerBensPendQTDBENSPEND: TFloatField
      FieldName = 'QTDBENSPEND'
      Origin = '"CM.BENSPENDENTES".IDBENSPENDENTES'
    end
  end
  object sprSaldoContabBem: TCMSQLScript
    Script.Strings = (
      'DROP PROCEDURE SPRSALDOCONTABBEM;'
      'DROP PUBLIC SYNONYM SPRSALDOCONTABBEM;'
      ''
      
        'CREATE PROCEDURE SPRSALDOCONTABBEM (PIDBEM          IN SALDOCONT' +
        'ABBEM.IDBEM%TYPE,'
      
        '                                    PIDPESSOA       IN SALDOCONT' +
        'ABBEM.IDPESSOA%TYPE,'
      
        '                                    PDATASLDBEM     IN SALDOCONT' +
        'ABBEM.DATASLDBEM%TYPE,'
      
        '                                    PVALORG         IN SALDOCONT' +
        'ABBEM.VALORG%TYPE,'
      
        '                                    PCMBEM          IN SALDOCONT' +
        'ABBEM.CMBEM%TYPE,'
      
        '                                    PDEPLANC        IN SALDOCONT' +
        'ABBEM.DEPLANC%TYPE,'
      
        '                                    PCMDEP          IN SALDOCONT' +
        'ABBEM.CMDEP%TYPE,'
      
        '                                    PREAVVALORG     IN SALDOCONT' +
        'ABBEM.REAVVALORG%TYPE,'
      
        '                                    PREAVCMBEM      IN SALDOCONT' +
        'ABBEM.REAVCMBEM%TYPE,'
      
        '                                    PREAVDEPLANC    IN SALDOCONT' +
        'ABBEM.REAVDEPLANC%TYPE,'
      
        '                                    PREAVCMDEP      IN SALDOCONT' +
        'ABBEM.REAVCMDEP%TYPE,'
      
        '                                    PULTREAVVALORG  IN SALDOCONT' +
        'ABBEM.ULTREAVVALORG%TYPE,'
      
        '                                    PULTREAVCMBEM   IN SALDOCONT' +
        'ABBEM.ULTREAVCMBEM%TYPE,'
      
        '                                    PULTREAVDEPLANC IN SALDOCONT' +
        'ABBEM.ULTREAVDEPLANC%TYPE,'
      
        '                                    PULTREAVCMDEP   IN SALDOCONT' +
        'ABBEM.ULTREAVCMDEP%TYPE,'
      
        '                                    PCODMOV         IN INTEGER) ' +
        'IS'
      ''
      '   IIDBEM           INTEGER;'
      '   IIDPESSOA        NUMBER;'
      '   DDATASLD         DATE;'
      ''
      '   CURSOR SALDOBEM IS'
      '   SELECT SCB.IDBEM, SCB.IDPESSOA, SCB.DATASLDBEM,'
      '          SCB.VALORG, SCB.CMBEM, SCB.DEPLANC, SCB.CMDEP,'
      
        '          SCB.REAVVALORG, SCB.REAVCMBEM, SCB.REAVDEPLANC, SCB.RE' +
        'AVCMDEP,'
      
        '          SCB.ULTREAVVALORG, SCB.ULTREAVCMBEM, SCB.ULTREAVDEPLAN' +
        'C, SCB.ULTREAVCMDEP'
      '   FROM SALDOCONTABBEM SCB,'
      '        (SELECT IDBEM, MAX(DATASLDBEM) AS DATA'
      '         FROM SALDOCONTABBEM'
      '         WHERE (IDBEM = IIDBEM)'
      '           AND (IDPESSOA = IIDPESSOA)'
      '           AND (DATASLDBEM <= DDATASLD)'
      '         GROUP BY IDBEM) DTAMAX'
      '   WHERE (SCB.IDBEM = IIDBEM)'
      '     AND (SCB.IDPESSOA = IIDPESSOA)'
      '     AND (SCB.IDBEM = DTAMAX.IDBEM)'
      '     AND (SCB.DATASLDBEM = DTAMAX.DATA);'
      ''
      '   RSALDOBEM        SALDOBEM%ROWTYPE;'
      ''
      '   CURSOR MOVCONTABBEM IS'
      '   SELECT'
      '      VBEM.IDBEM, VBEM.IDPESSOA, VBEM.DATAMOVIMENTACAO,'
      '      SUM(VBEM.VALBEMACUM + VBEM.VALACRESACUM -'
      
        '          VBEM.BXVALBEMACUM - VBEM.BXVALACRESACUM)              ' +
        '           AS VALORG,'
      '      SUM(VBEM.VALCMBEMACUM + VBEM.VALCMACRESACUM  -'
      
        '          VBEM.BXVALCMBEMACUM  - VBEM.BXVALCMACRESACUM)         ' +
        '           AS CMBEM,'
      '      SUM(VBEM.VALDEPBEMACUM  + VBEM.VALDEPACRESACUM -'
      
        '          VBEM.BXVALDEPBEMACUM  - VBEM.BXVALDEPACRESACUM)       ' +
        '           AS DEPLANC,'
      '      SUM(VBEM.VALCMDEPBEMACUM + VBEM.VALCMDEPACRESACUM -'
      
        '          VBEM.BXVALCMDEPBEMACUM - VBEM.BXVALCMDEPACRESACUM)    ' +
        '           AS CMDEP,'
      
        '      SUM(VBEM.VALREAVACUM - VBEM.BXVALREAVACUM)                ' +
        '           AS REAVVALORG,'
      
        '      SUM(VBEM.VALCMREAVACUM - VBEM.BXVALCMREAVACUM)            ' +
        '           AS REAVCMBEM,'
      
        '      SUM(VBEM.VALDEPREAVACUM - VBEM.BXVALDEPREAVACUM)          ' +
        '           AS REAVDEPLANC,'
      
        '      SUM(VBEM.VALCMDEPREAVACUM - VBEM.BXVALCMDEPREAVACUM)      ' +
        '           AS REAVCMDEP,'
      
        '      SUM(VBEM.VALULTREAVACUM - VBEM.BXVALULTREAVACUM)          ' +
        '           AS ULTREAVVALORG,'
      
        '      SUM(VBEM.VALULTCMREAVACUM - VBEM.BXVALULTCMREAVACUM)      ' +
        '           AS ULTREAVCMBEM,'
      
        '      SUM(VBEM.VALULTDEPREAVACUM - VBEM.BXVALULTDEPREAVACUM)    ' +
        '           AS ULTREAVDEPLANC,'
      
        '      SUM(VBEM.VALULTCMDEPREAVACUM - VBEM.BXVALULTCMDEPREAVACUM)' +
        '           AS ULTREAVCMDEP'
      '   FROM'
      '     ((SELECT HM.IDBEM,'
      '              HM.IDPESSOA,'
      '              HM.DATAMOVIMENTACAO,'
      
        '              SUM(DECODE(HM.IDTIPOMOVIMENTACAO,01,NVL(HM.VALOFI,' +
        '0),'
      
        '                                               41,NVL(HM.VALOFI,' +
        '0),'
      
        '                                               07,NVL(HM.VALOFI,' +
        '0),0)) AS  VALBEMACUM,'
      
        '              (0)                                               ' +
        '       AS  VALREAVACUM,'
      
        '              SUM(DECODE(HM.IDTIPOMOVIMENTACAO,09,NVL(HM.VALOFI,' +
        '0),'
      
        '                                               49,NVL(HM.VALOFI,' +
        '0),0)) AS  VALACRESACUM,'
      
        '              SUM(DECODE(HM.IDTIPOMOVIMENTACAO,15,NVL(HM.VALOFI,' +
        '0),'
      
        '                                               42,NVL(HM.VALOFI,' +
        '0),0)) AS  VALCMBEMACUM,'
      
        '              (0)                                               ' +
        '       AS  VALCMREAVACUM,'
      
        '              SUM(DECODE(HM.IDTIPOMOVIMENTACAO,34,NVL(HM.VALOFI,' +
        '0),'
      
        '                                               50,NVL(HM.VALOFI,' +
        '0),0)) AS  VALCMACRESACUM,'
      
        '              SUM(DECODE(HM.IDTIPOMOVIMENTACAO,14,NVL(HM.VALOFI,' +
        '0),'
      
        '                                               17,NVL(HM.VALOFI,' +
        '0),'
      
        '                                               43,NVL(HM.VALOFI,' +
        '0),0)) AS  VALDEPBEMACUM,'
      
        '              (0)                                               ' +
        '       AS  VALDEPREAVACUM,'
      
        '              SUM(DECODE(HM.IDTIPOMOVIMENTACAO,35,NVL(HM.VALOFI,' +
        '0),'
      
        '                                               51,NVL(HM.VALOFI,' +
        '0),0)) AS  VALDEPACRESACUM,'
      
        '              SUM(DECODE(HM.IDTIPOMOVIMENTACAO,21,NVL(HM.VALOFI,' +
        '0),'
      
        '                                               44,NVL(HM.VALOFI,' +
        '0),0)) AS  VALCMDEPBEMACUM,'
      
        '              (0)                                               ' +
        '       AS  VALCMDEPREAVACUM,'
      
        '              SUM(DECODE(HM.IDTIPOMOVIMENTACAO,36,NVL(HM.VALOFI,' +
        '0),'
      
        '                                               52,NVL(HM.VALOFI,' +
        '0),0)) AS  VALCMDEPACRESACUM,'
      
        '              SUM(DECODE(HM.IDTIPOMOVIMENTACAO,06,NVL(HM.VALOFI,' +
        '0),'
      
        '                                               13,NVL(HM.VALOFI,' +
        '0),0)) AS  BXVALBEMACUM,'
      
        '              (0)                                               ' +
        '       AS  BXVALREAVACUM,'
      
        '              SUM(DECODE(HM.IDTIPOMOVIMENTACAO,37,NVL(HM.VALOFI,' +
        '0),0)) AS  BXVALACRESACUM,'
      
        '              SUM(DECODE(HM.IDTIPOMOVIMENTACAO,25,NVL(HM.VALOFI,' +
        '0),0)) AS  BXVALCMBEMACUM,'
      
        '              (0)                                               ' +
        '       AS  BXVALCMREAVACUM,'
      
        '              SUM(DECODE(HM.IDTIPOMOVIMENTACAO,38,NVL(HM.VALOFI,' +
        '0),0)) AS  BXVALCMACRESACUM,'
      
        '              SUM(DECODE(HM.IDTIPOMOVIMENTACAO,24,NVL(HM.VALOFI,' +
        '0),0)) AS  BXVALDEPBEMACUM,'
      
        '              (0)                                               ' +
        '       AS  BXVALDEPREAVACUM,'
      
        '              SUM(DECODE(HM.IDTIPOMOVIMENTACAO,39,NVL(HM.VALOFI,' +
        '0),0)) AS  BXVALDEPACRESACUM,'
      
        '              SUM(DECODE(HM.IDTIPOMOVIMENTACAO,26,NVL(HM.VALOFI,' +
        '0),0)) AS  BXVALCMDEPBEMACUM,'
      
        '              (0)                                               ' +
        '       AS  BXVALCMDEPREAVACUM,'
      
        '              SUM(DECODE(HM.IDTIPOMOVIMENTACAO,40,NVL(HM.VALOFI,' +
        '0),0)) AS  BXVALCMDEPACRESACUM,'
      
        '              (0)                                               ' +
        '       AS  VALULTREAVACUM,'
      
        '              (0)                                               ' +
        '       AS  VALULTCMREAVACUM,'
      
        '              (0)                                               ' +
        '       AS  VALULTDEPREAVACUM,'
      
        '              (0)                                               ' +
        '       AS  VALULTCMDEPREAVACUM,'
      
        '              (0)                                               ' +
        '       AS  BXVALULTREAVACUM,'
      
        '              (0)                                               ' +
        '       AS  BXVALULTCMREAVACUM,'
      
        '              (0)                                               ' +
        '       AS  BXVALULTDEPREAVACUM,'
      
        '              (0)                                               ' +
        '       AS  BXVALULTCMDEPREAVACUM'
      '       FROM HISTORICOMOVIMENTACAO HM'
      '       WHERE (HM.IDBEM = IIDBEM)'
      '         AND (HM.DATAMOVIMENTACAO >= DDATASLD)'
      '       GROUP BY HM.IDBEM,HM.IDPESSOA,HM.DATAMOVIMENTACAO) UNION'
      '      ((SELECT'
      '               HM.IDBEM,'
      '               HM.IDPESSOA,'
      '               HM.DATAMOVIMENTACAO,'
      
        '               (0)                                              ' +
        '        AS  VALBEMACUM,'
      
        '               SUM(DECODE(HM.IDTIPOMOVIMENTACAO,08,NVL(HM.VALOFI' +
        ',0),'
      
        '                                                32,NVL(HM.VALOFI' +
        ',0),'
      
        '                                                45,NVL(HM.VALOFI' +
        ',0),0)) AS  VALREAVACUM,'
      
        '               (0)                                              ' +
        '        AS  VALACRESACUM,'
      
        '               (0)                                              ' +
        '        AS  VALCMBEMACUM,'
      
        '               SUM(DECODE(HM.IDTIPOMOVIMENTACAO,22,NVL(HM.VALOFI' +
        ',0),'
      
        '                                                46,NVL(HM.VALOFI' +
        ',0),0)) AS  VALCMREAVACUM,'
      
        '               (0)                                              ' +
        '        AS  VALCMACRESACUM,'
      
        '               (0)                                              ' +
        '        AS  VALDEPBEMACUM,'
      
        '               SUM(DECODE(HM.IDTIPOMOVIMENTACAO,18,NVL(HM.VALOFI' +
        ',0),'
      
        '                                                33,NVL(HM.VALOFI' +
        ',0),'
      
        '                                                47,NVL(HM.VALOFI' +
        ',0),0)) AS  VALDEPREAVACUM,'
      
        '               (0)                                              ' +
        '        AS  VALDEPACRESACUM,'
      
        '               (0)                                              ' +
        '        AS  VALCMDEPBEMACUM,'
      
        '               SUM(DECODE(HM.IDTIPOMOVIMENTACAO,19,NVL(HM.VALOFI' +
        ',0),'
      
        '                                                48,NVL(HM.VALOFI' +
        ',0),0)) AS  VALCMDEPREAVACUM,'
      
        '               (0)                                              ' +
        '        AS  VALCMDEPACRESACUM,'
      
        '               (0)                                              ' +
        '        AS  BXVALBEMACUM,'
      
        '               SUM(DECODE(HM.IDTIPOMOVIMENTACAO,20,NVL(HM.VALOFI' +
        ',0),0)) AS  BXVALREAVACUM,'
      
        '               (0)                                              ' +
        '        AS  BXVALACRESACUM,'
      
        '               (0)                                              ' +
        '        AS  BXVALCMBEMACUM,'
      
        '               SUM(DECODE(HM.IDTIPOMOVIMENTACAO,28,NVL(HM.VALOFI' +
        ',0),0)) AS  BXVALCMREAVACUM,'
      
        '               (0)                                              ' +
        '        AS  BXVALCMACRESACUM,'
      
        '               (0)                                              ' +
        '        AS  BXVALDEPBEMACUM,'
      
        '               SUM(DECODE(HM.IDTIPOMOVIMENTACAO,27,NVL(HM.VALOFI' +
        ',0),0)) AS  BXVALDEPREAVACUM,'
      
        '               (0)                                              ' +
        '        AS  BXVALDEPACRESACUM,'
      
        '               (0)                                              ' +
        '        AS  BXVALCMDEPBEMACUM,'
      
        '               SUM(DECODE(HM.IDTIPOMOVIMENTACAO,29,NVL(HM.VALOFI' +
        ',0),0)) AS  BXVALCMDEPREAVACUM,'
      
        '               (0)                                              ' +
        '        AS  BXVALCMDEPACRESACUM,'
      
        '               (0)                                              ' +
        '        AS  VALULTREAVACUM,'
      
        '               (0)                                              ' +
        '        AS  VALULTCMREAVACUM,'
      
        '               (0)                                              ' +
        '        AS  VALULTDEPREAVACUM,'
      
        '               (0)                                              ' +
        '        AS  VALULTCMDEPREAVACUM,'
      
        '               (0)                                              ' +
        '        AS  BXVALULTREAVACUM,'
      
        '               (0)                                              ' +
        '        AS  BXVALULTCMREAVACUM,'
      
        '               (0)                                              ' +
        '        AS  BXVALULTDEPREAVACUM,'
      
        '               (0)                                              ' +
        '        AS  BXVALULTCMDEPREAVACUM'
      '        FROM HISTORICOMOVIMENTACAO HM, REAVALIACAO R'
      '        WHERE (HM.IDBEM = IIDBEM)'
      '          AND (HM.DATAMOVIMENTACAO >= DDATASLD)'
      '          AND (R.FLGULTREAVAL = 0)'
      '          AND (HM.IDREAVALACRESC = R.IDREAVALIACAO(+))'
      '        GROUP BY HM.IDBEM,HM.IDPESSOA,HM.DATAMOVIMENTACAO) UNION'
      '       (SELECT'
      '               HM.IDBEM,'
      '               HM.IDPESSOA,'
      '               HM.DATAMOVIMENTACAO,'
      
        '               (0)                                              ' +
        '        AS  VALBEMACUM,'
      
        '               (0)                                              ' +
        '        AS  VALREAVACUM,'
      
        '               (0)                                              ' +
        '        AS  VALACRESACUM,'
      
        '               (0)                                              ' +
        '        AS  VALCMBEMACUM,'
      
        '               (0)                                              ' +
        '        AS  VALCMREAVACUM,'
      
        '               (0)                                              ' +
        '        AS  VALCMACRESACUM,'
      
        '               (0)                                              ' +
        '        AS  VALDEPBEMACUM,'
      
        '               (0)                                              ' +
        '        AS  VALDEPREAVACUM,'
      
        '               (0)                                              ' +
        '        AS  VALDEPACRESACUM,'
      
        '               (0)                                              ' +
        '        AS  VALCMDEPBEMACUM,'
      
        '               (0)                                              ' +
        '        AS  VALCMDEPREAVACUM,'
      
        '               (0)                                              ' +
        '        AS  VALCMDEPACRESACUM,'
      
        '               (0)                                              ' +
        '        AS  BXVALBEMACUM,'
      
        '               (0)                                              ' +
        '        AS  BXVALREAVACUM,'
      
        '               (0)                                              ' +
        '        AS  BXVALACRESACUM,'
      
        '               (0)                                              ' +
        '        AS  BXVALCMBEMACUM,'
      
        '               (0)                                              ' +
        '        AS  BXVALCMREAVACUM,'
      
        '               (0)                                              ' +
        '        AS  BXVALCMACRESACUM,'
      
        '               (0)                                              ' +
        '        AS  BXVALDEPBEMACUM,'
      
        '               (0)                                              ' +
        '        AS  BXVALDEPREAVACUM,'
      
        '               (0)                                              ' +
        '        AS  BXVALDEPACRESACUM,'
      
        '               (0)                                              ' +
        '        AS  BXVALCMDEPBEMACUM,'
      
        '               (0)                                              ' +
        '        AS  BXVALCMDEPREAVACUM,'
      
        '               (0)                                              ' +
        '        AS  BXVALCMDEPACRESACUM,'
      
        '               SUM(DECODE(HM.IDTIPOMOVIMENTACAO,08,NVL(HM.VALOFI' +
        ',0),'
      
        '                                                32,NVL(HM.VALOFI' +
        ',0),'
      
        '                                                45,NVL(HM.VALOFI' +
        ',0),0)) AS  VALULTREAVACUM,'
      
        '               SUM(DECODE(HM.IDTIPOMOVIMENTACAO,22,NVL(HM.VALOFI' +
        ',0),'
      
        '                                                46,NVL(HM.VALOFI' +
        ',0),0)) AS  VALULTCMREAVACUM,'
      
        '               SUM(DECODE(HM.IDTIPOMOVIMENTACAO,18,NVL(HM.VALOFI' +
        ',0),'
      
        '                                                33,NVL(HM.VALOFI' +
        ',0),'
      
        '                                                47,NVL(HM.VALOFI' +
        ',0),0)) AS  VALULTDEPREAVACUM,'
      
        '               SUM(DECODE(HM.IDTIPOMOVIMENTACAO,19,NVL(HM.VALOFI' +
        ',0),'
      
        '                                                48,NVL(HM.VALOFI' +
        ',0),0)) AS  VALULTCMDEPREAVACUM,'
      
        '               SUM(DECODE(HM.IDTIPOMOVIMENTACAO,20,NVL(HM.VALOFI' +
        ',0),0)) AS  BXVALULTREAVACUM,'
      
        '               SUM(DECODE(HM.IDTIPOMOVIMENTACAO,28,NVL(HM.VALOFI' +
        ',0),0)) AS  BXVALULTCMREAVACUM,'
      
        '               SUM(DECODE(HM.IDTIPOMOVIMENTACAO,27,NVL(HM.VALOFI' +
        ',0),0)) AS  BXVALULTDEPREAVACUM,'
      
        '               SUM(DECODE(HM.IDTIPOMOVIMENTACAO,29,NVL(HM.VALOFI' +
        ',0),0)) AS  BXVALULTCMDEPREAVACUM'
      '        FROM HISTORICOMOVIMENTACAO HM, REAVALIACAO R'
      '        WHERE (HM.IDBEM = IIDBEM)'
      '          AND (HM.DATAMOVIMENTACAO >= DDATASLD)'
      '          AND (R.FLGULTREAVAL = 1)'
      '          AND (HM.IDREAVALACRESC = R.IDREAVALIACAO(+))'
      '        GROUP BY HM.IDBEM,HM.IDPESSOA,HM.DATAMOVIMENTACAO))'
      '     )  VBEM'
      '   GROUP BY VBEM.IDBEM, VBEM.IDPESSOA, VBEM.DATAMOVIMENTACAO;'
      ''
      '   RMOVCONTABBEM    MOVCONTABBEM%ROWTYPE;'
      ''
      'BEGIN'
      '   IIDBEM    := PIDBEM;'
      '   IIDPESSOA := PIDPESSOA;'
      '   DDATASLD  := PDATASLDBEM;'
      
        '   -------------------------------------------------------------' +
        '--------------------------'
      
        '   -- CASO SEJA ESTORNO, REMOVER OS SALDOS POSTERIORES          ' +
        '                        --'
      
        '   -------------------------------------------------------------' +
        '--------------------------'
      '   IF PCODMOV = 2 THEN'
      '      DELETE FROM SALDOCONTABBEM'
      '      WHERE (IDBEM = IIDBEM)'
      '        AND (IDPESSOA = IIDPESSOA)'
      '        AND (DATASLDBEM >= DDATASLD);'
      '   END IF;'
      
        '   -------------------------------------------------------------' +
        '--------------------------'
      
        '   -- VERIFICA O SALDO NA DATA                                  ' +
        '                        --'
      
        '   -------------------------------------------------------------' +
        '--------------------------'
      '   OPEN SALDOBEM;'
      '   IF SALDOBEM%ISOPEN THEN'
      '      FETCH SALDOBEM INTO RSALDOBEM;'
      '      IF SALDOBEM%NOTFOUND THEN'
      '         RSALDOBEM.IDBEM          := 0;'
      '         RSALDOBEM.VALORG         := 0;'
      '         RSALDOBEM.CMBEM          := 0;'
      '         RSALDOBEM.DEPLANC        := 0;'
      '         RSALDOBEM.CMDEP          := 0;'
      '         RSALDOBEM.REAVVALORG     := 0;'
      '         RSALDOBEM.REAVCMBEM      := 0;'
      '         RSALDOBEM.REAVDEPLANC    := 0;'
      '         RSALDOBEM.REAVCMDEP      := 0;'
      '         RSALDOBEM.ULTREAVVALORG  := 0;'
      '         RSALDOBEM.ULTREAVCMBEM   := 0;'
      '         RSALDOBEM.ULTREAVDEPLANC := 0;'
      '         RSALDOBEM.ULTREAVCMDEP   := 0;'
      '      END IF;'
      '      CLOSE SALDOBEM;'
      '   ELSE'
      '      RSALDOBEM.IDBEM          := 0;'
      '      RSALDOBEM.VALORG         := 0;'
      '      RSALDOBEM.CMBEM          := 0;'
      '      RSALDOBEM.DEPLANC        := 0;'
      '      RSALDOBEM.CMDEP          := 0;'
      '      RSALDOBEM.REAVVALORG     := 0;'
      '      RSALDOBEM.REAVCMBEM      := 0;'
      '      RSALDOBEM.REAVDEPLANC    := 0;'
      '      RSALDOBEM.REAVCMDEP      := 0;'
      '      RSALDOBEM.ULTREAVVALORG  := 0;'
      '      RSALDOBEM.ULTREAVCMBEM   := 0;'
      '      RSALDOBEM.ULTREAVDEPLANC := 0;'
      '      RSALDOBEM.ULTREAVCMDEP   := 0;'
      '   END IF;'
      
        '   -------------------------------------------------------------' +
        '--------------------------'
      
        '   -- ATUALIZA SALDO                                            ' +
        '                        --'
      
        '   -------------------------------------------------------------' +
        '--------------------------'
      '   IF PCODMOV = 0 THEN -- MOVIMENTAÇÕES, EXCETO REAVALIAÇÃO--'
      '      IF RSALDOBEM.DATASLDBEM = PDATASLDBEM THEN'
      '         UPDATE SALDOCONTABBEM'
      
        '         SET VALORG         = RSALDOBEM.VALORG         + PVALORG' +
        '        ,'
      
        '             CMBEM          = RSALDOBEM.CMBEM          + PCMBEM ' +
        '        ,'
      
        '             DEPLANC        = RSALDOBEM.DEPLANC        + PDEPLAN' +
        'C       ,'
      
        '             CMDEP          = RSALDOBEM.CMDEP          + PCMDEP ' +
        '        ,'
      
        '             REAVVALORG     = RSALDOBEM.REAVVALORG     + PREAVVA' +
        'LORG    ,'
      
        '             REAVCMBEM      = RSALDOBEM.REAVCMBEM      + PREAVCM' +
        'BEM     ,'
      
        '             REAVDEPLANC    = RSALDOBEM.REAVDEPLANC    + PREAVDE' +
        'PLANC   ,'
      
        '             REAVCMDEP      = RSALDOBEM.REAVCMDEP      + PREAVCM' +
        'DEP     ,'
      
        '             ULTREAVVALORG  = RSALDOBEM.ULTREAVVALORG  + PULTREA' +
        'VVALORG ,'
      
        '             ULTREAVCMBEM   = RSALDOBEM.ULTREAVCMBEM   + PULTREA' +
        'VCMBEM  ,'
      
        '             ULTREAVDEPLANC = RSALDOBEM.ULTREAVDEPLANC + PULTREA' +
        'VDEPLANC,'
      
        '             ULTREAVCMDEP   = RSALDOBEM.ULTREAVCMDEP   + PULTREA' +
        'VCMDEP'
      '         WHERE (IDBEM = PIDBEM)'
      '           AND (IDPESSOA = PIDPESSOA)'
      '           AND (DATASLDBEM = PDATASLDBEM);'
      '      ELSE'
      
        '         INSERT INTO SALDOCONTABBEM (IDBEM, IDPESSOA, DATASLDBEM' +
        ','
      '                                     VALORG,CMBEM,DEPLANC,CMDEP,'
      
        '                                     REAVVALORG,REAVCMBEM,REAVDE' +
        'PLANC,REAVCMDEP,'
      
        '                                     ULTREAVVALORG,ULTREAVCMBEM,' +
        'ULTREAVDEPLANC,ULTREAVCMDEP)'
      
        '                             VALUES (PIDBEM, PIDPESSOA, PDATASLD' +
        'BEM,'
      
        '                                     RSALDOBEM.VALORG         + ' +
        'PVALORG        ,'
      
        '                                     RSALDOBEM.CMBEM          + ' +
        'PCMBEM         ,'
      
        '                                     RSALDOBEM.DEPLANC        + ' +
        'PDEPLANC       ,'
      
        '                                     RSALDOBEM.CMDEP          + ' +
        'PCMDEP         ,'
      
        '                                     RSALDOBEM.REAVVALORG     + ' +
        'PREAVVALORG    ,'
      
        '                                     RSALDOBEM.REAVCMBEM      + ' +
        'PREAVCMBEM     ,'
      
        '                                     RSALDOBEM.REAVDEPLANC    + ' +
        'PREAVDEPLANC   ,'
      
        '                                     RSALDOBEM.REAVCMDEP      + ' +
        'PREAVCMDEP     ,'
      
        '                                     RSALDOBEM.ULTREAVVALORG  + ' +
        'PULTREAVVALORG ,'
      
        '                                     RSALDOBEM.ULTREAVCMBEM   + ' +
        'PULTREAVCMBEM  ,'
      
        '                                     RSALDOBEM.ULTREAVDEPLANC + ' +
        'PULTREAVDEPLANC,'
      
        '                                     RSALDOBEM.ULTREAVCMDEP   + ' +
        'PULTREAVCMDEP);'
      '      END IF;'
      '   ELSIF PCODMOV = 1 THEN   -- REAVALIAÇÃO --'
      '      IF RSALDOBEM.DATASLDBEM = PDATASLDBEM THEN'
      '         UPDATE SALDOCONTABBEM'
      '         SET VALORG         = RSALDOBEM.VALORG      + PVALORG,'
      '             CMBEM          = RSALDOBEM.CMBEM       + PCMBEM,'
      '             DEPLANC        = RSALDOBEM.DEPLANC     + PDEPLANC,'
      '             CMDEP          = RSALDOBEM.CMDEP       + PCMDEP,'
      
        '             REAVVALORG     = RSALDOBEM.REAVVALORG  + RSALDOBEM.' +
        'ULTREAVVALORG,'
      
        '             REAVCMBEM      = RSALDOBEM.REAVCMBEM   + RSALDOBEM.' +
        'ULTREAVCMBEM,'
      
        '             REAVDEPLANC    = RSALDOBEM.REAVDEPLANC + RSALDOBEM.' +
        'ULTREAVDEPLANC,'
      
        '             REAVCMDEP      = RSALDOBEM.REAVCMDEP   + RSALDOBEM.' +
        'ULTREAVCMDEP,'
      '             ULTREAVVALORG  = PULTREAVVALORG,'
      '             ULTREAVCMBEM   = PULTREAVCMBEM  ,'
      '             ULTREAVDEPLANC = PULTREAVDEPLANC,'
      '             ULTREAVCMDEP   = PULTREAVCMDEP'
      '         WHERE (IDBEM = PIDBEM)'
      '           AND (IDPESSOA = PIDPESSOA)'
      '           AND (DATASLDBEM = PDATASLDBEM);'
      '      ELSE'
      
        '         INSERT INTO SALDOCONTABBEM (IDBEM, IDPESSOA, DATASLDBEM' +
        ','
      '                                     VALORG,CMBEM,DEPLANC,CMDEP,'
      
        '                                     REAVVALORG,REAVCMBEM,REAVDE' +
        'PLANC,REAVCMDEP,'
      
        '                                     ULTREAVVALORG,ULTREAVCMBEM,' +
        'ULTREAVDEPLANC,ULTREAVCMDEP)'
      
        '                             VALUES (PIDBEM, PIDPESSOA, PDATASLD' +
        'BEM,'
      
        '                                     RSALDOBEM.VALORG      + PVA' +
        'LORG,'
      
        '                                     RSALDOBEM.CMBEM       + PCM' +
        'BEM,'
      
        '                                     RSALDOBEM.DEPLANC     + PDE' +
        'PLANC,'
      
        '                                     RSALDOBEM.CMDEP       + PCM' +
        'DEP,'
      
        '                                     RSALDOBEM.REAVVALORG  + RSA' +
        'LDOBEM.ULTREAVVALORG,'
      
        '                                     RSALDOBEM.REAVCMBEM   + RSA' +
        'LDOBEM.ULTREAVCMBEM,'
      
        '                                     RSALDOBEM.REAVDEPLANC + RSA' +
        'LDOBEM.ULTREAVDEPLANC,'
      
        '                                     RSALDOBEM.REAVCMDEP   + RSA' +
        'LDOBEM.ULTREAVCMDEP,'
      '                                     PULTREAVVALORG,'
      '                                     PULTREAVCMBEM  ,'
      '                                     PULTREAVDEPLANC,'
      '                                     PULTREAVCMDEP);'
      '      END IF;'
      '   ELSIF PCODMOV = 2 THEN   -- ESTORNOS --'
      
        '      ----------------------------------------------------------' +
        '--------------------------'
      
        '      -- PROCESSA OS SALDOS DIARIOS DO BEM                      ' +
        '                        --'
      
        '      ----------------------------------------------------------' +
        '--------------------------'
      '      OPEN MOVCONTABBEM;'
      '      IF MOVCONTABBEM%ISOPEN THEN'
      '         FETCH MOVCONTABBEM INTO RMOVCONTABBEM;'
      '         WHILE NOT MOVCONTABBEM%NOTFOUND LOOP'
      
        '            RSALDOBEM.VALORG         := RSALDOBEM.VALORG        ' +
        ' + RMOVCONTABBEM.VALORG;'
      
        '            RSALDOBEM.CMBEM          := RSALDOBEM.CMBEM         ' +
        ' + RMOVCONTABBEM.CMBEM;'
      
        '            RSALDOBEM.DEPLANC        := RSALDOBEM.DEPLANC       ' +
        ' + RMOVCONTABBEM.DEPLANC;'
      
        '            RSALDOBEM.CMDEP          := RSALDOBEM.CMDEP         ' +
        ' + RMOVCONTABBEM.CMDEP;'
      
        '            RSALDOBEM.REAVVALORG     := RSALDOBEM.REAVVALORG    ' +
        ' + RMOVCONTABBEM.REAVVALORG;'
      
        '            RSALDOBEM.REAVCMBEM      := RSALDOBEM.REAVCMBEM     ' +
        ' + RMOVCONTABBEM.REAVCMBEM;'
      
        '            RSALDOBEM.REAVDEPLANC    := RSALDOBEM.REAVDEPLANC   ' +
        ' + RMOVCONTABBEM.REAVDEPLANC;'
      
        '            RSALDOBEM.REAVCMDEP      := RSALDOBEM.REAVCMDEP     ' +
        ' + RMOVCONTABBEM.REAVCMDEP;'
      
        '            RSALDOBEM.ULTREAVVALORG  := RSALDOBEM.ULTREAVVALORG ' +
        ' + RMOVCONTABBEM.ULTREAVVALORG;'
      
        '            RSALDOBEM.ULTREAVCMBEM   := RSALDOBEM.ULTREAVCMBEM  ' +
        ' + RMOVCONTABBEM.ULTREAVCMBEM;'
      
        '            RSALDOBEM.ULTREAVDEPLANC := RSALDOBEM.ULTREAVDEPLANC' +
        ' + RMOVCONTABBEM.ULTREAVDEPLANC;'
      
        '            RSALDOBEM.ULTREAVCMDEP   := RSALDOBEM.ULTREAVCMDEP  ' +
        ' + RMOVCONTABBEM.ULTREAVCMDEP;'
      
        '            ----------------------------------------------------' +
        '--------------------------'
      '            INSERT INTO SALDOCONTABBEM (IDBEM,'
      '                                        IDPESSOA,'
      '                                        DATASLDBEM,'
      '                                        VALORG,'
      '                                        CMBEM,'
      '                                        DEPLANC,'
      '                                        CMDEP,'
      '                                        REAVVALORG,'
      '                                        REAVCMBEM,'
      '                                        REAVDEPLANC,'
      '                                        REAVCMDEP,'
      '                                        ULTREAVVALORG,'
      '                                        ULTREAVCMBEM,'
      '                                        ULTREAVDEPLANC,'
      '                                        ULTREAVCMDEP)'
      '                                VALUES (RMOVCONTABBEM.IDBEM,'
      '                                        RMOVCONTABBEM.IDPESSOA,'
      
        '                                        RMOVCONTABBEM.DATAMOVIME' +
        'NTACAO,'
      '                                        RSALDOBEM.VALORG,'
      '                                        RSALDOBEM.CMBEM,'
      '                                        RSALDOBEM.DEPLANC,'
      '                                        RSALDOBEM.CMDEP,'
      '                                        RSALDOBEM.REAVVALORG,'
      '                                        RSALDOBEM.REAVCMBEM,'
      '                                        RSALDOBEM.REAVDEPLANC,'
      '                                        RSALDOBEM.REAVCMDEP,'
      '                                        RSALDOBEM.ULTREAVVALORG,'
      '                                        RSALDOBEM.ULTREAVCMBEM,'
      
        '                                        RSALDOBEM.ULTREAVDEPLANC' +
        ','
      '                                        RSALDOBEM.ULTREAVCMDEP);'
      
        '            ----------------------------------------------------' +
        '--------------------------'
      '            FETCH MOVCONTABBEM INTO RMOVCONTABBEM;'
      '         END LOOP;'
      '      END IF;'
      '   END IF;'
      'END;'
      '/'
      
        'CREATE PUBLIC SYNONYM SPRSALDOCONTABBEM FOR CM.SPRSALDOCONTABBEM' +
        ';'
      ''
      ' '
      ' ')
    Commit = ctNone
    DataBaseName = 'Basedados'
    Left = 136
    Top = 320
  end
  object scrTriggerCAFMT: TCMSQLScript
    Script.Strings = (
      'DROP TRIGGER TRGINSHISTMOVIMBEM;'
      ''
      'CREATE TRIGGER TRGINSHISTMOVIMBEM'
      'BEFORE INSERT ON HISTORICOMOVIMENTACAO'
      'FOR EACH ROW'
      'DECLARE'
      '   dDTANCAF DATE;'
      'BEGIN'
      '   SELECT DTANCAF INTO dDTANCAF'
      '   FROM PARAMETROSCAFMANUT'
      '   WHERE IDPESSOA = :NEW.IDPESSOA;'
      ''
      '   IF (dDTANCAF IS NOT NULL) AND (:NEW.FLGNCAF IS NULL) THEN'
      
        '      RAISE_APPLICATION_ERROR(-20000,'#39'NÃO É MAIS POSSÍVEL EXECUT' +
        'AR MOVIMENTAÇÕES COM O CAF 3.00.xx OU INFERIOR'#39');'
      '   END IF;'
      'END;'
      ''
      ' '
      ' ')
    Commit = ctNone
    DataBaseName = 'Basedados'
    Left = 136
    Top = 272
  end
end
