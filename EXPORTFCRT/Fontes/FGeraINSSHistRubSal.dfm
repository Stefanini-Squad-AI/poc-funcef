inherited frmGeraINSSHistRubSal: TfrmGeraINSSHistRubSal
  Left = 238
  Top = 138
  Caption = 'Gerar INSS no Histórico de Rubricas'
  ClientHeight = 253
  ClientWidth = 381
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 381
    Height = 214
    object Label1: TLabel
      Left = 24
      Top = 21
      Width = 245
      Height = 13
      Caption = 'Informe o Ano/Mês da Folha de Benefícios'
    end
    object Label2: TLabel
      Left = 150
      Top = 44
      Width = 147
      Height = 13
      Caption = '(aaaa/mm   Ex.: 2003/01)'
    end
    object lblProcesso: TLabel
      Left = 24
      Top = 168
      Width = 133
      Height = 13
      Caption = 'Linhas Processadas : 0'
    end
    object Label3: TLabel
      Left = 24
      Top = 61
      Width = 302
      Height = 13
      Caption = 'Informe o Código da Rubrica para Pagamento Normal'
    end
    object Label4: TLabel
      Left = 24
      Top = 101
      Width = 313
      Height = 13
      Caption = 'Informe o Código da Rubrica para Pagamento Atrasado'
    end
    object Label5: TLabel
      Left = 232
      Top = 125
      Width = 257
      Height = 13
      Caption = 'Informe o Código da Rubrica para Devolução'
      Visible = False
    end
    object edAnoMesRef: TEdit
      Left = 24
      Top = 36
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object edCodRubricaNormal: TEdit
      Left = 24
      Top = 76
      Width = 121
      Height = 21
      TabOrder = 1
      Text = '25167'
    end
    object edCodRubricaAtraso: TEdit
      Left = 24
      Top = 116
      Width = 121
      Height = 21
      TabOrder = 2
      Text = '25167'
    end
    object edCodRubricaDevolucao: TEdit
      Left = 232
      Top = 140
      Width = 121
      Height = 21
      TabOrder = 3
      Text = '25168'
      Visible = False
    end
    object PbProcesso: TProgressBar
      Left = 24
      Top = 186
      Width = 336
      Height = 16
      Min = 0
      Max = 100
      TabOrder = 4
    end
  end
  inherited Dock971: TDock97
    Top = 214
    Width = 381
    inherited tb97Fundo: TToolbar97
      Left = 211
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 44
      inherited bbtnConfirmar: TBitBtn
        Caption = '&Gerar'
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 3
    Top = 256
  end
  object qry: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 276
    Top = 156
  end
  object qryGrava: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 321
    Top = 153
  end
end
