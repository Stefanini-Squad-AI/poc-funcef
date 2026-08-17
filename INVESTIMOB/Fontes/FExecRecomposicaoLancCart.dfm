inherited frmRecomposicaoLancCart: TfrmRecomposicaoLancCart
  Left = 313
  Top = 209
  Caption = 
    'Recomposição dos Movimentos das Carteiras de Investimento - Movi' +
    'mentações do Ativo Fixo'
  ClientHeight = 228
  ClientWidth = 624
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 624
    Height = 146
    object Label13: TLabel
      Left = 16
      Top = 20
      Width = 59
      Height = 13
      AutoSize = False
      Caption = 'ATENÇÃO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
    end
    object Label14: TLabel
      Left = 80
      Top = 116
      Width = 529
      Height = 13
      AutoSize = False
      Caption = '   O processamento pode ser bastante demorado.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 80
      Top = 20
      Width = 529
      Height = 13
      AutoSize = False
      Caption = ':  Este procedimento consiste em:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 80
      Top = 60
      Width = 529
      Height = 13
      AutoSize = False
      Caption = 
        '       de Receitas e Despesas originados pelo módulo Administraç' +
        'ão Imobiliária;'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 80
      Top = 44
      Width = 529
      Height = 13
      AutoSize = False
      Caption = 
        '   1) Excluir das Carteiras de Investimento TODOS os movimentos ' +
        'referentes a Lançamentos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 80
      Top = 84
      Width = 529
      Height = 13
      AutoSize = False
      Caption = 
        '   2) Refazer esses movimentos nas Carteiras, o que implicará no' +
        ' recálculo dos seus saldos.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  inherited Dock971: TDock97
    Top = 195
    Width = 624
    inherited tb97Fundo: TToolbar97
      Left = 382
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  object Panel2: TPanel [2]
    Left = 0
    Top = 146
    Width = 624
    Height = 49
    Align = alBottom
    TabOrder = 2
    object lblProgress: TLabel
      Left = 16
      Top = 10
      Width = 140
      Height = 13
      Caption = 'Gerando Lançamentos...'
      Visible = False
    end
    object lblContador: TLabel
      Left = 516
      Top = 10
      Width = 93
      Height = 13
      Alignment = taRightJustify
      Caption = '00000 de 00000'
      Visible = False
    end
    object ProgressBar: TProgressBar
      Left = 16
      Top = 24
      Width = 593
      Height = 16
      Min = 0
      Max = 100
      Step = 1
      TabOrder = 0
      Visible = False
    end
  end
end
