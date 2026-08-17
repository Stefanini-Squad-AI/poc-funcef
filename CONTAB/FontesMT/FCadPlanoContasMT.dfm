inherited frmCadPlanoContasMT: TfrmCadPlanoContasMT
  Left = 202
  Top = 202
  Caption = 'Cadastro de Plano de Contas'
  ClientHeight = 224
  ClientWidth = 399
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 399
    Height = 138
    object Label1: TLabel
      Left = 24
      Top = 24
      Width = 49
      Height = 13
      Caption = 'Máscara'
    end
    object Label2: TLabel
      Left = 24
      Top = 72
      Width = 62
      Height = 13
      Caption = 'Descrição '
    end
    object dbeMascara: TwwDBEdit
      Left = 24
      Top = 40
      Width = 193
      Height = 21
      Hint = 
        'Digite a máscara. Utilize apenas '#39'9'#39' e '#39'.'#39'(ponto) . Ex.: 9.99.99' +
        '9'
      DataField = 'MASCARA'
      DataSource = ds
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnKeyPress = dbeMascaraKeyPress
    end
    object dbeNome: TwwDBEdit
      Left = 24
      Top = 88
      Width = 353
      Height = 21
      DataField = 'DESCPLANO'
      DataSource = ds
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  inherited Dock972: TDock97
    Width = 399
  end
  inherited Dock971: TDock97
    Top = 185
    Width = 399
    inherited tb97Fundo: TToolbar97
      Left = 227
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 58
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 330
  end
  inherited ds: TwwDataSource
    Left = 358
    Top = 47
  end
  inherited ImlPadrao: TImageList
    Left = 8
    Top = 191
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 352
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    Left = 252
    Top = 7
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PLANO.DESCPLANO'
      'PLANO.MASCARA')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Descrição do Plano'
      'Máscara da Conta Contábil')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'PLANO')
    CamposChave.Strings = (
      'PLANO.PLANO')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '35'
      '25')
    Left = 312
    Top = 65535
  end
end
