inherited frmConsultaHistorico: TfrmConsultaHistorico
  Left = 424
  Top = 94
  HelpContext = 180054
  Caption = 'Consulta o Histórico da Folha de Benefícios'
  ClientHeight = 542
  ClientWidth = 790
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock971: TDock97 [0]
    Top = 503
    Width = 790
    inherited tb97Fundo: TToolbar97
      Left = 421
    end
  end
  inherited pnlFundo: TPanel [1]
    Width = 790
    Height = 503
    object PnlMatricOuInscricao: TPanel
      Left = 1
      Top = 1
      Width = 788
      Height = 107
      Align = alTop
      BevelInner = bvLowered
      TabOrder = 0
      object LblInscricao: TLabel
        Left = 461
        Top = 8
        Width = 89
        Height = 13
        Caption = 'Nº de Inscrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LblMatric: TLabel
        Left = 344
        Top = 8
        Width = 55
        Height = 13
        Caption = 'Matrícula'
      end
      object LblTitular: TLabel
        Left = 5
        Top = 8
        Width = 73
        Height = 13
        Caption = 'Nome Titular'
      end
      object LblPatrocinadora: TLabel
        Left = 5
        Top = 45
        Width = 80
        Height = 13
        Caption = 'Patrocinadora'
      end
      object LblPlano: TLabel
        Left = 344
        Top = 45
        Width = 33
        Height = 13
        Caption = 'Plano'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 564
        Top = 8
        Width = 129
        Height = 13
        Caption = 'Situação na Fundação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object BtnProcura: TBitBtn
        Left = 702
        Top = 45
        Width = 67
        Height = 53
        Anchors = [akTop, akRight]
        Caption = '&Procura'
        Default = True
        ModalResult = 1
        TabOrder = 2
        OnClick = btnprocuraClick
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
        Layout = blGlyphTop
        NumGlyphs = 2
        Spacing = 2
      end
      object dbedtitular: TwwDBEdit
        Left = 5
        Top = 21
        Width = 331
        Height = 21
        DataField = 'TITULAR'
        DataSource = FrameConsulta.dsPrevia
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbedPatrocinadora: TwwDBEdit
        Left = 5
        Top = 58
        Width = 331
        Height = 21
        DataField = 'PATROCINADORA'
        DataSource = FrameConsulta.dsPrevia
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbedPlano: TwwDBEdit
        Left = 344
        Top = 58
        Width = 353
        Height = 21
        DataField = 'PLANO'
        DataSource = FrameConsulta.dsPrevia
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object EdtMatricula: TEdit
        Left = 344
        Top = 21
        Width = 107
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnEnter = EdtMatriculaEnter
        OnKeyPress = EdtMatriculaKeyPress
      end
      object EdtNumInscr: TEdit
        Left = 461
        Top = 21
        Width = 94
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnEnter = EdtNumInscrEnter
        OnKeyPress = EdtNumInscrKeyPress
      end
      object EdtSituacao: TEdit
        Left = 564
        Top = 21
        Width = 205
        Height = 21
        Color = clMenu
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
      end
      object dbChkIRTotal: TDBCheckBox
        Left = 5
        Top = 85
        Width = 304
        Height = 17
        Caption = 'Cálculo do IRRF com base no somatório de todas as fontes'
        DataField = 'FLGSOMAIRSUPINSS'
        DataSource = FrameConsulta.dsPrevia
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 7
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
    end
    inline FrameConsulta: TfrmFrameConsultaHistorico
      Left = 1
      Top = 108
      Width = 788
      Height = 394
      Align = alClient
      TabOrder = 1
      inherited pnlFundo: TPanel
        Width = 788
        Height = 394
        inherited Splitter1: TSplitter
          Width = 788
        end
        inherited PnlValores: TPanel
          Top = 364
          Width = 788
        end
        inherited PageControl1: TPageControl
          Width = 788
          Height = 280
          inherited TabSheet1: TTabSheet
            inherited dbgDetalhe: TwwDBGrid
              Width = 780
              Height = 252
            end
          end
          inherited TabSheet2: TTabSheet
            inherited pnlDadosPagGeral: TPanel
              inherited pnlDadosPag2: TPanel
                inherited PnlDetalhes: TPanel
                  Width = 377
                  inherited LblPortForma: TLabel
                    Left = 8
                  end
                  inherited LblNumDep: TLabel
                    Left = 154
                  end
                  inherited dbedNumDepIR: TwwDBEdit
                    Left = 235
                    Width = 27
                  end
                  inherited dbchIsentoIR: TDBCheckBox
                    Left = 264
                    Width = 110
                  end
                end
                inherited pnlDadosPag1: TPanel
                  inherited PnlSRB: TPanel
                    Left = 377
                    Width = 399
                    inherited pnlMostraSRB: TPanel
                      Width = 395
                    end
                  end
                  inherited wwDBgrid1: TwwDBGrid
                    Left = 377
                    Width = 398
                  end
                end
              end
            end
          end
          inherited TbsBasePagamento: TTabSheet
            inherited PnlBasePagamento: TPanel
              Width = 780
              Height = 252
              inherited dbgBasePagamento: TDBGrid
                Width = 595
                Height = 252
                DataSource = dsBasePagamento
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'Campo'
                    PickList.Strings = ()
                    Width = 152
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'Valor'
                    PickList.Strings = ()
                    Width = 600
                    Visible = True
                  end>
              end
              inherited pnlBasePagDir: TPanel
                Left = 595
                Height = 252
              end
            end
          end
          inherited TbsConciliacaoCredito: TTabSheet
            inherited PnlConcCredito: TPanel
              Width = 780
              Height = 252
              inherited dbgConcCredito: TDBGrid
                Width = 778
                Height = 250
                OnDrawDataCell = FrameConsultadbgConcCreditoDrawDataCell
                OnDblClick = FrameConsultadbgConcCreditoDblClick
              end
            end
          end
        end
        inherited PnlHistorico: TPanel
          Width = 788
          inherited dbgHistorico: TwwDBGrid
            Width = 489
          end
          inherited DBGridRecebedor: TwwDBGrid
            Left = 491
          end
        end
      end
      inherited qryPrevia: TwwQuery
        AfterScroll = FrameConsultaqryPreviaAfterScroll
        SQL.Strings = (
          'SELECT DISTINCT'
          '  PJR.NOME AS PATROCINADORA,'
          '  TIT.NOME AS TITULAR,'
          '  ELG.MATRICULA,'
          '  BEN.NOME AS BENEFICIARIO,'
          '  PLP.NOME AS PLANO,'
          '  NVL(PSF.FLGSOMAIRSUPINSS,0) AS FLGSOMAIRSUPINSS,'
          '  PPP.INSCRICAONUMERO,'
          '  DECODE(HST.FLGESTORNO,'
          '           Null, '#39'PAGAMENTO NORMAL'#39','
          '           0,    '#39'PAGAMENTO NORMAL'#39','
          '           1,    '#39'PAGAMENTO PENDENTE'#39','
          '           2,    '#39'PAGAMENTO PENDENTE EM PROCESSO DE PREVIA'#39','
          
            '           3,    '#39'PAGAMENTO PENDENTE PAGO NOVAMENTE (REENVIADO P' +
            'ARA CAP)'#39','
          '           9,    '#39'PAGAMENTO INDEVIDO ESTORNADO'#39') AS SITUACAO,'
          '  HST.IDVERSAOPAGTO,'
          
            '  SUBSTR(TO_CHAR(HST.DATAPAGAMENTO,'#39'DD/MM/YYYY'#39'),7,4)||SUBSTR(TO' +
            '_CHAR(HST.DATAPAGAMENTO,'#39'DD/MM/YYYY'#39'),3,3) AS DATAPAGAMENTO,'
          '  NVL(HST.NUMDEPIRRF,NVL(PSF.NUMDEPIRRF,0)) AS NUMDEPIRRF,'
          
            '  NVL(HST.FLGISENTOIRRF,NVL(PSF.FLGISENTOIRRF,0)) AS FLGISENTOIR' +
            'RF,'
          '  PSF.DATANASC,'
          '  HST.IDRESPONSAVEL,'
          '  HST.IDRECEBEPGTO,'
          '  FAV.NOME AS FAVORECIDO,'
          '  HST.MESCOBRANCA,'
          '  HST.IDPESSJUR,'
          '  HST.NUMBANCO,'
          '  HST.NUMAGENCIA,'
          '  PE.NOME BANCO,'
          '  HST.CONTACORRENTE,'
          '  HFCAP.NOMETXT,'
          '  PTF.DESCRICAO'
          'FROM'
          '  HISTRUBSAL HST,'
          '  PARTPREVPLAN PPP,'
          '  ELEGPATRO ELG,'
          '  PESSOAFISICA PSF,'
          '  PESSOA TIT,'
          '  PESSOA BEN,'
          '  PLANPREV PLP,'
          '  PESSOA PJR,'
          '  PESSOA FAV,'
          '  HSTFOLHABENEFCAP HFCAP,'
          '  PORTADORFORMA PTF,'
          '  CONTABANCARIA  CC,'
          '  AGENCIABANCARIA AG,'
          '  PESSOA        PE'
          'WHERE'
          '  (HST.IDHSTFOLHABENEF = :IDVERSAO)                AND'
          '  (HST.idresponsavel       = :idresponsavel)       AND'
          '  (HST.IDHSTFOLHABENEF = HFCAP.IDHSTFOLHABENEF(+)) AND'
          '  (HST.CODDOCUMENTO    = HFCAP.CODDOCUMENTO(+))    AND'
          '  (HST.CODPORTFORMA    = PTF.CODPORTFORMA(+))      AND'
          '  (PPP.IDPESSJUR       = HST.IDPATRO)              AND'
          '  (PJR.IDPESSOA        = HST.IDPATRO)              AND'
          '  (PPP.IDPLANOPREV     = HST.IDPLANOPREV)          AND'
          '  (PPP.IDPESSOA        = HST.IDTITULAR)            AND'
          '  (TIT.IDPESSOA        = HST.IDTITULAR)            AND'
          '  (BEN.IDPESSOA        = HST.IDRESPONSAVEL)        AND'
          '  (PLP.IDPLANOPREV     = HST.IDPLANOPREV)          AND'
          '  (ELG.IDPESSOA        = HST.IDTITULAR)            AND'
          '  (PSF.IDPESSOA        = BEN.IDPESSOA)             AND'
          '  (HST.IDRECEBEPGTO    = FAV.IDPESSOA(+))          AND '
          '   Hst.CONTACORRENTE = CC.CONTACORRENTE            AND'
          '   CC.IDAGENCIA = AG.IDPESSOA                      AND'
          '   AG.IDBANCO = PE.IDPESSOA')
        ParamData = <
          item
            DataType = ftUnknown
            Name = 'IDVERSAO'
            ParamType = ptUnknown
          end
          item
            DataType = ftUnknown
            Name = 'idresponsavel'
            ParamType = ptUnknown
          end>
      end
      inherited qrySelecao: TwwQuery
        AfterScroll = FrameConsultaqrySelecaoAfterScroll
      end
      inherited QryObtemBasePagamento: TwwQuery
        Top = 160
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 243
    Top = 403
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryInscricao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT ELG.IDPESSOA, ELG.IDPESSJUR, PPP.INSCRICAONUMERO, ELG.MAT' +
        'RICULA'
      'FROM ELEGPATRO ELG, PARTPREVPLAN PPP, PATRO PAT'
      'WHERE PPP.INSCRICAONUMERO = :INSCRICAO'
      'AND PPP.IDPESSJUR = ELG.IDPESSJUR'
      'AND PPP.IDPESSJUR = PAT.IDPESSOA'
      'AND PAT.IDFUNDACAO = :PIDFUNDACAO'
      'AND ELG.IDPESSOA = PPP.IDPESSOA'
      'AND ((PPP.FLGDESATIVADO = 0)'
      '     OR ((FLGDESATIVADO = 1) AND'
      '         NOT EXISTS (SELECT 1'
      '                     FROM PARTPREVPLAN P1'
      '                     WHERE P1.IDPESSOA = PPP.IDPESSOA'
      '                     AND P1.FLGDESATIVADO = 0)))'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 450
    Top = 10
    ParamData = <
      item
        DataType = ftInteger
        Name = 'INSCRICAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object qryMatric: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT ELG.IDPESSOA, ELG.IDPESSJUR, PPP.INSCRICAONUMERO'
      'FROM ELEGPATRO ELG, PARTPREVPLAN PPP, PATRO PAT'
      'WHERE ELG.MATRICULA LIKE :NUMMATRICULA'
      'AND ELG.IDPESSOA = PPP.IDPESSOA'
      'AND ELG.IDPESSJUR = PPP.IDPESSJUR'
      'AND ELG.IDPESSJUR = PAT.IDPESSOA'
      'AND PAT.IDFUNDACAO = :PIDFUNDACAO'
      'AND (   (PPP.FLGDESATIVADO = 0)'
      '     OR (    (FLGDESATIVADO = 1)'
      '         AND NOT EXISTS (SELECT 1'
      '                         FROM PARTPREVPLAN P1'
      '                         WHERE P1.IDPESSOA = PPP.IDPESSOA'
      '                         AND P1.FLGDESATIVADO = 0)))'
      'UNION'
      
        'SELECT DPT.IDTITULAR AS IDPESSOA,PPP.IDPESSJUR,PPP.INSCRICAONUME' +
        'RO'
      'FROM DEPENTIT DPT, PARTPREVPLAN PPP, PATRO PAT'
      'WHERE DPT.MATRICULA LIKE :NUMMATRICULA'
      'AND DPT.IDTITULAR = PPP.IDPESSOA'
      'AND PPP.IDPESSJUR = PAT.IDPESSOA'
      'AND PAT.IDFUNDACAO = :PIDFUNDACAO'
      'AND (   (PPP.FLGDESATIVADO = 0)'
      '     OR (    (FLGDESATIVADO = 1)'
      '         AND NOT EXISTS (SELECT 1'
      '                         FROM PARTPREVPLAN P1'
      '                         WHERE P1.IDPESSOA = PPP.IDPESSOA'
      '                         AND P1.FLGDESATIVADO = 0)))')
    ValidateWithMask = True
    Left = 168
    Top = 10
    ParamData = <
      item
        DataType = ftString
        Name = 'NUMMATRICULA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDFUNDACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NUMMATRICULA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDFUNDACAO'
        ParamType = ptUnknown
      end>
    object qryMatricIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'ELEGPATRO.IDPESSOA'
    end
    object qryMatricIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
      Origin = 'ELEGPATRO.IDPESSJUR'
    end
    object qryMatricINSCRICAONUMERO: TFloatField
      FieldName = 'INSCRICAONUMERO'
      Origin = 'BASEDADOS.PARTPREVPLAN.INSCRICAONUMERO'
    end
  end
  object MontaSelect1: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'E.MATRICULA'
      'P.INSCRICAONUMERO'
      'TIT.NOME'
      'REC.NOME'
      'PA.NOME'
      'DP.MATRICULA'
      'TIT.NUMDOCUMENTO')
    TipodeDado.Strings = (
      'C'
      'N'
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Número de Inscrição'
      'Titular'
      'Recebedor'
      'Patrocinadora'
      'Matrícula do Dependente'
      'CPF Titular')
    SensivelACaixa.Strings = (
      'S'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'HISTRUBSAL H'
      'PARTPREVPLAN P'
      'ELEGPATRO E'
      'PESSOA TIT'
      'PESSOA REC'
      'PESSOA PA'
      'DEPENTIT DP')
    CamposChave.Strings = (
      'H.IDTITULAR'
      'P.INSCRICAONUMERO'
      'E.MATRICULA'
      'DP.MATRICULA'
      'H.IDPESSOA'
      'H.IDRESPONSAVEL')
    Filtro.Strings = (
      'E.IDPESSOA=H.IDTITULAR'
      'TIT.IDPESSOA=H.IDTITULAR'
      'REC.IDPESSOA=H.IDPESSOA'
      'DP.IDPESSOA(+) = H.IDPESSOA'
      'P.IDPESSOA=H.IDTITULAR')
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
      '40'
      '40'
      '30'
      '15'
      '15')
    OperComparador.Strings = (
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
      'N')
    ComparaMaiuscula.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = True
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
      '')
    LookupCampoChave.Strings = (
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
      '')
    Left = 747
    Top = 27
  end
  object CdsBasePagamento: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Campo'
        DataType = ftString
        Size = 26
      end
      item
        Name = 'Valor'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 449
    Top = 295
  end
  object SqlCampos: TCMSqlParams
    SQL.Strings = (
      
        'SELECT '#39'                                                        ' +
        '                         '#39' AS Campo,'
      
        '               '#39'                                                ' +
        '                                                               '#39 +
        ' AS Valor'
      '  FROM DUAL')
    ClientDataSet = CdsBasePagamento
    Left = 449
    Top = 321
  end
  object dsBasePagamento: TwwDataSource
    AutoEdit = False
    DataSet = CdsBasePagamento
    Left = 448
    Top = 379
  end
end
