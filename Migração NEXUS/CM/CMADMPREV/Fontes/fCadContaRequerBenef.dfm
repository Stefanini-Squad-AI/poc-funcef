inherited frmCadContaRequerBenef: TfrmCadContaRequerBenef
  Left = 391
  Top = 142
  Caption = 'Cadastro de Conta Bancária'
  ClientHeight = 303
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 217
    inherited dbGrd: TwwDBGrid [0]
      Height = 215
      Selected.Strings = (
        'BANCO'#9'20'#9'Banco'
        'AGENCIA'#9'20'#9'Agência'#9'F'
        'CONTACORRENTE'#9'15'#9'Conta'
        'FLGCONTAPREF'#9'10'#9'Preferencial'
        'DESCRTIPO'#9'14'#9'Tipo')
    end
    inherited pnlControles: TPanel [1]
      Height = 215
      object DBRadioGroup1: TDBRadioGroup
        Left = 376
        Top = 1
        Width = 145
        Height = 73
        Caption = 'Tipo'
        DataField = 'TIPOCONTA'
        DataSource = ds
        Items.Strings = (
          'Conta &Corrente'
          'Conta &Salário'
          '&Poupança')
        TabOrder = 0
        Values.Strings = (
          '1'
          '2'
          '3')
      end
      object DBRadioGroup2: TDBRadioGroup
        Left = 376
        Top = 73
        Width = 144
        Height = 37
        Caption = 'Preferencial'
        Columns = 2
        DataField = 'FLGCONTAPREF'
        DataSource = ds
        Items.Strings = (
          '&Sim'
          '&Não')
        TabOrder = 1
        Values.Strings = (
          '1'
          '0')
      end
      object DBRadioGroup3: TDBRadioGroup
        Left = 376
        Top = 115
        Width = 147
        Height = 39
        Caption = 'Conta Conjunta'
        Columns = 2
        DataField = 'FLGCONTACONJUNTA'
        DataSource = ds
        Items.Strings = (
          '&Sim'
          '&Não')
        TabOrder = 2
        Values.Strings = (
          'S'
          'N')
      end
      object GroupBox1: TGroupBox
        Left = 5
        Top = 1
        Width = 358
        Height = 196
        TabOrder = 3
        object Label4: TLabel
          Left = 10
          Top = 14
          Width = 55
          Height = 13
          Caption = 'Nº Banco'
        end
        object Label1: TLabel
          Left = 90
          Top = 14
          Width = 37
          Height = 13
          Caption = 'Banco'
        end
        object Label5: TLabel
          Left = 10
          Top = 74
          Width = 65
          Height = 13
          Caption = 'Nº Ag&encia'
        end
        object Label2: TLabel
          Left = 90
          Top = 74
          Width = 47
          Height = 13
          Caption = 'Agência'
        end
        object Label3: TLabel
          Left = 90
          Top = 135
          Width = 86
          Height = 13
          Caption = 'Conta Corrente'
        end
        object edtNumBanco: TEdit
          Left = 10
          Top = 30
          Width = 70
          Height = 21
          TabOrder = 0
          OnExit = edtNumBancoExit
        end
        object cmbBanco: TwwDBLookupCombo
          Left = 90
          Top = 30
          Width = 261
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'BANCO'#9'30'#9'Banco'#9'F')
          LookupTable = qryBanco
          LookupField = 'IDPESSOA'
          TabOrder = 1
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
          OnCloseUp = cmbBancoCloseUp
          OnExit = cmbBancoExit
        end
        object edtNumAgencia: TEdit
          Left = 10
          Top = 91
          Width = 72
          Height = 21
          TabOrder = 2
          OnExit = edtNumAgenciaExit
        end
        object cmbAgencia: TwwDBLookupCombo
          Left = 90
          Top = 91
          Width = 261
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'AGENCIA'#9'60'#9'Agência'#9'F')
          DataField = 'IDAGENCIA'
          DataSource = ds
          LookupTable = qryAgencia
          LookupField = 'IDPESSOA'
          TabOrder = 3
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
          OnCloseUp = cmbAgenciaCloseUp
        end
        object edtConta: TwwDBEdit
          Left = 90
          Top = 151
          Width = 137
          Height = 21
          DataField = 'CONTACORRENTE'
          DataSource = ds
          TabOrder = 4
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
          OnExit = edtContaExit
        end
      end
      object dbRdgContaResgate: TDBRadioGroup
        Left = 376
        Top = 158
        Width = 147
        Height = 39
        Caption = 'Conta Resgate'
        Columns = 2
        DataField = 'FLGCONTARESGATE'
        DataSource = ds
        Items.Strings = (
          '&Sim'
          '&Não')
        TabOrder = 4
        Values.Strings = (
          '1'
          '0')
      end
    end
  end
  inherited Dock972: TDock97
    object lblNome: TLabel [0]
      Left = 264
      Top = 6
      Width = 41
      Height = 13
      Caption = 'Nome :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblDocumento: TLabel [1]
      Left = 264
      Top = 24
      Width = 32
      Height = 13
      Caption = 'CPF :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inherited Toolbar971: TToolbar97
      inherited sbtnProcurar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 264
    inherited TB97oKCancelar: TToolbar97
      inherited bbtnConfirmar: TBitBtn
        Default = False
        ModalResult = 0
      end
      inherited bbtnCancelar: TBitBtn
        ModalResult = 0
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 16
    Top = 246
  end
  inherited ds: TwwDataSource
    Left = 105
    Top = 186
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update CONTABANCARIA'
      'set'
      '  CONTACORRENTE = :CONTACORRENTE,'
      '  IDAGENCIA = :IDAGENCIA,'
      '  FLGCONTAPREF = :FLGCONTAPREF,'
      '  IDPESSOA = :IDPESSOA,'
      '  TIPOCONTA = :TIPOCONTA,'
      '  FLGCONTACONJUNTA = :FLGCONTACONJUNTA,'
      '  FLGCONTARESGATE =:FLGCONTARESGATE'
      'where'
      '  IDCBANCARIA = :OLD_IDCBANCARIA')
    InsertSQL.Strings = (
      'insert into CONTABANCARIA'
      
        '  (IDCBANCARIA, CONTACORRENTE, IDAGENCIA, FLGCONTAPREF, IDPESSOA' +
        ', '
      'TIPOCONTA, '
      '   FLGCONTACONJUNTA,'
      '   FLGCONTARESGATE)'
      'values'
      '  (:IDCBANCARIA, :CONTACORRENTE, :IDAGENCIA, :FLGCONTAPREF, '
      ':IDPESSOA, '
      '   :TIPOCONTA, :FLGCONTACONJUNTA,:FLGCONTARESGATE)')
    DeleteSQL.Strings = (
      'delete from CONTABANCARIA'
      'where'
      '  IDCBANCARIA = :OLD_IDCBANCARIA')
    Left = 210
    Top = 218
  end
  inherited MontaSelect: TMontaSelect
    Left = 101
    Top = 246
  end
  inherited ImlPadrao: TImageList
    Left = 57
    Top = 246
  end
  inherited CmeCadastro: TCmEventosCadastro
    RepetirInsert = False
    OpenDsAutomatico = True
    Left = 308
    Top = 258
  end
  inherited qry: TwwQuery
    AfterOpen = qryAfterOpen
    AfterInsert = qryAfterInsert
    AfterPost = qryAfterPost
    AfterDelete = qryAfterDelete
    SQL.Strings = (
      'SELECT  CB.IDCBANCARIA,'
      '        CB.CONTACORRENTE,'
      '        CB.IDAGENCIA,'
      '        CB.FLGCONTAPREF,'
      '        CB.IDPESSOA,'
      '        CB.TIPOCONTA,'
      '        DECODE(CB.TIPOCONTA,1,'#39'Conta Corrente'#39','
      '                            2,'#39'Conta Salário'#39','
      '                            3,'#39'Poupança'#39') AS DESCRTIPO,'
      '        CB.FLGCONTACONJUNTA,'
      '        BANCO.NOME AS BANCO,'
      '        AGENCIA.NOME AS AGENCIA,'
      '        BANCO.IDPESSOA AS IDBANCO,'
      '        CB.ROWID,'
      '        CB.FLGCONTARESGATE'
      
        'FROM   PESSOA AGENCIA, PESSOA BANCO, AGENCIABANCARIA AG, CONTABA' +
        'NCARIA CB'
      'WHERE  CB.IDPESSOA = :IDPESSOA'
      'AND    AG. IDPESSOA = CB.IDAGENCIA'
      'AND    AGENCIA.IDPESSOA = AG.IDPESSOA'
      'AND    BANCO.IDPESSOA = AG.IDBANCO'
      ''
      ' ')
    ControlType.Strings = (
      'FLGCONTAPREF;CheckBox;1;0'
      'TIPOCONTA;CheckBox;1;0'
      'FLGCONTACONJUNTA;CheckBox;1;0')
    Left = 103
    Top = 138
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = '10001'
      end>
  end
  object qryAgencia: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  AGENCIABANCARIA.IDPESSOA,'
      '  AGENCIA.NOME AS AGENCIA,'
      '  AGENCIABANCARIA.NUMAGENCIA,'
      '  AGENCIABANCARIA.IDBANCO'
      'FROM'
      '  AGENCIABANCARIA, PESSOA AGENCIA'
      'WHERE'
      '  AGENCIABANCARIA.IDPESSOA  = AGENCIA.IDPESSOA AND'
      '  AGENCIABANCARIA.IDBANCO=:pIdBanco'
      'ORDER BY'
      '  AGENCIA.NOME')
    ValidateWithMask = True
    Left = 264
    Top = 162
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIdBanco'
        ParamType = ptUnknown
      end>
  end
  object qryBanco: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  BANCO.IDPESSOA,'
      '        PESSOA.NOME AS BANCO,'
      '        BANCO.NUMBANCO, '
      '        BANCO.FLGVALIDACC,'
      '        BANCO.MASCARACC'
      'FROM    PESSOA, BANCO'
      'WHERE   BANCO.IDPESSOA = PESSOA.IDPESSOA'
      'ORDER BY BANCO'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 349
    Top = 258
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 391
    Top = 258
  end
  object QryContaResgate: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        #39'                                                               ' +
        '                                               '#39'  AS IDROWID'
      'FROM DUAL')
    UpdateObject = updContaResgate
    ValidateWithMask = True
    Left = 233
    Top = 76
  end
  object updContaResgate: TUpdateSQL
    Left = 243
    Top = 118
  end
end
