object FrmTestesRegra: TFrmTestesRegra
  Left = 51
  Top = 28
  Width = 698
  Height = 518
  Caption = 'Testes do Regra '
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 690
    Height = 389
    Align = alClient
    Caption = 'Panel1'
    TabOrder = 0
    object Label1: TLabel
      Left = 7
      Top = 7
      Width = 206
      Height = 13
      Caption = 'Identificador da Regra a ser testada'
    end
    object Label2: TLabel
      Left = 7
      Top = 49
      Width = 114
      Height = 13
      Caption = 'Descrição da Regra'
    end
    object Label3: TLabel
      Left = 7
      Top = 108
      Width = 107
      Height = 20
      Caption = 'Qry da Regra'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 368
      Top = 7
      Width = 100
      Height = 13
      Caption = 'Numero de Loops'
    end
    object Label5: TLabel
      Left = 544
      Top = 8
      Width = 121
      Height = 13
      Caption = 'Regras Selecionadas'
    end
    object Bevel1: TBevel
      Left = 528
      Top = -8
      Width = 11
      Height = 139
      Shape = bsLeftLine
    end
    object BtAddLista: TSpeedButton
      Left = 115
      Top = 22
      Width = 22
      Height = 21
      Hint = 'Adicionar a lista de Regras Selecionadas'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333333333FFFFFFFFF333333000000000033333377777777773333330FFFFF
        FFF03333337F333333373333330FFFFFFFF03333337F3FF3FFF73333330F00F0
        00F03333F37F773777373330330FFFFFFFF03337FF7F3F3FF3F73339030F0800
        F0F033377F7F737737373339900FFFFFFFF03FF7777F3FF3FFF70999990F00F0
        00007777777F7737777709999990FFF0FF0377777777FF37F3730999999908F0
        F033777777777337F73309999990FFF0033377777777FFF77333099999000000
        3333777777777777333333399033333333333337773333333333333903333333
        3333333773333333333333303333333333333337333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = BtAddListaClick
    end
    object Label7: TLabel
      Left = 9
      Top = 368
      Width = 62
      Height = 13
      Caption = 'Resultado:'
    end
    object lblResultado: TLabel
      Left = 75
      Top = 365
      Width = 606
      Height = 17
      AutoSize = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object EdRegra: TEdit
      Left = 7
      Top = 21
      Width = 106
      Height = 21
      TabOrder = 0
      OnExit = EdRegraExit
      OnKeyPress = EdRegraKeyPress
    end
    object DbLkcRegra: TwwDBLookupCombo
      Left = 7
      Top = 64
      Width = 506
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOMEREGRA'#9'60'#9'Regra')
      LookupTable = QryRegra
      LookupField = 'IDREGRA'
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
      OnExit = DbLkcRegraExit
    end
    object MemoQuery: TMemo
      Left = 7
      Top = 128
      Width = 674
      Height = 233
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object EdLoops: TEdit
      Left = 368
      Top = 21
      Width = 145
      Height = 21
      TabOrder = 3
      Text = '1'
    end
    object LsBxRegra: TListBox
      Left = 544
      Top = 24
      Width = 137
      Height = 97
      ItemHeight = 13
      PopupMenu = MnLista
      TabOrder = 4
    end
    object ChkBx3C: TCheckBox
      Left = 478
      Top = 103
      Width = 34
      Height = 17
      Alignment = taLeftJustify
      Caption = '3C'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 5
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 389
    Width = 690
    Height = 102
    Align = alBottom
    TabOrder = 1
    object BtExec: TBitBtn
      Left = 614
      Top = 1
      Width = 71
      Height = 49
      Caption = 'Executar'
      Default = True
      TabOrder = 0
      OnClick = BtExecClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333303
        333333333333337FF3333333333333903333333333333377FF33333333333399
        03333FFFFFFFFF777FF3000000999999903377777777777777FF0FFFF0999999
        99037F3337777777777F0FFFF099999999907F3FF777777777770F00F0999999
        99037F773777777777730FFFF099999990337F3FF777777777330F00FFFFF099
        03337F773333377773330FFFFFFFF09033337F3FF3FFF77733330F00F0000003
        33337F773777777333330FFFF0FF033333337F3FF7F3733333330F08F0F03333
        33337F7737F7333333330FFFF003333333337FFFF77333333333000000333333
        3333777777333333333333333333333333333333333333333333}
      Layout = blGlyphTop
      NumGlyphs = 2
    end
    object BtSair: TBitBtn
      Left = 614
      Top = 51
      Width = 71
      Height = 49
      Cancel = True
      Caption = 'Sair'
      TabOrder = 1
      OnClick = BtSairClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333333333333333333333333333333333333333333333333FF333333333333
        3000333333FFFFF3F77733333000003000B033333777773777F733330BFBFB00
        E00033337FFF3377F7773333000FBFB0E000333377733337F7773330FBFBFBF0
        E00033F7FFFF3337F7773000000FBFB0E000377777733337F7770BFBFBFBFBF0
        E00073FFFFFFFF37F777300000000FB0E000377777777337F7773333330BFB00
        000033333373FF77777733333330003333333333333777333333333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      Layout = blGlyphTop
      NumGlyphs = 2
    end
    object grpMemoria: TGroupBox
      Left = 6
      Top = 3
      Width = 377
      Height = 92
      Caption = 'Memória'
      TabOrder = 2
      object Label6: TLabel
        Left = 7
        Top = 12
        Width = 326
        Height = 13
        Caption = 'Atenção, Memórias incluem espaço de cache de disco !!!'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object PnlTotalMem: TPanel
        Left = 7
        Top = 32
        Width = 198
        Height = 25
        BevelOuter = bvNone
        BorderStyle = bsSingle
        TabOrder = 0
      end
      object PnlMem: TPanel
        Left = 7
        Top = 59
        Width = 198
        Height = 25
        BevelOuter = bvNone
        BorderStyle = bsSingle
        TabOrder = 1
      end
      object PnlInicio: TPanel
        Left = 223
        Top = 32
        Width = 145
        Height = 25
        BevelOuter = bvNone
        BorderStyle = bsSingle
        TabOrder = 2
      end
      object PnlFim: TPanel
        Left = 223
        Top = 59
        Width = 145
        Height = 25
        BevelOuter = bvNone
        BorderStyle = bsSingle
        TabOrder = 3
      end
    end
    object grpTempo: TGroupBox
      Left = 396
      Top = 3
      Width = 196
      Height = 92
      Caption = 'Tempo'
      TabOrder = 3
      object pnlInicioHora: TPanel
        Left = 7
        Top = 32
        Width = 182
        Height = 25
        BevelOuter = bvNone
        BorderStyle = bsSingle
        TabOrder = 0
      end
      object pnlFimHora: TPanel
        Left = 7
        Top = 59
        Width = 182
        Height = 25
        BevelOuter = bvNone
        BorderStyle = bsSingle
        TabOrder = 1
      end
    end
  end
  object QryRegra: TwwQuery
    CachedUpdates = True
    AfterScroll = QryRegraAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  R.IDREGRA, R.NOMEREGRA, R.IDTIPOREGRA, T.SQLREGRA'
      'FROM '
      '  REGRA R, TIPOREGRA T'
      'WHERE'
      '  R.IDTIPOREGRA = T.IDTIPOREGRA'
      'ORDER BY'
      '  NOMEREGRA')
    UpdateObject = UpdRegra
    ValidateWithMask = True
    Left = 139
    Top = 36
  end
  object DsRegra: TwwDataSource
    DataSet = QryRegra
    Left = 172
    Top = 36
  end
  object QryExecute: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 312
    Top = 36
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 380
    Top = 35
  end
  object MnLista: TPopupMenu
    Left = 456
    Top = 32
    object Excluir1: TMenuItem
      Caption = 'Excluir'
      OnClick = Excluir1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object LimparTodas1: TMenuItem
      Caption = 'Limpar Todas'
      OnClick = LimparTodas1Click
    end
  end
  object QryAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  *'
      'FROM '
      '  DUAL ')
    ValidateWithMask = True
    Left = 344
    Top = 36
  end
  object UpdRegra: TUpdateSQL
    ModifySQL.Strings = (
      'update REGRA'
      'set'
      '  IDREGRA = :IDREGRA,'
      '  NOMEREGRA = :NOMEREGRA,'
      '  IDTIPOREGRA = :IDTIPOREGRA'
      'where'
      '  IDREGRA = :OLD_IDREGRA')
    InsertSQL.Strings = (
      'insert into REGRA'
      '  (IDREGRA, NOMEREGRA, IDTIPOREGRA)'
      'values'
      '  (:IDREGRA, :NOMEREGRA, :IDTIPOREGRA)')
    DeleteSQL.Strings = (
      'delete from REGRA'
      'where'
      '  IDREGRA = :OLD_IDREGRA')
    Left = 208
    Top = 34
  end
  object cdsRegra: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 280
    Top = 37
  end
end
