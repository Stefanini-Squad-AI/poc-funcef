inherited frmImporta: TfrmImporta
  Left = 176
  Top = 123
  Caption = 'Importação de Arquivos'
  ClientHeight = 420
  ClientWidth = 536
  OnActivate = FormActivate
  OnShow = nil
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 536
    Height = 381
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 534
      Height = 80
      Align = alTop
      TabOrder = 0
      object spdSelec: TSpeedButton
        Left = 6
        Top = 45
        Width = 136
        Height = 25
        Caption = 'Selecionar Arquivo '
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clActiveCaption
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          5555555555555555555555555555555555555555555555555555555555555555
          555555555555555555555555555555555555555FFFFFFFFFF555550000000000
          55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
          B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
          000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
          555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
          55555575FFF75555555555700007555555555557777555555555555555555555
          5555555555555555555555555555555555555555555555555555}
        NumGlyphs = 2
        ParentFont = False
        OnClick = spdSelecClick
      end
      object Label1: TLabel
        Left = 6
        Top = 6
        Width = 117
        Height = 13
        Caption = 'Arquivo de Interface'
      end
      object edNomeArqTxt: TEdit
        Left = 150
        Top = 45
        Width = 250
        Height = 25
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Enabled = False
        ReadOnly = True
        TabOrder = 0
      end
      object rdgrpContas: TRadioGroup
        Left = 412
        Top = 1
        Width = 121
        Height = 78
        Align = alRight
        Caption = 'Processo'
        Enabled = False
        ItemIndex = 1
        Items.Strings = (
          'Sobrescrever'
          'Adicionar')
        TabOrder = 1
      end
      object dblkinterface: TwwDBLookupCombo
        Left = 6
        Top = 21
        Width = 241
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEARQ'#9'60'#9'Nome do Arquivo')
        LookupTable = qryArquivos
        LookupField = 'IDARQ'
        TabOrder = 2
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnChange = dblkinterfaceChange
      end
    end
    object prgbrImportar: TProgressBar
      Left = 1
      Top = 364
      Width = 534
      Height = 16
      Align = alBottom
      Min = 0
      Max = 100
      Step = 1
      TabOrder = 1
      Visible = False
    end
    object mmTxt: TRichEdit
      Left = 5
      Top = 204
      Width = 527
      Height = 156
      MaxLength = 1200
      ReadOnly = True
      TabOrder = 2
    end
    object Panel2: TPanel
      Left = 5
      Top = 85
      Width = 526
      Height = 120
      TabOrder = 3
      object Panel3: TPanel
        Left = 0
        Top = 1
        Width = 391
        Height = 117
        TabOrder = 0
        object spdTodos: TSpeedButton
          Left = 6
          Top = 18
          Width = 76
          Height = 37
          Caption = '&Todos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clActiveCaption
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000
            000FFFFFFFF88888888FFFFFFFF07797770FFFFFFFF8FF7FFF8FFFFFF0007999
            770FFFFFF888F777FF8FFFFFF0709979970FFFFFF8F877F77F8FFFF000709777
            990FFFF888F87FFF778FFFF070907777799FFFF8F878FFFFF77FF00070900000
            0099F888F87888888877F070907777799FFFF8F878FFFFF77FFFF07090000000
            99FFF8F87888888877FFF0907777799FFFFFF878FFFFF77FFFFFF09000000099
            FFFFF87888888877FFFFF07777799FFFFFFFF8FFFFF77FFFFFFFF000000099FF
            FFFFF888888877FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          NumGlyphs = 2
          ParentFont = False
          OnClick = spdTodosClick
        end
        object spdInverte: TSpeedButton
          Left = 6
          Top = 60
          Width = 76
          Height = 37
          Caption = '&Inverter'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clActiveCaption
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000FFFFFFFF88888888FFFFFFFF0777
            7770FFFFFFFF8FFFFFF8FFF000FF07777770FFF788FF8FFFFFF8FFF0FFFF0777
            7770FFF8FFFF8FFFFFF8FF000FFF07777770FF778FFF8FFFFFF8FFF0FFFF0777
            7770FFF8FFFF8FFFFFF8FFFFFFFF00000000FFFFFFFF8888888800000000FFFF
            FFFF88888888FFFFFFFF07797770FFFF0FFF8FF7FFF8FFFF8FFF07999770FFF0
            00FF8F777FF8FFF877FF09979970FFFF0FFF877F77F8FFFF8FFF09777990FF00
            0FFF87FFF778FF887FFF07777799FFFFFFFF8FFFFF77FFFFFFFF000000099FFF
            FFFF888888877FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          NumGlyphs = 2
          ParentFont = False
          OnClick = spdInverteClick
        end
        object lvCampos: TListView
          Left = 85
          Top = 0
          Width = 303
          Height = 117
          Checkboxes = True
          Columns = <
            item
              Caption = 'Campo do TXT'
              Width = 150
            end
            item
              Caption = 'Coluna do Banco'
              Width = 150
            end>
          MultiSelect = True
          ReadOnly = True
          RowSelect = True
          TabOrder = 0
          ViewStyle = vsReport
        end
      end
      object Panel4: TPanel
        Left = 393
        Top = 0
        Width = 133
        Height = 118
        TabOrder = 1
      end
    end
  end
  inherited Dock971: TDock97
    Top = 381
    Width = 536
    inherited tb97Fundo: TToolbar97
      Left = 368
      DockPos = 370
    end
  end
  object qryTXT: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 66
    Top = 385
  end
  object qryArquivos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select * from arquivo')
    ValidateWithMask = True
    Left = 108
    Top = 382
  end
  object OpDlgTxt: TOpenArqText
    IdArq = 0
    DataBaseName = 'BaseDados'
    Left = 156
    Top = 382
  end
end
