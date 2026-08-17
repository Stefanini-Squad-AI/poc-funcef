inherited frmParamRelEvSalPart: TfrmParamRelEvSalPart
  Left = 194
  Top = 140
  Caption = 'Parâmetro do Relatório de Evolução de Salário de Participação'
  ClientHeight = 304
  ClientWidth = 439
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 439
    Height = 265
    ParentFont = False
    object Label1: TLabel
      Left = 16
      Top = 96
      Width = 80
      Height = 13
      Caption = 'Patrocinadora'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object grpMesRef: TGroupBox
      Left = 17
      Top = 17
      Width = 171
      Height = 60
      Caption = 'Mês e Ano de Cobrança '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object cbMes: TComboBox
        Left = 7
        Top = 27
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
        Text = 'cbMes'
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
      object dbseAno: TSpinEdit
        Left = 114
        Top = 27
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
        Value = 0
      end
    end
    object dblkpPatro: TCMDBLookupCombo
      Left = 16
      Top = 112
      Width = 401
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'60'#9'NOME')
      LookupTable = qryPatro
      LookupField = 'IDPESSOA'
      Options = [loColLines, loRowLines, loTitles]
      Style = csDropDownList
      ParentFont = False
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnChange = dblkpPatroChange
      OnExit = dblkpPatroExit
    end
    object grpboxPart: TGroupBox
      Left = 16
      Top = 144
      Width = 401
      Height = 105
      Caption = ' Participante '
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      object btnProc: TBitBtn
        Left = 304
        Top = 16
        Width = 75
        Height = 49
        Caption = 'Procurar'
        TabOrder = 0
        OnClick = btnProcClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033BBBBBBBBBB
          BB33337777777777777F33BB00BBBBBBBB33337F77333333F37F33BB0BBBBBB0
          BB33337F73F33337FF7F33BBB0BBBB000B33337F37FF3377737F33BBB00BB00B
          BB33337F377F3773337F33BBBB0B00BBBB33337F337F7733337F33BBBB000BBB
          BB33337F33777F33337F33EEEE000EEEEE33337F3F777FFF337F33EE0E80000E
          EE33337F73F77773337F33EEE0800EEEEE33337F37377F33337F33EEEE000EEE
          EE33337F33777F33337F33EEEEE00EEEEE33337F33377FF3337F33EEEEEE00EE
          EE33337F333377F3337F33EEEEEE00EEEE33337F33337733337F33EEEEEEEEEE
          EE33337FFFFFFFFFFF7F33EEEEEEEEEEEE333377777777777773}
        Layout = blGlyphTop
        NumGlyphs = 2
      end
      object edNome: TEdit
        Left = 8
        Top = 72
        Width = 385
        Height = 21
        TabOrder = 1
      end
      object chkTodosPart: TCheckBox
        Left = 10
        Top = 48
        Width = 161
        Height = 17
        Caption = 'Todos os Participantes'
        TabOrder = 2
      end
    end
  end
  inherited Dock971: TDock97
    Top = 265
    Width = 439
    inherited tb97Fundo: TToolbar97
      Left = 269
      DockPos = 269
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 101
      DockPos = 101
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 259
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPESSOA, NOME'
      'FROM PESSOA'
      
        'WHERE IDPESSOA IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO =' +
        ' :IDFUNDACAO)'
      'ORDER BY NOME'
      ' ')
    ValidateWithMask = True
    Left = 394
    Top = 13
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PESSOA.NOME'
      'PESSOA.IDPESSOA')
    TipodeDado.Strings = (
      'C'
      'N')
    Descricao.Strings = (
      'Participante'
      'Identificador')
    Tabelas.Strings = (
      'PESSOA'
      'ELEGPATRO'
      'PESSOA PJ')
    CamposChave.Strings = (
      'ELEGPATRO.IDPESSOA'
      'PESSOA.NOME')
    Filtro.Strings = (
      'ELEGPATRO.IDPESSOA = PESSOA.IDPESSOA'
      'ELEGPATRO.IDPESSJUR = PJ.IDPESSOA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '60'
      '10')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 395
    Top = 64
  end
end
