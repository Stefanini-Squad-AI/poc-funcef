inherited frmLancIRRFxInforme: TfrmLancIRRFxInforme
  Left = 39
  Top = 95
  Caption = 'Lançamento do IRRF'
  ClientWidth = 736
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 736
    inherited tbcDetalhe: TTabControlDetalhe [0]
      Top = 121
      Width = 726
      Height = 212
      Tabs.Strings = (
        'Linhas do Informe'
        'Valores'
        'Previdência')
      detdbGrids.Strings = (
        'dbgrdDet'
        ''
        '')
      inherited pgctrlDetalhe: TPageControl
        Width = 628
        Height = 153
        inherited tbsDet: TTabSheet
          inherited pnlControlesDet: TPanel [0]
            Width = 620
            Height = 125
            object lblLinhaInforme: TLabel
              Left = 32
              Top = 24
              Width = 96
              Height = 13
              Caption = 'Linha do Informe'
            end
            object lblValor: TLabel
              Left = 470
              Top = 25
              Width = 95
              Height = 13
              Caption = 'Base do Imposto'
            end
            object dblcLinhaInforme: TCMDBLookupCombo
              Left = 32
              Top = 40
              Width = 417
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMEINFORME'#9'60'#9'Nome da Linha'
                'CODINFORME'#9'10'#9'Código da Linha')
              DataField = 'IDINFORME'
              DataSource = dsDet
              LookupTable = qryLinhaInforme
              LookupField = 'IDINFORME'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object dbreValor: TDBRealEdit
              Left = 470
              Top = 40
              Width = 130
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '          0,00')
              TabOrder = 1
              WordWrap = False
              OnExit = dbrValorBaseExit
              IntDigits = 14
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLRLANC'
              DataSource = dsDet
            end
          end
          inherited dbgrdDet: TwwDBGrid [1]
            Width = 620
            Height = 125
            Selected.Strings = (
              'NOMEINFORME'#9'60'#9'Nome da Linha'#9'F'
              'VLRLANC'#9'10'#9'Valor'#9'F'
              'VLRLANCSINAL'#9'10'#9'VLRLANCSINAL'#9'F')
          end
        end
        object tbsValores: TTabSheet
          Caption = 'Valores'
          object lblBase: TLabel
            Left = 38
            Top = 17
            Width = 95
            Height = 13
            Caption = 'Base do Imposto'
          end
          object lblINSS: TLabel
            Left = 191
            Top = 65
            Width = 30
            Height = 13
            Caption = 'INSS'
          end
          object lblPercent: TLabel
            Left = 191
            Top = 17
            Width = 62
            Height = 13
            Caption = 'Percentual'
          end
          object lblPerc: TLabel
            Left = 280
            Top = 40
            Width = 10
            Height = 13
            Caption = '%'
          end
          object lblValorRef: TLabel
            Left = 294
            Top = 17
            Width = 114
            Height = 13
            Caption = 'Valor de Referência'
          end
          object lblIRRF: TLabel
            Left = 38
            Top = 65
            Width = 30
            Height = 13
            Caption = 'IRRF'
          end
          object lblPIS: TLabel
            Left = 294
            Top = 65
            Width = 21
            Height = 13
            Caption = 'PIS'
          end
          object lblIOF: TLabel
            Left = 438
            Top = 17
            Width = 72
            Height = 13
            Caption = 'Valor de IOF'
          end
          object dbrValorBase: TDBRealEdit
            Left = 38
            Top = 32
            Width = 130
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '          0,00')
            TabOrder = 0
            WordWrap = False
            OnExit = dbrValorBaseExit
            IntDigits = 14
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'VLRBASE'
            DataSource = ds
          end
          object dbrIRRF: TDBRealEdit
            Left = 38
            Top = 80
            Width = 130
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '          0,00')
            TabOrder = 4
            WordWrap = False
            IntDigits = 14
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'VLRIRRF'
            DataSource = ds
          end
          object dbrINSS: TDBRealEdit
            Left = 191
            Top = 80
            Width = 90
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '              0,00')
            TabOrder = 5
            WordWrap = False
            IntDigits = 18
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'VLRINSS'
            DataSource = ds
          end
          object dbrPercIRRF: TDBRealEdit
            Left = 191
            Top = 32
            Width = 90
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0,00')
            TabOrder = 1
            WordWrap = False
            OnExit = dbrPercIRRFExit
            IntDigits = 3
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'PERCIRRF'
            DataSource = ds
          end
          object dbrValorReferencia: TDBRealEdit
            Left = 294
            Top = 32
            Width = 130
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '          0,00')
            TabOrder = 2
            WordWrap = False
            IntDigits = 14
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'VLRREFERENCIA'
            DataSource = ds
          end
          object dbrPIS: TDBRealEdit
            Left = 294
            Top = 80
            Width = 130
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '              0,00')
            TabOrder = 6
            WordWrap = False
            IntDigits = 18
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'VLRPIS'
            DataSource = ds
          end
          object dbrIOF: TDBRealEdit
            Left = 438
            Top = 32
            Width = 130
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '          0,00')
            TabOrder = 3
            WordWrap = False
            IntDigits = 14
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'VLRIOF'
            DataSource = ds
          end
        end
        object tbsPrevidencia: TTabSheet
          Caption = 'Previdência'
          object lblPrograma: TLabel
            Left = 15
            Top = 52
            Width = 54
            Height = 13
            Caption = 'Programa'
          end
          object lblCentroCusto: TLabel
            Left = 303
            Top = 52
            Width = 92
            Height = 13
            Caption = 'Centro de Custo'
          end
          object lblMotivo: TLabel
            Left = 15
            Top = 97
            Width = 39
            Height = 13
            Caption = 'Motivo'
          end
          object Label1: TLabel
            Left = 303
            Top = 97
            Width = 93
            Height = 13
            Caption = 'Versão da Folha'
          end
          object pnlPlanoPatroC: TPanel
            Left = 0
            Top = 0
            Width = 620
            Height = 49
            BevelOuter = bvNone
            TabOrder = 0
            object lblPlanoPrevC: TLabel
              Left = 15
              Top = 4
              Width = 33
              Height = 13
              Caption = 'Plano'
            end
            object lblPatroC: TLabel
              Left = 303
              Top = 4
              Width = 80
              Height = 13
              Caption = 'Patrocinadora'
            end
            object dblcPlanoPrevC: TwwDBLookupCombo
              Left = 15
              Top = 20
              Width = 281
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'30'#9'Nome')
              DataField = 'IDPLANOPREV'
              DataSource = ds
              LookupTable = qryPlanoPrev
              LookupField = 'IDPLANOPREV'
              Options = [loColLines]
              Style = csDropDownList
              DropDownCount = 5
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object dblcPatroC: TwwDBLookupCombo
              Left = 303
              Top = 20
              Width = 281
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'30'#9'Nome')
              DataField = 'IDPATRO'
              DataSource = ds
              LookupTable = qryPatro
              LookupField = 'IDPESSOA'
              Options = [loColLines]
              Style = csDropDownList
              DropDownCount = 5
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
          end
          object dblcPrograma: TwwDBLookupCombo
            Left = 15
            Top = 68
            Width = 281
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCPROGRAMA'#9'60'#9'Descrição'
              'CODPROGRAMA'#9'2'#9'Código')
            DataField = 'IDPROGRAMA'
            DataSource = ds
            LookupTable = qryPrograma
            LookupField = 'IDPROGRAMA'
            Options = [loColLines]
            Style = csDropDownList
            DropDownCount = 5
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object dblcCentroCusto: TwwDBLookupCombo
            Left = 303
            Top = 68
            Width = 281
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'30'#9'Nome')
            DataField = 'CODCENTROCUSTO'
            DataSource = ds
            LookupTable = qryCentroCusto
            LookupField = 'CODCENTROCUSTO'
            Options = [loColLines]
            Style = csDropDownList
            DropDownCount = 5
            TabOrder = 2
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object dblcMotivo: TwwDBLookupCombo
            Left = 15
            Top = 111
            Width = 281
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'50'#9'Descrição'#9'F')
            DataField = 'IDMOTIVO'
            DataSource = ds
            LookupTable = qryMotivo
            LookupField = 'IDMOTIVO'
            Options = [loColLines]
            Style = csDropDownList
            DropDownCount = 5
            TabOrder = 3
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object dblcVersaoFolha: TwwDBLookupCombo
            Left = 303
            Top = 111
            Width = 281
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'HISTORICO'#9'50'#9'Descrição'#9'F')
            DataField = 'IDHSTFOLHABENEF'
            DataSource = ds
            LookupTable = qryVersaoFolha
            LookupField = 'IDHSTFOLHABENEF'
            Options = [loColLines]
            Style = csDropDownList
            DropDownCount = 5
            TabOrder = 4
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
        end
      end
      inherited Dock973: TDock97
        Width = 718
      end
      inherited Dock974: TDock97
        Left = 632
        Height = 153
      end
    end
    inherited pnlMestre: TPanel [1]
      Width = 726
      Height = 116
      object lblDataLancamento: TLabel
        Left = 368
        Top = 14
        Width = 119
        Height = 13
        Caption = 'Data do Lançamento'
      end
      object lblNatRendimento: TLabel
        Left = 255
        Top = 72
        Width = 141
        Height = 13
        Caption = 'Natureza de Rendimento'
      end
      object lblDocumento: TLabel
        Left = 24
        Top = 72
        Width = 65
        Height = 13
        Caption = 'Documento'
      end
      object PSubTipoBeneficiario1: TCMProcuraSubTipo
        Left = 24
        Top = 14
        Width = 325
        Height = 50
        Caption = 'Beneficiário'
        TabOrder = 0
        OnExit = PSubTipoBeneficiario1Exit
        CampoEdit = ceRazaoSocial
        MostraMensagens = True
        DataSource = ds
        DataField = 'IDBENEFIRRF'
        Mensagens.EmBranco = 'Beneficiário não pode estar em branco'
        Mensagens.NaoExiste = 'Beneficiário não existe'
        PermiteChaveInvalida = False
        PermiteChaveEmBranco = False
        SubTipo = stCliente
        FiltraSubTipo = False
      end
      object dbedDataLanc: TCMDateTimePicker
        Left = 366
        Top = 28
        Width = 121
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DATALANCAMENTO'
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
      object dblcNatRendimento: TwwDBLookupCombo
        Left = 255
        Top = 87
        Width = 246
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'60'#9'Descrição'
          'CODNATUREZA'#9'4'#9'Código')
        DataField = 'CODNATUREZA'
        DataSource = ds
        LookupTable = qryNatRendimento
        LookupField = 'CODNATUREZA'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dblcDocumento: TwwDBLookupCombo
        Left = 24
        Top = 87
        Width = 89
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'CODDOCUMENTO'#9'10'#9'Documento')
        DataField = 'CODDOCUMENTO'
        DataSource = ds
        LookupTable = qryDocumento
        LookupField = 'CODDOCUMENTO'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnEnter = dblcDocumentoEnter
      end
      object dbFolha: TDBCheckBox
        Left = 122
        Top = 91
        Width = 130
        Height = 17
        Caption = 'Refere-se a Folha'
        DataField = 'FLGFOLHA'
        DataSource = ds
        TabOrder = 4
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object cmccContaContabil: TCMProcuraMaskContabil
        Left = 510
        Top = 11
        Width = 209
        Height = 97
        Caption = ' Conta Contábil '
        TabOrder = 5
        OnExit = cmccContaContabilExit
        MostraMensagens = True
        MostraDescricao = True
        DataSource = ds
        DataField = 'PLACONTA'
        Mensagens.EmBranco = 'Conta não pode estar em branco'
        Mensagens.NaoExiste = 'Conta não existe'
        Mensagens.Sintetica = 'Conta não pode ser sintética'
        Mensagens.Analitica = 'Conta não pode ser analítica'
        PermiteChaveInvalida = False
        PermiteChaveEmBranco = False
        AceitaTipoConta = SoAnalitica
        Plano = 0
        Status = scSoAtiva
      end
    end
  end
  inherited Dock972: TDock97
    Width = 736
  end
  inherited Dock971: TDock97
    Width = 736
    inherited tb97Fundo: TToolbar97
      inherited bbtnSair: TBitBtn
        Tag = 99
      end
    end
    inherited TB97oKCancelar: TToolbar97
      inherited bbtnCancelar: TBitBtn
        Tag = 99
      end
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT * FROM LANCIRRF WHERE IDLANCIRRF = :IDLANCIRRF')
    Left = 649
    Top = 202
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDLANCIRRF'
        ParamType = ptUnknown
      end>
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 519
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update LANCIRRF'
      'set'
      '  DATALANCAMENTO = :DATALANCAMENTO,'
      '  PLANO = :PLANO,'
      '  PLACONTA = :PLACONTA,'
      '  IDDARF = :IDDARF,'
      '  CODDOCUMENTO = :CODDOCUMENTO,'
      '  IDPESSOA = :IDPESSOA,'
      '  IDBENEFIRRF = :IDBENEFIRRF,'
      '  VLRBASE = :VLRBASE,'
      '  CODNATUREZA = :CODNATUREZA,'
      '  VLRIRRF = :VLRIRRF,'
      '  VLRINSS = :VLRINSS,'
      '  FLGDARF = :FLGDARF,'
      '  NUMDOCUMENTO = :NUMDOCUMENTO,'
      '  VLRREFERENCIA = :VLRREFERENCIA,'
      '  PERCIRRF = :PERCIRRF,'
      '  FLGFOLHA = :FLGFOLHA,'
      '  IDPATRO = :IDPATRO,'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  IDPROGRAMA = :IDPROGRAMA,'
      '  IDMODULO = :IDMODULO,'
      '  IDMOTIVO = :IDMOTIVO,'
      '  CODCENTROCUSTO = :CODCENTROCUSTO,'
      '  IDEMPRESA = :IDEMPRESA,'
      '  VLRPIS = :VLRPIS,'
      '  IDHSTFOLHABENEF = :IDHSTFOLHABENEF,'
      '  VLRIOF = :VLRIOF'
      'where'
      '  IDLANCIRRF = :OLD_IDLANCIRRF')
    InsertSQL.Strings = (
      'insert into LANCIRRF'
      '  (DATALANCAMENTO, PLANO, PLACONTA, IDDARF, CODDOCUMENTO, '
      'IDPESSOA, IDBENEFIRRF, '
      
        '   VLRBASE, CODNATUREZA, VLRIRRF, VLRINSS, FLGDARF, NUMDOCUMENTO' +
        ', '
      'VLRREFERENCIA, '
      
        '   PERCIRRF, FLGFOLHA, IDPATRO, IDPLANOPREV, IDPROGRAMA, IDMODUL' +
        'O, '
      'IDMOTIVO, '
      '   CODCENTROCUSTO, IDEMPRESA, VLRPIS, IDHSTFOLHABENEF, VLRIOF)'
      'values'
      '  (:DATALANCAMENTO, :PLANO, :PLACONTA, :IDDARF, :CODDOCUMENTO, '
      ':IDPESSOA, '
      
        '   :IDBENEFIRRF, :VLRBASE, :CODNATUREZA, :VLRIRRF, :VLRINSS, :FL' +
        'GDARF, '
      
        '   :NUMDOCUMENTO, :VLRREFERENCIA, :PERCIRRF, :FLGFOLHA, :IDPATRO' +
        ', '
      ':IDPLANOPREV, '
      
        '   :IDPROGRAMA, :IDMODULO, :IDMOTIVO, :CODCENTROCUSTO, :IDEMPRES' +
        'A, '
      ':VLRPIS, '
      '   :IDHSTFOLHABENEF, :VLRIOF)')
    DeleteSQL.Strings = (
      'delete from LANCIRRF'
      'where'
      '  IDLANCIRRF = :OLD_IDLANCIRRF')
    Left = 170
    Top = 10
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PESSOA.RAZAOSOCIAL'
      'LANCIRRF.DATALANCAMENTO'
      'LANCIRRF.CODNATUREZA'
      'DOCUMENTO.NODOCUMENTO'
      'DOCUMENTO.COMPLDOCUMENTO'
      'LANCIRRF.VLRBASE'
      'LANCIRRF.VLRIRRF'
      'LANCIRRF.FLGDARF'
      'LANCIRRF.IDBENEFIRRF'
      'PESSOA.NUMDOCUMENTO')
    TipodeDado.Strings = (
      'C'
      'D'
      'C'
      'N'
      'C'
      'N'
      'N'
      'C'
      'N'
      'C')
    Descricao.Strings = (
      'Beneficiário'
      'Data de Lançamento'
      'Natureza do Rendimento'
      'Número do Documento'
      'Complemento do Documento'
      'Valor Base do Imposto'
      'Valor do IRRF'
      'DARF Impresso <S/N>'
      'Código do Beneficiário'
      'CGC/CPF')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'S')
    Tabelas.Strings = (
      'DOCUMENTO'
      'LANCIRRF'
      'PESSOA')
    CamposChave.Strings = (
      'LANCIRRF.IDLANCIRRF'
      'LANCIRRF.IDPESSOA')
    Filtro.Strings = (
      'DOCUMENTO.CODDOCUMENTO(+)=LANCIRRF.CODDOCUMENTO'
      'PESSOA.IDPESSOA=LANCIRRF.IDBENEFIRRF')
    Mascaras.Strings = (
      ''
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
      '10'
      '10'
      '10'
      '10'
      '60'
      '1'
      '60'
      '10'
      '10'
      '18')
    Left = 206
    Top = 192
  end
  inherited ds: TwwDataSource
    Left = 314
    Top = 2
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 364
    Top = 1
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 576
    Top = 147
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT LI.*, I.NOMEINFORME, 0 AS VLRLANCSINAL'
      'FROM LANCXINFORME LI, INFORME I'
      'WHERE (LI.IDLANCIRRF = :IDLANCIRRF)'
      '  AND (LI.IDINFORME = I.IDINFORME) '
      '   '
      ' ')
    UpdateObject = updDet
    ValidateWithMask = True
    Left = 608
    Top = 9
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDLANCIRRF'
        ParamType = ptUnknown
      end>
    object qryDetNOMEINFORME: TStringField
      DisplayLabel = 'Nome da Linha'
      DisplayWidth = 60
      FieldName = 'NOMEINFORME'
      Origin = 'INFORME.NOMEINFORME'
      Size = 60
    end
    object qryDetVLRLANC: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 10
      FieldName = 'VLRLANC'
      Origin = 'LANCXINFORME.VLRLANC'
      DisplayFormat = '#,##0.00'
    end
    object qryDetVLRLANCSINAL: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRLANCSINAL'
    end
    object qryDetIDINFORME: TFloatField
      FieldName = 'IDINFORME'
      Origin = 'LANCXINFORME.IDINFORME'
      Visible = False
    end
    object qryDetIDLANCIRRF: TFloatField
      FieldName = 'IDLANCIRRF'
      Origin = 'LANCXINFORME.IDLANCIRRF'
      Visible = False
    end
    object qryDetPERCLANC: TFloatField
      FieldName = 'PERCLANC'
      Origin = 'LANCXINFORME.PERCLANC'
      Visible = False
    end
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update LANCXINFORME'
      'set'
      '  IDINFORME = :IDINFORME,'
      '  IDLANCIRRF = :IDLANCIRRF,'
      '  PERCLANC = :PERCLANC,'
      '  VLRLANC = :VLRLANC'
      'where'
      '  IDINFORME = :OLD_IDINFORME and'
      '  IDLANCIRRF = :OLD_IDLANCIRRF')
    InsertSQL.Strings = (
      'insert into LANCXINFORME'
      '  (IDINFORME, IDLANCIRRF, PERCLANC, VLRLANC)'
      'values'
      '  (:IDINFORME, :IDLANCIRRF, :PERCLANC, :VLRLANC)')
    DeleteSQL.Strings = (
      'delete from LANCXINFORME'
      'where'
      '  IDINFORME = :OLD_IDINFORME and'
      '  IDLANCIRRF = :OLD_IDLANCIRRF')
    Left = 568
    Top = 9
  end
  object qryEmpresaProp: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT RAZAOSOCIAL,NOME,NUMDOCUMENTO FROM PESSOA '
      'WHERE'
      'IDPESSOA = :PIDPESSOA')
    ValidateWithMask = True
    Left = 380
    Top = 190
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryTabIRRF: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 516
    Top = 152
  end
  object qryPFisica: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT TIPO FROM PESSOA '
      'WHERE'
      'IDPESSOA = :PIDPESSOA')
    ValidateWithMask = True
    Left = 660
    Top = 130
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryDocumento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select * from documento')
    ValidateWithMask = True
    Left = 612
    Top = 86
  end
  object qryNatRendimento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select * from NATURENDIMENTO')
    ValidateWithMask = True
    Left = 524
    Top = 2
  end
  object qryPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   P.NOME, PT.IDPESSOA'
      'FROM'
      '   PESSOA P,'
      '   PATRO PT'
      'WHERE'
      '   (P.IDPESSOA = PT.IDPESSOA)   ')
    ValidateWithMask = True
    Left = 562
    Top = 205
  end
  object qryPrograma: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPROGRAMA, CODPROGRAMA, DESCPROGRAMA'
      'FROM PROGRAMA'
      'ORDER BY CODPROGRAMA')
    ValidateWithMask = True
    Left = 252
    Top = 4
  end
  object qryPlanoPrev: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '   IDPLANOPREV, NOME'
      'FROM'
      '   PLANPREVCONTABIL'
      'ORDER BY NOME ')
    ValidateWithMask = True
    Left = 102
  end
  object qryLinhaInforme: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '   IDINFORME, NOMEINFORME,  CODINFORME'
      'FROM'
      '   INFORME'
      'ORDER BY NOMEINFORME')
    ValidateWithMask = True
    Left = 438
    Top = 24
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 493
    Top = 192
  end
  object qryCentroCusto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   NOME, CODCENTROCUSTO'
      'FROM'
      '   CENTCUST'
      'WHERE'
      '   (IDEMPRESA = :IDEMPRESA)'
      'ORDER BY CODCENTROCUSTO   '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 271
    Top = 195
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end>
  end
  object qryMotivo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDMOTIVO,'
      '   DESCRICAO'
      'FROM'
      '   MOTIVO'
      'ORDER BY DESCRICAO'
      ' ')
    ValidateWithMask = True
    Left = 234
    Top = 289
  end
  object qryVersaoFolha: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDHSTFOLHABENEF,'
      '   HISTORICO'
      'FROM'
      '   HSTFOLHABENEF'
      'ORDER BY HISTORICO'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 139
    Top = 305
  end
end
