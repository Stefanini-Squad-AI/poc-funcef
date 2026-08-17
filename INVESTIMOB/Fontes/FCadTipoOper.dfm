inherited frmCadTipoOperacao: TfrmCadTipoOperacao
  Left = 221
  Top = 176
  Caption = 'Tipos de Operação de Investimento'
  ClientHeight = 351
  ClientWidth = 654
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 654
    Height = 283
    inherited pnlControles: TPanel
      Width = 652
      Height = 281
      object Label2: TLabel
        Left = 16
        Top = 6
        Width = 107
        Height = 13
        Caption = 'Tipo de Operação '
      end
      object Label4: TLabel
        Left = 16
        Top = 227
        Width = 112
        Height = 13
        Caption = 'Tipo de Documento'
      end
      object Bevel1: TBevel
        Left = 16
        Top = 216
        Width = 617
        Height = 2
        Shape = bsTopLine
      end
      object dbedDescricao: TwwDBEdit
        Left = 16
        Top = 20
        Width = 377
        Height = 21
        DataField = 'DESCTIPOOPERACAO'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object DBchkGeraContab: TDBCheckBox
        Left = 328
        Top = 170
        Width = 185
        Height = 17
        Caption = 'Contabilizar Operação'
        DataField = 'FLGGERACONTAB'
        DataSource = ds
        TabOrder = 4
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBchkGeraCAPCAR: TDBCheckBox
        Left = 24
        Top = 170
        Width = 297
        Height = 17
        Caption = 'Gerar documento de Contas a Pagar / Receber'
        DataField = 'FLGGERACAPCAR'
        DataSource = ds
        Enabled = False
        TabOrder = 3
        ValueChecked = '1'
        ValueUnchecked = '0'
        OnClick = DBchkGeraCAPCARClick
        OnExit = DBchkGeraCAPCARClick
      end
      object pnlCAPCAR: TPanel
        Left = 16
        Top = 289
        Width = 617
        Height = 91
        Enabled = False
        TabOrder = 6
        Visible = False
        object lblTipoCliente: TLabel
          Left = 16
          Top = 43
          Width = 87
          Height = 13
          Caption = 'Tipo de Cliente'
        end
        object lblForCli: TLabel
          Left = 16
          Top = 5
          Width = 91
          Height = 13
          Caption = 'Credor / Cliente'
        end
        object DBcboTipoCliente: TwwDBLookupCombo
          Left = 16
          Top = 58
          Width = 201
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'40'#9'DESCRICAO')
          LookupTable = qryLookTipoCliente
          LookupField = 'IDTIPOCLIENTE'
          Style = csDropDownList
          DropDownCount = 5
          DropDownWidth = 8
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
        end
        object DBcboForCli: TwwDBLookupCombo
          Left = 16
          Top = 20
          Width = 585
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'60'#9'NOME')
          LookupTable = qryLookForCli
          LookupField = 'IDPESSOA'
          Style = csDropDownList
          DropDownWidth = 8
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
        end
      end
      object DBrdgCustoRec: TDBRadioGroup
        Left = 408
        Top = 8
        Width = 225
        Height = 34
        Columns = 2
        DataField = 'RECPAG'
        DataSource = ds
        Items.Strings = (
          'a Pagar'
          'a Receber')
        TabOrder = 1
        TabStop = True
        Values.Strings = (
          'P'
          'R')
        OnClick = DBrdgCustoRecClick
        OnExit = DBrdgCustoRecClick
      end
      object DBchkGeraCAF: TDBCheckBox
        Left = 24
        Top = 190
        Width = 273
        Height = 17
        Caption = 'Agregar valor / contabilizar pelo Ativo Fixo'
        DataField = 'FLGGERACAF'
        DataSource = ds
        TabOrder = 5
        ValueChecked = '1'
        ValueUnchecked = '0'
        OnClick = DBchkGeraCAPCARClick
        OnExit = DBchkGeraCAPCARClick
      end
      object rdgAtualizaCarteira: TDBRadioGroup
        Left = 16
        Top = 50
        Width = 617
        Height = 111
        Caption = ' Atualização dos Saldos em Carteira '
        Columns = 2
        DataField = 'NATUREZAOPERACAO'
        DataSource = ds
        Items.Strings = (
          'Nº de cotas e quant. investimento (compra)'
          'Nº de cotas (acresc. valor)'
          'Valor da cota (receita)'
          'Valor da cota e valor investimento (reavaliação)'
          'Não altera saldos'
          'Nº de cotas e quant. investimento (venda)'
          'Nº de cotas (decresc. valor)'
          'Valor da cota (despesa)'
          'Valor da cota e valor investimento (reavaliação)')
        TabOrder = 2
        TabStop = True
        Values.Strings = (
          'A'
          'M'
          'O'
          'G'
          'N'
          'D'
          'I'
          'U'
          'P')
      end
      object GroupBox2: TGroupBox
        Left = 321
        Top = 51
        Width = 2
        Height = 110
        TabOrder = 7
      end
      object GroupBox1: TGroupBox
        Left = 321
        Top = 166
        Width = 2
        Height = 42
        Caption = 'GroupBox1'
        TabOrder = 8
      end
      object Panel2: TPanel
        Left = 607
        Top = 57
        Width = 24
        Height = 24
        BevelOuter = bvNone
        TabOrder = 9
        object Image3: TImage
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
      object Panel1: TPanel
        Left = 297
        Top = 57
        Width = 24
        Height = 24
        BevelOuter = bvNone
        TabOrder = 10
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
      object DBcboTipoDoc: TwwDBLookupCombo
        Left = 16
        Top = 242
        Width = 369
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'35'#9'DESCRICAO')
        DataField = 'CODTIPDOC'
        DataSource = ds
        LookupTable = qryLookTipoDoc
        LookupField = 'CODTIPDOC'
        Style = csDropDownList
        DropDownCount = 5
        DropDownWidth = 8
        TabOrder = 11
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
      end
    end
    inherited dbGrd: TwwDBGrid
      Width = 652
      Height = 281
      Selected.Strings = (
        'DESCTIPOOPERACAO'#9'70'#9'Tipo de Operação'
        'RECPAG'#9'6'#9' ')
    end
  end
  inherited Dock972: TDock97
    Width = 654
  end
  inherited Dock971: TDock97
    Top = 318
    Width = 654
    inherited tb97Fundo: TToolbar97
      Left = 241
      DockPos = 241
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 64
      DockPos = 64
    end
  end
  inherited ds: TwwDataSource
    OnDataChange = dsDataChange
    Left = 568
    Top = 0
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update TIPOOPERACAO'
      'set'
      '  IDTIPOINVEST = :IDTIPOINVEST,'
      '  IDTIPOOPERACAO = :IDTIPOOPERACAO,'
      '  DESCTIPOOPERACAO = :DESCTIPOOPERACAO,'
      '  NATUREZAOPERACAO = :NATUREZAOPERACAO,'
      '  FLGGERACONTAB = :FLGGERACONTAB,'
      '  FLGGERACAPCAR = :FLGGERACAPCAR,'
      '  RECPAG = :RECPAG,'
      '  CODTIPDOC = :CODTIPDOC,'
      '  TIPCREDOR = :TIPCREDOR,'
      '  FLGGERACAF = :FLGGERACAF'
      'where'
      '  IDTIPOINVEST = :OLD_IDTIPOINVEST and'
      '  IDTIPOOPERACAO = :OLD_IDTIPOOPERACAO')
    InsertSQL.Strings = (
      'insert into TIPOOPERACAO'
      
        '  (IDTIPOINVEST, IDTIPOOPERACAO, DESCTIPOOPERACAO, NATUREZAOPERA' +
        'CAO, FLGGERACONTAB, '
      '   FLGGERACAPCAR, RECPAG, CODTIPDOC, TIPCREDOR, FLGGERACAF)'
      'values'
      
        '  (:IDTIPOINVEST, :IDTIPOOPERACAO, :DESCTIPOOPERACAO, :NATUREZAO' +
        'PERACAO, '
      
        '   :FLGGERACONTAB, :FLGGERACAPCAR, :RECPAG, :CODTIPDOC, :TIPCRED' +
        'OR, :FLGGERACAF)')
    DeleteSQL.Strings = (
      'delete from TIPOOPERACAO'
      'where'
      '  IDTIPOINVEST = :OLD_IDTIPOINVEST and'
      '  IDTIPOOPERACAO = :OLD_IDTIPOOPERACAO')
    Left = 600
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Left = 360
    Top = 40
  end
  inherited ImlPadrao: TImageList
    Left = 265
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 470
    Top = 2
  end
  inherited qry: TwwQuery
    BeforeEdit = qryBeforeEdit
    SQL.Strings = (
      'SELECT'
      '   IDTIPOINVEST, IDTIPOOPERACAO, DESCTIPOOPERACAO,'
      '   NATUREZAOPERACAO, FLGGERACONTAB, FLGGERACAPCAR,'
      '   RECPAG, CODTIPDOC, TIPCREDOR, FLGGERACAF'
      'FROM'
      '   TIPOOPERACAO'
      'WHERE'
      '   IDTIPOINVEST = 3'
      'ORDER BY'
      '   DESCTIPOOPERACAO')
    Left = 536
    Top = 0
    object qryDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Tipo de Operação'
      DisplayWidth = 70
      FieldName = 'DESCTIPOOPERACAO'
      Origin = 'TIPOOPERACAO.DESCTIPOOPERACAO'
      Size = 60
    end
    object qryRECPAG: TStringField
      Alignment = taCenter
      DisplayLabel = ' '
      DisplayWidth = 6
      FieldName = 'RECPAG'
      Origin = 'TIPOOPERACAO.RECPAG'
      Size = 1
    end
    object qryIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'TIPOOPERACAO.IDTIPOINVEST'
      Visible = False
    end
    object qryIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'TIPOOPERACAO.IDTIPOOPERACAO'
      Visible = False
    end
    object qryNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      Origin = 'TIPOOPERACAO.NATUREZAOPERACAO'
      Visible = False
      Size = 1
    end
    object qryFLGGERACONTAB: TFloatField
      FieldName = 'FLGGERACONTAB'
      Origin = 'TIPOOPERACAO.FLGGERACONTAB'
      Visible = False
    end
    object qryFLGGERACAPCAR: TFloatField
      FieldName = 'FLGGERACAPCAR'
      Origin = 'TIPOOPERACAO.FLGGERACAPCAR'
      Visible = False
    end
    object qryCODTIPDOC: TFloatField
      FieldName = 'CODTIPDOC'
      Origin = 'TIPOOPERACAO.CODTIPDOC'
      Visible = False
    end
    object qryTIPCREDOR: TStringField
      FieldName = 'TIPCREDOR'
      Origin = 'TIPOOPERACAO.TIPCREDOR'
      Visible = False
      Size = 2
    end
    object qryFLGGERACAF: TFloatField
      FieldName = 'FLGGERACAF'
      Origin = 'TIPOOPERACAO.FLGGERACAF'
      Visible = False
    end
  end
  object qryVerificaOcorrencia: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDTIPOOPERACAO, DESCTIPOOPERACAO'
      'FROM'
      '  TIPOOPERACAO'
      'WHERE'
      '  ( IDTIPOINVEST = 3 ) AND'
      '  ( LOWER(DESCTIPOOPERACAO) =:DESCRICAO )')
    ValidateWithMask = True
    Left = 480
    Top = 232
    ParamData = <
      item
        DataType = ftString
        Name = 'DESCRICAO'
        ParamType = ptUnknown
      end>
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
    Left = 592
    Top = 237
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
    Left = 592
    Top = 225
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
  object updForCliXTipOper: TUpdateSQL
    ModifySQL.Strings = (
      'update FORCLIXTIPOPER'
      'set'
      '  IDTIPOINVEST = :IDTIPOINVEST,'
      '  IDTIPOOPERACAO = :IDTIPOOPERACAO,'
      '  EMPRESAPROP = :EMPRESAPROP,'
      '  IDFORCLI = :IDFORCLI'
      'where'
      '  IDTIPOINVEST = :OLD_IDTIPOINVEST and'
      '  IDTIPOOPERACAO = :OLD_IDTIPOOPERACAO')
    InsertSQL.Strings = (
      'insert into FORCLIXTIPOPER'
      '  (IDTIPOINVEST, IDTIPOOPERACAO, EMPRESAPROP, IDFORCLI)'
      'values'
      '  (:IDTIPOINVEST, :IDTIPOOPERACAO, :EMPRESAPROP, :IDFORCLI)')
    DeleteSQL.Strings = (
      'delete from FORCLIXTIPOPER'
      'where'
      '  IDTIPOINVEST = :OLD_IDTIPOINVEST and'
      '  IDTIPOOPERACAO = :OLD_IDTIPOOPERACAO')
    Left = 592
    Top = 213
  end
  object qryForCliXTipOper: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   X.IDTIPOINVEST, X.IDTIPOOPERACAO, X.EMPRESAPROP,'
      '   X.IDFORCLI,'
      '   C.IDTIPOCLIENTE'
      'FROM'
      '   FORCLIXTIPOPER X, CLIENTEPESS C'
      'WHERE'
      '   ('
      '   ( EMPRESAPROP =:EMPRESAPROP ) AND'
      '   ( IDTIPOINVEST =:INVEST )  AND'
      '   ( IDTIPOOPERACAO =:OPERACAO )'
      '   )'
      '   AND'
      '   ( X.IDFORCLI = C.IDPESSOA(+) ) ')
    UpdateObject = updForCliXTipOper
    ValidateWithMask = True
    Left = 592
    Top = 201
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'INVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'OPERACAO'
        ParamType = ptUnknown
      end>
    object qryForCliXTipOperIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'FORCLIXTIPOPER.IDTIPOINVEST'
    end
    object qryForCliXTipOperIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'FORCLIXTIPOPER.IDTIPOOPERACAO'
    end
    object qryForCliXTipOperEMPRESAPROP: TFloatField
      FieldName = 'EMPRESAPROP'
      Origin = 'FORCLIXTIPOPER.EMPRESAPROP'
    end
    object qryForCliXTipOperIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = 'FORCLIXTIPOPER.IDFORCLI'
    end
    object qryForCliXTipOperIDTIPOCLIENTE: TFloatField
      FieldName = 'IDTIPOCLIENTE'
    end
  end
  object qryLookTipoDoc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  CODTIPDOC, RECPAG, DESCRICAO, DEBCRE'
      'FROM'
      '  TIPODOCRECPAG'
      'WHERE'
      '  ( RECPAG =:RECPAG ) AND'
      '  ( DEBCRE =:DEBCRE )'
      'ORDER BY'
      '  DESCRICAO')
    ValidateWithMask = True
    Left = 480
    Top = 220
    ParamData = <
      item
        DataType = ftString
        Name = 'RECPAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DEBCRE'
        ParamType = ptUnknown
      end>
    object qryLookTipoDocDESCRICAO: TStringField
      DisplayWidth = 35
      FieldName = 'DESCRICAO'
      Origin = 'TIPODOCRECPAG.DESCRICAO'
      Size = 35
    end
    object qryLookTipoDocCODTIPDOC: TFloatField
      DisplayWidth = 10
      FieldName = 'CODTIPDOC'
      Origin = 'TIPODOCRECPAG.CODTIPDOC'
      Visible = False
    end
    object qryLookTipoDocRECPAG: TStringField
      DisplayWidth = 1
      FieldName = 'RECPAG'
      Origin = 'TIPODOCRECPAG.RECPAG'
      Visible = False
      Size = 1
    end
    object qryLookTipoDocDEBCRE: TStringField
      DisplayWidth = 1
      FieldName = 'DEBCRE'
      Origin = 'TIPODOCRECPAG.DEBCRE'
      Visible = False
      Size = 1
    end
  end
end
