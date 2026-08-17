inherited frmCadCargo: TfrmCadCargo
  Left = 113
  Top = 176
  Caption = 'Tabela de Cargos'
  ClientHeight = 330
  ClientWidth = 594
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 594
    Height = 244
    BorderWidth = 2
    object Label1: TLabel
      Left = 9
      Top = 15
      Width = 95
      Height = 13
      Caption = 'Código do Cargo'
      FocusControl = dbedCodigo
    end
    object Label2: TLabel
      Left = 9
      Top = 42
      Width = 90
      Height = 13
      Caption = 'Título do Cargo'
      FocusControl = dbedTitulo
    end
    object Label4: TLabel
      Left = 9
      Top = 72
      Width = 26
      Height = 13
      Caption = 'CBO'
    end
    object Label3: TLabel
      Left = 9
      Top = 99
      Width = 113
      Height = 13
      Caption = 'Descrição do Cargo'
      FocusControl = DBMemo1
    end
    object Label7: TLabel
      Left = 418
      Top = 15
      Width = 80
      Height = 13
      AutoSize = False
      Caption = 'Faixa Salarial'
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
      Top = 69
      Width = 67
      Height = 21
      DataField = 'CBO'
      DataSource = ds
      MaxLength = 5
      TabOrder = 2
    end
    object dblcCBO: TwwDBLookupCombo
      Left = 117
      Top = 69
      Width = 467
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'80'#9'DESCRICAO')
      DataField = 'CBO'
      DataSource = ds
      LookupTable = qryCBO
      LookupField = 'IDCBO'
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      OnChange = dblcCBOChange
    end
    object DBMemo1: TDBMemo
      Left = 9
      Top = 114
      Width = 575
      Height = 112
      DataField = 'DESCRICAO'
      DataSource = ds
      ScrollBars = ssVertical
      TabOrder = 4
    end
    object dblcFaixa: TwwDBLookupCombo
      Left = 499
      Top = 12
      Width = 85
      Height = 21
      DropDownAlignment = taRightJustify
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
  end
  inherited Dock972: TDock97
    Width = 594
  end
  inherited Dock971: TDock97
    Top = 291
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
      '  C.IDCARGO, C.TITULO, C.IDFAIXASALARIAL, C.CBO,'
      '  UPPER(CBO.DESCRICAO) AS NOMECBO,'
      '  C.DESCRICAO, C.CODGRPFUNC, C.CODGRPTREIN'
      'FROM'
      '  CARGO C, CBO'
      'WHERE'
      '  (C.CBO = CBO.IDCBO(+))'
      'ORDER BY'
      '  C.TITULO')
    Left = 270
    Top = 1
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 555
    Top = 1
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update CARGO'
      'set'
      '  IDCARGO = :IDCARGO,'
      '  TITULO = :TITULO,'
      '  IDFAIXASALARIAL = :IDFAIXASALARIAL,'
      '  CBO = :CBO,'
      '  DESCRICAO = :DESCRICAO,'
      '  CODGRPFUNC = :CODGRPFUNC,'
      '  CODGRPTREIN = :CODGRPTREIN'
      'where'
      '  IDCARGO = :OLD_IDCARGO')
    InsertSQL.Strings = (
      'insert into CARGO'
      
        '  (IDCARGO, TITULO, IDFAIXASALARIAL, CBO, DESCRICAO, CODGRPFUNC,' +
        ' CODGRPTREIN)'
      'values'
      
        '  (:IDCARGO, :TITULO, :IDFAIXASALARIAL, :CBO, :DESCRICAO, :CODGR' +
        'PFUNC, '
      '   :CODGRPTREIN)')
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
    Left = 429
    Top = 1
  end
  inherited ds: TwwDataSource
    Left = 298
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 496
    Top = 1
  end
  object qryCBO: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select * from CBO order by DESCRICAO')
    ValidateWithMask = True
    Left = 377
    Top = 1
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
    Left = 336
    Top = 1
  end
end
