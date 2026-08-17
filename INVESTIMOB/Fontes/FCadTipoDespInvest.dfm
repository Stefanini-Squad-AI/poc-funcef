inherited frmCadTipoDespInvest: TfrmCadTipoDespInvest
  Left = 117
  Top = 154
  Caption = 'Cadastro de Tipos de Rubrica'
  ClientHeight = 329
  ClientWidth = 557
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 557
    Height = 261
    inherited pnlControles: TPanel
      Width = 555
      Height = 259
      object lbl: TLabel
        Left = 16
        Top = 8
        Width = 92
        Height = 13
        Caption = 'Tipo de Rubrica'
      end
      object LblIdRegra: TLabel
        Left = 360
        Top = 200
        Width = 39
        Height = 13
        Caption = 'Moeda'
      end
      object lblForCli: TLabel
        Left = 16
        Top = 160
        Width = 91
        Height = 13
        Caption = 'Credor / Cliente'
      end
      object Label1: TLabel
        Left = 16
        Top = 200
        Width = 87
        Height = 13
        Caption = 'Tipo de Cliente'
      end
      object dbedDescricao: TwwDBEdit
        Left = 16
        Top = 24
        Width = 521
        Height = 21
        DataField = 'DESCTIPODESPINV'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object DBcboMoeda: TwwDBLookupCombo
        Left = 360
        Top = 216
        Width = 177
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'MOESIGLA'#9'6'#9'Moeda')
        DataField = 'MOECODIGO'
        DataSource = ds
        LookupTable = qryLookMoeda
        LookupField = 'MOECODIGO'
        Style = csDropDownList
        DropDownCount = 5
        DropDownWidth = 8
        TabOrder = 4
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
      end
      object DBcboForCli: TwwDBLookupCombo
        Left = 16
        Top = 176
        Width = 521
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'NOME')
        LookupTable = qryLookForCli
        LookupField = 'IDPESSOA'
        Style = csDropDownList
        DropDownWidth = 8
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
      end
      object rdgAtualizaCarteira: TDBRadioGroup
        Left = 16
        Top = 56
        Width = 521
        Height = 89
        Caption = ' Atualização dos Saldos em Carteira '
        Columns = 2
        DataField = 'NATUREZAOPERACAO'
        DataSource = ds
        Items.Strings = (
          'Valor da cota (receita)'
          'Nº de cotas (acresc. valor)'
          'Não altera saldos'
          'Valor da cota (despesa)'
          'Nº de cotas (decresc. valor)')
        TabOrder = 1
        TabStop = True
        Values.Strings = (
          'O'
          'M'
          'N'
          'U'
          'I')
      end
      object DBcboTipoCliente: TwwDBLookupCombo
        Left = 16
        Top = 216
        Width = 329
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'40'#9'DESCRICAO')
        LookupTable = qryLookTipoCliente
        LookupField = 'IDTIPOCLIENTE'
        Style = csDropDownList
        DropDownCount = 5
        DropDownWidth = 8
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
      end
      object GroupBox2: TGroupBox
        Left = 273
        Top = 59
        Width = 2
        Height = 86
        Caption = 'GroupBox2'
        TabOrder = 5
      end
      object Panel1: TPanel
        Left = 249
        Top = 63
        Width = 24
        Height = 24
        BevelOuter = bvNone
        TabOrder = 6
        object Image4: TImage
          Left = 4
          Top = 4
          Width = 16
          Height = 16
          AutoSize = True
          Center = True
          Picture.Data = {
            07544269746D6170F6000000424DF60000000000000076000000280000001000
            0000100000000100040000000000800000000000000000000000100000000000
            0000000000000000800000800000008080008000000080008000808000008080
            8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
            FF00888888888888888888888000008888888880044444008888887444444444
            088887C444FFF444408887C444FFF44440887C4444FFF44444087C4444FFF444
            44087C4FFFFFFFFF44087C44FFFFFFF444087C444FFFFF44440887C444FFF444
            408887C4444F44444088887CC4444444088888877CCCCC778888888887777788
            8888}
        end
      end
      object Panel2: TPanel
        Left = 511
        Top = 63
        Width = 24
        Height = 24
        BevelOuter = bvNone
        TabOrder = 7
        object Image1: TImage
          Left = 4
          Top = 4
          Width = 16
          Height = 16
          AutoSize = True
          Center = True
          Picture.Data = {
            07544269746D6170F6000000424DF60000000000000076000000280000001000
            0000100000000100040000000000800000000000000000000000100000000000
            0000000000000000800000800000008080008000000080008000808000008080
            8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
            FF00888888888888888888888777778888888887711111778888887111111111
            08888791111F11111088879111FFF111108879111FFFFF1111087911FFFFFFF1
            1108791FFFFFFFFF1108791111FFF1111108791111FFF1111108879111FFF111
            1088879111FFF111108888799111111108888880099999008888888880000088
            8888}
        end
      end
    end
    inherited dbGrd: TwwDBGrid
      Width = 555
      Height = 259
      Selected.Strings = (
        'DESCTIPODESPINV'#9'51'#9'Tipo de Rubrica'
        'MOESIGLA'#9'13'#9'Moeda')
    end
  end
  inherited Dock972: TDock97
    Width = 557
  end
  inherited Dock971: TDock97
    Top = 296
    Width = 557
    inherited tb97Fundo: TToolbar97
      Left = 211
      DockPos = 211
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 34
      DockPos = 34
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 65504
    Top = 65500
  end
  inherited ds: TwwDataSource
    OnDataChange = dsDataChange
    Left = 440
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update TIPODESPINVEST'
      'set'
      '  IDTIPODESPINVEST = :IDTIPODESPINVEST,'
      '  DESCTIPODESPINV = :DESCTIPODESPINV,'
      '  MOECODIGO = :MOECODIGO,'
      '  NATUREZAOPERACAO = :NATUREZAOPERACAO,'
      '  TIPCREDOR = :TIPCREDOR'
      'where'
      '  IDTIPODESPINVEST = :OLD_IDTIPODESPINVEST')
    InsertSQL.Strings = (
      'insert into TIPODESPINVEST'
      
        '  (IDTIPODESPINVEST, DESCTIPODESPINV, MOECODIGO, NATUREZAOPERACA' +
        'O, TIPCREDOR)'
      'values'
      
        '  (:IDTIPODESPINVEST, :DESCTIPODESPINV, :MOECODIGO, :NATUREZAOPE' +
        'RACAO, '
      '   :TIPCREDOR)')
    DeleteSQL.Strings = (
      'delete from TIPODESPINVEST'
      'where'
      '  IDTIPODESPINVEST = :OLD_IDTIPODESPINVEST')
    Left = 376
  end
  inherited MontaSelect: TMontaSelect
    Left = 461
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 366
    Top = 66
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '   D.IDTIPODESPINVEST, D.DESCTIPODESPINV, D.MOECODIGO,'
      '   D.NATUREZAOPERACAO, D.TIPCREDOR, M.MOESIGLA'
      'FROM'
      '   TIPODESPINVEST D, MOEDA M'
      'WHERE'
      '   ( D.MOECODIGO = M.MOECODIGO(+) )'
      'ORDER BY'
      '   D.DESCTIPODESPINV')
    Left = 408
    object qryDESCTIPODESPINV: TStringField
      DisplayLabel = 'Tipo de Rubrica'
      DisplayWidth = 51
      FieldName = 'DESCTIPODESPINV'
      Size = 60
    end
    object qryMOESIGLA: TStringField
      DisplayLabel = 'Moeda'
      DisplayWidth = 13
      FieldName = 'MOESIGLA'
      Size = 10
    end
    object qryIDTIPODESPINVEST: TFloatField
      FieldName = 'IDTIPODESPINVEST'
      Visible = False
    end
    object qryMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Visible = False
    end
    object qryNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      Visible = False
      Size = 1
    end
    object qryTIPCREDOR: TStringField
      FieldName = 'TIPCREDOR'
      Visible = False
      Size = 2
    end
  end
  object qryLookMoeda: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   MOECODIGO, MOEDESC, MOESIGLA  '
      'FROM '
      '   MOEDA'
      'ORDER BY'
      '   MOESIGLA')
    ValidateWithMask = True
    Left = 272
    Top = 237
    object qryLookMoedaMOESIGLA: TStringField
      DisplayLabel = 'Moeda'
      DisplayWidth = 6
      FieldName = 'MOESIGLA'
      Origin = 'MOEDA.MOESIGLA'
      Size = 10
    end
    object qryLookMoedaMOEDESC: TStringField
      DisplayWidth = 15
      FieldName = 'MOEDESC'
      Origin = 'MOEDA.MOEDESC'
      Visible = False
    end
    object qryLookMoedaMOECODIGO: TFloatField
      DisplayWidth = 10
      FieldName = 'MOECODIGO'
      Origin = 'MOEDA.MOECODIGO'
      Visible = False
    end
  end
  object qryVerificaOcorrencia: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDTIPODESPINVEST, DESCTIPODESPINV'
      'FROM'
      '  TIPODESPINVEST'
      'WHERE'
      '  ( LOWER(DESCTIPODESPINV) =:DESCRICAO )')
    ValidateWithMask = True
    Left = 272
    Top = 225
    ParamData = <
      item
        DataType = ftString
        Name = 'DESCRICAO'
        ParamType = ptUnknown
      end>
  end
  object qryDespXForCli: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   X.IDTIPODESPINVEST, X.EMPRESAPROP, X.IDFORCLI,'
      '   C.IDTIPOCLIENTE'
      'FROM'
      '   FORCLIXDESPINVEST X, CLIENTEPESS C'
      'WHERE'
      '   ('
      '   ( EMPRESAPROP =:EMPRESAPROP ) AND'
      '   ( IDTIPODESPINVEST =:DESPESA )'
      '   )'
      '   AND'
      '   ( X.IDFORCLI = C.IDPESSOA(+) ) '
      '')
    UpdateObject = updDespXForCli
    ValidateWithMask = True
    Left = 272
    Top = 213
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'DESPESA'
        ParamType = ptUnknown
      end>
    object qryDespXForCliIDTIPODESPINVEST: TFloatField
      FieldName = 'IDTIPODESPINVEST'
      Origin = 'FORCLIXDESPINVEST.IDTIPODESPINVEST'
    end
    object qryDespXForCliEMPRESAPROP: TFloatField
      FieldName = 'EMPRESAPROP'
      Origin = 'FORCLIXDESPINVEST.EMPRESAPROP'
    end
    object qryDespXForCliIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = 'FORCLIXDESPINVEST.IDFORCLI'
    end
    object qryDespXForCliIDTIPOCLIENTE: TFloatField
      FieldName = 'IDTIPOCLIENTE'
      Origin = 'CLIENTEPESS.IDTIPOCLIENTE'
    end
  end
  object updDespXForCli: TUpdateSQL
    ModifySQL.Strings = (
      'update FORCLIXDESPINVEST'
      'set'
      '  IDTIPODESPINVEST = :IDTIPODESPINVEST,'
      '  EMPRESAPROP = :EMPRESAPROP,'
      '  IDFORCLI = :IDFORCLI'
      'where'
      '  IDTIPODESPINVEST = :OLD_IDTIPODESPINVEST and'
      '  EMPRESAPROP = :OLD_EMPRESAPROP')
    InsertSQL.Strings = (
      'insert into FORCLIXDESPINVEST'
      '  (IDTIPODESPINVEST, EMPRESAPROP, IDFORCLI)'
      'values'
      '  (:IDTIPODESPINVEST, :EMPRESAPROP, :IDFORCLI)')
    DeleteSQL.Strings = (
      'delete from FORCLIXDESPINVEST'
      'where'
      '  IDTIPODESPINVEST = :OLD_IDTIPODESPINVEST and'
      '  EMPRESAPROP = :OLD_EMPRESAPROP')
    Left = 272
    Top = 201
  end
  object qryLookForCli: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   P.IDPESSOA, P.NOME,'
      '   C.IDTIPOCLIENTE'
      'FROM'
      '   PESSOA P, CLIENTEPESS C'
      'WHERE'
      '   ('
      '   ( FLGFORNSERV = 1 ) OR'
      '   ( FLGCLIENTE = 1 )'
      '   )'
      '   AND'
      '   ( P.IDPESSOA = C.IDPESSOA(+) )'
      'ORDER BY'
      '   P.NOME')
    ValidateWithMask = True
    Left = 272
    Top = 189
    object qryLookForCliIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'PESSOA.IDPESSOA'
    end
    object qryLookForCliNOME: TStringField
      FieldName = 'NOME'
      Origin = 'PESSOA.NOME'
      Size = 60
    end
  end
  object qryLookTipoCliente: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDTIPOCLIENTE, DESCRICAO'
      'FROM'
      '   TIPOCLIENTE'
      'ORDER BY'
      '   DESCRICAO')
    ValidateWithMask = True
    Left = 272
    Top = 177
    object qryLookTipoClienteDESCRICAO: TStringField
      DisplayWidth = 40
      FieldName = 'DESCRICAO'
      Origin = 'TIPOCLIENTE.DESCRICAO'
      Size = 40
    end
    object qryLookTipoClienteIDTIPOCLIENTE: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOCLIENTE'
      Origin = 'TIPOCLIENTE.IDTIPOCLIENTE'
      Visible = False
    end
  end
end
