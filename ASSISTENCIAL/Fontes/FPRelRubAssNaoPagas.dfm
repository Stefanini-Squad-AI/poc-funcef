inherited frmPRelRubNaoPagas: TfrmPRelRubNaoPagas
  Left = 157
  Top = 117
  Caption = 'Relatório de Rubricas não Pagas'
  ClientHeight = 273
  ClientWidth = 588
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 588
    Height = 234
    inherited PageControl1: TPageControl
      Width = 578
      Height = 224
      ActivePage = tbsParametros
      Font.Height = -11
      Font.Style = []
      ParentFont = False
      object tbsParametros: TTabSheet
        Caption = 'Parâmetros'
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 570
          Height = 196
          Align = alClient
          BevelInner = bvLowered
          TabOrder = 0
          object GroupBox1: TGroupBox
            Left = 6
            Top = 6
            Width = 304
            Height = 179
            Caption = 'Gerais'
            TabOrder = 0
            object Label1: TLabel
              Left = 10
              Top = 25
              Width = 69
              Height = 13
              Caption = 'Patrocinadora '
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label2: TLabel
              Left = 10
              Top = 69
              Width = 100
              Height = 13
              Caption = 'Plano Previdenciário '
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object lblplanass: TLabel
              Left = 11
              Top = 115
              Width = 85
              Height = 13
              Caption = 'Plano Assistencial'
            end
            object dblkpcmbPatro: TwwDBLookupCombo
              Left = 10
              Top = 40
              Width = 282
              Height = 21
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'60'#9'Patrocinadora')
              LookupTable = qrypatro
              LookupField = 'IDPESSOA'
              Options = [loTitles]
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              ShowMatchText = True
            end
            object dblkpcmbPlano: TwwDBLookupCombo
              Left = 10
              Top = 84
              Width = 282
              Height = 21
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'50'#9'Plano Previdenciário')
              LookupTable = qryplano
              LookupField = 'IDPLANOPREV'
              Options = [loTitles]
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              ShowMatchText = True
            end
            object cmbplanass: TwwDBLookupCombo
              Left = 12
              Top = 130
              Width = 279
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'40'#9'NOME')
              LookupTable = qryplanass
              LookupField = 'IDPLANASS'
              TabOrder = 2
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
              OnEnter = cmbplanassEnter
            end
          end
          object grpMeses: TGroupBox
            Left = 315
            Top = 6
            Width = 248
            Height = 125
            Caption = 'Meses'
            Color = clBtnFace
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 1
            object grpMesAnoRef: TGroupBox
              Left = 9
              Top = 15
              Width = 226
              Height = 46
              Caption = 'Mês e Ano de Referência'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              object cmbMesRef: TComboBox
                Left = 6
                Top = 15
                Width = 112
                Height = 21
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ItemHeight = 13
                Items.Strings = (
                  'Janeiro'
                  'Fevereiro'
                  'Março'
                  'Abril'
                  'Maio'
                  'Junho'
                  'Julho'
                  'Agosto'
                  'Setembro '
                  'Outubro'
                  'Novembro'
                  'Dezembro')
                ParentFont = False
                TabOrder = 0
              end
              object spedAnoRef: TSpinEdit
                Left = 135
                Top = 15
                Width = 70
                Height = 22
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                MaxLength = 4
                MaxValue = 0
                MinValue = 0
                ParentFont = False
                TabOrder = 1
                Value = 1998
              end
            end
            object GroupBox4: TGroupBox
              Left = 9
              Top = 66
              Width = 226
              Height = 46
              Caption = 'Mês e Ano de Cobrança'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              object cmbMesCob: TComboBox
                Left = 6
                Top = 15
                Width = 109
                Height = 21
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ItemHeight = 13
                Items.Strings = (
                  'Janeiro'
                  'Fevereiro'
                  'Março'
                  'Abril'
                  'Maio'
                  'Junho'
                  'Julho'
                  'Agosto'
                  'Setembro '
                  'Outubro'
                  'Novembro'
                  'Dezembro')
                ParentFont = False
                TabOrder = 0
              end
              object spedAnoCob: TSpinEdit
                Left = 135
                Top = 14
                Width = 70
                Height = 22
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                MaxLength = 4
                MaxValue = 0
                MinValue = 0
                ParentFont = False
                TabOrder = 1
                Value = 1998
              end
            end
          end
          object rgrpDivergencias: TRadioGroup
            Left = 315
            Top = 134
            Width = 248
            Height = 52
            Items.Strings = (
              'Exibir Divergências por Rubrica'
              'Exibir Divergências por Participante')
            TabOrder = 2
            TabStop = True
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 234
    Width = 588
    inherited tb97Fundo: TToolbar97
      Left = 256
      DockPos = 256
      inherited rbtnVisualizar: TBitBtn
        OnClick = rbtnVisualizarClick
      end
      inherited rbtnImprimir: TmaHelpBitBtn
        OnClick = rbtnImprimirClick
        Kind = bkCustom
      end
    end
  end
  inherited cdMestre: TColorDialog
    Left = 54
    Top = 173
  end
  inherited cdCabecalho: TColorDialog
    Left = 15
    Top = 176
  end
  object qrypatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPESSOA , NOME  '
      'FROM PESSOA '
      'WHERE FLGPATROCINADORA = 1'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 298
    Top = 49
  end
  object qryplano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select  nome, idplanoprev   from  planprev '
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 356
    Top = 63
  end
  object qryplanass: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPLANASS , NOME '
      'FROM PLANASS')
    ValidateWithMask = True
    Left = 120
    Top = 160
  end
end
