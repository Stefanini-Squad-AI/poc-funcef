inherited frmRetINSSOutros: TfrmRetINSSOutros
  Left = 350
  Top = 242
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Retenção de INSS em outras empresas'
  ClientHeight = 197
  ClientWidth = 368
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 368
    Height = 158
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 337
      Height = 33
      AutoSize = False
      Caption = 
        'Informe o valor de INSS retido para o forcecedor em outras empre' +
        'sas neste mês.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    object Label2: TLabel
      Left = 16
      Top = 56
      Width = 65
      Height = 13
      Caption = 'Fornecedor'
    end
    object Label3: TLabel
      Left = 16
      Top = 104
      Width = 24
      Height = 13
      Caption = 'Mês'
    end
    object Label4: TLabel
      Left = 200
      Top = 104
      Width = 66
      Height = 13
      Caption = 'Valor retido'
    end
    object edtFornecedor: TEdit
      Left = 16
      Top = 72
      Width = 337
      Height = 21
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      Text = 'edtFornecedor'
    end
    object edtMes: TEdit
      Left = 16
      Top = 120
      Width = 150
      Height = 21
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
      Text = 'edtMes'
    end
    object edtValor: TDBRealEdit
      Left = 200
      Top = 120
      Width = 150
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '0,00')
      TabOrder = 0
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
    end
  end
  inherited Dock971: TDock97
    Top = 158
    Width = 368
    inherited tb97Fundo: TToolbar97
      Left = 198
      Visible = False
      inherited sep1: TToolbarSep97
        Visible = False
      end
      inherited sep3: TToolbarSep97
        Visible = False
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Visible = False
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 31
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 283
    Top = 43
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
end
