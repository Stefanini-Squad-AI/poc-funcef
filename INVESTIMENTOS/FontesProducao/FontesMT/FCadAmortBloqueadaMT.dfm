inherited FrmCadAmortBloqueadaMT: TFrmCadAmortBloqueadaMT
  Left = 225
  Top = 194
  Caption = 'Operação'
  ClientHeight = 382
  ClientWidth = 485
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 485
    Height = 265
    inherited dbGrd: TwwDBGrid [0]
      Width = 483
      Height = 263
      PictureMasks.Strings = (
        'VLROPERACAO'#9'###,###,###0.00'#9'T'#9'T')
      Selected.Strings = (
        'DESCTIPOFUNDOINV'#9'60'#9'Tipo de Fundo'
        'PLANPRVCONTABPATRO'#9'60'#9'Plano/Patrocinadora'
        'DESCFUNDOINVEST'#9'60'#9'Fundo de Investimento'
        'DATAOPERACAO'#9'18'#9'Data da Operação'
        'DESCTIPOOPERACAO'#9'60'#9'Tipo de Operação'
        'QTDOPERACAO'#9'22'#9'Quantidade de Cotas'
        'VLROPERACAO'#9'22'#9'Valor Recebido')
      TitleLines = 2
    end
    inherited pnlControles: TPanel [1]
      Width = 483
      Height = 263
      BevelInner = bvRaised
      BevelOuter = bvLowered
      object PageControl1: TPageControl
        Left = 2
        Top = 2
        Width = 479
        Height = 259
        ActivePage = TabSheet1
        Align = alClient
        TabOrder = 0
        object TabSheet1: TTabSheet
          Caption = 'Operação'
          object Label1: TLabel
            Left = 13
            Top = 132
            Width = 103
            Height = 13
            Caption = 'Tipo de Operação'
          end
          object lblQtdTransf: TLabel
            Left = 13
            Top = 181
            Width = 120
            Height = 13
            Caption = 'Quantidade de Cotas'
          end
          object lblVlrTransf: TLabel
            Left = 241
            Top = 181
            Width = 92
            Height = 13
            Caption = 'Valor Recebido '
          end
          object lblFundo: TLabel
            Left = 13
            Top = 88
            Width = 130
            Height = 13
            Caption = 'Fundo de Investimento'
          end
          object lblPlanoPatroOrigem: TLabel
            Left = 13
            Top = 46
            Width = 126
            Height = 13
            Caption = 'Plano / Patrocinadora'
          end
          object lblDtOperacao: TLabel
            Left = 341
            Top = 6
            Width = 73
            Height = 13
            Caption = 'Dt Operação'
          end
          object lblClasse: TLabel
            Left = 13
            Top = 6
            Width = 83
            Height = 13
            Caption = 'Tipo de Fundo'
          end
          object dblktipooperacao: TwwDBLookupCombo
            Left = 13
            Top = 147
            Width = 435
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCTIPOOPERACAO'#9'60'#9'DESCTIPOOPERACAO'#9'F')
            DataField = 'IDTIPOOPERACAO'
            DataSource = ds
            LookupTable = CdsTipoOper
            LookupField = 'IDTIPOOPERACAO'
            Options = [loColLines, loRowLines]
            TabOrder = 4
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
          end
          object dbrQuantidade: TDBRealEdit
            Left = 13
            Top = 196
            Width = 212
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0,000000000000')
            TabOrder = 5
            WordWrap = False
            OnEnter = dbrQuantidadeEnter
            IntDigits = 22
            DecDigits = 12
            NumberFormat = fNumber
            Signal = False
            DataField = 'QTDOPERACAO'
            DataSource = ds
          end
          object dbrValor: TDBRealEdit
            Left = 240
            Top = 196
            Width = 206
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0,00')
            TabOrder = 6
            WordWrap = False
            OnEnter = dbrValorEnter
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'VLROPERACAO'
            DataSource = ds
          end
          object dblkFundoInvest: TwwDBLookupCombo
            Left = 13
            Top = 103
            Width = 435
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCFUNDOINVEST'#9'60'#9'DESCFUNDOINVEST'#9'F')
            DataField = 'IDFUNDOINVEST'
            DataSource = ds
            LookupTable = CdsFundoInvest
            LookupField = 'IDFUNDOINVEST'
            Options = [loColLines, loRowLines]
            TabOrder = 3
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
            OnCloseUp = dblkFundoInvestCloseUp
            OnExit = dblkFundoInvestExit
          end
          object dblkPlanPatroOrig: TwwDBLookupCombo
            Left = 13
            Top = 61
            Width = 435
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'PLANPRVCONTABPATRO'#9'30'#9'Descrição'#9'F')
            DataField = 'IDPLANPREVCTBPATR'
            DataSource = ds
            LookupTable = CdsPlanoPatro
            LookupField = 'IDPLANPREVCTBPATR'
            Options = [loColLines, loRowLines]
            TabOrder = 2
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
          end
          object dbDtaOperacao: TCMDateTimePicker
            Left = 341
            Top = 21
            Width = 105
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'DATAOPERACAO'
            DataSource = ds
            Epoch = 1950
            ButtonGlyph.Data = {
              06050000424D06050000000000003604000028000000100000000D0000000100
              080000000000D000000000000000000000000001000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
              A6000020400000206000002080000020A0000020C0000020E000004000000040
              20000040400000406000004080000040A0000040C0000040E000006000000060
              20000060400000606000006080000060A0000060C0000060E000008000000080
              20000080400000806000008080000080A0000080C0000080E00000A0000000A0
              200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
              200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
              200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
              20004000400040006000400080004000A0004000C0004000E000402000004020
              20004020400040206000402080004020A0004020C0004020E000404000004040
              20004040400040406000404080004040A0004040C0004040E000406000004060
              20004060400040606000406080004060A0004060C0004060E000408000004080
              20004080400040806000408080004080A0004080C0004080E00040A0000040A0
              200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
              200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
              200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
              20008000400080006000800080008000A0008000C0008000E000802000008020
              20008020400080206000802080008020A0008020C0008020E000804000008040
              20008040400080406000804080008040A0008040C0008040E000806000008060
              20008060400080606000806080008060A0008060C0008060E000808000008080
              20008080400080806000808080008080A0008080C0008080E00080A0000080A0
              200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
              200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
              200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
              2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
              2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
              2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
              2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
              2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
              2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
              2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
              000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
              A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
              A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
              A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
              FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
              04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
              000000000000000000FF}
            ShowButton = True
            TabOrder = 1
          end
          object dblkTipoFundo: TwwDBLookupCombo
            Left = 13
            Top = 21
            Width = 316
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCTIPOFUNDOINV'#9'30'#9'DESCTIPOFUNDOINV'#9'F')
            DataField = 'IDTIPOFUNDOINVEST'
            DataSource = ds
            LookupTable = CdsTipoFundo
            LookupField = 'IDTIPOFUNDOINVEST'
            Options = [loColLines, loRowLines]
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
            OnCloseUp = dblkTipoFundoCloseUp
            OnExit = dblkTipoFundoExit
          end
        end
        object TabSheet2: TTabSheet
          Caption = 'Observação'
          ImageIndex = 1
          object dbmObs: TDBMemo
            Left = 0
            Top = 0
            Width = 605
            Height = 231
            Align = alClient
            DataField = 'OBSERVACAO'
            DataSource = ds
            MaxLength = 300
            TabOrder = 0
          end
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 485
  end
  inherited Dock971: TDock97
    Top = 343
    Width = 485
    inherited tb97Fundo: TToolbar97
      Left = 313
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 144
    end
  end
  inherited pnlTitulo: TPanel
    Width = 485
    inherited lbNomItem: TfcLabel
      Width = 435
      Caption = 'Recebimento de Amortizações Bloqueadas'
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      2
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        'TDBMemo'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 182
    Top = 47
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyEdit = CmeCadastroApplyInsert
    ApplyDelete = CmeCadastroApplyInsert
    Left = 272
    Top = 55
  end
  inherited Cds: TCMClientDataSet
    Left = 220
    Top = 55
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'OPERACAOFUNDO.DATAOPERACAO'
      'OPERACAOFUNDO.DATAOPERACAO'
      'TIPOFUNDOINVEST.DESCTIPOFUNDOINV'
      'VWPLANPREVCTBPATR.PLANPRVCONTABPATRO'
      'FUNDOINVEST.DESCFUNDOINVEST')
    TipodeDado.Strings = (
      'D'
      'D'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Data Inicial'
      'Data Final'
      'Tipo de Fundo'
      'Plano Patrocinadora'
      'Fundo de Investimento')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'OPERACAOFUNDO'
      'VWPLANPREVCTBPATR'
      'FUNDOINVEST'
      'TIPOFUNDOINVEST')
    CamposChave.Strings = (
      'OPERACAOFUNDO.IDOPERACAOFUNDO')
    Filtro.Strings = (
      
        'OPERACAOFUNDO.IDPLANPREVCTBPATR =  VWPLANPREVCTBPATR.IDPLANPREVC' +
        'TBPATR'
      'OPERACAOFUNDO.IDFUNDOINVEST = FUNDOINVEST.IDFUNDOINVEST'
      'OPERACAOFUNDO.IDTIPOOPERACAO=-171'
      
        'FUNDOINVEST.IDTIPOFUNDOINVEST = TIPOFUNDOINVEST.IDTIPOFUNDOINVES' +
        'T')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '18'
      '18'
      '80'
      '113'
      '60')
    OperComparador.Strings = (
      '2'
      '4'
      '-1'
      '-1'
      '-1')
    LookupSQL.Strings = (
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
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      '')
  end
  inherited CdsAux: TCMClientDataSet
    Left = 100
    Top = 207
  end
  inherited pmnuFixaColunas: TPopupMenu
    Left = 168
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      'select  OP.IDOPERACAOFUNDO,'
      '           FI.IdTipoFundoInvest,'
      '           TF.DescTipoFundoInv,'
      '           OP.DataOperacao,'
      '           OP.IdPlanPrevCtbPatr,'
      '           Patro.PlanPrvContabPatro,'
      '           OP.IdFundoInvest,'
      '           FI.DescFundoInvest,'
      '           OP.IdTipoOperacao,'
      '           TpOp.DescTipoOperacao,'
      '           OP.QtdOperacao,'
      '           OP.VlrOperacao,'
      '           OP.OBSERVACAO'
      
        'from OperacaoFundo OP, FundoInvest FI,TipoFundoInvest TF,VWPLANP' +
        'REVCTBPATR Patro,TipoOperacao TpOp'
      'where OP.idtipooperacao = -171 and'
      '      OP.idfundoinvest = FI.idfundoinvest and'
      '      FI.IDTIPOFUNDOINVEST = TF.idtipofundoinvest and'
      '      OP.IDPLANPREVCTBPATR = Patro.idplanprevctbpatr and'
      '      OP.IdTipoOperacao = TpOp.IdTipoOperacao'
      ' '
      ' '
      ' '
      ' '
      ' ')
    ClientDataSet = Cds
    Left = 141
    Top = 39
  end
  object CdsPlanoPatro: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 417
    Top = 159
  end
  object CdsTipoFundo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 301
    Top = 127
  end
  object CdsFundoInvest: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 413
    Top = 207
  end
  object CdsTipoOper: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 341
    Top = 247
  end
  object CMSqlParams2: TCMSqlParams
    SQL.Strings = (
      'SELECT *'
      'FROM TIPOOPERACAO')
    ClientDataSet = CdsTipoOper
    Left = 325
    Top = 287
  end
  object CdsMaxVigenciaFundos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 393
    Top = 103
  end
end
