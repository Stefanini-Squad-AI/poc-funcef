inherited frmCadCargo: TfrmCadCargo
  Left = 94
  Top = 114
  Caption = 'Tabela de Cargos'
  ClientHeight = 369
  ClientWidth = 594
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 594
    Height = 283
    BorderWidth = 2
    object Label1: TLabel
      Left = 9
      Top = 15
      Width = 103
      Height = 13
      AutoSize = False
      Caption = 'Código do Cargo'
      FocusControl = dbedCodigo
    end
    object Label2: TLabel
      Left = 9
      Top = 42
      Width = 103
      Height = 13
      AutoSize = False
      Caption = 'Título do Cargo'
      FocusControl = dbedTitulo
    end
    object Label4: TLabel
      Left = 9
      Top = 69
      Width = 26
      Height = 13
      Caption = 'CBO'
    end
    object Label6: TLabel
      Left = 9
      Top = 96
      Width = 103
      Height = 13
      AutoSize = False
      Caption = 'Grupo Funcional'
      FocusControl = DBMemo1
    end
    object Label7: TLabel
      Left = 9
      Top = 124
      Width = 103
      Height = 13
      AutoSize = False
      Caption = 'Faixa Salarial'
      FocusControl = DBMemo1
    end
    object Label3: TLabel
      Left = 9
      Top = 147
      Width = 113
      Height = 13
      Caption = 'Descrição do Cargo'
      FocusControl = DBMemo1
    end
    object dbedCodigo: TDBEdit
      Left = 117
      Top = 12
      Width = 84
      Height = 21
      DataField = 'IDCARGO'
      DataSource = ds
      TabOrder = 0
    end
    object dbedTitulo: TDBEdit
      Left = 117
      Top = 39
      Width = 467
      Height = 21
      DataField = 'TITULO'
      DataSource = ds
      TabOrder = 1
    end
    object dbedCBO: TDBEdit
      Left = 42
      Top = 66
      Width = 67
      Height = 21
      DataField = 'CBO'
      DataSource = ds
      MaxLength = 5
      TabOrder = 2
    end
    object dblcCBO: TwwDBLookupCombo
      Left = 117
      Top = 66
      Width = 467
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'80'#9'DESCRICAO')
      DataField = 'CBO'
      DataSource = ds
      LookupTable = qryCBO
      LookupField = 'IDCBO'
      Style = csDropDownList
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      OnChange = dblcCBOChange
    end
    object dblcGrupo: TwwDBLookupCombo
      Left = 117
      Top = 93
      Width = 319
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCGRPFUNC'#9'40'#9'DESCGRPFUNC')
      DataField = 'CODGRPFUNC'
      DataSource = ds
      LookupTable = qryGrupoFunc
      LookupField = 'CODGRPFUNC'
      Style = csDropDownList
      TabOrder = 4
      AutoDropDown = True
      ShowButton = True
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      OrderByDisplay = False
      AllowClearKey = True
    end
    object dblcFaixa: TwwDBLookupCombo
      Left = 117
      Top = 120
      Width = 85
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'IDFAIXASALARIAL'#9'10'#9'Código'
        'STEP1'#9'10'#9'STEP 1'
        'STEP2'#9'10'#9'STEP 2'
        'STEP3'#9'10'#9'STEP 3'
        'STEP4'#9'10'#9'STEP 4'
        'STEP5'#9'10'#9'STEP 5'
        'STEP6'#9'10'#9'STEP 6'
        'STEP7'#9'10'#9'STEP 7'
        'STEP8'#9'10'#9'STEP 8'
        'STEP9'#9'10'#9'STEP 9'
        'DATAEFETIV'#9'10'#9'Data Efetiv.')
      DataField = 'IDFAIXASALARIAL'
      DataSource = ds
      LookupTable = qryFaixa
      LookupField = 'IDFAIXASALARIAL'
      Options = [loColLines, loTitles]
      Style = csDropDownList
      TabOrder = 5
      AutoDropDown = True
      ShowButton = True
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      AllowClearKey = True
    end
    object DBMemo1: TDBMemo
      Left = 9
      Top = 162
      Width = 575
      Height = 112
      DataField = 'DESCRICAO'
      DataSource = ds
      ScrollBars = ssVertical
      TabOrder = 6
    end
  end
  inherited Dock972: TDock97
    Width = 594
  end
  inherited Dock971: TDock97
    Top = 330
    Width = 594
    inherited tb97Fundo: TToolbar97
      Left = 424
      DockPos = 424
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 256
      DockPos = 256
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '  C.IDCARGO, C.TITULO, C.CBO, UPPER(CBO.DESCRICAO) AS NOMECBO,'
      '  C.CODGRPFUNC, C.IDFAIXASALARIAL, C.DESCRICAO'
      'FROM'
      '  CARGO C, CBO'
      'WHERE'
      '  (C.IDCARGO = :IDCARGO) AND'
      '  (C.CBO     = CBO.IDCBO(+))'
      'ORDER BY'
      '  C.TITULO')
    Left = 270
    Top = 1
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDCARGO'
        ParamType = ptUnknown
      end>
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 473
    Top = 1
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update CARGO'
      'set'
      '  IDCARGO = :IDCARGO,'
      '  TITULO = :TITULO,'
      '  CBO = :CBO,'
      '  CODGRPFUNC = :CODGRPFUNC,'
      '  IDFAIXASALARIAL = :IDFAIXASALARIAL,'
      '  DESCRICAO = :DESCRICAO'
      'where'
      '  IDCARGO = :OLD_IDCARGO')
    InsertSQL.Strings = (
      'insert into CARGO'
      '  (IDCARGO, TITULO, CBO, CODGRPFUNC, IDFAIXASALARIAL, DESCRICAO)'
      'values'
      
        '  (:IDCARGO, :TITULO, :CBO, :CODGRPFUNC, :IDFAIXASALARIAL, :DESC' +
        'RICAO)')
    DeleteSQL.Strings = (
      'delete from CARGO'
      'where'
      '  IDCARGO = :OLD_IDCARGO')
    Left = 242
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Cargos'
    Colunas.Strings = (
      'CARGO.IDCARGO'
      'CARGO.TITULO'
      'CBO.IDCBO')
    TipodeDado.Strings = (
      'N'
      'C'
      'N')
    Descricao.Strings = (
      'Código'
      'Título'
      'Cód. CBO')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CBO'
      'CARGO')
    CamposChave.Strings = (
      'CARGO.IDCARGO')
    Filtro.Strings = (
      'CARGO.CBO = CBO.IDCBO(+)')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '40'
      '10')
    ExibePergunta = False
    Left = 341
    Top = 1
  end
  inherited ds: TwwDataSource
    Left = 298
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 531
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 411
    Top = 1
  end
  object qryCBO: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      ' IDCBO, DESCRICAO'
      'FROM'
      '  CBO'
      'ORDER BY'
      '  UPPER(DESCRICAO)')
    ValidateWithMask = True
    Left = 245
    Top = 248
  end
  object qryFaixa: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDFAIXASALARIAL,DATAEFETIV,'
      '  STEP1,STEP2,STEP3,STEP4,STEP5,STEP6,STEP7,STEP8,STEP9'
      'FROM'
      '  FAIXASAL'
      'ORDER BY'
      '  IDFAIXASALARIAL')
    ValidateWithMask = True
    Left = 288
    Top = 247
  end
  object qryGrupoFunc: TwwQuery
    Active = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select DESCGRPFUNC, CODGRPFUNC from GRUPFUNC '
      'order by DESCGRPFUNC')
    ValidateWithMask = True
    Left = 347
    Top = 247
  end
end
