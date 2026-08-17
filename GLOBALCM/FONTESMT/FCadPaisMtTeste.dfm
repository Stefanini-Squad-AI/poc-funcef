inherited FrmCadPaisMtTeste: TFrmCadPaisMtTeste
  Left = 131
  Top = 173
  Caption = 'Teste cadastro de país'
  ClientHeight = 360
  ClientWidth = 545
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 545
    Height = 274
    object Label1: TLabel
      Left = 24
      Top = 16
      Width = 65
      Height = 13
      Caption = 'NOMEPAIS'
      FocusControl = DBEdit1
    end
    object Label2: TLabel
      Left = 24
      Top = 56
      Width = 137
      Height = 13
      Caption = 'NOMENACIONALIDADE'
      FocusControl = DBEdit2
    end
    object Label3: TLabel
      Left = 24
      Top = 96
      Width = 136
      Height = 13
      Caption = 'CODRECEITAFEDERAL'
      FocusControl = DBEdit3
    end
    object Label4: TLabel
      Left = 24
      Top = 136
      Width = 127
      Height = 13
      Caption = 'CODINTERNACIONAL'
      FocusControl = DBEdit4
    end
    object Label5: TLabel
      Left = 24
      Top = 176
      Width = 116
      Height = 13
      Caption = 'MASCARACPOSTAL'
      FocusControl = DBEdit5
    end
    object Label6: TLabel
      Left = 24
      Top = 216
      Width = 74
      Height = 13
      Caption = 'CODREGIAO'
      FocusControl = DBEdit6
    end
    object DBEdit1: TDBEdit
      Left = 24
      Top = 32
      Width = 214
      Height = 21
      DataField = 'NOMEPAIS'
      DataSource = ds
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 24
      Top = 72
      Width = 214
      Height = 21
      DataField = 'NOMENACIONALIDADE'
      DataSource = ds
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 24
      Top = 112
      Width = 74
      Height = 21
      DataField = 'CODRECEITAFEDERAL'
      DataSource = ds
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 24
      Top = 152
      Width = 25
      Height = 21
      DataField = 'CODINTERNACIONAL'
      DataSource = ds
      TabOrder = 3
    end
    object DBEdit5: TDBEdit
      Left = 24
      Top = 192
      Width = 144
      Height = 21
      DataField = 'MASCARACPOSTAL'
      DataSource = ds
      TabOrder = 4
    end
    object DBEdit6: TDBEdit
      Left = 24
      Top = 232
      Width = 74
      Height = 21
      DataField = 'CODREGIAO'
      DataSource = ds
      TabOrder = 5
    end
  end
  inherited Dock972: TDock97
    Width = 545
  end
  inherited Dock971: TDock97
    Top = 321
    Width = 545
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyInsert
    ApplyDelete = CmeCadastroApplyInsert
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PAIS.NOMEPAIS')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Nome')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'PAIS')
    CamposChave.Strings = (
      'PAIS.IDPAIS')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '30')
  end
end
