inherited frmCadNatRendimento: TfrmCadNatRendimento
  Left = 145
  Top = 88
  Caption = 'Natureza de Rendimentos'
  ClientHeight = 397
  ClientWidth = 572
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 572
    Height = 311
    inherited dbGrd: TwwDBGrid [0]
      Width = 562
      Height = 301
      Selected.Strings = (
        'CODNATUREZA'#9'4'#9'Código'
        'DESCRICAO'#9'60'#9'Descrição')
    end
    inherited pnlControles: TPanel [1]
      Width = 562
      Height = 301
      object Label1: TLabel
        Left = 21
        Top = 42
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object lblCodigo: TLabel
        Left = 21
        Top = 5
        Width = 40
        Height = 13
        Caption = 'Código'
      end
      object gbDarf: TGroupBox
        Left = 21
        Top = 87
        Width = 513
        Height = 210
        Caption = ' Dados para o Darf '
        TabOrder = 2
        object Label2: TLabel
          Left = 24
          Top = 75
          Width = 116
          Height = 13
          Caption = 'Tipo de Desembolso'
        end
        object Label3: TLabel
          Left = 24
          Top = 120
          Width = 120
          Height = 13
          Caption = 'Forma de Pagamento'
        end
        object rgTributo: TLabel
          Left = 26
          Top = 165
          Width = 97
          Height = 13
          Caption = 'Grupo de Tributo'
        end
        object Label4: TLabel
          Left = 160
          Top = 166
          Width = 78
          Height = 13
          Caption = 'Periodicidade'
        end
        object cmfcFornDarf: TCMProcuraSubTipo
          Left = 24
          Top = 19
          Width = 473
          Height = 50
          Caption = ' Fornecedor '
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
        object dblcTipoDesemb: TwwDBLookupCombo
          Left = 24
          Top = 89
          Width = 474
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
        object dblcFormaPG: TwwDBLookupCombo
          Left = 24
          Top = 134
          Width = 474
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'35'#9'Forma de Pagamento'#9'F')
          DataField = 'CODFORMA'
          DataSource = ds
          LookupTable = qryFormaPG
          LookupField = 'CODFORMA'
          TabOrder = 2
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object cbTributo: TComboBox
          Left = 25
          Top = 181
          Width = 118
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          MaxLength = 4
          TabOrder = 3
          Items.Strings = (
            'IRPJ'
            'IRRF'
            'IPI'
            'IOF'
            'CSLL'
            'PIS/PASEP'
            'COFINS'
            'CPMF')
        end
        object cbPeriodicidade: TComboBox
          Left = 159
          Top = 181
          Width = 130
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          MaxLength = 4
          TabOrder = 4
          Items.Strings = (
            'D - Diário'
            'S - Semanal'
            'X - Decendial'
            'Q - Quinzenal'
            'M - Mensal'
            'T - Trimestral'
            'A - Anual')
        end
      end
      object dbedHistorico: TwwDBEdit
        Left = 21
        Top = 57
        Width = 508
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbedCodigo: TwwDBEdit
        Left = 21
        Top = 20
        Width = 61
        Height = 21
        DataField = 'CODNATUREZA'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
  end
  inherited Dock972: TDock97
    Width = 572
    inherited Toolbar971: TToolbar97
      inherited sbtnProcurar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 358
    Width = 572
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT * FROM NATURENDIMENTO')
    Left = 318
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 99
    Top = 7
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update NATURENDIMENTO'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  DESCRICAO = :DESCRICAO,'
      '  RECPAG = :RECPAG,'
      '  CODTIPRECDES = :CODTIPRECDES,'
      '  IDFORCLI = :IDFORCLI,'
      '  CODFORMA = :CODFORMA,'
      '  GRUPOTRIBUTO = :GRUPOTRIBUTO,'
      '  PERIODICIDADE = :PERIODICIDADE'
      'where'
      '  CODNATUREZA = :OLD_CODNATUREZA')
    InsertSQL.Strings = (
      'insert into NATURENDIMENTO'
      
        '  (CODNATUREZA, IDPESSOA, DESCRICAO, RECPAG, CODTIPRECDES, IDFOR' +
        'CLI, CODFORMA, '
      '   GRUPOTRIBUTO, PERIODICIDADE)'
      'values'
      
        '  (:CODNATUREZA, :IDPESSOA, :DESCRICAO, :RECPAG, :CODTIPRECDES, ' +
        ':IDFORCLI, '
      '   :CODFORMA, :GRUPOTRIBUTO, :PERIODICIDADE)')
    DeleteSQL.Strings = (
      'delete from NATURENDIMENTO'
      'where'
      '  CODNATUREZA = :OLD_CODNATUREZA')
    Left = 223
    Top = 10
  end
  inherited MontaSelect: TMontaSelect
    Left = 373
  end
  inherited ds: TwwDataSource
    Left = 509
  end
  inherited ImlPadrao: TImageList
    Left = 143
    Top = 16
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 358
    Top = 82
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 536
    Top = 105
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
    Left = 456
    Top = 7
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryFormaPG: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODFORMA,DESCRICAO'
      'FROM FORMARECPAG'
      'WHERE'
      '(IDPESSOA = :IDPESSOA)  AND'
      '(RECPAG = '#39'P'#39')'
      'ORDER BY  DESCRICAO'
      ' ')
    ValidateWithMask = True
    Left = 456
    Top = 64
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
end
