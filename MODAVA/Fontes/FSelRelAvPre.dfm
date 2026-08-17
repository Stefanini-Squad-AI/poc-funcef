inherited frmSelRelAvPre: TfrmSelRelAvPre
  Left = 40
  Top = 156
  Caption = 'Seleção para Emissão da Avaliação Preenchida'
  ClientHeight = 266
  ClientWidth = 551
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 551
    Height = 227
    inherited PageControl1: TPageControl
      Width = 541
      Height = 217
      ActivePage = TabSheet1
      object TabSheet1: TTabSheet [0]
        Caption = 'Seleção da Impressão'
        object wwDBGrid1: TwwDBGrid
          Left = 0
          Top = 65
          Width = 533
          Height = 124
          Selected.Strings = (
            'DATAPLAN'#9'10'#9'Data Plan.'
            'DATAREAL'#9'10'#9'Data Real'
            'AVALIADOR'#9'37'#9'Avaliador'
            'AVALIACAO'#9'9'#9'Avaliação')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsAval
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          IndicatorColor = icBlack
        end
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 533
          Height = 65
          Align = alTop
          BevelInner = bvLowered
          BevelOuter = bvNone
          TabOrder = 1
          object gbxOrdem: TGroupBox
            Left = 388
            Top = 7
            Width = 135
            Height = 47
            Caption = 'Ordem de Impressão'
            TabOrder = 0
            object cmbOrderBy: TComboBox
              Left = 8
              Top = 16
              Width = 120
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 0
              Items.Strings = (
                'Código'
                'Descrição')
            end
          end
          object gbxNome: TGroupBox
            Left = 8
            Top = 7
            Width = 369
            Height = 47
            Caption = 'Nome'
            TabOrder = 1
            object dblcNome: TwwDBLookupCombo
              Left = 10
              Top = 17
              Width = 343
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'60'#9'NOME')
              LookupTable = qryPessoal
              LookupField = 'NOME'
              TabOrder = 0
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
            end
          end
        end
      end
      inherited TabSheet2: TTabSheet
        inherited BitBtn1: TBitBtn
          Left = 316
          Top = 59
          Visible = False
        end
        inherited BitBtn2: TBitBtn
          Left = 316
          Top = -1
          Visible = False
        end
        object rgObserv: TRadioGroup
          Left = 179
          Top = 55
          Width = 175
          Height = 80
          Caption = 'Com Observações dos Fatores'
          ItemIndex = 1
          Items.Strings = (
            'Sim'
            'Não')
          TabOrder = 2
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 227
    Width = 551
    inherited tb97Fundo: TToolbar97
      Left = 221
      DockPos = 229
      inherited bbtnSair: TBitBtn
        Visible = True
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Visible = True
      end
      inherited rbtnVisualizar: TBitBtn
        OnClick = rbtnVisualizarClick
      end
      inherited rbtnImprimir: TBitBtn
        OnClick = rbtnImprimirClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 139
    Top = 75
  end
  inherited cdMestre: TColorDialog
    Left = 113
    Top = 132
  end
  object qryPessoal: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select IDPESSOA, NOME from PESSOA where FLGFUNCIONARIO = 1 '
      'order by NOME')
    ValidateWithMask = True
    Left = 374
    Top = 96
  end
  object ds: TwwDataSource
    DataSet = qryPessoal
    OnDataChange = dsDataChange
    Left = 327
    Top = 94
  end
  object dsAval: TwwDataSource
    DataSet = qryAval
    Left = 198
    Top = 81
  end
  object qryAval: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select * from HSTAVAL')
    ValidateWithMask = True
    Left = 276
    Top = 90
  end
end
