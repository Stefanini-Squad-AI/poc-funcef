inherited frmParamIRRFMT: TfrmParamIRRFMT
  Left = 248
  Top = 111
  HelpContext = 230005
  Caption = 'Parâmetros do Sistema'
  ClientHeight = 562
  ClientWidth = 932
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 932
    Height = 476
    object pcnParametros: TPageControl
      Left = 1
      Top = 1
      Width = 930
      Height = 474
      ActivePage = tbsInforme
      Align = alClient
      TabOrder = 0
      object tbsGeral: TTabSheet
        Caption = '&Geral'
        object lblNumDiasAviso: TLabel
          Left = 31
          Top = 196
          Width = 352
          Height = 13
          Caption = 'Aviso de darf não gerado (em dias úteis antes do vencimento)'
        end
        object GroupBox1: TGroupBox
          Left = 8
          Top = 9
          Width = 401
          Height = 153
          Caption = ' Alteradores para guias de pagamento (DARF, GPS, DARM) '
          TabOrder = 0
          object Multa: TLabel
            Left = 16
            Top = 22
            Width = 32
            Height = 13
            Caption = 'Multa'
          end
          object Label7: TLabel
            Left = 16
            Top = 62
            Width = 31
            Height = 13
            Caption = 'Juros'
          end
          object Label1: TLabel
            Left = 16
            Top = 102
            Width = 55
            Height = 13
            Caption = 'Desconto'
          end
          object dblcmbMulta: TwwDBLookupCombo
            Left = 16
            Top = 36
            Width = 374
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'35'#9'DESCRICAO')
            DataField = 'CODALTMULTA'
            DataSource = ds
            LookupTable = cdsMultaJurosDesc
            LookupField = 'CODALTERADOR'
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object dblcmbJuros: TwwDBLookupCombo
            Left = 16
            Top = 76
            Width = 374
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'35'#9'DESCRICAO')
            DataField = 'CODALTJUROS'
            DataSource = ds
            LookupTable = cdsMultaJurosDesc
            LookupField = 'CODALTERADOR'
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object dblcDesconto: TwwDBLookupCombo
            Left = 16
            Top = 116
            Width = 374
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'35'#9'DESCRICAO')
            DataField = 'CODALTDESCONTO'
            DataSource = ds
            LookupTable = cdsDesconto
            LookupField = 'CODALTERADOR'
            TabOrder = 2
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
        end
        object dbchkUsaDadosTelaManual: TDBCheckBox
          Left = 8
          Top = 170
          Width = 401
          Height = 17
          Caption = 
            'Utilizar dados do último registro em lançamento manual de impost' +
            'os'
          DataField = 'FLGUSAMANUAL'
          DataSource = ds
          TabOrder = 1
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbedNumDiasAvisoDarf: TwwDBEdit
          Left = 8
          Top = 192
          Width = 17
          Height = 21
          Hint = 
            'Informar o número de dias úteis que quer passar a ver o lembrete' +
            '. O valor zero desliga o parâmetro.'
          DataField = 'NUMDIASAVISODARF'
          DataSource = ds
          MaxLength = 1
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
      end
      object TabSheet1: TTabSheet
        Caption = 'Integração com Contas a Pagar'
        object Label2: TLabel
          Left = 8
          Top = 66
          Width = 331
          Height = 13
          Caption = 'Tipo de Desembolso para geração de guias de pagamento'
        end
        object Label3: TLabel
          Left = 8
          Top = 106
          Width = 108
          Height = 13
          Caption = 'Atividade / Projeto'
        end
        object Label5: TLabel
          Left = 8
          Top = 146
          Width = 112
          Height = 13
          Caption = 'Tipo de Documento'
        end
        object Label16: TLabel
          Left = 376
          Top = 18
          Width = 245
          Height = 13
          Caption = 'Linha de Informe para o Rendimento Bruto '
        end
        object Label17: TLabel
          Left = 376
          Top = 58
          Width = 225
          Height = 13
          Caption = 'Linha de Informe para o Imposto Retido'
        end
        object Label20: TLabel
          Left = 376
          Top = 194
          Width = 350
          Height = 13
          Caption = 'Centro de Custo ÚNICO para geração de guias de pagamento'
        end
        object wwDBLookupCombo1: TwwDBLookupCombo
          Left = 8
          Top = 80
          Width = 345
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'35'#9'Tipo de Desembolso'
            'CODTIPRECDES'#9'15'#9'Código')
          DataField = 'CODTIPRECDES'
          DataSource = ds
          LookupTable = cdsTipoDesembolso
          LookupField = 'CODTIPRECDES'
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object wwDBLookupCombo2: TwwDBLookupCombo
          Left = 8
          Top = 120
          Width = 345
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'25'#9'Descrição'
            'UNIDNEGOC'#9'10'#9'Código')
          DataField = 'UNIDNEGOC'
          DataSource = ds
          LookupTable = cdsAtivProj
          LookupField = 'UNIDNEGOC'
          TabOrder = 2
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object wwDBLookupCombo4: TwwDBLookupCombo
          Left = 8
          Top = 160
          Width = 345
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'35'#9'Descrição'
            'CODTIPDOC'#9'10'#9'Código')
          DataField = 'CODTIPDOC'
          DataSource = ds
          LookupTable = cdsTipoDoc
          LookupField = 'CODTIPDOC'
          TabOrder = 3
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object dbrgPagLanc: TDBRadioGroup
          Left = 8
          Top = 192
          Width = 345
          Height = 38
          Caption = ' Buscar impostos (exceto INSS e ISS) pela data de: '
          Columns = 2
          DataField = 'FLGPAGLANC'
          DataSource = ds
          Items.Strings = (
            '&Pagamento'
            '&Lançamento')
          TabOrder = 4
          Values.Strings = (
            'P'
            'L')
        end
        object cmprocForCli: TCMProcuraForCli
          Left = 8
          Top = 8
          Width = 345
          Height = 49
          Caption = ' Favorecido do DARF '
          TabOrder = 0
          CampoEdit = ceRazaoSocial
          MostraMensagens = True
          DataSource = ds
          DataField = 'IDFORCLI'
          Mensagens.EmBranco = 'Chave não pode estar em branco'
          Mensagens.NaoExiste = 'Chave não existe'
          PermiteChaveInvalida = False
          PermiteChaveEmBranco = False
          ForCli = fcFornecedor
          MostraEndereco = False
          StatusForCli = fcAll
          MostraStatusCredito = False
        end
        object dbrgDocDarfIRJud: TDBRadioGroup
          Left = 376
          Top = 104
          Width = 361
          Height = 78
          Caption = ' Gera Documento para DARFs de Dep. Judicial '
          DataField = 'FlgDocDarfIRJud'
          DataSource = ds
          Items.Strings = (
            'Documentos &Individuais'
            'Documento Ú&nico'
            'Documento por &Estado')
          TabOrder = 8
          Values.Strings = (
            '0'
            '1'
            '2')
        end
        object grpbxTipoGeraDARF: TGroupBox
          Left = 8
          Top = 240
          Width = 345
          Height = 43
          Caption = ' Ao gerar o DARF,  '
          TabOrder = 5
          object dbckbTipoGeraDARF: TDBCheckBox
            Left = 8
            Top = 18
            Width = 313
            Height = 17
            Caption = 'Gerar Documentos por Plano Contábil'
            DataField = 'FLGTIPOGERADARF'
            DataSource = ds
            TabOrder = 0
            ValueChecked = '2'
            ValueUnchecked = '1'
          end
        end
        object wwDBLookupCombo5: TwwDBLookupCombo
          Left = 376
          Top = 32
          Width = 361
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOMEINFORME'#9'60'#9'Linha')
          DataField = 'IDINFORMERENDBRUT'
          DataSource = ds
          LookupTable = cdsInforme
          LookupField = 'IDINFORME'
          Options = [loTitles]
          TabOrder = 6
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object wwDBLookupCombo3: TwwDBLookupCombo
          Left = 376
          Top = 72
          Width = 361
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOMEINFORME'#9'60'#9'Linha')
          DataField = 'IDINFORMEIRRETIDO'
          DataSource = ds
          LookupTable = cdsInforme
          LookupField = 'IDINFORME'
          Options = [loTitles]
          TabOrder = 7
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object wwDBLookupCombo7: TwwDBLookupCombo
          Left = 376
          Top = 208
          Width = 361
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'30'#9'Nome'#9'F'
            'CODEXTERNO'#9'10'#9'Código'#9'F')
          DataField = 'CCUSTOBUSCACAP'
          DataSource = ds
          LookupTable = cdsCentCust
          LookupField = 'CODCENTROCUSTO'
          Options = [loTitles]
          TabOrder = 9
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
      end
      object tbsInss: TTabSheet
        Caption = 'INSS'
        ImageIndex = 2
        object lblTetoInss: TLabel
          Left = 8
          Top = 18
          Width = 135
          Height = 13
          Caption = 'Índice do Teto do INSS'
        end
        object Label6: TLabel
          Left = 8
          Top = 66
          Width = 119
          Height = 13
          Caption = 'INSS para Autônomo'
        end
        object dblkTetoInss: TwwDBLookupCombo
          Left = 8
          Top = 32
          Width = 369
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'MOESIGLA'#9'20'#9'Sigla da Moeda'#9'F')
          DataField = 'MOECODIGO'
          DataSource = ds
          LookupTable = cdsTetoInss
          LookupField = 'MOECODIGO'
          TabOrder = 0
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = True
        end
        object dblkInssAutonomo: TwwDBLookupCombo
          Left = 8
          Top = 80
          Width = 369
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCCUSTAGREG'#9'30'#9'Descrição'#9'F')
          DataField = 'CODTIPOCUSTAGREG'
          DataSource = ds
          LookupTable = cdsInssAutonomo
          LookupField = 'CODTIPOCUSTAGREG'
          TabOrder = 1
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = True
        end
      end
      object tbsInforme: TTabSheet
        Caption = 'Informe de Rendimentos'
        ImageIndex = 3
        object Label25: TLabel
          Left = 480
          Top = 216
          Width = 241
          Height = 13
          Caption = 'Regra de Cálculo para Ação Judicial INSS'
        end
        object gbInss: TGroupBox
          Left = 464
          Top = 0
          Width = 449
          Height = 205
          Caption = ' Específicos para Rendimentos INSS '
          TabOrder = 1
          Visible = False
          object Label11: TLabel
            Left = 16
            Top = 18
            Width = 359
            Height = 13
            Caption = 'Parc. Isenta Prov. Apos., Res, Ref e Pensão (65 anos ou mais)'
          end
          object Label12: TLabel
            Left = 16
            Top = 90
            Width = 359
            Height = 13
            Caption = 'Pensão, Prov. Apos. por Moléstia Grave ou por  Acid. em Serv.'
          end
          object Label13: TLabel
            Left = 16
            Top = 54
            Width = 411
            Height = 13
            Caption = 
              'Parc. Isenta Prov. Apos., Res, Ref e Pensão (65 anos ou mais) pa' +
              'ra 13º'
          end
          object Label23: TLabel
            Left = 16
            Top = 126
            Width = 269
            Height = 13
            Caption = 'Linha do Informe para Ação Judicial em Liminar'
          end
          object Label24: TLabel
            Left = 16
            Top = 162
            Width = 321
            Height = 13
            Caption = 'Linha do Informe para Ação Judicial em Liminar para 13º'
          end
          object cboInforme65INSS: TwwDBLookupCombo
            Left = 16
            Top = 32
            Width = 417
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMEINFORME'#9'60'#9'Linha do Informe'#9'F')
            DataField = 'IDINFORME65INSS'
            DataSource = ds
            LookupTable = cdsInforme
            LookupField = 'IDINFORME'
            Options = [loTitles]
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object cboInformeMolINSS: TwwDBLookupCombo
            Left = 16
            Top = 104
            Width = 417
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMEINFORME'#9'60'#9'Linha do Informe'#9'F')
            DataField = 'IDINFORMEMOLINSS'
            DataSource = ds
            LookupTable = cdsInforme
            LookupField = 'IDINFORME'
            Options = [loTitles]
            TabOrder = 2
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object cboInforme65INSSAbono: TwwDBLookupCombo
            Left = 16
            Top = 68
            Width = 417
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMEINFORME'#9'60'#9'Linha do Informe'#9'F')
            DataField = 'IDINFORME65INSS13'
            DataSource = ds
            LookupTable = cdsInforme
            LookupField = 'IDINFORME'
            TabOrder = 1
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = True
          end
          object dblcAcaoJudicialInss: TwwDBLookupCombo
            Left = 16
            Top = 140
            Width = 417
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMEINFORME'#9'60'#9'Linha do Informe'#9'F')
            DataField = 'IdAcaoJudicialInss'
            DataSource = ds
            LookupTable = cdsInforme
            LookupField = 'IDINFORME'
            Options = [loTitles]
            TabOrder = 3
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object dblcAcaoJudicialInss13: TwwDBLookupCombo
            Left = 16
            Top = 176
            Width = 417
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMEINFORME'#9'60'#9'Linha do Informe'#9'F')
            DataField = 'IdAcaoJudicialInss13'
            DataSource = ds
            LookupTable = cdsInforme
            LookupField = 'IDINFORME'
            Options = [loTitles]
            TabOrder = 4
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
        end
        object GroupBox10: TGroupBox
          Left = 8
          Top = 0
          Width = 449
          Height = 445
          Caption = ' Específicos para Rendimentos da Fundação'
          TabOrder = 0
          object Label4: TLabel
            Left = 16
            Top = 18
            Width = 359
            Height = 13
            Caption = 'Parc. Isenta Prov. Apos., Res, Ref e Pensão (65 anos ou mais)'
          end
          object Label9: TLabel
            Left = 16
            Top = 54
            Width = 411
            Height = 13
            Caption = 
              'Parc. Isenta Prov. Apos., Res, Ref e Pensão (65 anos ou mais) pa' +
              'ra 13º'
          end
          object Label10: TLabel
            Left = 16
            Top = 90
            Width = 359
            Height = 13
            Caption = 'Pensão, Prov. Apos. por Moléstia Grave ou por  Acid. em Serv.'
          end
          object Label14: TLabel
            Left = 16
            Top = 126
            Width = 269
            Height = 13
            Caption = 'Linha do Informe para Ação Judicial em Liminar'
          end
          object Label15: TLabel
            Left = 16
            Top = 162
            Width = 321
            Height = 13
            Caption = 'Linha do Informe para Ação Judicial em Liminar para 13º'
          end
          object Label22: TLabel
            Left = 16
            Top = 202
            Width = 296
            Height = 13
            Caption = 'Linha do Informe para Exigibilidade Suspensa - BUA'
          end
          object lblCompensaVlrNegativo: TLabel
            Left = 16
            Top = 240
            Width = 402
            Height = 13
            Caption = 
              'Linha do Informe Oriundo do Acerto de Valor Negativo de Contribu' +
              'ição'
          end
          object Label26: TLabel
            Left = 16
            Top = 280
            Width = 408
            Height = 13
            Caption = 
              'Linha do Informe Oriundo do Acerto de Valor Neg. de Contrib. de ' +
              'Isento'
          end
          object lblCompensaVlrNegativo13s: TLabel
            Left = 16
            Top = 320
            Width = 425
            Height = 13
            Caption = 
              'Linha do Informe Oriundo do Acerto de Valor Negativo de Contribu' +
              'ição 13º'
          end
          object lblInformeContribExtra: TLabel
            Left = 16
            Top = 362
            Width = 282
            Height = 13
            Caption = 'Linha do Informe para Contribuição Extraordinária'
          end
          object lblInformeContribExtra13: TLabel
            Left = 16
            Top = 402
            Width = 334
            Height = 13
            Caption = 'Linha do Informe para Contribuição Extraordinária para 13º'
          end
          object dblcAcima65Abono: TwwDBLookupCombo
            Left = 16
            Top = 68
            Width = 417
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMEINFORME'#9'60'#9'Linha do Informe'#9'F')
            DataField = 'IDINFORME65ANOS13'
            DataSource = ds
            LookupTable = cdsInforme
            LookupField = 'IDINFORME'
            TabOrder = 1
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = True
          end
          object dblcAcima65: TwwDBLookupCombo
            Left = 16
            Top = 32
            Width = 417
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMEINFORME'#9'60'#9'Linha do Informe'#9'F')
            DataField = 'IDINFORME65ANOS'
            DataSource = ds
            LookupTable = cdsInforme
            LookupField = 'IDINFORME'
            Options = [loTitles]
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object dblcMolestiaGrave: TwwDBLookupCombo
            Left = 16
            Top = 104
            Width = 417
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMEINFORME'#9'60'#9'Linha do Informe'#9'F')
            DataField = 'IDINFORMEMOLESTIA'
            DataSource = ds
            LookupTable = cdsInforme
            LookupField = 'IDINFORME'
            Options = [loTitles]
            TabOrder = 2
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object dblcAcaoJudicial: TwwDBLookupCombo
            Left = 16
            Top = 140
            Width = 417
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMEINFORME'#9'60'#9'Linha do Informe'#9'F')
            DataField = 'IDINFORMEACJUD'
            DataSource = ds
            LookupTable = cdsInforme
            LookupField = 'IDINFORME'
            Options = [loTitles]
            TabOrder = 3
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object dblcAcaoJudicialAbono: TwwDBLookupCombo
            Left = 16
            Top = 176
            Width = 417
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMEINFORME'#9'60'#9'Linha do Informe'#9'F')
            DataField = 'IDINFORMEACJUD13'
            DataSource = ds
            LookupTable = cdsInforme
            LookupField = 'IDINFORME'
            Options = [loTitles]
            TabOrder = 4
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object dblcEgibilidadeSuspensa: TwwDBLookupCombo
            Left = 16
            Top = 216
            Width = 417
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMEINFORME'#9'60'#9'Linha do Informe'#9'F')
            DataField = 'IDExigibilidadeSuspensa'
            DataSource = ds
            LookupTable = cdsInforme
            LookupField = 'IDINFORME'
            Options = [loTitles]
            TabOrder = 5
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object dblcInfRendCompNeg: TwwDBLookupCombo
            Left = 16
            Top = 254
            Width = 417
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMEINFORME'#9'60'#9'Linha do Informe'#9'F')
            DataField = 'IDINFRENDCOMPNEG'
            DataSource = ds
            LookupTable = cdsInforme
            LookupField = 'IDINFORME'
            Options = [loTitles]
            TabOrder = 6
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object wwDBLookupCombo8: TwwDBLookupCombo
            Left = 16
            Top = 294
            Width = 417
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMEINFORME'#9'60'#9'Linha do Informe'#9'F')
            DataField = 'IDINFRENDCOMPNEGISENTO'
            DataSource = ds
            LookupTable = cdsInforme
            LookupField = 'IDINFORME'
            Options = [loTitles]
            TabOrder = 8
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object dblcInfRendCompNeg13s: TwwDBLookupCombo
            Left = 16
            Top = 334
            Width = 417
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMEINFORME'#9'60'#9'Linha do Informe'#9'F')
            DataField = 'IDINFRENDCOMPNEG13S'
            DataSource = ds
            LookupTable = cdsInforme
            LookupField = 'IDINFORME'
            Options = [loTitles]
            TabOrder = 7
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object dblcIDINFORMECONTRIBEXTRA: TwwDBLookupCombo
            Left = 16
            Top = 376
            Width = 417
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMEINFORME'#9'60'#9'Linha do Informe'#9'F')
            DataField = 'IDINFORMECONTRIBEXTRA'
            DataSource = ds
            LookupTable = cdsInforme
            LookupField = 'IDINFORME'
            TabOrder = 9
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
          end
          object dblcIDINFORMECONTRIBEXTRA13: TwwDBLookupCombo
            Left = 16
            Top = 416
            Width = 417
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMEINFORME'#9'60'#9'Linha do Informe'#9'F')
            DataField = 'IDINFORMECONTRIBEXTRA13'
            DataSource = ds
            LookupTable = cdsInforme
            LookupField = 'IDINFORME'
            TabOrder = 10
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
          end
        end
        object dblcRegraAcaoJudicialINSS: TwwDBLookupCombo
          Left = 480
          Top = 230
          Width = 417
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOMEREGRA'#9'60'#9'Nome da Regra'#9'F')
          DataField = 'IdRegraInss'
          DataSource = ds
          LookupTable = cdsRegra
          LookupField = 'IDREGRA'
          Options = [loTitles]
          TabOrder = 2
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
      end
      object tbsEmprestimo: TTabSheet
        Caption = 'Busca do IOF - Empréstimo'
        ImageIndex = 4
        object Label18: TLabel
          Left = 8
          Top = 74
          Width = 141
          Height = 13
          Caption = 'Natureza de Rendimento'
        end
        object Label19: TLabel
          Left = 8
          Top = 122
          Width = 92
          Height = 13
          Caption = 'Centro de Custo'
        end
        object dbgIOF: TDBRadioGroup
          Left = 8
          Top = 8
          Width = 409
          Height = 51
          Caption = ' Buscar IOF pela data: '
          Columns = 2
          DataField = 'FLGBUSCAIOF'
          DataSource = ds
          Items.Strings = (
            'Efetiva'
            'Prevista')
          TabOrder = 0
          Values.Strings = (
            '0'
            '1')
        end
        object dblcNatRendMantido: TwwDBLookupCombo
          Left = 8
          Top = 88
          Width = 412
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'60'#9'Descrição'#9'F'
            'CODNATUREZA'#9'4'#9'Código da Natureza'#9'F')
          DataField = 'CODIRRFDARFIOF'
          DataSource = ds
          LookupTable = cdsNatuRendimento
          LookupField = 'CODNATUREZA'
          Options = [loTitles]
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object wwDBLookupCombo6: TwwDBLookupCombo
          Left = 8
          Top = 136
          Width = 412
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'30'#9'Nome'#9'F'
            'CODEXTERNO'#9'10'#9'Código'#9'F')
          DataField = 'CODCENTROCUSTOIOF'
          DataSource = ds
          LookupTable = cdsCentCust
          LookupField = 'CODCENTROCUSTO'
          Options = [loTitles]
          TabOrder = 2
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
      end
      object tbsBuscaINSS: TTabSheet
        Caption = 'Busca do INSS'
        ImageIndex = 5
        object lblInformeVlrBase: TLabel
          Left = 8
          Top = 18
          Width = 219
          Height = 13
          Caption = 'Linha do Informe para o Valor da Base'
        end
        object Label8: TLabel
          Left = 8
          Top = 66
          Width = 235
          Height = 13
          Caption = 'Linha do Informe para o Valor do Imposto'
        end
        object Label21: TLabel
          Left = 160
          Top = 132
          Width = 153
          Height = 13
          Caption = 'Código padrão para GPS:  '
        end
        object dblkInformeVlrBase: TwwDBLookupCombo
          Left = 8
          Top = 32
          Width = 412
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOMEINFORME'#9'60'#9'Linha do Informe'#9'F')
          DataField = 'IDINFORMEVLRBASE'
          DataSource = ds
          LookupTable = cdsInforme
          LookupField = 'IDINFORME'
          TabOrder = 0
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = True
        end
        object dblkInformeVlrINSS: TwwDBLookupCombo
          Left = 8
          Top = 80
          Width = 412
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOMEINFORME'#9'60'#9'Linha do Informe'#9'F')
          DataField = 'IDINFORMEVLRINSS'
          DataSource = ds
          LookupTable = cdsInforme
          LookupField = 'IDINFORME'
          TabOrder = 1
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = True
        end
        object DBedtCodigoGPS: TDBEdit
          Left = 312
          Top = 128
          Width = 105
          Height = 21
          Hint = 
            'Código utilizado em caso de não haver parametrização para impost' +
            'os retidos ou alterador manual'
          DataField = 'CODIGOGPS'
          DataSource = ds
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 932
  end
  inherited Dock971: TDock97
    Top = 523
    Width = 932
    inherited tb97Fundo: TToolbar97
      Left = 453
      DockPos = 453
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 282
      DockPos = 282
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 800
    Top = 0
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 280
    Top = 0
  end
  inherited ImlPadrao: TImageList
    Left = 992
    Top = 0
  end
  inherited CmeCadastro: TCmEventosCadastro
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 328
    Top = 0
  end
  inherited Cds: TCMClientDataSet
    Left = 248
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Left = 400
    Top = 0
  end
  object cdsTipoAlterador: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 208
    Top = 368
  end
  object cdsMultaJurosDesc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 112
    Top = 368
  end
  object cdsTipoDesembolso: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 304
    Top = 368
  end
  object cdsAtivProj: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 456
    Top = 392
  end
  object cdsCentCust: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 392
    Top = 392
  end
  object cdsTipoDoc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 208
    Top = 392
  end
  object cdsDesconto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 24
    Top = 368
  end
  object cdsTetoInss: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 456
    Top = 368
  end
  object cdsInssAutonomo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 304
    Top = 392
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      'SELECT CODCENTROCUSTO,NOME,CODEXTERNO'
      '  FROM CENTCUST'
      
        ' WHERE  (IDPLANCENTCUST = (SELECT IDPLANCENTCUST FROM PARAMGLOBA' +
        'L))'
      '   AND (ATIVO = '#39'S'#39')'
      ' ORDER BY NOME')
    ClientDataSet = cdsCentCust
    Left = 24
    Top = 392
  end
  object cdsInforme: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 392
    Top = 368
  end
  object cdsNatuRendimento: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 112
    Top = 392
  end
  object cdsRegra: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 528
    Top = 368
  end
end
