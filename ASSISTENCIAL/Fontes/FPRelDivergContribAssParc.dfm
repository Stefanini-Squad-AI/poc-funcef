inherited frmPRelDivergContribParc: TfrmPRelDivergContribParc
  Left = 174
  Top = 40
  Caption = 'Relatório  de Divergências Parciais de Contribuição'
  ClientHeight = 272
  ClientWidth = 592
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 592
    Height = 233
    inherited PageControl1: TPageControl
      Width = 582
      Height = 223
      ActivePage = tbsParametros
      Font.Height = -11
      Font.Style = []
      ParentFont = False
      object tbsParametros: TTabSheet
        Caption = 'Parâmetros'
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 574
          Height = 195
          Align = alClient
          BevelInner = bvLowered
          TabOrder = 0
          object grpMeses: TGroupBox
            Left = 320
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
            TabOrder = 0
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
          object GroupBox1: TGroupBox
            Left = 6
            Top = 6
            Width = 304
            Height = 179
            Caption = 'Gerais'
            TabOrder = 1
            object Label1: TLabel
              Left = 10
              Top = 20
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
              Left = 12
              Top = 123
              Width = 85
              Height = 13
              Caption = 'Plano Assistencial'
            end
            object dblkpcmbPatro: TwwDBLookupCombo
              Left = 10
              Top = 37
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
              Top = 86
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
              Left = 11
              Top = 140
              Width = 280
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
          object rgrpDivergencias: TRadioGroup
            Left = 320
            Top = 134
            Width = 248
            Height = 52
            Items.Strings = (
              'Exibir Divergências por Contribuição'
              'Exibir Divergências por Participante')
            TabOrder = 2
            TabStop = True
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 233
    Width = 592
    inherited tb97Fundo: TToolbar97
      Left = 260
      DockPos = 260
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
    Left = 84
    Top = 299
  end
  inherited cdCabecalho: TColorDialog
    Left = 21
    Top = 302
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
    Top = 65521
  end
  object qryplano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select  nome, idplanoprev   from  planprev '
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 364
    Top = 65519
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
