object frmMSParamsEditor: TfrmMSParamsEditor
  Left = 183
  Top = 72
  BorderStyle = bsSingle
  Caption = 'Visual MontaSelect 2000'
  ClientHeight = 585
  ClientWidth = 685
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = True
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 31
    Width = 685
    Height = 178
    Align = alTop
    BevelOuter = bvNone
    BorderWidth = 5
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 5
      Top = 5
      Width = 329
      Height = 168
      Align = alLeft
      Caption = 'Tabelas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object btnIncluiTabela: TSpeedButton
        Left = 273
        Top = 17
        Width = 21
        Height = 21
        Glyph.Data = {
          E6000000424DE60000000000000076000000280000000E0000000E0000000100
          0400000000007000000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3300333333333333330033333333333333003333300033333300333330003333
          3300333330003333330033000000000333003300000000033300330000000003
          3300333330003333330033333000333333003333300033333300333333333333
          33003333333333333300}
        OnClick = btnIncluiTabelaClick
      end
      object btnExcluiTabela: TSpeedButton
        Left = 294
        Top = 17
        Width = 21
        Height = 21
        Glyph.Data = {
          E6000000424DE60000000000000076000000280000000E0000000E0000000100
          0400000000007000000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3300333333333333330033333333333333003333333333333300333333333333
          3300333333333333330033000000000033003300000000003300330000000000
          3300333333333333330033333333333333003333333333333300333333333333
          33003333333333333300}
        OnClick = btnExcluiabelaClick
      end
      object lstTabelas: TListBox
        Left = 15
        Top = 45
        Width = 300
        Height = 116
        Color = clInfoBk
        ExtendedSelect = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clInfoText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ItemHeight = 13
        ParentFont = False
        TabOrder = 0
        OnClick = lstTabelasClick
      end
      object cmbTabelas: TComboBox
        Left = 15
        Top = 17
        Width = 250
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        TabOrder = 1
      end
    end
    object Panel3: TPanel
      Left = 334
      Top = 5
      Width = 346
      Height = 168
      Align = alClient
      BevelOuter = bvNone
      Caption = 'Panel3'
      TabOrder = 1
      object GroupBox3: TGroupBox
        Left = 0
        Top = 0
        Width = 346
        Height = 87
        Align = alTop
        Caption = 'Campos chave'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object btnIncluiCamposChave: TSpeedButton
          Left = 298
          Top = 17
          Width = 21
          Height = 21
          Glyph.Data = {
            E6000000424DE60000000000000076000000280000000E0000000E0000000100
            0400000000007000000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3300333333333333330033333333333333003333300033333300333330003333
            3300333330003333330033000000000333003300000000033300330000000003
            3300333330003333330033333000333333003333300033333300333333333333
            33003333333333333300}
          OnClick = btnIncluiCamposChaveClick
        end
        object btnExcluiCamposChave: TSpeedButton
          Left = 319
          Top = 17
          Width = 21
          Height = 21
          Glyph.Data = {
            E6000000424DE60000000000000076000000280000000E0000000E0000000100
            0400000000007000000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3300333333333333330033333333333333003333333333333300333333333333
            3300333333333333330033000000000033003300000000003300330000000000
            3300333333333333330033333333333333003333333333333300333333333333
            33003333333333333300}
          OnClick = btnExcluiCamposChaveClick
        end
        object lstCamposChave: TListBox
          Left = 15
          Top = 42
          Width = 326
          Height = 39
          Color = clInfoBk
          ExtendedSelect = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clInfoText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ItemHeight = 13
          ParentFont = False
          TabOrder = 0
          OnClick = lstCamposChaveClick
        end
        object cmbCamposChave: TComboBox
          Left = 15
          Top = 17
          Width = 276
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          TabOrder = 1
        end
      end
      object GroupBox4: TGroupBox
        Left = 0
        Top = 87
        Width = 346
        Height = 81
        Align = alClient
        Caption = 'Filtros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object btnIncluiFiltro: TSpeedButton
          Left = 298
          Top = 14
          Width = 21
          Height = 21
          Glyph.Data = {
            E6000000424DE60000000000000076000000280000000E0000000E0000000100
            0400000000007000000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3300333333333333330033333333333333003333300033333300333330003333
            3300333330003333330033000000000333003300000000033300330000000003
            3300333330003333330033333000333333003333300033333300333333333333
            33003333333333333300}
          OnClick = btnIncluiCamposChaveClick
        end
        object btnExcluiFiltro: TSpeedButton
          Left = 319
          Top = 14
          Width = 21
          Height = 21
          Glyph.Data = {
            E6000000424DE60000000000000076000000280000000E0000000E0000000100
            0400000000007000000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3300333333333333330033333333333333003333333333333300333333333333
            3300333333333333330033000000000033003300000000003300330000000000
            3300333333333333330033333333333333003333333333333300333333333333
            33003333333333333300}
          OnClick = btnExcluiCamposChaveClick
        end
        object lstFiltros: TListBox
          Left = 15
          Top = 39
          Width = 326
          Height = 37
          Color = clInfoBk
          ExtendedSelect = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clInfoText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ItemHeight = 13
          ParentFont = False
          TabOrder = 0
          OnClick = lstFiltrosClick
        end
        object edFiltros: TEdit
          Left = 15
          Top = 14
          Width = 276
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 209
    Width = 685
    Height = 339
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 5
    TabOrder = 1
    object GroupBox2: TGroupBox
      Left = 5
      Top = 5
      Width = 675
      Height = 329
      Align = alClient
      Caption = 'Colunas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object btnIncluiColuna: TSpeedButton
        Left = 273
        Top = 20
        Width = 21
        Height = 21
        Glyph.Data = {
          E6000000424DE60000000000000076000000280000000E0000000E0000000100
          0400000000007000000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3300333333333333330033333333333333003333300033333300333330003333
          3300333330003333330033000000000333003300000000033300330000000003
          3300333330003333330033333000333333003333300033333300333333333333
          33003333333333333300}
        OnClick = btnIncluiColunaClick
      end
      object btnExcluiColuna: TSpeedButton
        Left = 294
        Top = 20
        Width = 21
        Height = 21
        Glyph.Data = {
          E6000000424DE60000000000000076000000280000000E0000000E0000000100
          0400000000007000000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3300333333333333330033333333333333003333333333333300333333333333
          3300333333333333330033000000000033003300000000003300330000000000
          3300333333333333330033333333333333003333333333333300333333333333
          33003333333333333300}
        OnClick = btnExcluiColunaClick
      end
      object cmbColunas: TComboBox
        Left = 15
        Top = 19
        Width = 250
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        TabOrder = 0
      end
      object lstColunas: TListBox
        Left = 7
        Top = 46
        Width = 300
        Height = 276
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clInfoText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ItemHeight = 13
        ParentFont = False
        TabOrder = 1
        OnClick = lstColunasClick
      end
      object PageControl: TPageControl
        Left = 320
        Top = 8
        Width = 350
        Height = 314
        ActivePage = TabSheet1
        TabOrder = 2
        object TabSheet1: TTabSheet
          Caption = 'Geral'
          object Label4: TLabel
            Left = 112
            Top = 44
            Width = 49
            Height = 13
            Caption = 'Máscara'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label6: TLabel
            Left = 111
            Top = 7
            Width = 58
            Height = 13
            Caption = 'Descrição'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label7: TLabel
            Left = 3
            Top = 7
            Width = 78
            Height = 13
            Caption = 'Tipo de Dado'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label1: TLabel
            Left = 5
            Top = 43
            Width = 44
            Height = 13
            Caption = 'Largura'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblmascara: TLabel
            Left = 255
            Top = 45
            Width = 3
            Height = 13
            Alignment = taRightJustify
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label3: TLabel
            Left = 3
            Top = 146
            Width = 190
            Height = 13
            Caption = 'Operador de Comparação Default'
          end
          object edMascara: TEdit
            Left = 110
            Top = 59
            Width = 211
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnChange = edMascaraChange
          end
          object edDescricao: TEdit
            Left = 110
            Top = 21
            Width = 211
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnChange = edDescricaoChange
          end
          object cmbTipoDeDado: TComboBox
            Left = 5
            Top = 21
            Width = 100
            Height = 21
            Style = csDropDownList
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            ParentFont = False
            TabOrder = 2
            OnChange = cmbTipoDeDadoChange
            Items.Strings = (
              '(C)aracter'
              '(N)umérico'
              '(D)ata'
              '(L) ookup')
          end
          object spnLargura: TSpinEdit
            Left = 5
            Top = 58
            Width = 100
            Height = 22
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MaxValue = 0
            MinValue = 0
            ParentFont = False
            TabOrder = 3
            Value = 0
            OnChange = spnLarguraChange
          end
          object GroupBox5: TGroupBox
            Left = 2
            Top = 185
            Width = 339
            Height = 100
            Caption = 'SQL'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 4
            object pnlSQL: TPanel
              Left = 2
              Top = 15
              Width = 335
              Height = 83
              Align = alClient
              BevelOuter = bvNone
              BorderWidth = 5
              Caption = 'pnlSQL'
              TabOrder = 0
              object MemoSQL: TMemo
                Left = 5
                Top = 5
                Width = 325
                Height = 73
                Align = alClient
                BorderStyle = bsNone
                Color = clInfoBk
                Ctl3D = True
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentCtl3D = False
                ParentFont = False
                ScrollBars = ssVertical
                TabOrder = 0
                WordWrap = False
              end
              object grdTeste: TwwDBGrid
                Left = 5
                Top = 5
                Width = 325
                Height = 73
                IniAttributes.Delimiter = ';;'
                TitleColor = clBtnFace
                FixedCols = 0
                ShowHorzScrollBar = True
                Align = alClient
                DataSource = dsTeste
                TabOrder = 1
                TitleAlignment = taLeftJustify
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = [fsBold]
                TitleLines = 1
                TitleButtons = False
                Visible = False
                OnExit = grdTesteExit
                IndicatorColor = icBlack
              end
            end
          end
          object CkbCase: TCheckBox
            Left = 5
            Top = 82
            Width = 323
            Height = 17
            Caption = 'Diferenciar MAIÚSCULAS de minúsculas na pesquisa'
            TabOrder = 5
            OnClick = CkbCaseClick
          end
          object CmbOperDefault: TComboBox
            Left = 4
            Top = 159
            Width = 197
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            ParentFont = False
            TabOrder = 6
            OnChange = CmbOperDefaultChange
          end
          object CmbOperDefaultN: TComboBox
            Left = 4
            Top = 159
            Width = 197
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            ParentFont = False
            TabOrder = 7
            OnChange = CmbOperDefaultNChange
          end
          object CkbSemEspecial: TCheckBox
            Left = 5
            Top = 103
            Width = 324
            Height = 17
            Hint = 
              'Marque esta opção se quiser limitar a entrada de dados no campo ' +
              'de pesquisa  permitindo só Letras e Números'
            Caption = 'Não permite digitar caracter especial'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 8
            OnClick = CkbSemEspecialClick
          end
          object CkbSoCxAlta: TCheckBox
            Left = 5
            Top = 123
            Width = 324
            Height = 17
            Hint = 
              'Marque esta opção caso o campo na base só tenha letras maiúscula' +
              ' (Ex: NOME da tabela Pessoa) para melhorar a performance nas bus' +
              'cas'
            Caption = 'Conteúdo do campo na base somente Maiúsculo'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 9
            OnClick = CkbSoCxAltaClick
          end
        end
        object TabSheet2: TTabSheet
          Caption = 'Complemento'
          ImageIndex = 1
          object GroupBox6: TGroupBox
            Left = 0
            Top = 0
            Width = 342
            Height = 89
            Align = alTop
            Caption = 'SQL'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object Label5: TLabel
              Left = 6
              Top = 43
              Width = 100
              Height = 13
              Caption = 'Chave p/ Lookup'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label8: TLabel
              Left = 139
              Top = 43
              Width = 113
              Height = 13
              Caption = 'Campo para Display'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object edtSql: TEdit
              Left = 6
              Top = 13
              Width = 313
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 0
              OnChange = edtSqlChange
            end
            object edtIdTabela: TEdit
              Left = 6
              Top = 57
              Width = 123
              Height = 21
              CharCase = ecUpperCase
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
              OnChange = edtIdTabelaChange
            end
            object edtCampoLkp: TEdit
              Left = 136
              Top = 57
              Width = 184
              Height = 21
              CharCase = ecUpperCase
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 2
              OnChange = edtCampoLkpChange
            end
          end
        end
      end
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 0
    Width = 685
    Height = 31
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object Label2: TLabel
      Left = 10
      Top = 9
      Width = 35
      Height = 13
      Caption = 'Título'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Bevel1: TBevel
      Left = 5
      Top = 29
      Width = 675
      Height = 5
      Shape = bsTopLine
    end
    object CkbDistinct: TCheckBox
      Left = 352
      Top = 7
      Width = 174
      Height = 17
      Caption = 'Seleciona Linhas Distintas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = CkbDistinctClick
    end
    object EdtTitulo: TEdit
      Left = 53
      Top = 5
      Width = 288
      Height = 21
      TabOrder = 1
    end
    object CkbRepete: TCheckBox
      Left = 536
      Top = 7
      Width = 118
      Height = 17
      Caption = 'Repete Consulta'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = CkbRepeteClick
    end
  end
  object CMOkCancelar1: TCMOkCancelar
    Left = 0
    Top = 548
    Width = 685
    Height = 37
    HelpContext = 0
    AllowDrag = False
    Background.Data = {
      760F0000424D760F0000000000007600000028000000800000003C0000000100
      040000000000000F000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
      888888888888787878888888888888788887888888888888888088F8FF8FFFF8
      88F88F88F8F8F8F8F8F8F8F8F888888888887888788888888888888888888888
      888888888887878878888888888888888878888888888888888888888FFFFF8F
      8F8F88F8F8F8F8F8F8F8F8F88888888888888878788888888888888888888888
      88888888888888787888888888888888878888888888888888888888888FF8FF
      8F88888888F8F8FF8F8F88F88F88888888888888788888888888888888888888
      8888888888887887888888888888888887888888888888888888888888888FFF
      FF8F8888F8F8F8F8F8F88F888888888888888887878888888888888888888888
      888888888888887888888888888888888888888888888888888888888888888F
      F8F8F8F888F8F8F8F8F8F8F8F888888888888888788888888888888888888888
      8888888888888888888888888888888888888888888888888888888888888888
      FFFF8F8F8F8F8F8F8F8F888888888F8888888888888888888888888888888888
      8888888888888888888888888888888888888888888888888888888888888888
      8FF8F8F8F8F8F8FFFFF8F8F8F8F8888888888888878878788888888888888888
      8888888888888888888888888888888888888888888888888888888888888887
      88FFFFF8F8888F88F8F8F88F88888F8888888888888787888888888888888888
      8888888888888788888888888888888888888888888888888888888888888888
      888FFFFFF8F8F88F8F8FF8F8F88F888888888888888888788888888888888888
      8888888888888888887888888888888888888888888888888888888888888888
      8788FFFF8F8F88F8F8FF8FF8F8F8F88F88888888888787878888888888888888
      8888888888888878887888888888888888888888888888888888888888888888
      88888FFFFF8F8888F8F8FF8FF8F88F8888888888888888888888887888888888
      8888888888888887888888888888888888888888888888888888888888888888
      888888FFFF8F88F8F8F8F8F8F8F8F88F8F888888888887878887888788788888
      8888888888888888888888888888888888888888888888888888888888888888
      888888FFFFFF8F88F8F8F8FF8FF8F8F8888F8888888888887878878888888888
      8888888888888888788888888888888888888888888888888888888888888888
      8888888FFFF8F8F888F8F8F8F8F8F888F8888F88888888878887888888888888
      8888888888888888878888888888888888888888888888888888888888888888
      8888888F8FFF8F88F8F88F8FFF8F8F8F888F8888888888787878878888888F88
      8888888888888888888887888888888888888888888888888888888888888888
      8888888FFFF8F8888888F8F8F8F8F8F88F88F8888888888887887888888F8888
      F8F8888888888888887888888888788888888888888888888888888888888888
      88888788FFFFF8F888F88F8F8FF8F8F8F88F88F888888888787878788888F888
      888F8F8888888888888788788887878888888888888888888888888888888888
      88888888FFFF8F888888F8F8FF8F8F8F8F8F8F88888888888887878878888888
      88888F8F88888888888878887888888888888888888888888888888888888888
      888888788FFFF8F8F88F8F8FF8F8FF8F8F8F8F8F888888888878788788888888
      7888888888888888888887878878888788888888888888888888888888888888
      888888888FFFF8F88888888F8F8FF8F8F8F8F888F88888888887887878888887
      8888888888887888888888788887888888888888888888888888888888888888
      88888887888F8F8F88888F8F8F8F8F8F8F8F8F8F888888888888887878878878
      8888888888888888888887888888888888888888888888888888888888888888
      888888888888F8F8F8F88F8F8F8F8F8F8F8F8888888F88888888878878787878
      8888888888787888888878888888888888888888888888888888888888888888
      88888888888888F8F88888888F8F8F8F8F8F8F8F8F8888888888888888878888
      8888888888888788888887888888888888888888888888888888888888888888
      888888888888888F8F88888F8F8F8F8F8F8F8F888888F88F8888887888878888
      8888888888888888888887788888888888888888888888888888888888888888
      8788888888888888F8F8888888F88F8F8FF8F8F8F8F888888888888888878888
      8888888888888888888888888888888888888888888888888888888888888888
      8888888888888888888888888F88F8F8F8F8F8F88888F8888888888887888888
      8888888888888888888887878888888888888888888888888888888888888888
      888888788888887888888888888F8F8F8F8F8F8F8F8F888F8888888888878888
      8888888888888888888888787888888888888888888888888888888888888888
      87888888888888888888888888F8F8F8F8F8F8F8F8F88F888888888888788888
      8888888888888888888888788888888888888888888888888888888888888878
      88888888888888878888888888888F88F8F8F8F8F8F8F8888888888888888888
      88888888888888888888888888888888888F8888888888888888888888888787
      8787888888888888787888888888F88F8F8F8F8F8F8F8F888888888888888888
      887888888888888888888888888888888788F888888888888888888888888878
      787888788888888878887888888888F8F8F8F8FF8F8F88F88888888888888787
      8888888888888888888888888888888888888F88888888888888888888888888
      88878788888888888787878788888F88F8F8F8F8F8F8F88F8888888888888787
      8788888788888888888888888888888888888FF8F88887888888888888888888
      7878888888888888887888888888888F8F8F8F8F8F8F88F8F888888888888888
      8888888878888888888888888888888888888888888888888888888888888888
      878888888888888888888888878888F88F8F8F8F8F8F8F8F88F8888888888887
      8788888888888888888888888888888888887888888888888888888888888888
      88788888888888888888888888888888F8F88F8F8F8F8F8FF888F88888888878
      888888F888888888888888888888888888888888878788878888888888888888
      88788888888888888888888887888888888F88F8F8F8F8F888F8888888888888
      787888F8F8888888888888788888888888888888888888888888888888888888
      888888888888888888888888788788888F88F8F8F8F8F8F8F8F8F8F888888888
      8888888F88888888888888888888888888888888888888888888888888888888
      88888888888888888888888887888888888F88F8F8F8F8F8F8F88888F8888888
      8878888F88888888888888878788888888888888888888888888888888888888
      8888888888888888888888888878888888888F8F8F8F8F8F8888F8F888888888
      888888888F888888888888888878888888888888888888888888888888888888
      888888888888888888888888888888888888F8F8F8F8F8F8F8F8F88888888888
      8888888888888888888888887888888888888888888888888888888888888888
      88888888888888888888888888878887888888F8F88F8F8F8F8F88F888888888
      8888888888888888888888888878788888888887888888888888888888888888
      8888888888888888888888888888788888888F8F88F8F8F8F8F88F888F888888
      8888888888888788888888888888888888888878788888888888888888888888
      88888888888888888788888888878787888888888F8F8FF8F8F8F88F88888888
      8888888888878888888888888878788888888888888888888888888888888888
      888888888888888888788888888877878888888F8F8F8F8F8F88F8F8F8F88888
      888888888878787878888888888888888888888887888888888F888888888888
      888888888888888888888888888778778888888888F88F8F8F8F88F88888F888
      88888888787888888888888888888888888888888888888888F8F88888888888
      88888888888888888887888888887778788888888F88F8F8F888F8F8F8F88888
      8888888888787888888888888888888888888888888888888888888888888888
      888888888888888888888888888887888888888888F88F8F8F8F8F8F888F8888
      8888888878788888888888888888888888888888888888888888888888888888
      88888888888888888888888888888888888788888888F88F8F88F8F8F8F88F88
      8888888888787888888888888888888888888888888888888888888888888888
      8888888888888888888888888888888888788888888F8F8F8F8F8F8F888F8888
      88888888888888888F8F88888878888888888888888888888888888887888888
      8888888888888888888888888888888888878888888888F8F8F88F8F8F8F88F8
      88888888888888888F8F8F888888888888888888888888888888887888888888
      88888888788888888888888888887888888878888888F8F8F88F8F8F8F88F888
      888888888888888888FFF88F8888878888888888888888888888888888788888
      88888888888888888888888888887888888887888888888888F8F8F8F88F88F8
      88F8888888888888888888F88888888888888888888888888888888888888888
      88888888888888888888888888888888888888787888888F8F88F8F8F8F88F88
      F88888888888888888888888F8F8888888888888888888888888888888888888
      888888888878888888888888888888888888878888888888888F8F8F8F88F88F
      88F88888888F88888878888888F8888888888888888888888888888888888888
      88888888888788888888888888888888888888888788888888F8F8F88F8F88F8
      8F88F88888888F88888878888888888888888888888888888888888888888888
      8888888888887888888888888888888888888888888888888F88F8F8F888F888
      F88F888888888888887887888888887888888888888888888888888888888888
      888888888888888887888888888888888888888888788888888F8F8F8F8F88F8
      F8F8888888888888888878787888888888888888888888888888888888888888
      88888888888887888888888888888788888888888887888888888888F888F888
      8888888888888888888787878788887888888888888888888888888888888888
      88888888888888888888888888888888888888888888888888888F8F8F8F8888
      F88F88F888888888888887887878788888888888888888888888888888888888
      8888888888888888888888888888888888888888888788888888}
    OnOkClick = CMOkCancelar1OkClick
    OnCancelarClick = CMOkCancelar1CancelarClick
    Buttons.BtnOk.Visible = True
    Buttons.BtnOk.Caption = '&Ok'
    Buttons.BtnOk.Enabled = True
    Buttons.BtnOk.Tag = 0
    Buttons.BtnOk.ShowHint = False
    Buttons.BtnOk.Default = False
    Buttons.BtnOk.Cancel = False
    Buttons.BtnCancelar.Visible = True
    Buttons.BtnCancelar.Caption = '&Cancelar'
    Buttons.BtnCancelar.Enabled = True
    Buttons.BtnCancelar.Tag = 0
    Buttons.BtnCancelar.ShowHint = False
    Buttons.BtnCancelar.Default = False
    Buttons.BtnCancelar.Cancel = False
    Buttons.BtnSair.Visible = False
    Buttons.BtnSair.Caption = '&Sair'
    Buttons.BtnSair.Enabled = True
    Buttons.BtnSair.Tag = 0
    Buttons.BtnSair.ShowHint = False
    Buttons.BtnSair.Default = False
    Buttons.BtnSair.Cancel = False
    Buttons.BtnAjuda.Visible = False
    Buttons.BtnAjuda.Caption = 'Aju&da'
    Buttons.BtnAjuda.Enabled = True
    Buttons.BtnAjuda.Tag = 0
    Buttons.BtnAjuda.ShowHint = False
    Buttons.BtnAjuda.Default = False
    Buttons.BtnAjuda.Cancel = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    object PnlSalvar: TPanel
      Left = 419
      Top = 1
      Width = 86
      Height = 36
      TabOrder = 1
      object BitBtn1: TBitBtn
        Left = 1
        Top = 0
        Width = 84
        Height = 34
        Cancel = True
        Caption = '&Testar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = BitBtn1Click
        Glyph.Data = {
          C2040000424DC204000000000000420000002800000018000000180000000100
          1000030000008004000000000000000000000000000000000000007C0000E003
          00001F0000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000E07FE07FE07FE07F
          E07FE07FE07FE07F00001F001F001F001F001F001F001F001F001F001F001F00
          1F001F0000000000E07FE07FE07FE07FE07FE07FE07FE07F00001F001F001F00
          1F001F001F001F001F001F001F001F001F001F0000000000E07FE07FE07FE07F
          E07FE07FE07FE07F00001F001F00000000000000000000001F001F001F001F00
          1F001F0000000000E07FE07FE07FE07FE07FE07FE07FE07F000000000000E07F
          E07FE07FE07FEF3DEF3D1F001F001F001F001F0000000000E07FE07FE07FE07F
          E07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07F00001F001F001F00
          1F001F0000000000E07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07F
          E07FE07FE07FE07FE07F1F001F001F001F001F0000000000E07FE07FE07FEF3D
          0000000000000000E07FE07FE07FE07FE07FE07FFF7FE07FE07F1F001F001F00
          1F001F0000000000E07FE07FFF7FFF7FFF7FFF7F007C007CE07FE07FFF7FFF7F
          FF7FFF7FE07FE07FFF7FFF7FFF7FFF7FFF7F1F0000000000E07FFF7FFF7F007C
          007CFF7FFF7F007CEF3DFF7FFF7F1F00FF7FFF7F00000000FF7FFF7F1F001F00
          1F001F0000000000E07FE07FEF3D0000007CFF7FFF7F007CFF7FFF7FE07FFF7F
          1F00FF7FFF7F1F00FF7FFF7F000000001F001F0000000000E07FE07FE07FFF7F
          FF7FFF7FFF7F007CFF7FFF7FE07F1F001F00FF7FFF7F1F00FF7FFF7FE003E003
          0000000000000000007CFF7FFF7FFF7FFF7F007C007C007CFF7FFF7F007C007C
          0000FF7FFF7F1F00FF7FFF7FE003E003E003000000000000007CFF7FFF7F007C
          007C007C007C007CFF7FFF7F007C007C0000FF7FFF7F1F00FF7FFF7FE003E003
          00001F0000000000007CFF7FFF7F007C007CFF7FFF7F007C007CFF7FFF7F007C
          FF7FFF7F1F001F00FF7FFF7FE003E00300001F0000000000007C007CFF7FFF7F
          FF7FFF7F007C007C007C007CFF7FFF7FFF7FE003E003E003FF7FFF7FE003E003
          E003E00300000000007C007C007C007C007C007C007C007C007C00000000007C
          0000E003E003E003E003E003E003E003E003E00300000000007C007C007C007C
          007C007C007C007CEF3DE003EF3D007C0000E003E003E003E003E003E003E003
          E003E00300000000007C007C007C007C007C007C007C007C0000E003E003E003
          E003E003E003E003E003E003E003E003E003E00300000000007C007C007C007C
          007C007C007C007C0000E003E003E003E003E003E003E003E003E003E003E003
          E003E00300000000007C007C007C007C007C007C007C007C0000E003E003E003
          E003E003E003E003E003E003E003E003E003E00300000000007C007C007C007C
          007C007C007C007C007C007C007C007C0000E003E003E003E003E003E003E003
          E003E00300000000007C007C007C007C007C007C007C007C007C007C007C007C
          0000E003E003E003E003E003E003E003E003E003000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000}
        Spacing = 2
      end
    end
  end
  object qryColunas: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 147
    Top = 287
  end
  object qryTeste: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 126
    Top = 347
  end
  object dsTeste: TwwDataSource
    DataSet = qryTeste
    Left = 222
    Top = 338
  end
end
