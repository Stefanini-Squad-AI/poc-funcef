inherited frmCadContaContabilBaseCalc: TfrmCadContaContabilBaseCalc
  Left = 374
  Top = 213
  ActiveControl = rgBaseCalculo
  Caption = 'Composição de Base de Cálculo'
  ClientHeight = 364
  ClientWidth = 358
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 358
    Height = 325
    object lblCodAjuste: TLabel
      Left = 13
      Top = 70
      Width = 97
      Height = 13
      Caption = 'Código do Ajuste'
    end
    object lblDescrAjuste: TLabel
      Left = 11
      Top = 157
      Width = 132
      Height = 13
      Caption = 'Identificação do Ajuste'
    end
    object lblNumProcesso: TLabel
      Left = 11
      Top = 113
      Width = 177
      Height = 13
      Caption = 'Número do Processo vinculado'
    end
    object lblInfo: TLabel
      Left = 11
      Top = 202
      Width = 166
      Height = 13
      Caption = 'Informações Complementares'
    end
    object rgBaseCalculo: TRadioGroup
      Left = 11
      Top = 7
      Width = 337
      Height = 54
      Caption = 'Conta Contábil compõe Base de Cálculo:'
      Columns = 2
      Items.Strings = (
        'Normal'
        'Ajustada')
      TabOrder = 0
    end
    object mmoInfo: TMemo
      Left = 11
      Top = 219
      Width = 337
      Height = 89
      Lines.Strings = (
        '')
      TabOrder = 4
    end
    object edtIdentAjuste: TEdit
      Left = 11
      Top = 174
      Width = 337
      Height = 21
      TabOrder = 3
    end
    object edtNumProcAjuste: TEdit
      Left = 11
      Top = 129
      Width = 337
      Height = 21
      TabOrder = 2
    end
    object cbbCodAjuste: TComboBox
      Left = 11
      Top = 86
      Width = 337
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
      Items.Strings = (
        
          '01 - Vendas canceladas de receitas tributadas em períodos anteri' +
          'ores'
        '02 - Devoluções de vendas tributadas em períodos anteriores'
        '21 - ICMS a recolher sobre Operações próprias'
        '41 - Outros valores a excluir, vinculados a decisão judicial'
        '42 - Outros valores a excluir, não vinculados a decisão judicial')
    end
  end
  inherited Dock971: TDock97
    Top = 325
    Width = 358
    inherited tb97Fundo: TToolbar97
      Left = 186
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 17
      inherited bbtnConfirmar: TBitBtn
        ModalResult = 0
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
end
