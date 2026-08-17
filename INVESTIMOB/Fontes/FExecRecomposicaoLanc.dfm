inherited frmRecomposicaoLanc: TfrmRecomposicaoLanc
  Left = 71
  Top = 168
  Caption = 
    'Recomposição dos Movimentos das Carteiras de Investimento - Rece' +
    'itas e Despesas'
  ClientHeight = 232
  ClientWidth = 625
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 625
    Height = 150
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
    object Label5: TLabel
      Left = 96
      Top = 136
      Width = 483
      Height = 13
      Caption = 
        'Recomposição dos Movimentos das Carteiras de Investimento - Rece' +
        'itas e Despesas'
    end
    object Label6: TLabel
      Left = 424
      Top = 112
      Width = 529
      Height = 13
      Caption = 
        'Recomposição dos Movimentos das Carteiras de Investimento - Movi' +
        'mentações do Ativo Fixo'
    end
  end
  inherited Dock971: TDock97
    Top = 199
    Width = 625
    inherited tb97Fundo: TToolbar97
      Left = 382
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited ToolbarSep974: TToolbarSep97
        Visible = False
      end
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Enabled = False
        Visible = False
      end
    end
  end
  object Panel2: TPanel [2]
    Left = 0
    Top = 150
    Width = 625
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
  inherited ivTradutor: TIvExtendedTranslator
    Left = 987
    Top = 11
  end
  object qryExcluiHistCartInv: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM HISTCARTINV'
      'WHERE IDLANCIMOVEL IS NOT NULL'
      '')
    ValidateWithMask = True
    Left = 856
    Top = 24
  end
  object qryLancImovel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM HISTCARTINV'
      'WHERE IDLANCIMOVEL IS NOT NULL'
      '')
    ValidateWithMask = True
    Left = 856
    Top = 72
  end
end
