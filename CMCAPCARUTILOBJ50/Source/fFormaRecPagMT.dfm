inherited frmFormaRecPagMT: TfrmFormaRecPagMT
  Left = 308
  Top = 161
  Caption = 'Forma de Pagamento'
  ClientHeight = 269
  ClientWidth = 369
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 369
    Height = 183
    object lblFormaRecPag: TLabel
      Left = 23
      Top = 48
      Width = 58
      Height = 13
      Caption = 'Descrição'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbedFormaRecPag: TDBEdit
      Left = 20
      Top = 69
      Width = 325
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object DBCheckBox1: TDBCheckBox
      Left = 24
      Top = 109
      Width = 238
      Height = 17
      Caption = 'Forma Vinculada a Dados Bancários'
      DataField = 'FLGDADOSBANCARIOS'
      DataSource = ds
      TabOrder = 1
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
  end
  inherited Dock972: TDock97
    Width = 369
  end
  inherited Dock971: TDock97
    Top = 230
    Width = 369
    inherited tb97Fundo: TToolbar97
      Left = 197
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 28
    end
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'FORMARECPAG.DESCRICAO'
      'FORMARECPAG.RECPAG')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Descrição'
      'Rec\Pag')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'FORMARECPAG')
    CamposChave.Strings = (
      'FORMARECPAG.CODFORMA'
      'FORMARECPAG.RECPAG'
      'FORMARECPAG.IDPESSOA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '30'
      '1')
    Left = 277
    Top = 64
  end
end
