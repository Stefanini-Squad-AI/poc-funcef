inherited frmLancaRub: TfrmLancaRub
  Left = 16
  Top = 103
  HelpContext = 210060
  Caption = 'Lançamento de Rubricas Salariais (Proventos e Descontos)'
  ClientHeight = 442
  ClientWidth = 767
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 767
    Height = 356
    BorderWidth = 2
    inherited pnlMestre: TPanel
      Left = 4
      Top = 4
      Width = 759
      Height = 34
      BevelInner = bvLowered
      BevelOuter = bvRaised
      object Label1: TLabel
        Left = 28
        Top = 9
        Width = 55
        Height = 13
        Caption = 'Matrícula'
      end
      object Label10: TLabel
        Left = 201
        Top = 9
        Width = 33
        Height = 13
        Caption = 'Nome'
      end
      object dbedMat: TwwDBEdit
        Left = 88
        Top = 7
        Width = 84
        Height = 21
        Color = clGray
        DataField = 'MATRICULA'
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
      object dbedNome: TwwDBEdit
        Left = 239
        Top = 7
        Width = 457
        Height = 21
        Color = clGray
        DataField = 'NOME'
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
      Top = 38
      Width = 501
      Height = 314
      MultiLine = True
      Tabs.Strings = (
        'Rubricas')
      inherited pgctrlDetalhe: TPageControl
        Width = 403
        Height = 255
        inherited tbsDet: TTabSheet
          Caption = 'Rubricas'
          inherited dbgrdDet: TwwDBGrid
            Width = 395
            Height = 227
            Selected.Strings = (
              'RUBRICA'#9'36'#9'Nome da Rubrica'
              'ANOMESINICIO'#9'7'#9'Ano/Mês'
              'FLGPERMANENTE'#9'10'#9'Permanente?'
              'PARCELAS'#9'7'#9'Parcelas'
              'NUMOCORRENCIAS'#9'10'#9'Ocorrências'
              'VALORRUBRICA'#9'10'#9'Valor Informado'
              'SEQRUBRICAINDIV'#9'10'#9'Sequência'#9'F')
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            ParentFont = False
          end
          inherited pnlControlesDet: TPanel
            Width = 395
            Height = 227
            object Label2: TLabel
              Left = 12
              Top = 0
              Width = 194
              Height = 13
              Caption = 'Rubrica do Provento ou Desconto'
            end
            object Label16: TLabel
              Left = 323
              Top = 0
              Width = 61
              Height = 13
              Caption = 'Sequência'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblParcelas: TLabel
              Left = 233
              Top = 45
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
            object Label3: TLabel
              Left = 312
              Top = 45
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
            object Label9: TLabel
              Left = 12
              Top = 150
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
            object dblckcmbRubrica: TwwDBLookupCombo
              Left = 12
              Top = 15
              Width = 302
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRPROVDESC'#9'60'#9'Descrição'
                'IDRUBRICA'#9'10'#9'Código')
              DataField = 'IDRUBRICA'
              DataSource = dsDet
              LookupTable = qryRubrica
              LookupField = 'IDRUBRICA'
              Options = [loColLines, loTitles]
              Style = csDropDownList
              ParentFont = False
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              OnChange = dblckcmbRubricaChange
              OnExit = dblckcmbRubricaExit
            end
            object dbedSeq: TwwDBEdit
              Left = 323
              Top = 15
              Width = 61
              Height = 21
              TabStop = False
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
              TabOrder = 1
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object grpMesInicio: TGroupBox
              Left = 12
              Top = 45
              Width = 200
              Height = 47
              Caption = 'Mês e Ano de Início '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 2
              object cmbMes: TComboBox
                Left = 7
                Top = 17
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
                OnChange = cmbMesChange
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
                Left = 125
                Top = 17
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
                OnChange = spnedAnoChange
              end
            end
            object spedParcelas: TSpinEdit
              Left = 233
              Top = 60
              Width = 59
              Height = 22
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              MaxValue = 999
              MinValue = 1
              ParentFont = False
              TabOrder = 3
              Value = 1
            end
            object dbedOcorr: TwwDBEdit
              Left = 312
              Top = 61
              Width = 72
              Height = 21
              DataField = 'NUMOCORRENCIAS'
              DataSource = dsDet
              TabOrder = 4
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object chkRubPermanente: TCheckBox
              Left = 12
              Top = 114
              Width = 92
              Height = 16
              Alignment = taLeftJustify
              Caption = 'Permanente?'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 5
              OnClick = chkRubPermanenteClick
            end
            object gbxValInf: TGroupBox
              Left = 111
              Top = 98
              Width = 133
              Height = 49
              Caption = 'Valor Informado'
              TabOrder = 6
              object dbedValor: TDBRealEdit
                Left = 6
                Top = 17
                Width = 120
                Height = 21
                Alignment = taRightJustify
                Lines.Strings = (
                  '      0,00')
                TabOrder = 0
                WordWrap = False
                IntDigits = 10
                DecDigits = 2
                NumberFormat = fNumber
                Signal = False
                DataField = 'VALORRUBRICA'
                DataSource = dsDet
              end
            end
            object gbxValCalc: TGroupBox
              Left = 250
              Top = 98
              Width = 133
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
                Width = 96
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
            object dblckcmbRegra: TwwDBLookupCombo
              Left = 12
              Top = 164
              Width = 373
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
              Options = [loTitles]
              Style = csDropDownList
              ParentFont = False
              TabOrder = 8
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              OnChange = dblckcmbRegraChange
            end
            object ProcuraFavorecido: TCMProcuraForCli
              Left = 12
              Top = 192
              Width = 373
              Height = 47
              Caption = 'Favorecido'
              TabOrder = 9
              Visible = False
              OnExit = ProcuraFavorecidoExit
              CampoEdit = ceRazaoSocial
              MostraMensagens = True
              DataSource = dsDet
              DataField = 'IDFAVORECIDO'
              Mensagens.EmBranco = 'Favorecido não pode estar em branco'
              Mensagens.NaoExiste = 'Favorecido não existe'
              PermiteChaveInvalida = False
              PermiteChaveEmBranco = True
              ForCli = fcFornecedor
              MostraEndereco = False
              StatusForCli = fcAll
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 493
        object tb97BotaoIncRubVarPess: TToolbar97
          Left = 96
          Top = 0
          Caption = 'tb97BotoesDetalhe'
          DockPos = 96
          TabOrder = 1
          object sbtnIncRubVarPess: TToolbarButton97
            Left = 0
            Top = 0
            Width = 25
            Height = 25
            Hint = 'Inserir Rubrica para várias Pessoas'
            AllowAllUp = True
            GroupIndex = 2
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              3333333333333333333333333333333333333333333333333333333333300000
              0003333333388888888333333330FF9FFF0333333338FF7FFF8333333000F999
              FF0333333888F777FF83333330F099F99F03333338F877F77F83333000F09FFF
              9903333888F87FFF77833330F090FFFFF9933338F878FFFFF7733000F0900000
              00993888F8788888887730F090FFFFF9933338F878FFFFF7733330F090000000
              993338F87888888877333090FFFFF99333333878FFFFF7733333309000000099
              3333387888888877333330FFFFF99333333338FFFFF773333333300000009933
              3333388888887733333333333333333333333333333333333333}
            ImageIndex = 0
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = sbtnIncRubVarPessClick
          end
        end
      end
      inherited Dock974: TDock97
        Left = 407
        Height = 255
      end
    end
    object pnlMesLanc: TPanel
      Left = 505
      Top = 38
      Width = 258
      Height = 314
      Align = alRight
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 2
      object Shape1: TShape
        Left = 9
        Top = 170
        Width = 36
        Height = 18
      end
      object Label4: TLabel
        Left = 54
        Top = 172
        Width = 33
        Height = 13
        Caption = 'Normal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Shape5: TShape
        Left = 142
        Top = 170
        Width = 36
        Height = 18
        Brush.Color = clLime
      end
      object Label12: TLabel
        Left = 186
        Top = 172
        Width = 48
        Height = 13
        Caption = 'Descanso'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Shape7: TShape
        Left = 9
        Top = 200
        Width = 36
        Height = 18
        Hint = 
          'Selecione uma Data e Clique Botão da Direita para (Des)Informar ' +
          'uma Falta'
        Brush.Color = clOlive
        ParentShowHint = False
        ShowHint = True
      end
      object Label14: TLabel
        Left = 54
        Top = 202
        Width = 23
        Height = 13
        Caption = 'Falta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Shape6: TShape
        Left = 142
        Top = 200
        Width = 36
        Height = 18
        Brush.Color = clAqua
      end
      object Label13: TLabel
        Left = 186
        Top = 202
        Width = 35
        Height = 13
        Caption = 'Feriado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Shape3: TShape
        Left = 9
        Top = 230
        Width = 36
        Height = 18
        Brush.Color = clFuchsia
      end
      object Label8: TLabel
        Left = 54
        Top = 232
        Width = 28
        Height = 13
        Caption = 'Férias'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Shape4: TShape
        Left = 142
        Top = 230
        Width = 36
        Height = 18
        Brush.Color = clRed
      end
      object Label11: TLabel
        Left = 186
        Top = 232
        Width = 64
        Height = 13
        Caption = 'Desligamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Shape2: TShape
        Left = 142
        Top = 261
        Width = 36
        Height = 18
        Brush.Color = clYellow
      end
      object Label6: TLabel
        Left = 186
        Top = 263
        Width = 59
        Height = 13
        Caption = 'Afastamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Bevel1: TBevel
        Left = 0
        Top = 34
        Width = 258
        Height = 3
      end
      object lblMesLanc: TLabel
        Left = 7
        Top = 11
        Width = 245
        Height = 13
        AutoSize = False
        Caption = 'Mês de Lançamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Calendario: TStringGrid
        Left = 9
        Top = 46
        Width = 241
        Height = 115
        ColCount = 7
        DefaultColWidth = 33
        DefaultRowHeight = 15
        FixedCols = 0
        RowCount = 7
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine]
        ScrollBars = ssNone
        TabOrder = 0
        OnDblClick = CalendarioDblClick
        OnDrawCell = CalendarioDrawCell
        OnSelectCell = CalendarioSelectCell
      end
    end
  end
  inherited Dock972: TDock97
    Width = 767
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Enabled = False
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Enabled = False
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 403
    Width = 767
    inherited tb97Fundo: TToolbar97
      Left = 598
      DockPos = 612
      inherited sep1: TToolbarSep97
        SizeHorz = 2
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 431
      DockPos = 445
    end
  end
  inherited qry: TwwQuery
    AfterScroll = qryAfterScroll
    SQL.Strings = (
      'SELECT'
      '  F.IDPESSOA, F.IDEMPRESA, F.MATRICULA, F.DATADESLIGAMENTO,'
      '  F.DATARETORNO, F.IDHORARIO, PF.NOME, ST.TIPOSIT,'
      '  DECODE(C.IdPais,NULL,ES.IDPAIS,C.IdPais) AS IdPais,'
      '  E.IdCidades, RTRIM(ES.CodEstado) AS UF'
      'FROM'
      '  PESSOA PJ, PESSOA PF, ENDPESS E, FUNCIONARIO F,'
      '  SITFUNC ST, ESTADO ES, CIDADES C'
      'WHERE'
      '  (F.IDPESSOA        = :IDPESSOA)       AND'
      '  (F.IDSITFUNC       = ST.IDSITFUNC)    AND'
      '  (F.IDPESSOA        = PF.IDPESSOA)     AND'
      '  (F.IDESTAB         = PJ.IDPESSOA)     AND'
      '  (PJ.IDENDCOMERCIAL = E.IDENDERECO(+)) AND'
      '  (PJ.IDPESSOA       = E.IDPESSOA(+))   AND'
      '  (E.IDCIDADES       = C.IDCIDADES(+))  AND'
      '  (C.IDESTADO        = ES.IDESTADO(+))'
      ' ')
    Left = 273
    Top = 1
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    OnStateChange = dsDetStateChange
    Left = 403
    Top = 1
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 154
    Top = 1
    TargetsData = (
      1
      3
      (
        ''
        'Cells'
        0)
      (
        'TRealEdit'
        'Text'
        0)
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited upd: TUpdateSQL
    Left = 245
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Empregados'
    Colunas.Strings = (
      'PESSOA.NOME'
      'FUNCIONARIO.MATRICULA'
      'PESSOA.NUMDOCUMENTO'
      'CARGO.TITULO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nome da Pessoa'
      'Matrícula'
      'CPF (ou equivalente)'
      'Cargo')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'FUNCIONARIO'
      'CARGO')
    CamposChave.Strings = (
      'FUNCIONARIO.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '22'
      '22'
      '40')
    Left = 662
    Top = 27
  end
  inherited ds: TwwDataSource
    Left = 301
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 209
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 663
    Top = 14
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 663
    Top = 1
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    BeforeInsert = qryDetBeforeInsert
    AfterInsert = qryDetAfterInsert
    AfterScroll = qryDetAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  RI.IDPESSOA, RI.IDEMPRESA, RI.IDRUBRICA, RI.NUMOCORRENCIAS, RI' +
        '.SEQRUBRICAINDIV,'
      
        '  RI.IDFAVORECIDO, RI.IDREGRACALCULO, RI.VALORRUBRICA, RI.ANOMES' +
        'INICIO,'
      
        '  RI.FLGPERMANENTE, RI.PARCELAS, RI.FLGTPRUBMANUT, RP.DESCRPROVD' +
        'ESC AS RUBRICA'
      'FROM'
      '  RUBRICAINDIV RI, RUBRICAXPESS RP, PROVDESC PD'
      'WHERE'
      '  (RI.IDPESSOA       = :IDPESSOA)    AND'
      '  (RI.IDEMPRESA      = :IDEMPRESA)   AND'
      '  (RP.IDPESSOA       = :IDEMPRESA)   AND'
      '  (RI.FLGTPRUBMANUT  = '#39'2'#39')          AND'
      '  (PD.FLGCONSTAFOLHA = 1)            AND'
      '  (RI.IDRUBRICA      = RP.IDRUBRICA) AND'
      '  (RP.IDRUBRICA      = PD.IDPROVENTO)'
      'ORDER BY'
      
        '  FLGPERMANENTE DESC, ANOMESINICIO DESC, UPPER(RUBRICA), SEQRUBR' +
        'ICAINDIV')
    UpdateObject = updDet
    ControlType.Strings = (
      'FLGPERMANENTE;CheckBox;1;0')
    ValidateWithMask = True
    Left = 372
    Top = 1
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end>
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update RUBRICAINDIV'
      'set'
      '  IDRUBRICA = :IDRUBRICA,'
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
    Left = 337
    Top = 1
  end
  object qryIn: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 608
    Top = 14
  end
  object Regra: TRegra
    QueryIn = qryIn
    DatabaseName = 'BaseDados'
    IdCalculo = 0
    IdEmpresa = -1
    Left = 608
    Top = 1
  end
  object qryParamRH: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  NORMALINI, NORMALFIM, IDRUBFALTA'
      'FROM'
      '  PARAMRH')
    ValidateWithMask = True
    Left = 496
    Top = 14
  end
  object qryProxSeq: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 496
    Top = 1
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
    Left = 559
    Top = 13
  end
  object qryRubrica: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  RP.IDPESSOA, RP.IDRUBRICA, RP.DESCRPROVDESC,'
      '  PD.FLGOBRIGAFAVOREC, PD.IDREGRA'
      'FROM'
      '  RUBRICAXPESS RP, PROVDESC PD'
      'WHERE'
      '  (PD.FLGCONSTAFOLHA  = 1)          AND'
      '  (PD.FLGTPRUBRICA LIKE '#39'%F%'#39')      AND'
      '  (RP.IDPESSOA        = :IDEMPRESA) AND'
      '  (RP.IDRUBRICA       = PD.IDPROVENTO)'
      'ORDER BY'
      '  UPPER(RP.DESCRPROVDESC)')
    ValidateWithMask = True
    Left = 559
    Top = 1
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end>
  end
  object qryTurnoSem: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDDIASEMANA'
      'FROM'
      '  TURNOSEM'
      'WHERE'
      '  (IDHORARIO = :IDHORARIO)')
    ControlType.Strings = (
      'FLGPERMANENTE;CheckBox;1;0')
    ValidateWithMask = True
    Left = 452
    Top = 279
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDHORARIO'
        ParamType = ptUnknown
      end>
  end
  object qryHstFer: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  INIGOZOFERIAS, FIMGOZOFERIAS'
      'FROM'
      '  FERIAS'
      'WHERE'
      '  (IDPESSOA       = :IDPESSOA)  AND'
      '  (FLGOCORRIDA    = 1)          AND'
      '  (FIMGOZOFERIAS >= :NORMALINI) AND'
      '  (INIGOZOFERIAS <= :NORMALFIM)'
      ' ')
    ControlType.Strings = (
      'FLGPERMANENTE;CheckBox;1;0')
    ValidateWithMask = True
    Left = 452
    Top = 265
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'NORMALINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'NORMALFIM'
        ParamType = ptUnknown
      end>
  end
  object qryFalta: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  FT.IDPESSOA, FT.DATAFALTA'
      'FROM'
      '  FALTASTRAB FT, PARAMRH PH'
      'WHERE'
      '  (FT.IDPESSOA = :IDPESSOA)      AND'
      '  (FT.DATAFALTA >= PH.NORMALINI) AND'
      '  (FT.DATAFALTA <= PH.NORMALFIM)')
    UpdateObject = updFalta
    ControlType.Strings = (
      'FLGPERMANENTE;CheckBox;1;0')
    ValidateWithMask = True
    Left = 450
    Top = 345
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object updFalta: TUpdateSQL
    ModifySQL.Strings = (
      'update FALTASTRAB'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  DATAFALTA = :DATAFALTA'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  DATAFALTA = :OLD_DATAFALTA')
    InsertSQL.Strings = (
      'insert into FALTASTRAB'
      '  (IDPESSOA, DATAFALTA)'
      'values'
      '  (:IDPESSOA, :DATAFALTA)')
    DeleteSQL.Strings = (
      'delete from FALTASTRAB'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  DATAFALTA = :OLD_DATAFALTA')
    Left = 450
    Top = 331
  end
  object qryFeriado: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '')
    ValidateWithMask = True
    Left = 447
    Top = 214
  end
end
