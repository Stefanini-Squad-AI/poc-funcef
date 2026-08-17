object Form1: TForm1
  Left = 16
  Top = 85
  Width = 768
  Height = 451
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ToolWindow971: TToolWindow97
    Left = 648
    Top = 0
    Color = clActiveBorder
    CloseButton = False
    ClientAreaHeight = 399
    ClientAreaWidth = 103
    TabOrder = 0
    object ToolbarButton971: TToolbarButton97
      Left = 0
      Top = 0
      Width = 102
      Height = 33
      Caption = '&PLANOS'
    end
    object ToolbarButton972: TToolbarButton97
      Left = 0
      Top = 33
      Width = 102
      Height = 33
      Caption = '&EVENTOS'
    end
    object ToolbarButton973: TToolbarButton97
      Left = 0
      Top = 66
      Width = 102
      Height = 33
      Caption = '&CONTRIBUIÇÕES'
    end
    object ToolbarButton974: TToolbarButton97
      Left = 0
      Top = 99
      Width = 102
      Height = 33
      Caption = '&BENEFÍCIOS'
    end
    object ToolbarButton975: TToolbarButton97
      Left = 0
      Top = 132
      Width = 102
      Height = 33
      Caption = '&HIST. FUNCIONAL'
    end
    object ToolbarButton976: TToolbarButton97
      Left = 0
      Top = 165
      Width = 102
      Height = 33
      Caption = '&DADOS PESSOAIS'
    end
    object ToolbarButton977: TToolbarButton97
      Left = 0
      Top = 198
      Width = 102
      Height = 33
      Caption = 'E&MPRÉSTIMOS'
    end
    object ToolbarButton978: TToolbarButton97
      Left = 0
      Top = 231
      Width = 102
      Height = 33
      Caption = 'PRO&TOCOLOS'
    end
    object ToolbarButton979: TToolbarButton97
      Left = 0
      Top = 264
      Width = 102
      Height = 33
      Caption = '&RUBS'
    end
    object ToolbarButton9710: TToolbarButton97
      Left = 0
      Top = 297
      Width = 102
      Height = 33
      Caption = 'R&AD'
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 648
    Height = 423
    ActivePage = TabSheet1
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'Participante'
      object Panel2: TPanel
        Left = 5
        Top = 2
        Width = 630
        Height = 152
        BevelOuter = bvNone
        Caption = 'Panel2'
        TabOrder = 0
        object ScrollBox1: TScrollBox
          Left = 0
          Top = 0
          Width = 629
          Height = 152
          Align = alLeft
          Color = clBtnFace
          ParentColor = False
          TabOrder = 0
          object lblNomePai: TLabel
            Left = 9
            Top = 0
            Width = 61
            Height = 13
            Cursor = crNo
            Caption = 'Nome do Pai'
          end
          object lblNomeMae: TLabel
            Left = 9
            Top = 36
            Width = 67
            Height = 13
            Cursor = crNo
            Caption = 'Nome da Mãe'
          end
          object lblsexo: TLabel
            Left = 261
            Top = 72
            Width = 24
            Height = 13
            Cursor = crNo
            Caption = 'Sexo'
          end
          object lbldataFalecimento: TLabel
            Left = 137
            Top = 72
            Width = 98
            Height = 13
            Cursor = crNo
            Caption = 'Data de Falecimento'
          end
          object lbldataNascimento: TLabel
            Left = 10
            Top = 72
            Width = 97
            Height = 13
            Cursor = crNo
            Caption = 'Data de Nascimento'
          end
          object lblEstadoCivil: TLabel
            Left = 9
            Top = 108
            Width = 55
            Height = 13
            Cursor = crNo
            Caption = 'Estado Civil'
          end
          object lblEMail: TLabel
            Left = 137
            Top = 108
            Width = 28
            Height = 13
            Caption = 'E-mail'
          end
          object dbednomepai: TwwDBEdit
            Left = 8
            Top = 14
            Width = 362
            Height = 21
            Cursor = crNo
            TabStop = False
            Color = clGray
            DataField = 'NOMEPAI'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbednomemae: TwwDBEdit
            Left = 9
            Top = 50
            Width = 360
            Height = 21
            Cursor = crNo
            TabStop = False
            Color = clGray
            DataField = 'NOMEMAE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbeddatafalecimento: TwwDBEdit
            Left = 135
            Top = 87
            Width = 121
            Height = 21
            Cursor = crNo
            TabStop = False
            Color = clGray
            DataField = 'DATAMORTE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbeddatanasc: TwwDBEdit
            Left = 9
            Top = 87
            Width = 121
            Height = 21
            Cursor = crNo
            TabStop = False
            Color = clGray
            DataField = 'DATANASC'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbedSexo: TwwDBEdit
            Left = 261
            Top = 87
            Width = 108
            Height = 21
            Cursor = crNo
            TabStop = False
            Color = clGray
            DataField = 'SEXO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 4
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbedEstadoCivil: TwwDBEdit
            Left = 8
            Top = 123
            Width = 121
            Height = 21
            Cursor = crNo
            TabStop = False
            Color = clGray
            DataField = 'ESTADOCIVIL'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 5
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbedEMail: TwwDBEdit
            Left = 135
            Top = 123
            Width = 234
            Height = 21
            Cursor = crNo
            TabStop = False
            Color = clGray
            DataField = 'EMAIL'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 6
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
        end
      end
      object Panel12: TPanel
        Left = 0
        Top = 244
        Width = 639
        Height = 148
        BevelOuter = bvNone
        Caption = 'Panel12'
        TabOrder = 1
        object dbgridenderecos: TwwDBGrid
          Left = 0
          Top = 30
          Width = 639
          Height = 118
          Selected.Strings = (
            'NOME'#9'30'#9'Local'
            'LOGRADOURO'#9'30'#9'Logradouro'
            'NUMERO'#9'8'#9'Número'
            'COMPLEMENTO'#9'20'#9'Complemento'
            'BAIRRO'#9'20'#9'Bairro'
            'CIDADE'#9'30'#9'Cidade'
            'ESTADO'#9'30'#9'Estado'
            'UF'#9'3'#9'UF'
            'CEP'#9'8'#9'CEP'
            'NOMEPAIS'#9'20'#9'País')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
          TabOrder = 0
          TitleAlignment = taCenter
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          TitleLines = 1
          TitleButtons = False
          IndicatorColor = icBlack
        end
        object pnlEnderecos: TPanel
          Left = 0
          Top = 0
          Width = 639
          Height = 30
          Align = alTop
          BevelInner = bvLowered
          BevelWidth = 2
          Caption = 'Endereços'
          Color = clGray
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          TabOrder = 1
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Dependentes'
      ImageIndex = 1
      object Panel4: TPanel
        Left = 0
        Top = 148
        Width = 401
        Height = 105
        BevelOuter = bvNone
        Caption = 'Panel4'
        TabOrder = 0
        object dbgriddepen: TwwDBGrid
          Left = 0
          Top = 30
          Width = 401
          Height = 75
          Selected.Strings = (
            'NOME'#9'33'#9'Nome'#9'F'
            'FLGCONTAIMPOSTOR'#9'10'#9'IRRF'#9'F'
            'FLGCONTASALARIOF'#9'10'#9'Sal. Fam.'#9'F'
            'FLGDEPLEGAL'#9'10'#9'Dep. Legal'#9'F'
            'DESCRICAO'#9'10'#9'Grau de Parentesco'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          TitleLines = 1
          TitleButtons = False
          UseTFields = False
          IndicatorColor = icBlack
        end
        object pnlDependentes: TPanel
          Left = 0
          Top = 0
          Width = 401
          Height = 30
          Align = alTop
          BevelInner = bvLowered
          BevelWidth = 2
          Caption = 'Dependentes'
          Color = clGray
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          TabOrder = 1
        end
      end
    end
  end
end
