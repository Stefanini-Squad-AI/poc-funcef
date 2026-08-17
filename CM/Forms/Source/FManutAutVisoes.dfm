inherited FrmManutAutVisoes: TFrmManutAutVisoes
  Left = 369
  Top = 164
  BorderStyle = bsDialog
  Caption = 'Manutenção das Autorizações das Visões'
  ClientHeight = 332
  ClientWidth = 552
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 552
    Height = 293
    object Label3: TLabel
      Left = 16
      Top = 56
      Width = 77
      Height = 13
      Caption = 'Selecionados'
    end
    object Label4: TLabel
      Left = 296
      Top = 56
      Width = 104
      Height = 13
      Caption = 'Não Selecionados'
    end
    object BtnAdd: TSpeedButton
      Left = 264
      Top = 99
      Width = 25
      Height = 25
      Caption = '<'
      OnClick = BtnAddClick
    end
    object BtnAddAll: TSpeedButton
      Left = 264
      Top = 131
      Width = 25
      Height = 25
      Caption = '<<'
      OnClick = BtnAddAllClick
    end
    object BtnDel: TSpeedButton
      Left = 264
      Top = 163
      Width = 25
      Height = 25
      Caption = '>'
      OnClick = BtnDelClick
    end
    object BtnDelAll: TSpeedButton
      Left = 264
      Top = 195
      Width = 25
      Height = 25
      Caption = '>>'
      OnClick = BtnDelAllClick
    end
    object Label1: TLabel
      Left = 16
      Top = 12
      Width = 33
      Height = 13
      Caption = 'Nome'
    end
    object LstTabSelec: TListView
      Left = 16
      Top = 72
      Width = 241
      Height = 204
      Columns = <
        item
          Caption = 'Nome'
          Width = 220
        end>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Items.Data = {
        290000000100000000000000FFFFFFFFFFFFFFFF00000000000000000C546573
        746520546162656C61}
      MultiSelect = True
      ReadOnly = True
      RowSelect = True
      ParentFont = False
      TabOrder = 0
      ViewStyle = vsReport
      OnDblClick = BtnDelClick
    end
    object LstTabNaoSelec: TListView
      Left = 296
      Top = 72
      Width = 241
      Height = 205
      Columns = <
        item
          Caption = 'Nome'
          Width = 220
        end>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Items.Data = {
        290000000100000000000000FFFFFFFFFFFFFFFF00000000000000000C546573
        746520546162656C61}
      MultiSelect = True
      ReadOnly = True
      RowSelect = True
      ParentFont = False
      TabOrder = 1
      ViewStyle = vsReport
      OnDblClick = BtnAddClick
    end
    object EdNome: TEdit
      Left = 16
      Top = 28
      Width = 521
      Height = 21
      ReadOnly = True
      TabOrder = 2
    end
  end
  inherited Dock971: TDock97
    Top = 293
    Width = 552
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 491
    Top = 171
    TargetsData = (
      1
      1
      (
        ''
        'Items'
        0))
  end
end
