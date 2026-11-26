inherited frmParamRelMovReserva: TfrmParamRelMovReserva
  Left = 154
  Top = 104
  Caption = 'Relatório de Consulta ao Extrato de Reservas de um Participante'
  ClientHeight = 354
  ClientWidth = 460
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 460
    Height = 315
    object GroupBox1: TGroupBox
      Left = 24
      Top = 9
      Width = 412
      Height = 58
      TabOrder = 0
      object Label1: TLabel
        Left = 12
        Top = 24
        Width = 145
        Height = 13
        Caption = 'Escolha o Participante ...'
      end
      object bbtnProcurar: TBitBtn
        Left = 312
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
    object GroupBox2: TGroupBox
      Left = 24
      Top = 67
      Width = 412
      Height = 148
      TabOrder = 1
      object Label3: TLabel
        Left = 12
        Top = 18
        Width = 69
        Height = 13
        Caption = 'Participante'
      end
      object Label4: TLabel
        Left = 12
        Top = 59
        Width = 55
        Height = 13
        Caption = 'Matrícula'
      end
      object Label5: TLabel
        Left = 12
        Top = 104
        Width = 71
        Height = 13
        Caption = 'Inscrição Nº'
      end
      object Label6: TLabel
        Left = 153
        Top = 59
        Width = 80
        Height = 13
        Caption = 'Patrocinadora'
      end
      object Label7: TLabel
        Left = 153
        Top = 104
        Width = 33
        Height = 13
        Caption = 'Plano'
      end
      object edParticipante: TEdit
        Left = 12
        Top = 35
        Width = 386
        Height = 21
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object edMatricula: TEdit
        Left = 12
        Top = 77
        Width = 121
        Height = 21
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object edNumInsc: TEdit
        Left = 12
        Top = 119
        Width = 121
        Height = 21
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object edPatrocinadora: TEdit
        Left = 153
        Top = 77
        Width = 245
        Height = 21
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
      object edPlano: TEdit
        Left = 153
        Top = 119
        Width = 245
        Height = 21
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
      end
    end
    object GroupBox7: TGroupBox
      Left = 24
      Top = 216
      Width = 412
      Height = 46
      TabOrder = 2
      object Label15: TLabel
        Left = 8
        Top = 18
        Width = 141
        Height = 13
        Caption = 'Mês de Referência entre'
      end
      object Label16: TLabel
        Left = 244
        Top = 18
        Width = 8
        Height = 13
        Caption = 'e'
      end
      object edMesCobIni: TMaskEdit
        Left = 153
        Top = 14
        Width = 82
        Height = 21
        EditMask = '!9999/99;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 7
        ParentFont = False
        TabOrder = 0
        Text = '    /  '
      end
      object edMesCobFim: TMaskEdit
        Left = 255
        Top = 14
        Width = 82
        Height = 21
        EditMask = '!9999/99;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 7
        ParentFont = False
        TabOrder = 1
        Text = '    /  '
      end
    end
    object GroupBox3: TGroupBox
      Left = 24
      Top = 263
      Width = 412
      Height = 41
      TabOrder = 3
      object Label2: TLabel
        Left = 8
        Top = 18
        Width = 95
        Height = 13
        Caption = 'Tipo de Reserva'
      end
      object CbTipoReserva: TComboBox
        Left = 153
        Top = 12
        Width = 226
        Height = 21
        ItemHeight = 13
        TabOrder = 0
        Text = 'Todas'
        Items.Strings = (
          'Ativa'
          'Controle'
          'Todas')
      end
    end
  end
  inherited Dock971: TDock97
    Top = 315
    Width = 460
    inherited tb97Fundo: TToolbar97
      Left = 290
      DockPos = 353
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 123
      DockPos = 185
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 477
    Top = 27
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'ELEGPATRO.MATRICULA'
      'PESSOA.NOME'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'PLANPREV.NOME'
      'PATRO.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Participante'
      'N° de Inscrição'
      'Plano Previdenciário'
      'Patrocinadora')
    SensivelACaixa.Strings = (
      'S'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'ELEGPATRO'
      'PARTPREVPLAN'
      'PESSOA PATRO'
      'PLANPREV'
      'SITFUNC'
      'SITPART'
      'SITPLANOPREV'
      'PESSOAFISICA')
    CamposChave.Strings = (
      'ELEGPATRO.IDPESSOA'
      'ELEGPATRO.IDPESSJUR'
      'PLANPREV.IDPLANOPREV'
      'PESSOA.NOME'
      'PATRO.NOME AS PATRO'
      'PLANPREV.NOME AS PLANO'
      'PARTPREVPLAN.SEQPROPOSTA'
      'ELEGPATRO.MATRICULA'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'SITPART.FLGINTERNO')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = ELEGPATRO.IDPESSOA'
      'ELEGPATRO.IDPESSOA = PARTPREVPLAN.IDPESSOA'
      'ELEGPATRO.IDPESSJUR = PARTPREVPLAN.IDPESSJUR'
      'PARTPREVPLAN.IDPLANOPREV = PLANPREV.IDPLANOPREV'
      'PATRO.IDPESSOA = ELEGPATRO.IDPESSJUR'
      'ELEGPATRO.IDSITFUNC = SITFUNC.IDSITFUNC(+)'
      'PARTPREVPLAN.IDSITPART = SITPART.IDSITPART'
      'PARTPREVPLAN.IDSITPLANOPREV = SITPLANOPREV.IDSITPLANOPREV'
      'PESSOA.IDPESSOA = PESSOAFISICA.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '10'
      '10'
      '10'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 478
    Top = 129
  end
  object qryparamglobal: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MOEDACORRENTE '
      'FROM PARAMGLOBAL '
      'WHERE IDPESSOA = :IDEMPRESA')
    ValidateWithMask = True
    Left = 30
    Top = 311
    ParamData = <
      item
        DataType = ftString
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end>
  end
end
