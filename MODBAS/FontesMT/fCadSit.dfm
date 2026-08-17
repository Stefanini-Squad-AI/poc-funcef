inherited frmCadSit: TfrmCadSit
  Left = 187
  Top = 185
  Caption = 'Cadastro de Situações Funcionais'
  ClientHeight = 246
  ClientWidth = 437
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 437
    Height = 160
    BorderWidth = 2
    object Label5: TLabel
      Left = 18
      Top = 14
      Width = 40
      Height = 13
      Caption = 'Código'
      FocusControl = dbedCodigo
    end
    object Label6: TLabel
      Left = 122
      Top = 14
      Width = 58
      Height = 13
      Caption = 'Descrição'
      FocusControl = dbedDescr
    end
    object Bevel1: TBevel
      Left = 271
      Top = 60
      Width = 149
      Height = 84
    end
    object Label8: TLabel
      Left = 276
      Top = 62
      Width = 86
      Height = 13
      Caption = 'Código CAGED'
      FocusControl = DBEdit3
    end
    object Label7: TLabel
      Left = 276
      Top = 103
      Width = 104
      Height = 13
      Caption = 'Código Mov.FGTS'
      FocusControl = DBEdit4
    end
    object dbedCodigo: TDBEdit
      Left = 18
      Top = 29
      Width = 95
      Height = 21
      DataField = 'IDSITFUNC'
      DataSource = ds
      TabOrder = 0
    end
    object dbedDescr: TDBEdit
      Left = 122
      Top = 29
      Width = 298
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = ds
      TabOrder = 1
    end
    object dbrgTipoSit: TDBRadioGroup
      Left = 18
      Top = 55
      Width = 239
      Height = 89
      Caption = 'Tipo'
      DataField = 'TIPOSIT'
      DataSource = ds
      Items.Strings = (
        'Ativo(a)'
        'Afastado(a)'
        'Demitido(a)')
      TabOrder = 2
      Values.Strings = (
        'A'
        'F'
        'D')
    end
    object DBEdit3: TDBEdit
      Left = 276
      Top = 78
      Width = 64
      Height = 21
      DataField = 'CODCAGED'
      DataSource = ds
      TabOrder = 3
    end
    object DBEdit4: TDBEdit
      Left = 276
      Top = 118
      Width = 64
      Height = 21
      DataField = 'CODMOVFGTS'
      DataSource = ds
      TabOrder = 4
    end
  end
  inherited Dock972: TDock97
    Width = 437
  end
  inherited Dock971: TDock97
    Top = 207
    Width = 437
    inherited tb97Fundo: TToolbar97
      Left = 267
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 100
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 385
    Top = 14
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 270
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 385
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 318
    Top = 14
  end
  inherited Cds: TCMClientDataSet
    Left = 242
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Situação Funcional'
    Colunas.Strings = (
      'SITFUNC.IDSITFUNC'
      'SITFUNC.DESCRICAO')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'SITFUNC')
    CamposChave.Strings = (
      'SITFUNC.IDSITFUNC')
    Filtro.Strings = (
      'FLGUSO IN ('#39'G'#39','#39'R'#39')')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '17'
      '65')
    ExibePergunta = False
    Left = 318
    Top = 1
  end
end
