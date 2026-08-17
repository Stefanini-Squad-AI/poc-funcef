inherited frmPRelQuadroSalarios: TfrmPRelQuadroSalarios
  Caption = 'Relatóios de Quadro de Salários'
  ClientHeight = 150
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 111
    object GroupBox1: TGroupBox
      Left = 17
      Top = 16
      Width = 489
      Height = 76
      Caption = 'Participante'
      Enabled = False
      TabOrder = 0
      object Label1: TLabel
        Left = 16
        Top = 25
        Width = 55
        Height = 13
        Caption = 'Nº. Inscr.'
      end
      object Label2: TLabel
        Left = 112
        Top = 25
        Width = 33
        Height = 13
        Caption = 'Nome'
      end
      object edNome: TEdit
        Left = 112
        Top = 42
        Width = 265
        Height = 21
        ReadOnly = True
        TabOrder = 0
      end
    end
    object bbtnProcurar: TBitBtn
      Left = 409
      Top = 49
      Width = 88
      Height = 35
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
    object edInscr: TEdit
      Left = 32
      Top = 57
      Width = 89
      Height = 21
      TabOrder = 2
    end
  end
  inherited Dock971: TDock97
    Top = 111
    inherited TB97oKCancelar: TToolbar97
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 65515
    Top = 259
  end
  object MontaSelect1: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PP.INSCRICAONUMERO'
      'P.NOME')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Inscrição'
      'Participante')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA P'
      'PARTPREVPLAN PP')
    CamposChave.Strings = (
      'P.IDPESSOA'
      'P.NOME'
      'PP.INSCRICAONUMERO')
    Filtro.Strings = (
      'P.IDPESSOA=PP.IDPESSOA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 48
    Top = 112
  end
end
