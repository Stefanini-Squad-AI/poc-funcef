inherited FrmCadEstadoAlex: TFrmCadEstadoAlex
  Left = 308
  Top = 236
  Caption = 'FrmCadEstadoAlex'
  ClientHeight = 404
  ClientWidth = 534
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 534
    Height = 318
    object Label1: TLabel
      Left = 32
      Top = 16
      Width = 77
      Height = 13
      Caption = 'CODESTADO'
      FocusControl = DBEdit1
    end
    object Label2: TLabel
      Left = 32
      Top = 56
      Width = 87
      Height = 13
      Caption = 'NOMEESTADO'
      FocusControl = DBEdit2
    end
    object Label3: TLabel
      Left = 32
      Top = 96
      Width = 101
      Height = 13
      Caption = 'CODJURISDICAO'
      FocusControl = DBEdit3
    end
    object Label4: TLabel
      Left = 32
      Top = 136
      Width = 69
      Height = 13
      Caption = 'CODFISCAL'
      FocusControl = DBEdit4
    end
    object Label5: TLabel
      Left = 35
      Top = 192
      Width = 29
      Height = 13
      Caption = 'PAÍS'
      FocusControl = DBEdit4
    end
    object DBEdit1: TDBEdit
      Left = 32
      Top = 32
      Width = 73
      Height = 21
      DataField = 'CODESTADO'
      DataSource = ds
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 32
      Top = 72
      Width = 214
      Height = 21
      DataField = 'NOMEESTADO'
      DataSource = ds
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 32
      Top = 112
      Width = 97
      Height = 21
      DataField = 'CODJURISDICAO'
      DataSource = ds
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 32
      Top = 152
      Width = 74
      Height = 21
      DataField = 'CODFISCAL'
      DataSource = ds
      TabOrder = 3
    end
    object wwDBLookupCombo1: TwwDBLookupCombo
      Left = 32
      Top = 208
      Width = 305
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOMEPAIS'#9'30'#9'NOMEPAIS'#9'F'
        'CODRECEITAFEDERAL'#9'10'#9'CODRECEITAFEDERAL'#9'F')
      DataField = 'IDPAIS'
      DataSource = ds
      LookupTable = cdsPais
      LookupField = 'IDPAIS'
      TabOrder = 4
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
  end
  inherited Dock972: TDock97
    Width = 534
  end
  inherited Dock971: TDock97
    Top = 365
    Width = 534
    inherited tb97Fundo: TToolbar97
      Left = 362
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'E.CODESTADO'
      'E.NOMEESTADO'
      'P.NOMEPAIS')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'UF'
      'Estado'
      'Pais')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'ESTADO E'
      'PAIS P')
    CamposChave.Strings = (
      'E.IDESTADO')
    Filtro.Strings = (
      'E.IDPAIS=P.IDPAIS')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '3'
      '30'
      '30')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1')
    MultiSelect = True
    LookupSQL.Strings = (
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      '')
    Top = 112
  end
  object cdsPais: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 256
    Top = 215
  end
end
