inherited frmPRelPAFavor: TfrmPRelPAFavor
  Left = 157
  Top = 195
  Caption = 'Pensão Alimentícia dos Favorecidos'
  ClientHeight = 262
  ClientWidth = 625
  FormStyle = fsNormal
  Visible = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 625
    Height = 223
    inherited PageControl1: TPageControl
      Width = 615
      Height = 213
      ActivePage = TabSheet1
      object TabSheet1: TTabSheet [0]
        Caption = 'Parâmetros'
        object Panel1: TPanel
          Left = 5
          Top = 98
          Width = 595
          Height = 80
          BevelOuter = bvLowered
          TabOrder = 0
          object StaticText3: TStaticText
            Left = 12
            Top = 3
            Width = 459
            Height = 27
            Caption = 'Opções para Pensão Alimentícia dos Favorecidos'
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindow
            Font.Height = -19
            Font.Name = 'Bookman Old Style'
            Font.Style = [fsItalic]
            ParentColor = False
            ParentFont = False
            TabOrder = 0
          end
          object bbtnProcurar: TBitBtn
            Left = 471
            Top = 38
            Width = 110
            Height = 31
            Hint = 'Procurar participante'
            Caption = '&Procurar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            OnClick = bbtnProcurarClick
            Glyph.Data = {
              4E010000424D4E01000000000000760000002800000012000000120000000100
              040000000000D800000000000000000000001000000010000000000000000000
              BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
              DDDDDD000000DDDDDDDDDDDDDDDDDD000000D000000000000DD00D000000D0FF
              FFFFFFFF0D000D000000D0FFFFFFF0000800DD000000D0FFFFFF0877808DDD00
              0000D0FFFFF0877E880DDD000000D0FFFFF07777870DDD000000D0FFFFF07E77
              870DDD000000D0FFFFF08EE7880DDD000000D0FFFFFF087780DDDD000000D0FF
              FFFFF0000DDDDD000000D0FFFFFFFFFF0DDDDD000000D0FFFFFFF0000DDDDD00
              0000D0FFFFFFF070DDDDDD000000D0FFFFFFF00DDDDDDD000000DD00000000DD
              DDDDDD000000DDDDDDDDDDDDDDDDDD000000}
          end
          object chkRubrica: TCheckBox
            Left = 10
            Top = 33
            Width = 97
            Height = 13
            Caption = 'Rúbrica'
            TabOrder = 2
          end
          object edRubrica: TEdit
            Left = 10
            Top = 48
            Width = 444
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
          end
        end
        object pnlInformacoes: TPanel
          Left = 5
          Top = 4
          Width = 595
          Height = 87
          BevelOuter = bvLowered
          TabOrder = 1
          object grpMesRef: TGroupBox
            Left = 9
            Top = 32
            Width = 208
            Height = 45
            Caption = 'Mês e Ano da Folha '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object cmbMes: TComboBox
              Left = 17
              Top = 16
              Width = 100
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ItemHeight = 13
              ParentFont = False
              TabOrder = 0
              Text = 'cmbMes'
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
            object spedAno: TSpinEdit
              Left = 132
              Top = 16
              Width = 50
              Height = 22
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              MaxValue = 0
              MinValue = 0
              ParentFont = False
              TabOrder = 1
              Value = 1999
            end
          end
          object StaticText1: TStaticText
            Left = 18
            Top = 5
            Width = 486
            Height = 27
            Caption = 'Informações da Pensão Alimentícia dos Favorecidos'
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindow
            Font.Height = -19
            Font.Name = 'Bookman Old Style'
            Font.Style = [fsItalic]
            ParentColor = False
            ParentFont = False
            TabOrder = 1
          end
          object TGroupBox
            Left = 225
            Top = 32
            Width = 361
            Height = 45
            Caption = 'Patrocinadora'
            TabOrder = 2
            object dblkpcmbpatrocinadora: TwwDBLookupCombo
              Left = 12
              Top = 17
              Width = 343
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'60'#9'NOME')
              LookupTable = qryPatro
              LookupField = 'NOME'
              Options = [loTitles]
              ParentFont = False
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 223
    Width = 625
    inherited tb97Fundo: TToolbar97
      inherited rbtnVisualizar: TBitBtn
        ModalResult = 1
        OnClick = rbtnVisualizarClick
      end
      inherited rbtnImprimir: TBitBtn
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object MontaSelectRUBRICAS: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PROVDESC.IDPROVENTO'
      'PROVDESC.DESCRICAO')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Código da Rúbrica'
      'Rúbrica')
    Tabelas.Strings = (
      'PROVDESC')
    CamposChave.Strings = (
      'PROVDESC.IDPROVENTO'
      'PROVDESC.DESCRICAO')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '130')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 225
    Top = 168
  end
  object qryPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.IDPESSOA,P.NOME'
      'FROM PESSOA P, PATRO PT'
      'WHERE P.IDPESSOA = PT.IDPESSOA'
      'ORDER BY UPPER(P.NOME)')
    ValidateWithMask = True
    Left = 150
    Top = 167
    object qryPatroNOME: TStringField
      DisplayWidth = 60
      FieldName = 'NOME'
      Size = 60
    end
    object qryPatroIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Visible = False
    end
  end
end
