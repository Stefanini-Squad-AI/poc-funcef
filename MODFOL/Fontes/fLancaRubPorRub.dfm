inherited frmLancaRubPorRub: TfrmLancaRubPorRub
  Left = 36
  Top = 109
  HelpContext = 210061
  Caption = 'Lançamento de Rubricas Salariais (Proventos e Descontos)'
  ClientHeight = 437
  ClientWidth = 720
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 720
    Height = 351
    BorderWidth = 2
    inherited pnlMestre: TPanel
      Left = 4
      Top = 4
      Width = 712
      Height = 51
      object Label10: TLabel
        Left = 147
        Top = 11
        Width = 45
        Height = 13
        Caption = 'Rubrica'
      end
      object Label1: TLabel
        Left = 8
        Top = 12
        Width = 40
        Height = 13
        Caption = 'Código'
      end
      object Bevel1: TBevel
        Left = 195
        Top = 32
        Width = 444
        Height = 19
      end
      object lblMesLanc: TLabel
        Left = 196
        Top = 33
        Width = 441
        Height = 16
        Alignment = taCenter
        AutoSize = False
        Caption = 'Período em Aberto'
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object dbedDescricao: TwwDBEdit
        Left = 195
        Top = 8
        Width = 444
        Height = 21
        Color = clGray
        DataField = 'DESCRPROVDESC'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbedCodigo: TwwDBEdit
        Left = 53
        Top = 8
        Width = 84
        Height = 21
        Color = clGray
        DataField = 'CODPROVDESC'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Left = 4
      Top = 55
      Width = 712
      Height = 292
      Tabs.Strings = (
        'Rubricas')
      inherited pgctrlDetalhe: TPageControl
        Width = 614
        Height = 233
        inherited tbsDet: TTabSheet
          Caption = 'Rubricas'
          inherited dbgrdDet: TwwDBGrid
            Width = 606
            Height = 205
            Selected.Strings = (
              'FUNCIONARIO'#9'36'#9'Nome da Pessoa'#9'No'
              'ANOMESINICIO'#9'7'#9'Ano/Mês'#9'No'
              'FLGPERMANENTE'#9'10'#9'Permanente ?'#9'No'
              'PARCELAS'#9'10'#9'Parcelas'#9'No'
              'NUMOCORRENCIAS'#9'10'#9'Ocorrências'#9'No'
              'VALORRUBRICA'#9'10'#9'Valor Informado'#9'No'
              'SEQRUBRICAINDIV'#9'10'#9'Sequência'#9'No')
            Font.Height = -11
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgWordWrap]
            ParentFont = False
          end
          inherited pnlControlesDet: TPanel
            Width = 606
            Height = 205
            object Label2: TLabel
              Left = 70
              Top = 3
              Width = 118
              Height = 13
              Caption = 'Nome do Empregado'
            end
            object lblSeq: TLabel
              Left = 400
              Top = 3
              Width = 27
              Height = 13
              Caption = 'Seq.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblRegra: TLabel
              Left = 70
              Top = 109
              Width = 99
              Height = 13
              Caption = 'Regra de Cálculo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblValorInf: TLabel
              Left = 400
              Top = 53
              Width = 90
              Height = 13
              Caption = 'Valor Informado'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblParcelas: TLabel
              Left = 400
              Top = 170
              Width = 50
              Height = 13
              Caption = 'Parcelas'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblOcorr: TLabel
              Left = 469
              Top = 170
              Width = 69
              Height = 13
              Caption = 'Ocorrências'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dblkpcmbEmpregado: TwwDBLookupCombo
              Left = 70
              Top = 18
              Width = 300
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'60'#9'Nome'
                'MATRICULA'#9'13'#9'Matrícula')
              DataField = 'IDPESSOA'
              DataSource = dsDet
              LookupTable = qryFunc
              LookupField = 'IDPESSOA'
              Options = [loTitles]
              Style = csDropDownList
              ParentFont = False
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              OnChange = dblkpcmbEmpregadoChange
            end
            object chkRubPermanente: TCheckBox
              Left = 445
              Top = 20
              Width = 96
              Height = 16
              Alignment = taLeftJustify
              Caption = 'Permanente ?'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
              OnClick = chkRubPermanenteClick
            end
            object dblkcmbRegra: TwwDBLookupCombo
              Left = 70
              Top = 123
              Width = 300
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMEREGRA'#9'60'#9'Regra')
              DataField = 'IDREGRACALCULO'
              DataSource = dsDet
              LookupTable = qryRegra
              LookupField = 'IDREGRA'
              Style = csDropDownList
              ParentFont = False
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              OnChange = dblkcmbRegraChange
            end
            object grpMesInicio: TGroupBox
              Left = 70
              Top = 170
              Width = 300
              Height = 43
              Caption = 'Início '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 4
              object Label5: TLabel
                Left = 9
                Top = 18
                Width = 24
                Height = 13
                Caption = 'Mês'
              end
              object Label7: TLabel
                Left = 176
                Top = 18
                Width = 23
                Height = 13
                Caption = 'Ano'
              end
              object cmbMes: TComboBox
                Left = 39
                Top = 15
                Width = 114
                Height = 21
                Style = csDropDownList
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ItemHeight = 13
                ParentFont = False
                TabOrder = 0
                OnExit = cmbMesExit
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
              object spnedAno: TSpinEdit
                Left = 209
                Top = 15
                Width = 68
                Height = 22
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                MaxValue = 0
                MinValue = 0
                ParentFont = False
                TabOrder = 1
                Value = 0
                OnExit = spnedAnoExit
              end
            end
            object spedParcelas: TSpinEdit
              Left = 400
              Top = 184
              Width = 52
              Height = 22
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              MaxValue = 999
              MinValue = 1
              ParentFont = False
              TabOrder = 5
              Value = 1
            end
            object dbedOcorr: TwwDBEdit
              Left = 469
              Top = 184
              Width = 70
              Height = 21
              DataField = 'NUMOCORRENCIAS'
              DataSource = dsDet
              TabOrder = 6
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object ProcuraFavorecido: TCMProcuraForCli
              Left = 70
              Top = 48
              Width = 300
              Height = 51
              Caption = 'Favorecido'
              TabOrder = 2
              OnExit = ProcuraFavorecidoExit
              CampoEdit = ceRazaoSocial
              MostraMensagens = False
              DataSource = dsDet
              DataField = 'IDFAVORECIDO'
              Mensagens.EmBranco = 'Favorecido não pode estar em branco'
              Mensagens.NaoExiste = 'Favorecido não existe'
              PermiteChaveInvalida = False
              PermiteChaveEmBranco = True
              ForCli = fcFornecedor
              MostraEndereco = False
              StatusForCli = fcAll
              MostraStatusCredito = False
            end
            object gbxValCalc: TGroupBox
              Left = 400
              Top = 102
              Width = 140
              Height = 49
              Caption = 'Valor Calculado'
              TabOrder = 7
              object spdbtnValCalc: TSpeedButton
                Left = 5
                Top = 15
                Width = 25
                Height = 25
                Enabled = False
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  0400000000000001000000000000000000001000000010000000000000000000
                  800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
                  73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
                  0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
                  0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
                  0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
                  0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
                  0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
                  0333337F777777737F333308888888880333337F333333337F33330888888888
                  03333373FFFFFFFF733333700000000073333337777777773333}
                NumGlyphs = 2
                OnClick = spdbtnValCalcClick
              end
              object edTotProventos: TRealEdit
                Left = 32
                Top = 17
                Width = 104
                Height = 21
                Alignment = taRightJustify
                Color = clGray
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                Lines.Strings = (
                  '      0,00')
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
                WordWrap = False
                IntDigits = 10
                DecDigits = 2
                NumberFormat = fNumber
                Signal = False
              end
            end
            object dbedSeq: TwwDBEdit
              Left = 400
              Top = 18
              Width = 37
              Height = 21
              Color = clGray
              DataField = 'SEQRUBRICAINDIV'
              DataSource = dsDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 8
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbedValor: TDBRealEdit
              Left = 400
              Top = 66
              Width = 140
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '      0,00')
              TabOrder = 9
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VALORRUBRICA'
              DataSource = dsDet
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 704
      end
      inherited Dock974: TDock97
        Left = 618
        Height = 233
      end
    end
  end
  inherited Dock972: TDock97
    Width = 720
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 398
    Width = 720
    inherited tb97Fundo: TToolbar97
      Left = 551
      DockPos = 559
      inherited sep1: TToolbarSep97
        SizeHorz = 2
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 384
      DockPos = 385
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '  RP.IDRUBRICA, RP.CODPROVDESC,'
      '  ('#39'  '#39' || RP.DESCRPROVDESC) DESCRPROVDESC,'
      '  PD.IDREGRA, PD.FLGOBRIGAFAVOREC'
      'FROM'
      '  RUBRICAXPESS RP, PROVDESC PD'
      'WHERE'
      '  (PD.FLGCONSTAFOLHA = 1)            AND'
      '  (RP.IDRUBRICA      = :IDPROVENTO)  AND'
      '  (RP.IDPESSOA       = :IDEMPRESA)   AND'
      '  (RP.IDRUBRICA      = PD.IDPROVENTO)'
      'ORDER BY'
      '  UPPER(RP.DESCRPROVDESC)')
    Left = 274
    Top = 1
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPROVENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end>
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    OnStateChange = dsDetStateChange
    Left = 407
    Top = 1
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 136
    Top = 2
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update RUBRICAXPESS'
      'set'
      '  IDRUBRICA = :IDRUBRICA'
      'where'
      '  IDRUBRICA = :OLD_IDRUBRICA')
    InsertSQL.Strings = (
      'insert into RUBRICAXPESS'
      '  (IDRUBRICA)'
      'values'
      '  (:IDRUBRICA)')
    DeleteSQL.Strings = (
      'delete from RUBRICAXPESS'
      'where'
      '  IDRUBRICA = :OLD_IDRUBRICA')
    Left = 246
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Rubricas'
    Colunas.Strings = (
      'RUBRICAXPESS.DESCRPROVDESC'
      'PROVDESC.IDPROVENTO'
      'RUBRICAXPESS.CODPROVDESC')
    TipodeDado.Strings = (
      'C'
      'N'
      'C')
    Descricao.Strings = (
      'Nome da Rubrica'
      'Cód. Interno'
      'Seu Código')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PROVDESC'
      'RUBRICAXPESS')
    CamposChave.Strings = (
      'PROVDESC.DESCRICAO'
      'PROVDESC.IDPROVENTO'
      'RUBRICAXPESS.CODPROVDESC')
    Filtro.Strings = (
      'PROVDESC.FLGTPRUBRICA LIKE ('#39'%F%'#39')'
      'PROVDESC.IDPROVENTO = RUBRICAXPESS.IDRUBRICA(+)')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '55'
      '12'
      '12')
    Left = 664
    Top = 25
  end
  inherited ds: TwwDataSource
    Left = 302
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 189
    Top = 2
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 665
    Top = 13
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 665
    Top = 1
  end
  object qryParamRH: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  NORMALINI, NORMALFIM'
      'FROM'
      '  PARAMRH')
    ValidateWithMask = True
    Left = 493
    Top = 14
  end
  object qryFunc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  F.MATRICULA, F.IDPESSOA, P.NOME'
      'FROM'
      '  PESSOA P, FUNCIONARIO F'
      'WHERE'
      ''
      ''
      '  (F.IDEMPRESA = :IDEMPRESA) AND'
      '  (F.IDPESSOA  = P.IDPESSOA)'
      'ORDER BY'
      '  UPPER(NOME)'
      ' ')
    ValidateWithMask = True
    Left = 550
    Top = 13
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end>
  end
  object qryRegra: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDREGRA, NOMEREGRA'
      'FROM'
      '  REGRA'
      'ORDER BY'
      '  UPPER(NOMEREGRA)')
    ValidateWithMask = True
    Left = 550
    Top = 1
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  RI.IDPESSOA,        RI.IDEMPRESA,     RI.IDRUBRICA,      RI.NU' +
        'MOCORRENCIAS,'
      
        '  RI.SEQRUBRICAINDIV, RI.IDFAVORECIDO,  RI.IDREGRACALCULO, RI.VA' +
        'LORRUBRICA,'
      
        '  RI.ANOMESINICIO,    RI.FLGPERMANENTE, RI.PARCELAS,       RI.FL' +
        'GTPRUBMANUT,'
      '  PF.NOME AS FUNCIONARIO'
      'FROM'
      
        '  PESSOA PF, RUBRICAINDIV RI, PROVDESC PD, RUBRICAXPESS RP, FUNC' +
        'IONARIO F'
      'WHERE'
      ''
      ''
      '  (RP.IDRUBRICA      = :IDPROVENTO)   AND'
      '  (RP.IDPESSOA       = :IDEMPRESA)    AND'
      '  (RI.IDEMPRESA      = :IDEMPRESA)    AND'
      '  (F.IDEMPRESA       = :IDEMPRESA)    AND'
      '  (RI.FLGTPRUBMANUT  = '#39'2'#39')           AND'
      '  (PD.FLGCONSTAFOLHA = 1)             AND'
      '  (RP.IDRUBRICA      = RI.IDRUBRICA)  AND'
      '  (RP.IDRUBRICA      = PD.IDPROVENTO) AND'
      '  (RI.IDPESSOA       = F.IDPESSOA)    AND'
      '  (F.IDPESSOA        = PF.IDPESSOA)'
      'ORDER BY'
      '  ANOMESINICIO DESC, UPPER(FUNCIONARIO), SEQRUBRICAINDIV'
      ' ')
    UpdateObject = updDet
    ControlType.Strings = (
      'FLGPERMANENTE;CheckBox;1;0')
    ValidateWithMask = True
    Left = 374
    Top = 1
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPROVENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end>
    object qryDetFUNCIONARIO: TStringField
      DisplayLabel = 'Nome da Pessoa'
      DisplayWidth = 36
      FieldName = 'FUNCIONARIO'
      Size = 60
    end
    object qryDetANOMESINICIO: TStringField
      DisplayLabel = 'Ano/Mês'
      DisplayWidth = 7
      FieldName = 'ANOMESINICIO'
      Size = 7
    end
    object qryDetFLGPERMANENTE: TFloatField
      DisplayLabel = 'Permanente ?'
      DisplayWidth = 10
      FieldName = 'FLGPERMANENTE'
    end
    object qryDetPARCELAS: TFloatField
      DisplayLabel = 'Parcelas'
      DisplayWidth = 10
      FieldName = 'PARCELAS'
    end
    object qryDetNUMOCORRENCIAS: TFloatField
      DisplayLabel = 'Ocorrências'
      DisplayWidth = 10
      FieldName = 'NUMOCORRENCIAS'
    end
    object qryDetVALORRUBRICA: TFloatField
      DisplayLabel = 'Valor Informado'
      DisplayWidth = 10
      FieldName = 'VALORRUBRICA'
      DisplayFormat = '#,0.00;#,0.00'
    end
    object qryDetSEQRUBRICAINDIV: TFloatField
      DisplayLabel = 'Sequência'
      DisplayWidth = 10
      FieldName = 'SEQRUBRICAINDIV'
    end
    object qryDetIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object qryDetIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
      Visible = False
    end
    object qryDetIDRUBRICA: TFloatField
      FieldName = 'IDRUBRICA'
      Visible = False
    end
    object qryDetIDFAVORECIDO: TFloatField
      FieldName = 'IDFAVORECIDO'
      Visible = False
    end
    object qryDetIDREGRACALCULO: TFloatField
      FieldName = 'IDREGRACALCULO'
      Visible = False
    end
    object qryDetFLGTPRUBMANUT: TStringField
      FieldName = 'FLGTPRUBMANUT'
      Visible = False
      Size = 1
    end
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update RUBRICAINDIV'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  NUMOCORRENCIAS = :NUMOCORRENCIAS,'
      '  SEQRUBRICAINDIV = :SEQRUBRICAINDIV,'
      '  IDFAVORECIDO = :IDFAVORECIDO,'
      '  IDREGRACALCULO = :IDREGRACALCULO,'
      '  VALORRUBRICA = :VALORRUBRICA,'
      '  ANOMESINICIO = :ANOMESINICIO,'
      '  FLGPERMANENTE = :FLGPERMANENTE,'
      '  PARCELAS = :PARCELAS,'
      '  FLGTPRUBMANUT = :FLGTPRUBMANUT'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDEMPRESA = :OLD_IDEMPRESA and'
      '  IDRUBRICA = :OLD_IDRUBRICA and'
      '  SEQRUBRICAINDIV = :OLD_SEQRUBRICAINDIV')
    InsertSQL.Strings = (
      'insert into RUBRICAINDIV'
      '  (IDPESSOA, IDEMPRESA, IDRUBRICA, NUMOCORRENCIAS, '
      'SEQRUBRICAINDIV, IDFAVORECIDO, '
      '   IDREGRACALCULO, VALORRUBRICA, ANOMESINICIO, FLGPERMANENTE, '
      'PARCELAS, '
      '   FLGTPRUBMANUT)'
      'values'
      '  (:IDPESSOA, :IDEMPRESA, :IDRUBRICA, :NUMOCORRENCIAS, '
      ':SEQRUBRICAINDIV, '
      
        '   :IDFAVORECIDO, :IDREGRACALCULO, :VALORRUBRICA, :ANOMESINICIO,' +
        ' '
      ':FLGPERMANENTE, '
      '   :PARCELAS, :FLGTPRUBMANUT)')
    DeleteSQL.Strings = (
      'delete from RUBRICAINDIV'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDEMPRESA = :OLD_IDEMPRESA and'
      '  IDRUBRICA = :OLD_IDRUBRICA and'
      '  SEQRUBRICAINDIV = :OLD_SEQRUBRICAINDIV')
    Left = 338
    Top = 1
  end
  object qryProxSeq: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 493
    Top = 1
  end
  object qryIn: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 614
    Top = 14
  end
  object Regra: TRegra
    QueryIn = qryIn
    DatabaseName = 'BaseDados'
    IdCalculo = 0
    IdEmpresa = -1
    Left = 614
    Top = 1
  end
end
