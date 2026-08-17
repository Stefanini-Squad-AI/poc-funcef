inherited frmParamProdAnalit: TfrmParamProdAnalit
  Left = 159
  Top = 181
  Caption = 'Parâmetros do Relatório de Produtos'
  ClientHeight = 201
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 162
    inherited PageControl1: TPageControl
      Height = 152
      ActivePage = TabSheet1
      Font.Height = -11
      Font.Style = []
      ParentFont = False
      object TabSheet1: TTabSheet
        Caption = 'Parâmetros'
        object GroupBox1: TGroupBox
          Left = 1
          Top = -1
          Width = 388
          Height = 89
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object Label4: TLabel
            Left = 18
            Top = 27
            Width = 85
            Height = 13
            Caption = 'Plano Assistencial'
          end
          object DBLkpCmbplanass: TwwDBLookupCombo
            Left = 18
            Top = 49
            Width = 291
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'40'#9'NOME')
            LookupTable = qryplanass
            LookupField = 'IDPLANASS'
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
          end
        end
        object RadioGroup1: TRadioGroup
          Left = 1
          Top = 88
          Width = 388
          Height = 33
          Columns = 2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Items.Strings = (
            'Analítica'
            'Sintética')
          ParentFont = False
          TabOrder = 1
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 162
    inherited tb97Fundo: TToolbar97
      inherited rbtnImprimir: TcmReportBtn
        OnClick = rbtnImprimirClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
          8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
          8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
          8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
      end
      inherited rbtnVisualizar: TcmReportBtn
        OnClick = rbtnVisualizarClick
      end
    end
  end
  inherited cdMestre: TColorDialog
    Left = 161
    Top = 36
  end
  inherited cdCabecalho: TColorDialog
    Left = 126
    Top = 61
  end
  object dspatro: TwwDataSource
    Left = 8
    Top = 168
  end
  object dsplanoprev: TwwDataSource
    Left = 40
    Top = 168
  end
  object qryplanass: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPLANASS , NOME'
      'FROM PLANASS'
      '')
    ValidateWithMask = True
    Left = 248
    Top = 13
  end
  object dsplanass: TwwDataSource
    DataSet = qryplanass
    Left = 72
    Top = 168
  end
end
