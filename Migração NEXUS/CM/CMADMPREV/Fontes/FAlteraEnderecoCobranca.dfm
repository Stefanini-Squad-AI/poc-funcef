inherited frmAlteraEnderecoCobranca: TfrmAlteraEnderecoCobranca
  Left = 241
  Top = 121
  Caption = 'Alteração de Endereço para Cobrança'
  ClientHeight = 329
  ClientWidth = 531
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 531
    Height = 290
    object DBText1: TDBText
      Left = 9
      Top = 27
      Width = 250
      Height = 17
      DataField = 'NOMEPESSOA'
      DataSource = ds
    end
    object DBText2: TDBText
      Left = 360
      Top = 27
      Width = 106
      Height = 17
      DataField = 'CPF'
      DataSource = ds
    end
    object Label1: TLabel
      Left = 9
      Top = 15
      Width = 69
      Height = 13
      Caption = 'Participante'
    end
    object Label2: TLabel
      Left = 360
      Top = 15
      Width = 24
      Height = 13
      Caption = 'CPF'
    end
    object pgctrlAlteracoes: TPageControl
      Left = 9
      Top = 45
      Width = 514
      Height = 238
      ActivePage = tbsContaBancaria
      TabOrder = 0
      object tbsEndereco: TTabSheet
        Caption = 'Endereço para Cobrança'
        object lblPdLocal: TLabel
          Left = 2
          Top = 3
          Width = 32
          Height = 13
          Caption = 'Local'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblPdLogradouro: TLabel
          Left = 2
          Top = 43
          Width = 65
          Height = 13
          Caption = 'Logradouro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblPdComplemento: TLabel
          Left = 2
          Top = 84
          Width = 76
          Height = 13
          Caption = 'Complemento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblPdCidade: TLabel
          Left = 2
          Top = 126
          Width = 40
          Height = 13
          Caption = 'Cidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblPdPais: TLabel
          Left = 2
          Top = 168
          Width = 25
          Height = 13
          Caption = 'Pais'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblPdEstado: TLabel
          Left = 229
          Top = 126
          Width = 40
          Height = 13
          Caption = 'Estado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblBairro: TLabel
          Left = 229
          Top = 84
          Width = 34
          Height = 13
          Caption = 'Bairro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblPdCEP: TLabel
          Left = 390
          Top = 84
          Width = 37
          Height = 13
          Caption = 'C.E.P.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label57: TLabel
          Left = 390
          Top = 126
          Width = 17
          Height = 13
          Caption = 'UF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblPdNumero: TLabel
          Left = 390
          Top = 43
          Width = 44
          Height = 13
          Caption = 'Número'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object cmbCidade: TCMDBLookupCombo
          Left = 2
          Top = 140
          Width = 211
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOMECIDADE'#9'40'#9'Cidade'
            'CODESTADO'#9'3'#9'Estado')
          LookupTable = qryCidade
          LookupField = 'IDCIDADES'
          Options = [loTitles]
          Style = csDropDownList
          ParentFont = False
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object dbedPais: TwwDBEdit
          Left = 2
          Top = 181
          Width = 210
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataSource = dsCidade
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbedEstado: TwwDBEdit
          Left = 229
          Top = 140
          Width = 150
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'NOMEESTADO'
          DataSource = dsCidade
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbeCodEstado: TwwDBEdit
          Left = 390
          Top = 140
          Width = 70
          Height = 21
          Color = clBtnFace
          DataField = 'CODESTADO'
          DataSource = dsCidade
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
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
        object edNomeEndereco: TEdit
          Left = 2
          Top = 17
          Width = 377
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 40
          ParentFont = False
          TabOrder = 4
        end
        object edLogradouro: TEdit
          Left = 2
          Top = 58
          Width = 377
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 60
          ParentFont = False
          TabOrder = 5
        end
        object edNumero: TEdit
          Left = 390
          Top = 58
          Width = 70
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 8
          ParentFont = False
          TabOrder = 6
          Text = 'edNumero'
        end
        object edComplemento: TEdit
          Left = 2
          Top = 99
          Width = 211
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 20
          ParentFont = False
          TabOrder = 7
          Text = 'edComplemento'
        end
        object edBairro: TEdit
          Left = 228
          Top = 99
          Width = 150
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 20
          ParentFont = False
          TabOrder = 8
          Text = 'edBairro'
        end
        object edCEP: TEdit
          Left = 390
          Top = 99
          Width = 70
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 8
          ParentFont = False
          TabOrder = 9
          Text = 'edCEP'
        end
      end
      object tbsContaBancaria: TTabSheet
        Caption = 'Conta Bancária Preferencial'
        ImageIndex = 1
        object GroupBox1: TGroupBox
          Left = 1
          Top = 0
          Width = 363
          Height = 133
          TabOrder = 0
          object Label6: TLabel
            Left = 71
            Top = 10
            Width = 37
            Height = 13
            Caption = 'Banco'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label7: TLabel
            Left = 71
            Top = 53
            Width = 47
            Height = 13
            Caption = 'Agência'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label8: TLabel
            Left = 71
            Top = 92
            Width = 88
            Height = 13
            Caption = 'Conta Bancária'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label4: TLabel
            Left = 4
            Top = 10
            Width = 55
            Height = 13
            Caption = 'Banco Nº'
          end
          object Label5: TLabel
            Left = 4
            Top = 53
            Width = 65
            Height = 13
            Caption = 'Agência Nº'
          end
          object dblkpcmbBanco: TwwDBLookupCombo
            Left = 71
            Top = 24
            Width = 280
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'BANCO'#9'60'#9'Banco'
              'NUMBANCO'#9'10'#9'Nº')
            DataField = 'IDBANCO'
            DataSource = dsCBancaria
            LookupTable = qryBanco
            LookupField = 'IDPESSOA'
            Options = [loTitles]
            ParentFont = False
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            OnCloseUp = dblkpcmbBancoCloseUp
            OnExit = dblkpcmbBancoExit
          end
          object dblkpcmbAgencia: TwwDBLookupCombo
            Left = 71
            Top = 68
            Width = 280
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'AGENCIA'#9'60'#9'AGENCIA'
              'NUMAGENCIA'#9'15'#9'NUMAGENCIA')
            DataField = 'IDAGENCIA'
            DataSource = dsCBancaria
            LookupTable = qryAgencia
            LookupField = 'IDPESSOA'
            Options = [loTitles]
            ParentFont = False
            TabOrder = 3
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            OnCloseUp = dblkpcmbAgenciaCloseUp
          end
          object edDigBanco: TEditNum
            Left = 4
            Top = 24
            Width = 64
            Height = 21
            Hint = 'Digite este campo caso deseje procurar o banco por número'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            OnExit = edDigBancoExit
            IntDigits = 0
            Signal = False
            DecDigits = 0
            Numeric = False
          end
          object edDigAgencia: TEditNum
            Left = 4
            Top = 68
            Width = 64
            Height = 21
            Hint = 'Digite este campo caso deseje procurar a agência por número'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            OnExit = edDigAgenciaExit
            IntDigits = 0
            Signal = False
            DecDigits = 0
            Numeric = False
          end
          object edNumeroConta: TwwDBEdit
            Left = 67
            Top = 106
            Width = 137
            Height = 21
            DataField = 'CONTACORRENTE'
            DataSource = dsCBancaria
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
            OnExit = edNumeroContaExit
          end
        end
        object rgrpContaConjunta: TRadioGroup
          Left = 368
          Top = 63
          Width = 137
          Height = 36
          Caption = 'Conta Conjunta'
          Columns = 2
          Items.Strings = (
            'Não'
            'Sim')
          TabOrder = 2
          TabStop = True
        end
        object rgrpTipoConta: TRadioGroup
          Left = 368
          Top = 0
          Width = 137
          Height = 60
          Caption = 'Tipo'
          Items.Strings = (
            'Conta Corrente'
            'Conta Salário'
            'Poupança')
          TabOrder = 1
          TabStop = True
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 290
    Width = 531
    inherited tb97Fundo: TToolbar97
      Left = 359
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 15
    Top = 307
  end
  object qry: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PES.NOME AS NOMEPESSOA, PES.NUMDOCUMENTO AS CPF,'
      '  PES.IDPESSOA ,'
      '  EP.IDENDERECO ,'
      '  EP.IDCIDADES ,'
      '  EP.LOGRADOURO ,'
      '  EP.NUMERO ,'
      '  EP.COMPLEMENTO ,'
      '  EP.BAIRRO ,'
      '  EP.CIDADE ,'
      '  EP.NOME ,'
      '  EP.CEP ,'
      '  EP.IDCIDADES,'
      '  C.NOME AS NOMECIDADE,'
      '  E.NOMEESTADO,'
      '  P.NOMEPAIS,'
      '  E.CODESTADO'
      'FROM PESSOA PES,'
      '     ENDPESS EP,     CIDADES C,  ESTADO E,  PAIS P'
      'WHERE PES.IDPESSOA = :IDPESSOA'
      'AND   EP.IDPESSOA(+)   = PES.IDPESSOA'
      'AND   EP.IDENDERECO(+) = PES.IDENDCOBRANCA'
      'AND   E.IDPAIS = P.IDPAIS(+)'
      'AND   E.IDESTADO(+) = C.IDESTADO'
      'AND   C.IDCIDADES(+) = EP.IDCIDADES'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 513
    Top = 29
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryCidade: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  C.IDCIDADES,'
      '  C.NOME AS NOMECIDADE,'
      '  E.CODESTADO , '
      '  E.NOMEESTADO , '
      '  P.IDPAIS , '
      '  P.NOMEPAIS,'
      '  P.MASCARACPOSTAL'
      'FROM '
      '  CIDADES C,'
      '  ESTADO E, '
      '  PAIS P'
      'WHERE '
      '  ( C.IDESTADO = E.IDESTADO) AND'
      '  ( E.IDPAIS = P.IDPAIS )'
      'ORDER BY C.NOME'
      ' ')
    ValidateWithMask = True
    Left = 501
    Top = 172
    object qryCidadeNOMECIDADE: TStringField
      DisplayLabel = 'Cidade'
      DisplayWidth = 40
      FieldName = 'NOMECIDADE'
      Origin = '"CM.CIDADES".NOME'
      Size = 50
    end
    object qryCidadeCODESTADO: TStringField
      DisplayLabel = 'Estado'
      DisplayWidth = 3
      FieldName = 'CODESTADO'
      Origin = 'ESTADO.CODESTADO'
      Size = 3
    end
    object qryCidadeIDCIDADES: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCIDADES'
      Origin = '"CM.CIDADES".IDCIDADES'
      Visible = False
    end
    object qryCidadeNOMEESTADO: TStringField
      DisplayWidth = 30
      FieldName = 'NOMEESTADO'
      Origin = 'ESTADO.NOMEESTADO'
      Visible = False
      Size = 30
    end
    object qryCidadeIDPAIS: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPAIS'
      Origin = '"CM.PAIS".IDPAIS'
      Visible = False
    end
    object qryCidadeNOMEPAIS: TStringField
      DisplayWidth = 30
      FieldName = 'NOMEPAIS'
      Origin = '"CM.PAIS".NOMEPAIS'
      Visible = False
      Size = 30
    end
  end
  object dsCidade: TwwDataSource
    AutoEdit = False
    DataSet = qryCidade
    Left = 516
    Top = 128
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PES.NOME AS NOMEPESSOA, PES.NUMDOCUMENTO AS CPF,'
      '  EP.IDPESSOA ,'
      '  EP.IDENDERECO ,'
      '  EP.IDCIDADES ,'
      '  EP.LOGRADOURO ,'
      '  EP.NUMERO ,'
      '  EP.COMPLEMENTO ,'
      '  EP.BAIRRO ,'
      '  EP.CIDADE ,'
      '  EP.NOME ,'
      '  EP.CEP ,'
      '  EP.IDCIDADES,'
      '  C.NOME AS NOMECIDADE,'
      '  E.NOMEESTADO,'
      '  P.NOMEPAIS,'
      '  E.CODESTADO'
      'FROM PESSOA PES,'
      '  ENDPESS EP,'
      '  CIDADES C,'
      '  ESTADO E,'
      '  PAIS P'
      'WHERE EP.IDPESSOA = 2'
      'AND   PES.IDPESSOA = EP.IDPESSOA'
      'AND   EP.IDENDERECO = PES.IDENDCOBRANCA'
      'AND   E.IDPAIS = P.IDPAIS(+)'
      'AND   E.IDESTADO(+) = C.IDESTADO'
      'AND   C.IDCIDADES(+) = EP.IDCIDADES'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 492
    Top = 222
  end
  object ds: TwwDataSource
    AutoEdit = False
    DataSet = qry
    Left = 510
    Top = 65524
  end
  object qryCBancaria: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CB.IDCBANCARIA,CB.FLGCONTAPREF,'
      '       AGENCIA.NOME AS NOMEAGENCIA,'
      '       BANCO.NOME   AS NOMEBANCO,'
      '       CB.IDAGENCIA,'
      '       CB.CONTACORRENTE,'
      '       CB.TIPOCONTA,'
      '       CB.FLGCONTACONJUNTA,'
      '       B.NUMBANCO,'
      '       AB.NUMAGENCIA, B.IDPESSOA AS IDBANCO'
      ''
      'FROM  PESSOA AGENCIA, PESSOA BANCO, CONTABANCARIA CB,'
      '      AGENCIABANCARIA AB,  BANCO B'
      'WHERE CB.IDPESSOA        = :IDPESSOA'
      'AND   CB.FLGCONTAPREF     = 1'
      'AND   AB.IDPESSOA(+)      = CB.IDAGENCIA'
      'AND   AGENCIA.IDPESSOA(+) = AB.IDPESSOA'
      'AND   BANCO.IDPESSOA(+)   = AB.IDBANCO'
      'AND   B.IDPESSOA(+)       = AB.IDBANCO'
      'AND   CB.IDCBANCARIA = ( SELECT MAX(IDCBANCARIA) '
      '                         FROM   CONTABANCARIA'
      '                         WHERE  IDPESSOA     = :IDPESSOA'
      '                         AND    FLGCONTAPREF = 1 )'
      ''
      ' ')
    UpdateObject = updCBancaria
    ValidateWithMask = True
    Left = 282
    Top = 245
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryBanco: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT BANCO.IDPESSOA, PESSOA.NOME AS BANCO, '
      'BANCO.NUMBANCO, BANCO.MASCARACC, BANCO.FLGVALIDACC'
      'FROM BANCO, PESSOA'
      'WHERE BANCO.IDPESSOA = PESSOA.IDPESSOA')
    ValidateWithMask = True
    Left = 407
    Top = 239
  end
  object qryAgencia: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  AGENCIABANCARIA.IDPESSOA,'
      '               AGENCIA.NOME AS AGENCIA,'
      '               AGENCIABANCARIA.NUMAGENCIA,'
      '               AGENCIABANCARIA.IDBANCO'
      'FROM AGENCIABANCARIA, PESSOA AGENCIA'
      'WHERE AGENCIABANCARIA.IDBANCO = :IDBANCO'
      'AND AGENCIABANCARIA.IDPESSOA = AGENCIA.IDPESSOA'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 446
    Top = 214
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDBANCO'
        ParamType = ptUnknown
      end>
  end
  object dsCBancaria: TwwDataSource
    AutoEdit = False
    DataSet = qryCBancaria
    Left = 306
    Top = 258
  end
  object updCBancaria: TUpdateSQL
    Left = 240
    Top = 252
  end
end
