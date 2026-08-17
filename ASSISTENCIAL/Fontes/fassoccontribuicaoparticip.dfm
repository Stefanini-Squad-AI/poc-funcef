inherited frmAssocContribuicaoParticip: TfrmAssocContribuicaoParticip
  Left = 55
  Top = 67
  Caption = 'Associação de Contribuições ao Participante'
  ClientHeight = 337
  ClientWidth = 662
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 662
    Height = 298
    object pnlControle: TPanel
      Left = 5
      Top = 5
      Width = 652
      Height = 288
      Align = alClient
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object pnlOpcoes: TPanel
        Left = 0
        Top = 0
        Width = 652
        Height = 288
        Align = alClient
        BevelOuter = bvLowered
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object btnAssocContribuicoes: TBitBtn
          Left = 16
          Top = 227
          Width = 169
          Height = 38
          Hint = 'Associa as Contribuições aos Participantes'
          Caption = 'Associar Contribuições'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnClick = btnAssocContribuicoesClick
          Glyph.Data = {
            DE000000424DDE0000000000000076000000280000000D0000000D0000000100
            0400000000006800000000000000000000001000000010000000000000000000
            BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
            7000777777077777700077777700777770007777770607777000770000066077
            7000770666666607700077066666666070007706666666077000770000066077
            7000777777060777700077777700777770007777770777777000777777777777
            7000}
        end
        object GroupBox1: TGroupBox
          Left = 4
          Top = 8
          Width = 641
          Height = 201
          Caption = 'Selecionar'
          TabOrder = 1
          object lbPatro: TLabel
            Left = 9
            Top = 18
            Width = 107
            Height = 16
            Caption = 'Patrocinadoras'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label7: TLabel
            Left = 217
            Top = 18
            Width = 145
            Height = 16
            Caption = 'Planos Assistenciais'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label3: TLabel
            Left = 425
            Top = 18
            Width = 96
            Height = 16
            Caption = 'Contribuições'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object chklstPatro: TCheckListBox
            Left = 9
            Top = 40
            Width = 204
            Height = 145
            OnClickCheck = chklstPatroClickCheck
            Columns = 1
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            ParentFont = False
            TabOrder = 0
          end
          object chklstPlano: TCheckListBox
            Left = 217
            Top = 40
            Width = 204
            Height = 145
            OnClickCheck = chklstPlanoClickCheck
            Columns = 1
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            ParentFont = False
            TabOrder = 1
          end
          object chklstContribuicao: TCheckListBox
            Left = 425
            Top = 40
            Width = 204
            Height = 145
            Columns = 1
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            ParentFont = False
            TabOrder = 2
          end
        end
        object rgTipo: TRadioGroup
          Left = 192
          Top = 216
          Width = 157
          Height = 61
          Caption = 'Associar'
          ItemIndex = 1
          Items.Strings = (
            'Selecionar contribuição'
            'Todas')
          TabOrder = 2
          OnClick = rgTipoClick
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 298
    Width = 662
    inherited tb97Fundo: TToolbar97
      Left = 492
      DockPos = 492
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 324
      DockPos = 324
      Visible = False
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 543
    Top = 23
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 373
    Top = 226
  end
  object qryPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPESSOA,NOME'
      'FROM PESSOA'
      'WHERE FLGPATROCINADORA = 1'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 97
    Top = 58
  end
  object qryPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT NOME, IDPLANASS'
      'FROM PLANASS'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 274
    Top = 58
  end
  object qryContribuicao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      ' DISTINCT C.IDCONTRIBUICAO, C.NOME, C.FLGOBRIGATORIA'
      'FROM'
      ' CONTRIBUICAO C, CONTPREV CP'
      'WHERE'
      ' (C.IDCONTRIBUICAO = CP.IDCONTRIBUICAO) AND'
      ' (C.IDCONTRIBUICAO = -1)'
      'ORDER BY C.NOME')
    ValidateWithMask = True
    Left = 473
    Top = 58
  end
  object qrySitPart: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM SITPART'
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 434
    Top = 226
  end
  object qryContribAssoc: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 492
    Top = 229
  end
end
