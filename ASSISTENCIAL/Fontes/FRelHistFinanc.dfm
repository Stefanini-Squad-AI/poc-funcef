inherited frmRelHistFinanc: TfrmRelHistFinanc
  Left = 234
  Top = 85
  Caption = 'Relatório de Histórico Financeiro de Participante'
  ClientHeight = 418
  ClientWidth = 453
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 453
    Height = 379
    object GroupBox4: TGroupBox
      Left = 11
      Top = 120
      Width = 430
      Height = 105
      Caption = 'Período'
      TabOrder = 1
      object Label1: TLabel
        Left = 134
        Top = 81
        Width = 7
        Height = 13
        Caption = '/'
      end
      object Label7: TLabel
        Left = 347
        Top = 81
        Width = 7
        Height = 13
        Caption = '/'
      end
      object cmbmes1: TComboBox
        Left = 10
        Top = 74
        Width = 121
        Height = 21
        Enabled = False
        ItemHeight = 13
        TabOrder = 0
        Text = 'cmbmes1'
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
      object spinano1: TSpinEdit
        Left = 144
        Top = 74
        Width = 65
        Height = 22
        Enabled = False
        MaxValue = 0
        MinValue = 0
        TabOrder = 1
        Value = 0
      end
      object RadioGroup1: TRadioGroup
        Left = 8
        Top = 15
        Width = 417
        Height = 34
        Caption = 'Mês'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Referência'
          'Cobrança')
        TabOrder = 2
      end
      object cmbmes2: TComboBox
        Left = 223
        Top = 74
        Width = 121
        Height = 21
        Enabled = False
        ItemHeight = 13
        TabOrder = 3
        Text = 'cmbmes'
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
      object spinano2: TSpinEdit
        Left = 357
        Top = 74
        Width = 65
        Height = 22
        Enabled = False
        MaxValue = 0
        MinValue = 0
        TabOrder = 4
        Value = 0
      end
      object chkInicio: TCheckBox
        Left = 11
        Top = 56
        Width = 97
        Height = 17
        Caption = 'Início:'
        TabOrder = 5
        OnClick = chkInicioClick
      end
      object chkFim: TCheckBox
        Left = 225
        Top = 56
        Width = 97
        Height = 17
        Caption = 'Fim:'
        TabOrder = 6
        OnClick = chkFimClick
      end
    end
    object Participante: TGroupBox
      Left = 11
      Top = 10
      Width = 430
      Height = 103
      Caption = 'Participante'
      TabOrder = 0
      object Label4: TLabel
        Left = 9
        Top = 33
        Width = 37
        Height = 13
        Caption = 'Nome:'
      end
      object SpeedButton1: TSpeedButton
        Left = 383
        Top = 20
        Width = 39
        Height = 29
        Hint = 'Procurar'
        Glyph.Data = {
          06020000424D0602000000000000760000002800000028000000140000000100
          0400000000009001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333333FFFFF
          FFF00000333333333333333777773333333BFBFBFBF0FFF03333333333333337
          FFF73333333FFFFFFF000000333333333333337777773333333BFBFBF0FBFBFB
          333333333FFFF733FFFF3333333F00000FF000003333333377777FF777773333
          333B0FFF0000FFF0333333337FFF7777FFF73333333F00000FF000003333333F
          777773F777773333330BFBFBF0FBFBFB3333337FF333373FFFFF33333010FFFF
          FF00000033333777FF3333777777333330170BFBFBF0FFF0333337777FF33337
          FFF73333301170FFFFF0000033333777778F3337777333330711190BFBFBFBFB
          333377777378F3333333333308819990FFFFFFFF3333733733378F3333333330
          88FF9999033333333337333333FF7333333333088FFFF0003333333333733333
          F777333333333088FFF003333333333337333337733333333333088FFF033333
          333333337F33337333333333333308FFF09333333333333378F3373333333333
          333330FF0933333333333333378F733333333333333333003333333333333333
          33773333333333333333}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton1Click
      end
      object Label3: TLabel
        Left = 9
        Top = 57
        Width = 84
        Height = 13
        Caption = 'Patrocinadora:'
      end
      object Label5: TLabel
        Left = 9
        Top = 81
        Width = 71
        Height = 13
        Caption = 'Plano Prev.:'
      end
      object lbPlanoPrev: TLabel
        Left = 105
        Top = 81
        Width = 264
        Height = 13
        AutoSize = False
      end
      object lbPatrocinadora: TLabel
        Left = 105
        Top = 57
        Width = 264
        Height = 13
        AutoSize = False
      end
      object edparticipante: TEdit
        Left = 56
        Top = 27
        Width = 313
        Height = 21
        Cursor = crArrow
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 0
        Text = 'edparticipante'
        OnMouseMove = edparticipanteMouseMove
      end
    end
    object PageControl1: TPageControl
      Left = 5
      Top = 232
      Width = 443
      Height = 142
      ActivePage = TabSheet2
      Align = alBottom
      TabOrder = 2
      object TabSheet1: TTabSheet
        Caption = 'Plano Assistencial'
        object chkplano: TCheckListBox
          Left = 0
          Top = 0
          Width = 435
          Height = 114
          Align = alClient
          Columns = 2
          ItemHeight = 13
          TabOrder = 0
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Histórico'
        object chkhistorico: TCheckListBox
          Left = 0
          Top = 0
          Width = 435
          Height = 114
          Align = alClient
          Columns = 2
          ItemHeight = 13
          Items.Strings = (
            'Não enviadas'
            'Não recebidas'
            'Recebidas OK'
            'Divergências não tratadas'
            'Div. Tratadas'
            'Canceladas')
          TabOrder = 0
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 379
    Width = 453
    inherited tb97Fundo: TToolbar97
      Left = 280
      DockPos = 280
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 104
      DockPos = 104
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 347
    Top = 65523
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object procuraPart: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PARTASS.IDPESSOA'
      'PESSOA.NOME'
      'PARTPREVPLAN.INSCRICAONUMERO')
    TipodeDado.Strings = (
      'N'
      'C'
      'N')
    Descricao.Strings = (
      'Matrícula'
      'Participante'
      'Inscrição Previdenciaria')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'PARTASS'
      'PARTPREVPLAN'
      'PLANPREV'
      'PESSOA PATRO')
    CamposChave.Strings = (
      'PESSOA.NOME'
      'PESSOA.IDPESSOA'
      'PLANPREV.NOME'
      'PATRO.NOME')
    Filtro.Strings = (
      'PARTASS.IDPESSOA =  PESSOA.IDPESSOA'
      'PARTASS.IDPESSJUR =  PATRO.IDPESSOA'
      'PARTASS.IDPESSJUR =  PARTPREVPLAN.IDPESSJUR'
      'PARTASS.IDPLANOPREV =  PARTPREVPLAN.IDPLANOPREV'
      'PARTASS.IDPESSOA =  PARTPREVPLAN.IDPESSOA'
      'PARTASS.IDPLANOPREV = PLANPREV.IDPLANOPREV')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '60'
      '10')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 372
    Top = 66
  end
  object qryplano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select idplanass, nome '
      'from planass')
    ValidateWithMask = True
    Left = 208
    Top = 296
  end
end
