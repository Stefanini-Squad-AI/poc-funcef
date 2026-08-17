inherited frmCadCurso: TfrmCadCurso
  Left = 134
  Top = 176
  Caption = 'Tabela de Cursos'
  ClientHeight = 344
  ClientWidth = 612
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 612
    Height = 258
    object Label1: TLabel
      Left = 30
      Top = 9
      Width = 94
      Height = 13
      Caption = 'Código do Curso'
      FocusControl = dbedCodCurso
    end
    object Label6: TLabel
      Left = 127
      Top = 9
      Width = 89
      Height = 13
      Caption = 'Título do Curso'
      FocusControl = dbedDescricao
    end
    object Label7: TLabel
      Left = 486
      Top = 9
      Width = 94
      Height = 13
      Caption = 'Nome Abreviado'
      FocusControl = dbedAbrev
    end
    object Label2: TLabel
      Left = 30
      Top = 48
      Width = 80
      Height = 13
      Caption = 'Tipo de Curso'
    end
    object Label4: TLabel
      Left = 303
      Top = 48
      Width = 127
      Height = 13
      Caption = 'Grupo de Treinamento'
    end
    object Label5: TLabel
      Left = 30
      Top = 87
      Width = 41
      Height = 13
      Caption = 'Pacote'
    end
    object Label8: TLabel
      Left = 30
      Top = 126
      Width = 158
      Height = 13
      Caption = 'Empresa/Entidade/Instrutor'
    end
    object Label9: TLabel
      Left = 303
      Top = 90
      Width = 84
      Height = 13
      Caption = 'Valor do Curso'
      FocusControl = dbedValor
    end
    object Label10: TLabel
      Left = 402
      Top = 89
      Width = 84
      Height = 13
      Caption = 'Horas Práticas'
      FocusControl = dbedDurPrat
    end
    object Label11: TLabel
      Left = 495
      Top = 89
      Width = 87
      Height = 13
      Caption = 'Horas Teóricas'
      FocusControl = dbedDurTeor
    end
    object Label25: TLabel
      Left = 30
      Top = 214
      Width = 73
      Height = 13
      Caption = 'Nota Mínima'
      FocusControl = dbedAvaliacao
    end
    object Label27: TLabel
      Left = 168
      Top = 213
      Width = 73
      Height = 13
      Caption = 'Nota Mínima'
      FocusControl = dbedAvalPrat
    end
    object Label3: TLabel
      Left = 303
      Top = 129
      Width = 75
      Height = 13
      Caption = 'Observações'
      FocusControl = dbedValor
    end
    object dbedCodCurso: TDBEdit
      Left = 30
      Top = 24
      Width = 91
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'IDCURSO'
      DataSource = ds
      ReadOnly = True
      TabOrder = 0
    end
    object dbedDescricao: TDBEdit
      Left = 127
      Top = 24
      Width = 354
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = ds
      TabOrder = 1
    end
    object dbedAbrev: TDBEdit
      Left = 486
      Top = 24
      Width = 94
      Height = 21
      DataField = 'ABREV'
      DataSource = ds
      TabOrder = 2
    end
    object dblcTipCurso: TwwDBLookupCombo
      Left = 30
      Top = 63
      Width = 262
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'30'#9'DESCRICAO')
      DataField = 'IDTIPOCURSO'
      DataSource = ds
      LookupTable = qryTipCurso
      LookupField = 'IDTIPOCURSO'
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      AllowClearKey = True
    end
    object wwDBLookupCombo1: TwwDBLookupCombo
      Left = 303
      Top = 63
      Width = 277
      Height = 21
      DropDownAlignment = taRightJustify
      Selected.Strings = (
        'DESCGRPTREIN'#9'40'#9'DESCGRPTREIN')
      DataField = 'CODGRPTREIN'
      DataSource = ds
      LookupTable = qryGrupoTr
      LookupField = 'CODGRPTREIN'
      TabOrder = 4
      AutoDropDown = True
      ShowButton = True
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      AllowClearKey = True
    end
    object dblcPacote: TwwDBLookupCombo
      Left = 30
      Top = 102
      Width = 262
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'30'#9'DESCRICAO')
      DataField = 'IDPACOTE'
      DataSource = ds
      LookupTable = qryPacote
      LookupField = 'IDPACOTE'
      TabOrder = 5
      AutoDropDown = True
      ShowButton = True
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      AllowClearKey = True
    end
    object dblcEntid: TwwDBLookupCombo
      Left = 30
      Top = 141
      Width = 262
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'60'#9'NOME')
      DataField = 'IDENTIDINSTR'
      DataSource = ds
      LookupTable = qryEntid
      LookupField = 'IDPESSOA'
      TabOrder = 9
      AutoDropDown = True
      ShowButton = True
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      AllowClearKey = True
    end
    object dbedValor: TDBEdit
      Left = 303
      Top = 105
      Width = 84
      Height = 21
      DataField = 'VALOR'
      DataSource = ds
      TabOrder = 6
    end
    object dbedDurPrat: TDBEdit
      Left = 399
      Top = 105
      Width = 84
      Height = 21
      DataField = 'DUR_PRAT'
      DataSource = ds
      TabOrder = 7
    end
    object dbedDurTeor: TDBEdit
      Left = 495
      Top = 104
      Width = 84
      Height = 21
      DataField = 'DUR_TEOR'
      DataSource = ds
      TabOrder = 8
    end
    object dbrgAvaTeor: TDBRadioGroup
      Left = 30
      Top = 165
      Width = 127
      Height = 49
      Caption = 'Avaliação Teórica ?'
      DataField = 'TEMAVAL'
      DataSource = ds
      Items.Strings = (
        'Sim'
        'Não')
      TabOrder = 10
      Values.Strings = (
        '1'
        '0')
    end
    object dbedAvaliacao: TDBEdit
      Left = 30
      Top = 226
      Width = 73
      Height = 21
      DataField = 'AVALIACAO'
      DataSource = ds
      TabOrder = 11
    end
    object dbrgAvaPrat: TDBRadioGroup
      Left = 168
      Top = 165
      Width = 124
      Height = 49
      Caption = 'Avaliação Prática ?'
      DataField = 'TEMAVPR'
      DataSource = ds
      Items.Strings = (
        'Sim'
        'Não')
      TabOrder = 12
      Values.Strings = (
        '1'
        '0')
    end
    object dbedAvalPrat: TDBEdit
      Left = 168
      Top = 226
      Width = 73
      Height = 21
      DataField = 'AVALPRAT'
      DataSource = ds
      TabOrder = 13
    end
    object dbedObserv: TDBMemo
      Left = 303
      Top = 141
      Width = 295
      Height = 109
      DataField = 'OBSERVACAO'
      DataSource = ds
      ScrollBars = ssVertical
      TabOrder = 14
    end
  end
  inherited Dock972: TDock97
    Width = 612
  end
  inherited Dock971: TDock97
    Top = 305
    Width = 612
    inherited tb97Fundo: TToolbar97
      Left = 358
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
    inherited dbnav: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited ds: TwwDataSource
    DataSet = tblCurso
    Left = 315
    Top = 2
  end
  inherited srchdlgProcura: TwwSearchDialog
    Left = 153
    Top = 307
  end
  inherited seldlgProcuraQry: TcmSelectDlg
    Left = 264
    Top = 306
  end
  object tblCurso: TwwTable
    AfterInsert = tblCursoAfterInsert
    BeforePost = tblCursoBeforePost
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDCURSO'
    TableName = 'CM.CURSO'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 354
    Top = 3
  end
  object qryGrupoTr: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select CODGRPTREIN, DESCGRPTREIN from GRPTREIN '
      'order by DESCGRPTREIN')
    ValidateWithMask = True
    Left = 453
    Top = 2
  end
  object qryTipCurso: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select IDTIPOCURSO, DESCRICAO from TIPCURSO'
      'order by DESCRICAO')
    ValidateWithMask = True
    Left = 513
    Top = 2
  end
  object qryPacote: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select IDPACOTE, DESCRICAO from PACOTE'
      'order by DESCRICAO')
    ValidateWithMask = True
    Left = 402
    Top = 5
  end
  object qryEntid: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select P.IDPESSOA, upper(P.NOME) as NOME '
      'from PESSOA P, FUNCIONARIO F'
      'where P.IDPESSOA = F.IDPESSOA '
      'Union'
      'Select P.IDPESSOA, upper(P.NOME) as NOME '
      'from PESSOA P, TERCEIRO T'
      'where P.IDPESSOA = T.IDPESSOA'
      'Order By 2')
    ValidateWithMask = True
    Left = 564
    Top = 8
  end
  object MontaSelectCurso: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona o Curso'
    Colunas.Strings = (
      'DESCRICAO'
      'IDCURSO'
      'ABREV')
    TipodeDado.Strings = (
      'C'
      'N'
      'C')
    Descricao.Strings = (
      'Título'
      'Código'
      'Nome Abreviado')
    Tabelas.Strings = (
      'CURSO')
    CamposChave.Strings = (
      'IDCURSO')
    Larguras.Strings = (
      '60'
      '15'
      '20')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 264
    Top = 9
  end
end
