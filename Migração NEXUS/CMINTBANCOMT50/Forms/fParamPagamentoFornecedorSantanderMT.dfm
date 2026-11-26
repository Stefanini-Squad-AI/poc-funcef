inherited frmParamPagamentoFornecedorSantanderMT: TfrmParamPagamentoFornecedorSantanderMT
  Left = 500
  Top = 258
  BorderIcons = [biSystemMenu]
  Caption = ' Parâmetro para Geração do Arquivo de Pagamento...'
  ClientHeight = 214
  ClientWidth = 397
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 397
    Height = 175
    object Label1: TLabel
      Left = 16
      Top = 105
      Width = 230
      Height = 13
      Caption = 'Finalidade do DOC/ TED STR/ TED CIP'
    end
    object Label2: TLabel
      Left = 16
      Top = 120
      Width = 283
      Height = 13
      Caption = '(Informar apenas para estes Tipos de Pagamento)'
    end
    object rgTipoDocumento: TRadioGroup
      Left = 16
      Top = 11
      Width = 368
      Height = 83
      Caption = ' Tipo de Documento ( Obrigatório Para DOC ) '
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'DUP - Duplicata'
        'NF - Nota Fiscal'
        'ND - Nota de Débito'
        'NP - Nota Promissória')
      TabOrder = 0
    end
    object cbxFinalidade: TComboBox
      Left = 16
      Top = 136
      Width = 368
      Height = 21
      ItemHeight = 13
      TabOrder = 1
      Items.Strings = (
        '00 - Não Informar'
        '01 - Crédito em Conta Corrente'
        '02 - Pagamento de Aluguel / Condomínio'
        '03 - Pagamento de Duplicatas e Títulos'
        '04 - Pagamento de Dividendos'
        '05 - Pagamento de Mensalidades Escolares'
        '06 - Pagamento de Salário'
        '07 - Pagamento de Fornecedor / Honorários'
        '08 - Pagamento de Câmbio / Fundos / Bolsas'
        '09 - Repasse de Arrecadação / Pagamento de Tributos'
        '10 - Transferência Internacional em R$'
        '11 - DOC / TED para Poupança'
        '12 - DOC / TED para Depósito Judicial'
        '13 - Pensão Alimentícia'
        '14 - Restituição de Imposto de Renda'
        '99 - Outros')
    end
  end
  inherited Dock971: TDock97
    Top = 175
    Width = 397
    inherited tb97Fundo: TToolbar97
      Left = 227
      inherited bbtnSair: TBitBtn
        ModalResult = 3
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 60
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 352
  end
end
