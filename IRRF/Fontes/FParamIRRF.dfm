inherited frmParamIRRF: TfrmParamIRRF
  Left = 180
  Top = 72
  Caption = 'Parâmetros para o IRRF'
  ClientHeight = 402
  ClientWidth = 406
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 406
    Height = 316
    object pcnParametros: TPageControl
      Left = 5
      Top = 5
      Width = 396
      Height = 306
      ActivePage = tbsGeral
      Align = alClient
      TabOrder = 0
      object tbsGeral: TTabSheet
        Caption = '&Geral'
        object grpAlteradorCAR: TGroupBox
          Left = 9
          Top = 2
          Width = 367
          Height = 88
          Caption = ' Alteradores para Integração do IRRF do CAR'
          TabOrder = 0
          object lblJuros: TLabel
            Left = 15
            Top = 14
            Width = 54
            Height = 13
            Caption = 'Comissão'
          end
          object lblIRRFCAR: TLabel
            Left = 15
            Top = 47
            Width = 34
            Height = 13
            Caption = 'IRRF '
          end
          object dblcComissao: TwwDBLookupCombo
            Left = 15
            Top = 26
            Width = 331
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'35'#9'DESCRICAO')
            DataField = 'CODALTCOMISSAO'
            DataSource = ds
            LookupTable = qryAlterador
            LookupField = 'CODALTERADOR'
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object dblcIRRFCAR: TwwDBLookupCombo
            Left = 15
            Top = 59
            Width = 331
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'35'#9'DESCRICAO')
            DataField = 'CODALTIRRFCAR'
            DataSource = ds
            LookupTable = qryAlterador1
            LookupField = 'CODALTERADOR'
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
        end
        object grpAlteradorCAP: TGroupBox
          Left = 9
          Top = 90
          Width = 367
          Height = 90
          Caption = ' Alteradores para Integração do IRRF do CAP'
          TabOrder = 1
          object lblINSS: TLabel
            Left = 15
            Top = 14
            Width = 30
            Height = 13
            Caption = 'INSS'
          end
          object lblIRRFCAP: TLabel
            Left = 15
            Top = 48
            Width = 34
            Height = 13
            Caption = 'IRRF '
          end
          object dblcINSS: TwwDBLookupCombo
            Left = 15
            Top = 26
            Width = 331
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'35'#9'DESCRICAO')
            DataField = 'CODALTINSS'
            DataSource = ds
            LookupTable = qryAlterador2
            LookupField = 'CODALTERADOR'
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object dblcIRRFCAP: TwwDBLookupCombo
            Left = 15
            Top = 60
            Width = 331
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'35'#9'DESCRICAO')
            DataField = 'CODALTIRRFCAP'
            DataSource = ds
            LookupTable = qryAlterador2
            LookupField = 'CODALTERADOR'
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
        end
        object GroupBox1: TGroupBox
          Left = 9
          Top = 182
          Width = 367
          Height = 89
          Caption = ' Alteradores para Multa e Juros'
          TabOrder = 2
          object Multa: TLabel
            Left = 15
            Top = 14
            Width = 104
            Height = 13
            Caption = 'Código para Multa'
          end
          object Label7: TLabel
            Left = 15
            Top = 48
            Width = 103
            Height = 13
            Caption = 'Código para Juros'
          end
          object dblcmbMulta: TwwDBLookupCombo
            Left = 15
            Top = 26
            Width = 331
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'35'#9'DESCRICAO')
            DataField = 'CODALTMULTA'
            DataSource = ds
            LookupTable = qryAlterador3
            LookupField = 'CODALTERADOR'
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object dblcmbJuros: TwwDBLookupCombo
            Left = 15
            Top = 60
            Width = 331
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'35'#9'DESCRICAO')
            DataField = 'CODALTJUROS'
            DataSource = ds
            LookupTable = qryAlterador3
            LookupField = 'CODALTERADOR'
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
        end
      end
      object tbsPessoaFisica: TTabSheet
        Caption = 'Pessoa Física'
        object dbIdosos: TGroupBox
          Left = 15
          Top = 23
          Width = 362
          Height = 46
          Caption = 'Idade para a Pessoa ser Considerada Idosa'
          TabOrder = 0
          object DBRealEdit1: TDBRealEdit
            Left = 123
            Top = 18
            Width = 88
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              ' 65')
            TabOrder = 0
            WordWrap = False
            IntDigits = 3
            DecDigits = 0
            NumberFormat = fNumber
            Signal = False
            DataField = 'IDADEIDOSO'
            DataSource = ds
          end
        end
        object gbValorIdoso: TGroupBox
          Left = 15
          Top = 79
          Width = 362
          Height = 64
          Caption = 'Valor a Deduzir da Base de Cálculo para Idosos'
          TabOrder = 1
          object dbrVlrIdosos: TDBRealEdit
            Left = 114
            Top = 22
            Width = 136
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '           0,00')
            TabOrder = 0
            WordWrap = False
            IntDigits = 15
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'VLRIDOSOS'
            DataSource = ds
          end
        end
        object gbDependentes: TGroupBox
          Left = 15
          Top = 147
          Width = 362
          Height = 64
          Caption = 'Valor a Deduzir da Base de Cálculo por Dependente'
          TabOrder = 2
          object dbrDependente: TDBRealEdit
            Left = 114
            Top = 22
            Width = 136
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '           0,00')
            TabOrder = 0
            WordWrap = False
            IntDigits = 15
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'VLRDEPENDENTE'
            DataSource = ds
          end
        end
        object gbImpExterior: TGroupBox
          Left = 15
          Top = 216
          Width = 362
          Height = 55
          Caption = 'Percentual do Imposto de Renda para Residentes no Exterior'
          TabOrder = 3
          object lblPer: TLabel
            Left = 237
            Top = 30
            Width = 10
            Height = 13
            Caption = '%'
          end
          object dbreImpExterior: TDBRealEdit
            Left = 141
            Top = 22
            Width = 91
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '           0,00')
            TabOrder = 0
            WordWrap = False
            IntDigits = 15
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'PERCIRRFEXTERIOR'
            DataSource = ds
          end
        end
      end
      object TabSheet1: TTabSheet
        Caption = 'Integração com Contas a Pagar'
        object Label2: TLabel
          Left = 24
          Top = 60
          Width = 116
          Height = 13
          Caption = 'Tipo de Desembolso'
        end
        object Label3: TLabel
          Left = 24
          Top = 102
          Width = 98
          Height = 13
          Caption = 'Atividade Projeto'
        end
        object Label4: TLabel
          Left = 24
          Top = 144
          Width = 160
          Height = 13
          Caption = 'Centro de Responsabilidade'
        end
        object Label5: TLabel
          Left = 24
          Top = 184
          Width = 112
          Height = 13
          Caption = 'Tipo de Documento'
        end
        object wwDBLookupCombo1: TwwDBLookupCombo
          Left = 24
          Top = 74
          Width = 331
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'35'#9'Tipo de Desembolso'
            'CODTIPRECDES'#9'15'#9'Código')
          DataField = 'CODTIPRECDES'
          DataSource = ds
          LookupTable = qryDesembolso
          LookupField = 'CODTIPRECDES'
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object wwDBLookupCombo2: TwwDBLookupCombo
          Left = 24
          Top = 116
          Width = 331
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'25'#9'Descrição'
            'UNIDNEGOC'#9'10'#9'Código')
          DataField = 'UNIDNEGOC'
          DataSource = ds
          LookupTable = qryAtivProj
          LookupField = 'UNIDNEGOC'
          TabOrder = 2
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object wwDBLookupCombo3: TwwDBLookupCombo
          Left = 24
          Top = 158
          Width = 331
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'30'#9'Centro de Responsabilidade'
            'CODCENTRORESPON'#9'10'#9'Código')
          DataField = 'CODCENTRORESPON'
          DataSource = ds
          LookupTable = qryCentroRespon
          LookupField = 'CODCENTRORESPON'
          TabOrder = 3
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object wwDBLookupCombo4: TwwDBLookupCombo
          Left = 24
          Top = 198
          Width = 331
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'35'#9'Descrição'
            'CODTIPDOC'#9'10'#9'Código')
          DataField = 'CODTIPDOC'
          DataSource = ds
          LookupTable = qryTipDoc
          LookupField = 'CODTIPDOC'
          TabOrder = 4
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object CMProcuraSubTipo1: TCMProcuraSubTipo
          Left = 24
          Top = 2
          Width = 329
          Height = 50
          Caption = 'Fornecedor do DARF'
          TabOrder = 0
          CampoEdit = ceRazaoSocial
          MostraMensagens = True
          DataSource = ds
          DataField = 'IDFORCLI'
          Mensagens.EmBranco = 'Chave não pode estar em branco'
          Mensagens.NaoExiste = 'Chave não existe'
          PermiteChaveInvalida = False
          PermiteChaveEmBranco = False
          SubTipo = stFornecedor
          FiltraSubTipo = True
        end
        object dbrgPagLanc: TDBRadioGroup
          Left = 24
          Top = 222
          Width = 331
          Height = 49
          Caption = ' Gerar o IRRF em que data '
          Columns = 2
          DataField = 'FLGPAGLANC'
          DataSource = ds
          Items.Strings = (
            '&Pagamento'
            '&Lançamento')
          TabOrder = 5
          Values.Strings = (
            'P'
            'L')
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 406
  end
  inherited Dock971: TDock97
    Top = 363
    Width = 406
    inherited tb97Fundo: TToolbar97
      Left = 235
      DockPos = 235
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 67
      DockPos = 67
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'select * from paramirrf')
    Left = 73
    Top = 94
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 19
    Top = 65531
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
      'update paramirrf'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  CODALTIRRFCAP = :CODALTIRRFCAP,'
      '  CODALTIRRFCAR = :CODALTIRRFCAR,'
      '  CODALTCOMISSAO = :CODALTCOMISSAO,'
      '  CODALTINSS = :CODALTINSS,'
      '  IDADEIDOSO = :IDADEIDOSO,'
      '  VLRIDOSOS = :VLRIDOSOS,'
      '  VLRDEPENDENTE = :VLRDEPENDENTE,'
      '  IDFORCLI = :IDFORCLI,'
      '  RECPAG = :RECPAG,'
      '  CODTIPRECDES = :CODTIPRECDES,'
      '  UNIDNEGOC = :UNIDNEGOC,'
      '  CODCENTRORESPON = :CODCENTRORESPON,'
      '  CODTIPDOC = :CODTIPDOC,'
      '  CODALTJUROS = :CODALTJUROS,'
      '  CODALTMULTA = :CODALTMULTA,'
      '  PERCIRRFEXTERIOR = :PERCIRRFEXTERIOR,'
      '  FLGPAGLANC = :FLGPAGLANC'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into paramirrf'
      '  (IDPESSOA, CODALTIRRFCAP, CODALTIRRFCAR, CODALTCOMISSAO, '
      'CODALTINSS, '
      '   IDADEIDOSO, VLRIDOSOS, VLRDEPENDENTE, IDFORCLI, RECPAG, '
      'CODTIPRECDES, '
      '   UNIDNEGOC, CODCENTRORESPON, CODTIPDOC, CODALTJUROS, '
      'CODALTMULTA, PERCIRRFEXTERIOR, '
      '   FLGPAGLANC)'
      'values'
      '  (:IDPESSOA, :CODALTIRRFCAP, :CODALTIRRFCAR, :CODALTCOMISSAO, '
      ':CODALTINSS, '
      '   :IDADEIDOSO, :VLRIDOSOS, :VLRDEPENDENTE, :IDFORCLI, :RECPAG, '
      ':CODTIPRECDES, '
      '   :UNIDNEGOC, :CODCENTRORESPON, :CODTIPDOC, :CODALTJUROS, '
      ':CODALTMULTA, '
      '   :PERCIRRFEXTERIOR, :FLGPAGLANC)')
    DeleteSQL.Strings = (
      'delete from paramirrf'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 25
    Top = 43
  end
  inherited MontaSelect: TMontaSelect
    Left = 332
    Top = 7
  end
  inherited ds: TwwDataSource
    Left = 118
    Top = 14
  end
  inherited ImlPadrao: TImageList
    Left = 269
    Top = 10
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 358
    Top = 58
  end
  object qryAlterador1: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select * from tipoalterador')
    ValidateWithMask = True
    Left = 212
    Top = 8
  end
  object qryAlterador: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select * from tipoalterador')
    ValidateWithMask = True
    Left = 138
    Top = 8
  end
  object qryAlterador2: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select * from tipoalterador')
    ValidateWithMask = True
    Left = 55
    Top = 8
  end
  object qryDesembolso: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODTIPRECDES,DESCRICAO FROM TIPORECEBDESEMB'
      'WHERE'
      '(IDPESSOA = :IDPESSOA)  AND'
      '(RECPAG = '#39'P'#39') '
      'ORDER BY  DESCRICAO')
    ValidateWithMask = True
    Left = 312
    Top = 119
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryAtivProj: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT UNIDNEGOC,NOME '
      'FROM'
      ' UNIDNEGOCIO'
      'WHERE'
      ' (IDPESSOA = :IDPESSOA) AND'
      ' (UNETIPO = '#39'A'#39')'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 353
    Top = 172
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryCentroRespon: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODCENTRORESPON,NOME FROM CENTRESPON'
      'WHERE'
      '(IDPESSOA = :IDPESSOA) AND'
      '(ANALITICOSINTET = '#39'A'#39')'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 313
    Top = 244
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryTipDoc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODTIPDOC,DESCRICAO FROM TIPODOCRECPAG '
      'WHERE'
      '(RECPAG = '#39'P'#39') AND'
      '(DEBCRE = '#39'C'#39')'
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 289
    Top = 174
  end
  object qryAlterador3: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select * from tipoalterador'
      'where'
      'recpag = '#39'P'#39' and'
      'IDPESSOA = :IDPESSOA and'
      'ACRESDECRES = '#39'C'#39)
    ValidateWithMask = True
    Left = 199
    Top = 264
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
end
