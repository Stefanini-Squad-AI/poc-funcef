inherited frmExecRecalculoCarteira: TfrmExecRecalculoCarteira
  Left = 479
  Top = 388
  BorderStyle = bsSingle
  Caption = 'Recálculo dos Saldos das Carteiras de Investimento'
  ClientHeight = 113
  ClientWidth = 389
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 389
    Height = 80
    object Label13: TLabel
      Left = 16
      Top = 12
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
      Top = 52
      Width = 297
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
      Top = 12
      Width = 297
      Height = 13
      AutoSize = False
      Caption = ':  Este procedimento recalculará TODOS os saldos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 80
      Top = 28
      Width = 297
      Height = 13
      AutoSize = False
      Caption = '   da(s) carteira(s) de investimentos imobiliários.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  inherited Dock971: TDock97
    Top = 80
    Width = 389
    inherited tb97Fundo: TToolbar97
      Left = 217
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 44
      DockPos = 44
      inherited ToolbarSep971: TToolbarSep97
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
  inherited ivTradutor: TIvExtendedTranslator
    Left = 65499
    Top = 65491
  end
  object qryMarcaTodos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   HISTCARTINV'
      'SET'
      '   FLGCALCSALDO = '#39'1'#39
      'WHERE'
      '   IDMODULO = 64')
    ValidateWithMask = True
    Left = 29
    Top = 29
  end
end
