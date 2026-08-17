inherited frmParamRelBeneficios: TfrmParamRelBeneficios
  Left = 224
  Top = 94
  Caption = 'Relatório de Processos de Benefício'
  ClientHeight = 323
  ClientWidth = 553
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 553
    Height = 284
    object Label2: TLabel
      Left = 24
      Top = 72
      Width = 118
      Height = 13
      Caption = 'Número do Processo'
    end
    object Label3: TLabel
      Left = 24
      Top = 112
      Width = 69
      Height = 13
      Caption = 'Participante'
    end
    object Label4: TLabel
      Left = 24
      Top = 153
      Width = 55
      Height = 13
      Caption = 'Matrícula'
    end
    object Label5: TLabel
      Left = 24
      Top = 198
      Width = 71
      Height = 13
      Caption = 'Inscrição Nº'
    end
    object Label6: TLabel
      Left = 165
      Top = 153
      Width = 80
      Height = 13
      Caption = 'Patrocinadora'
    end
    object Label7: TLabel
      Left = 165
      Top = 198
      Width = 33
      Height = 13
      Caption = 'Plano'
    end
    object edNumProcesso: TEdit
      Left = 24
      Top = 87
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
      TabOrder = 0
    end
    object edParticipante: TEdit
      Left = 24
      Top = 129
      Width = 424
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
    object edMatricula: TEdit
      Left = 24
      Top = 171
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
    object edNumInsc: TEdit
      Left = 24
      Top = 210
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
      TabOrder = 3
    end
    object edPatrocinadora: TEdit
      Left = 165
      Top = 171
      Width = 283
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
    object edPlano: TEdit
      Left = 165
      Top = 210
      Width = 283
      Height = 21
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
    object GroupBox1: TGroupBox
      Left = 24
      Top = 9
      Width = 412
      Height = 58
      TabOrder = 6
      object Label1: TLabel
        Left = 12
        Top = 24
        Width = 206
        Height = 13
        Caption = 'Escolha o Processo de Benefício ...'
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
    object chkImprimirLog: TCheckBox
      Left = 24
      Top = 240
      Width = 241
      Height = 17
      Caption = 'Imprimir Log de Ocorrências'
      TabOrder = 7
    end
    object chkExibirReserva: TCheckBox
      Left = 24
      Top = 259
      Width = 211
      Height = 17
      Caption = 'Exibir Reservas do Participante'
      TabOrder = 8
    end
  end
  inherited Dock971: TDock97
    Top = 284
    Width = 553
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
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
      'P.NUMEROPROCESSO'
      'PTIT.NOME'
      'P.DTEVENTO'
      'BF.NOME'
      'EL.MATRICULA'
      'PP.INSCRICAONUMERO'
      'PTIT.NOME')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'D'
      'C'
      'N'
      'C')
    Descricao.Strings = (
      'Nº do Processo'
      'Participante Titular'
      'Data do Evento'
      'Benefício'
      'Matrícula'
      'Nº de Inscrição'
      'Titular')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PROCESSOBENEF P'
      'PESSOA PES'
      'PESSOA PTIT'
      'PESSOA PPAT'
      'PLANPREV PL'
      'BENEFICIO BF'
      'BENEFPLANPREV BFP'
      'ELEGPATRO EL'
      'PARTPREVPLAN PP'
      'BENEFBFCIARIO B')
    CamposChave.Strings = (
      'P.NUMEROPROCESSO'
      'B.IDTITULAR'
      'PES.NOME'
      'EL.MATRICULA'
      'PPAT.NOME'
      'PP.INSCRICAONUMERO'
      'PL.NOME'
      'BFP.TPMODALIDADE')
    Filtro.Strings = (
      'B.NUMEROPROCESSO = P.NUMEROPROCESSO'
      'B.IDPESSOA       = PES.IDPESSOA'
      'EL.IDPESSJUR     = PPAT.IDPESSOA'
      'PP.IDPESSOA      = EL.IDPESSOA'
      'PP.IDPESSJUR     = EL.IDPESSJUR'
      'PP.IDPLANOPREV   = PL.IDPLANOPREV'
      'B.IDTITULAR      = PP.IDPESSOA'
      'B.IDPESSJUR      = PP.IDPESSJUR'
      'B.IDPLANOORIGEM    = PP.IDPLANOPREV'
      'B.IDPLANOPREV    = BFP.IDPLANOPREV'
      'B.IDBENEFICIO    = BFP.IDBENEFICIO'
      'B.IDBENEFICIO    = BF.IDBENEFICIO'
      'B.IDTITULAR      = PTIT.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '15'
      '30'
      '30'
      '15'
      '15'
      '10'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 468
    Top = 109
  end
end
