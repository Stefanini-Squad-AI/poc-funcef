inherited FrmManutAutCons: TFrmManutAutCons
  Top = 117
  BorderStyle = bsDialog
  Caption = 'Manutenção das Autorizações de Consulta'
  ClientHeight = 368
  ClientWidth = 551
  FormStyle = fsNormal
  Visible = False
  OnDblClick = bbtnSairClick
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 551
    Height = 329
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
    object Label1: TLabel
      Left = 16
      Top = 12
      Width = 33
      Height = 13
      Caption = 'Nome'
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
    object BtnDireitos: TBitBtn
      Left = 16
      Top = 284
      Width = 85
      Height = 30
      Caption = '&Colunas'
      TabOrder = 2
      OnClick = BtnDireitosClick
      Glyph.Data = {
        B6010000424DB601000000000000760000002800000022000000100000000100
        0400000000004001000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777777777777777777000000777777777777777777777777777777777700
        0000777777777777777777777777777777777700000077777777777778877777
        7777777777FF7700000077788877777700887777FFF777777887F70000007700
        088777707B088778887F777787787F00000070B7B0888807B7B087877787FFF8
        F7778F0000003F7B7B000003737088F7F77888887777870000003F0FB7B7B7B7
        B7B738F8FF7777777777780000003F007BFFFFFFFFFF38F88777FFFFFFFFF800
        00003FB7BF3333333333787F7778888888888700000073FFF377777777777787
        FF87777777777700000077333777777777777778887777777777770000007777
        7777777777777777777777777777770000007777777777777777777777777777
        7777770000007777777777777777777777777777777777000000}
      NumGlyphs = 2
    end
    object EdNome: TEdit
      Left = 16
      Top = 28
      Width = 521
      Height = 21
      ReadOnly = True
      TabOrder = 3
    end
  end
  inherited Dock971: TDock97
    Top = 329
    Width = 551
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 327
    Top = 231
    TargetsData = (
      1
      1
      (
        ''
        'Items'
        0))
  end
end
