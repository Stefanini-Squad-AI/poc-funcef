inherited FrmCadCaixaPeq: TFrmCadCaixaPeq
  Left = 88
  Top = 113
  Caption = 'Cadastro de Caixa Pequeno'
  ClientHeight = 324
  ClientWidth = 584
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 584
    Height = 238
    object Label1: TLabel
      Left = 24
      Top = 16
      Width = 58
      Height = 13
      Caption = 'Descrição'
      FocusControl = edDesc
    end
    object Label2: TLabel
      Left = 288
      Top = 128
      Width = 83
      Height = 13
      Caption = 'Valor do Caixa'
      FocusControl = edDesc
    end
    object Label3: TLabel
      Left = 440
      Top = 128
      Width = 107
      Height = 13
      Caption = 'Valor Lançamento '
      FocusControl = edDesc
    end
    object Label4: TLabel
      Left = 24
      Top = 128
      Width = 112
      Height = 13
      Caption = 'Tipo de Documento'
      FocusControl = edDesc
    end
    object Label5: TLabel
      Left = 288
      Top = 176
      Width = 99
      Height = 13
      Caption = 'Nº de Dias Venc.'
      FocusControl = edDesc
    end
    object Label6: TLabel
      Left = 24
      Top = 176
      Width = 119
      Height = 13
      Caption = 'Forma de pagamento'
      FocusControl = edDesc
    end
    object edDesc: TDBEdit
      Left = 24
      Top = 32
      Width = 537
      Height = 21
      DataField = 'DESCCAIXAPEQ'
      DataSource = ds
      TabOrder = 0
    end
    object cmpFavo: TCMProcuraForCli
      Left = 24
      Top = 64
      Width = 537
      Height = 50
      Caption = ' Favorecido '
      TabOrder = 1
      CampoEdit = ceRazaoSocial
      MostraMensagens = True
      DataSource = ds
      DataField = 'IDFORCLI'
      Mensagens.EmBranco = 'Favorecido não pode estar em branco'
      Mensagens.NaoExiste = 'Favorecido não existe'
      PermiteChaveInvalida = False
      PermiteChaveEmBranco = False
      ForCli = fcFornecedor
      MostraEndereco = False
      StatusForCli = fcAll
    end
    object edValTot: TDBRealEdit
      Left = 288
      Top = 144
      Width = 129
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 3
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
      DataField = 'VLRTOTCAIXAPEQ'
      DataSource = ds
    end
    object dblcTipoDoc: TCMDBLookupCombo
      Left = 24
      Top = 144
      Width = 241
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'35'#9'Descrição')
      DataField = 'CODTIPDOC'
      DataSource = ds
      LookupTable = qryTipoDoc
      LookupField = 'CODTIPDOC'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object edValLanc: TDBRealEdit
      Left = 440
      Top = 144
      Width = 121
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 4
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
      DataField = 'VLRMAXLANC'
      DataSource = ds
    end
    object edNumDiasVenc: TDBRealEdit
      Left = 288
      Top = 192
      Width = 129
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '         0')
      TabOrder = 5
      WordWrap = False
      IntDigits = 10
      DecDigits = 0
      NumberFormat = iNumber
      Signal = False
      DataField = 'NUMDIASVENC'
      DataSource = ds
    end
    object dblcForma: TCMDBLookupCombo
      Left = 24
      Top = 192
      Width = 241
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'35'#9'Descrição')
      DataField = 'CODFORMA'
      DataSource = ds
      LookupTable = qryFormaPag
      LookupField = 'CODFORMA'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 6
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
  end
  inherited Dock972: TDock97
    Width = 584
  end
  inherited Dock971: TDock97
    Top = 285
    Width = 584
    inherited tb97Fundo: TToolbar97
      Left = 168
      DockPos = 168
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      DockPos = 0
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '      IDCAIXAPEQUENO,'
      '      CODTIPDOC,'
      '      IDFORCLI,'
      '      IDPESSOA,'
      '      DESCCAIXAPEQ,'
      '      VLRTOTCAIXAPEQ,'
      '      VLRMAXLANC,'
      '      NUMDIASVENC,'
      '      CODFORMA'
      'FROM'
      '      CAIXAPEQUENO'
      'WHERE'
      '     (IDCAIXAPEQUENO = :pIDCAIXAPEQUENO)')
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDCAIXAPEQUENO'
        ParamType = ptUnknown
      end>
    object qryCODTIPDOC: TFloatField
      FieldName = 'CODTIPDOC'
      Origin = 'CAIXAPEQUENO.IDCAIXAPEQUENO'
    end
    object qryIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = 'CAIXAPEQUENO.IDFORCLI'
    end
    object qryIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'CAIXAPEQUENO.IDPESSOA'
    end
    object qryDESCCAIXAPEQ: TStringField
      FieldName = 'DESCCAIXAPEQ'
      Origin = 'CAIXAPEQUENO.DESCCAIXAPEQ'
      Size = 60
    end
    object qryVLRTOTCAIXAPEQ: TFloatField
      FieldName = 'VLRTOTCAIXAPEQ'
      Origin = 'CAIXAPEQUENO.VLRTOTCAIXAPEQ'
    end
    object qryVLRMAXLANC: TFloatField
      FieldName = 'VLRMAXLANC'
      Origin = 'CAIXAPEQUENO.VLRMAXLANC'
    end
    object qryIDCAIXAPEQUENO: TFloatField
      FieldName = 'IDCAIXAPEQUENO'
      Origin = 'CAIXAPEQUENO.IDCAIXAPEQUENO'
    end
    object qryNUMDIASVENC: TFloatField
      FieldName = 'NUMDIASVENC'
      Origin = 'CAIXAPEQUENO.NUMDIASVENC'
    end
    object qryCODFORMA: TFloatField
      FieldName = 'CODFORMA'
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 787
    Top = 65531
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update CAIXAPEQUENO'
      'set'
      '  IDCAIXAPEQUENO = :IDCAIXAPEQUENO,'
      '  CODTIPDOC = :CODTIPDOC,'
      '  IDFORCLI = :IDFORCLI,'
      '  IDPESSOA = :IDPESSOA,'
      '  DESCCAIXAPEQ = :DESCCAIXAPEQ,'
      '  VLRTOTCAIXAPEQ = :VLRTOTCAIXAPEQ,'
      '  VLRMAXLANC = :VLRMAXLANC,'
      '  NUMDIASVENC = :NUMDIASVENC,'
      '  CODFORMA = :CODFORMA'
      'where'
      '  IDCAIXAPEQUENO = :OLD_IDCAIXAPEQUENO')
    InsertSQL.Strings = (
      'insert into CAIXAPEQUENO'
      
        '  (IDCAIXAPEQUENO, CODTIPDOC, IDFORCLI, IDPESSOA, DESCCAIXAPEQ, ' +
        'VLRTOTCAIXAPEQ, '
      '   VLRMAXLANC, NUMDIASVENC, CODFORMA)'
      'values'
      
        '  (:IDCAIXAPEQUENO, :CODTIPDOC, :IDFORCLI, :IDPESSOA, :DESCCAIXA' +
        'PEQ, :VLRTOTCAIXAPEQ, '
      '   :VLRMAXLANC, :NUMDIASVENC, :CODFORMA)')
    DeleteSQL.Strings = (
      'delete from CAIXAPEQUENO'
      'where'
      '  IDCAIXAPEQUENO = :OLD_IDCAIXAPEQUENO')
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'CAIXAPEQUENO.DESCCAIXAPEQ')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição')
    Tabelas.Strings = (
      'CAIXAPEQUENO')
    CamposChave.Strings = (
      'CAIXAPEQUENO.IDCAIXAPEQUENO')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 358
    Top = 58
  end
  object qryTipoDoc: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      #9'CODTIPDOC,'
      #9'DESCRICAO'
      'FROM'
      #9'TIPODOCRECPAG'
      'WHERE'
      '     (RECPAG = '#39'P'#39')'
      'ORDER BY DEBCRE DESC, DESCRICAO')
    ValidateWithMask = True
    Left = 488
    Top = 9
    object qryTipoDocDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 35
      FieldName = 'DESCRICAO'
      Origin = '"CM.TIPODOCRECPAG".DESCRICAO'
      Size = 35
    end
    object qryTipoDocCODTIPDOC: TFloatField
      DisplayWidth = 10
      FieldName = 'CODTIPDOC'
      Origin = '"CM.TIPODOCRECPAG".CODTIPDOC'
      Visible = False
    end
  end
  object qryFormaPag: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODFORMA, RECPAG, DESCRICAO'
      'FROM FORMARECPAG '
      'WHERE (RECPAG = :PRECPAG) AND'
      '               (IDPESSOA = :PIDPESSOA)')
    ValidateWithMask = True
    Left = 437
    Top = 64
    ParamData = <
      item
        DataType = ftString
        Name = 'PRECPAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryFormaPagDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 35
      FieldName = 'DESCRICAO'
      Origin = 'FORMARECPAG.DESCRICAO'
      Size = 30
    end
    object qryFormaPagCODFORMA: TFloatField
      FieldName = 'CODFORMA'
      Origin = 'FORMARECPAG.CODFORMA'
      Visible = False
    end
    object qryFormaPagRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'FORMARECPAG.RECPAG'
      Visible = False
      Size = 1
    end
  end
end
