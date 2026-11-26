inherited frmParamRelCert: TfrmParamRelCert
  Left = 270
  Top = 192
  Caption = 'Certificados de Inscrição'
  ClientHeight = 304
  ClientWidth = 473
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 473
    Height = 265
    object pgcQuantPart: TPageControl
      Left = 5
      Top = 5
      Width = 463
      Height = 255
      ActivePage = tbsVarPart
      Align = alClient
      TabOrder = 0
      object tbsUmPart: TTabSheet
        Caption = 'Participante'
        object Label3: TLabel
          Left = 34
          Top = 113
          Width = 33
          Height = 13
          Caption = 'Nome'
        end
        object Label4: TLabel
          Left = 34
          Top = 73
          Width = 33
          Height = 13
          Caption = 'Plano'
        end
        object Label5: TLabel
          Left = 34
          Top = 153
          Width = 55
          Height = 13
          Caption = 'Matrícula'
        end
        object Label7: TLabel
          Left = 34
          Top = 193
          Width = 53
          Height = 13
          Caption = 'Inscrição'
        end
        object edNomePart: TEdit
          Left = 104
          Top = 110
          Width = 329
          Height = 21
          Color = clBtnFace
          Enabled = False
          TabOrder = 0
        end
        object edPlano: TEdit
          Left = 104
          Top = 70
          Width = 329
          Height = 21
          Color = clBtnFace
          Enabled = False
          TabOrder = 1
        end
        object edMatricula: TEdit
          Left = 104
          Top = 150
          Width = 145
          Height = 21
          Color = clBtnFace
          Enabled = False
          TabOrder = 2
        end
        object gpbProcura: TGroupBox
          Left = 16
          Top = 1
          Width = 417
          Height = 58
          TabOrder = 3
          object Label6: TLabel
            Left = 12
            Top = 24
            Width = 145
            Height = 13
            Caption = 'Escolha o Participante ...'
          end
          object bbtnProcurar: TBitBtn
            Left = 310
            Top = 16
            Width = 88
            Height = 33
            Hint = 'Procurar Processo de Benefício'
            Caption = '&Procurar'
            Default = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
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
        end
        object edInscricao: TEdit
          Left = 104
          Top = 190
          Width = 145
          Height = 21
          Color = clBtnFace
          Enabled = False
          TabOrder = 4
        end
      end
      object tbsVarPart: TTabSheet
        Caption = 'Faixa'
        object grbFaixa: TGroupBox
          Left = 6
          Top = 8
          Width = 443
          Height = 209
          Caption = 'Datas de Inscrição'
          TabOrder = 0
          object Label1: TLabel
            Left = 44
            Top = 69
            Width = 66
            Height = 13
            Caption = 'Data Inicial'
          end
          object Label2: TLabel
            Left = 44
            Top = 122
            Width = 59
            Height = 13
            Caption = 'Data Final'
          end
          object mebMesFim: TMaskEdit
            Left = 184
            Top = 118
            Width = 78
            Height = 21
            EditMask = '!99/99/9999;1;_'
            MaxLength = 10
            TabOrder = 1
            Text = '  /  /    '
          end
          object mebMesIni: TMaskEdit
            Left = 184
            Top = 65
            Width = 78
            Height = 21
            EditMask = '!99/99/9999;1;_'
            MaxLength = 10
            TabOrder = 0
            Text = '  /  /    '
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 265
    Width = 473
    inherited tb97Fundo: TToolbar97
      Left = 289
      DockPos = 289
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 121
      DockPos = 121
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 68
    Top = 269
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object MontaSelect1: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PESSOA.NOME'
      'ELEGPATRO.MATRICULA'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'PLANPREV.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'C')
    Descricao.Strings = (
      'Participante'
      'Matrícula'
      'Número de Inscrição'
      'Plano Previdenciário')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'ELEGPATRO'
      'PARTPREVPLAN'
      'PLANPREV'
      'SITPART')
    CamposChave.Strings = (
      'PESSOA.NOME'
      'ELEGPATRO.MATRICULA'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'PLANPREV.NOME'
      'PESSOA.IDPESSOA'
      'PARTPREVPLAN.IDPLANOPREV'
      'PARTPREVPLAN.IDPESSJUR'
      'PARTPREVPLAN.SEQPROPOSTA')
    Filtro.Strings = (
      'ELEGPATRO.IDPESSOA = PESSOA.IDPESSOA'
      'PARTPREVPLAN.IDPESSOA = ELEGPATRO.IDPESSOA'
      'PARTPREVPLAN.IDPESSJUR = ELEGPATRO.IDPESSJUR'
      'PARTPREVPLAN.IDPLANOPREV = PLANPREV.IDPLANOPREV'
      'PARTPREVPLAN.IDSITPART = SITPART.IDSITPART'
      'PARTPREVPLAN.FLGDESATIVADO = 0')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '50'
      '10'
      '10'
      '50')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 9
    Top = 240
  end
end
