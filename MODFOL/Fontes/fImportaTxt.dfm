inherited frmImportaTxt: TfrmImportaTxt
  Left = 458
  Top = 128
  HelpContext = 210002
  ActiveControl = cmbMes
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsToolWindow
  Caption = 'Importação de Arquivos TXT'
  ClientHeight = 419
  ClientWidth = 618
  Font.Style = []
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 618
    Height = 380
    BorderWidth = 2
    object pgctrlPaginas: TPageControl
      Left = 2
      Top = 23
      Width = 614
      Height = 355
      ActivePage = tbsImporta
      Align = alClient
      TabOrder = 0
      OnChange = pgctrlPaginasChange
      object tbsImporta: TTabSheet
        Caption = 'Importação'
        object Bevel2: TBevel
          Left = 104
          Top = 48
          Width = 600
          Height = 283
          Style = bsRaised
        end
        object spbtnProcurarArq: TSpeedButton
          Left = 12
          Top = 14
          Width = 101
          Height = 45
          Hint = 'Procura arquivo de importação'
          Caption = '  &Arquivo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
            777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
            77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
            77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
            077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
            FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
            F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
            7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
            777777787FFF8777777777770000777777777777888877777777}
          NumGlyphs = 2
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          OnClick = spbtnProcurarArqClick
        end
        object Label4: TLabel
          Left = 12
          Top = 69
          Width = 102
          Height = 13
          Caption = 'Arquivos Importados :'
        end
        object Label6: TLabel
          Left = 12
          Top = 143
          Width = 32
          Height = 13
          Caption = 'Layout'
        end
        object grpMesRef: TGroupBox
          Left = 128
          Top = 9
          Width = 270
          Height = 51
          Caption = ' Mês e Ano de Início'
          TabOrder = 0
          object cmbSinal: TComboBox
            Left = 8
            Top = 19
            Width = 66
            Height = 21
            Enabled = False
            ItemHeight = 13
            TabOrder = 0
            Text = ' = '
            Items.Strings = (
              ' = '
              ' <='
              ' >=')
          end
          object cmbMes: TComboBox
            Left = 80
            Top = 19
            Width = 110
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 1
            Items.Strings = (
              'Janeiro'
              'Fevereiro'
              'Março'
              'Abril'
              'Maio'
              'Junho'
              'Julho'
              'Agosto'
              'Setembro'
              'Outubro'
              'Novembro'
              'Dezembro')
          end
          object spnedAno: TSpinEdit
            Left = 197
            Top = 19
            Width = 65
            Height = 22
            MaxValue = 0
            MinValue = 0
            TabOrder = 2
            Value = 0
            OnChange = spnedAnoChange
          end
        end
        object dblckLayout: TwwDBLookupCombo
          Left = 12
          Top = 158
          Width = 335
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'30'#9'DESCRICAO')
          LookupTable = CdsLayout
          LookupField = 'IDLAYOUT'
          Style = csDropDownList
          TabOrder = 1
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
          OnChange = dblckLayoutChange
        end
        object rgTipoImportacao: TRadioGroup
          Left = 12
          Top = 182
          Width = 335
          Height = 41
          Caption = 'Tipo de Importação'
          Columns = 3
          ItemIndex = 0
          Items.Strings = (
            'Acrescentar'
            'Substituir'
            'Somar')
          TabOrder = 2
          TabStop = True
          OnClick = rgTipoImportacaoClick
        end
        object rgOcorrencias: TRadioGroup
          Left = 12
          Top = 233
          Width = 335
          Height = 41
          Caption = 'Havendo Número de Ocorrências, Subtrair 1 do Mesmo?'
          Columns = 2
          ItemIndex = 1
          Items.Strings = (
            'Sim'
            'Não')
          TabOrder = 3
          TabStop = True
          Visible = False
          OnClick = rgTipoImportacaoClick
        end
        object rgPermanente: TRadioGroup
          Left = 435
          Top = 155
          Width = 154
          Height = 33
          Caption = 'Permanente?'
          Columns = 2
          ItemIndex = 1
          Items.Strings = (
            'Sim'
            'Não')
          TabOrder = 4
          TabStop = True
          OnClick = rgPermanenteClick
        end
        object rgIgnoraValZero: TRadioGroup
          Left = 435
          Top = 193
          Width = 154
          Height = 33
          Caption = 'Ignora valores zerados?'
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'Sim'
            'Não')
          TabOrder = 5
          TabStop = True
        end
        object gbxParcelas: TGroupBox
          Left = 435
          Top = 230
          Width = 154
          Height = 46
          Caption = 'Parcelas'
          TabOrder = 6
          object speParcelas: TSpinEdit
            Tag = 1
            Left = 37
            Top = 15
            Width = 80
            Height = 22
            MaxValue = 9999
            MinValue = 1
            TabOrder = 0
            Value = 1
          end
        end
        object pgbarProgresso: TProgressBar
          Left = 12
          Top = 287
          Width = 576
          Height = 19
          Min = 0
          Max = 100
          Step = 1
          TabOrder = 7
          Visible = False
        end
        object lbListaArquivos: TListBox
          Left = 11
          Top = 88
          Width = 577
          Height = 54
          ItemHeight = 13
          MultiSelect = True
          PopupMenu = ppApagar
          TabOrder = 8
          OnDblClick = lbListaArquivosDblClick
          OnKeyUp = lbListaArquivosKeyUp
        end
      end
      object tbsResult: TTabSheet
        Caption = 'Resultado'
        object memResult: TMemo
          Left = 0
          Top = 0
          Width = 497
          Height = 252
          Color = clBlack
          Font.Charset = ANSI_CHARSET
          Font.Color = clLime
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssBoth
          TabOrder = 0
        end
        object bbtnSalvar: TBitBtn
          Left = 504
          Top = 24
          Width = 93
          Height = 33
          Caption = '  &Salvar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = bbtnSalvarClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
            7700333333337777777733333333008088003333333377F73377333333330088
            88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
            000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
            FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
            99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
            99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
            99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
            93337FFFF7737777733300000033333333337777773333333333}
          NumGlyphs = 2
        end
      end
    end
    object pnlHorario: TPanel
      Left = 2
      Top = 2
      Width = 614
      Height = 21
      Align = alTop
      BevelInner = bvLowered
      Caption = 'Tempo Decorrido'
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
  end
  inherited Dock971: TDock97
    Top = 380
    Width = 618
    inherited tb97Fundo: TToolbar97
      Left = 301
      DockPos = 310
      inherited sep1: TToolbarSep97
        Left = 230
      end
      object ToolbarSep972: TToolbarSep97 [1]
        Left = 119
        Top = 0
        Blank = True
        SizeHorz = 30
      end
      inherited bbtnSair: TBitBtn
        Left = 149
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 232
      end
      object rbtnImportarArq: TBitBtn
        Left = 0
        Top = 0
        Width = 119
        Height = 33
        Caption = '  &Importar Arquivo'
        Default = True
        Enabled = False
        TabOrder = 2
        OnClick = rbtnImportarArqClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888444488
          88888888887777F888888888884CC48888888888887F87F888888888884CC488
          88888888887F87F888888888884CC48888888888887F87FFF8888888444CC444
          8888888877788777F88888884CCCCCC48888888878F888878888888884CCCC48
          888888FFF78F887FFFF88000004CC400008887777778F77777FF777777744777
          7708777777777777777878FFFFFFFFFF87707F8FFFFFFFFFF7F7787777777777
          87707F777777777787F778888888888887707F888888888887F7788888888882
          87707FFFFFFFFFFFF7F77FFFFFFFFFFFF7707777777777777787878888888888
          8870878FFFFFFFFFFFF788777777777777788877777777777778}
        NumGlyphs = 2
        Spacing = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 562
    Top = 85
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object SaveDlg: TSaveDialog
    DefaultExt = '*.TXT'
    Filter = 'Arquivos texto|*.txt|Todos os arquivos|*.*'
    InitialDir = 'C:\'
    Title = 'Salvar LOG da Importação'
    Left = 562
    Top = 72
  end
  object OpenDlg: TOpenDialog
    DefaultExt = '*.TXT'
    Filter = 'Arquivos texto|*.txt|Todos os arquivos|*.*'
    InitialDir = 'C:\'
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofEnableSizing]
    Title = 'Abrir arquivo a Importar'
    Left = 562
    Top = 44
  end
  object CdsLayout: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'CdsLayoutIndex'
        CaseInsFields = 'DESCRICAO'
        Fields = 'DESCRICAO'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'CdsLayoutIndex'
    Params = <>
    StoreDefs = True
    Left = 506
    Top = 60
  end
  object ppApagar: TPopupMenu
    Left = 462
    Top = 55
    object Apagar: TMenuItem
      Caption = 'Delete'
      OnClick = ApagarClick
    end
  end
end
