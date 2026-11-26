inherited frmCancelaEvento: TfrmCancelaEvento
  Left = 278
  Top = 86
  HelpContext = 160037
  Caption = 'Cancelamento de Eventos Registrados'
  ClientHeight = 448
  ClientWidth = 679
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 679
    Height = 409
    object lblValores: TLabel
      Left = 15
      Top = 5
      Width = 222
      Height = 23
      AutoSize = False
      Caption = 'Dados do Participante'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object DBText1: TDBText
      Left = 90
      Top = 198
      Width = 70
      Height = 20
      AutoSize = True
      DataField = 'NOME'
      DataSource = dtsUltEventoGerador
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 21
      Top = 198
      Width = 57
      Height = 20
      Caption = 'Evento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object pnlInformacao: TPanel
      Left = 15
      Top = 222
      Width = 649
      Height = 178
      TabOrder = 3
      object Label10: TLabel
        Left = 532
        Top = 6
        Width = 90
        Height = 13
        Caption = 'Data do Evento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 9
        Top = 6
        Width = 138
        Height = 13
        Caption = 'Ações do Cancelamento'
      end
      object Label7: TLabel
        Left = 532
        Top = 48
        Width = 97
        Height = 13
        Caption = 'Data do Registro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 532
        Top = 87
        Width = 111
        Height = 13
        Caption = 'Data da Efetivação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object chkAcoes: TCMchklistbox
        Left = 9
        Top = 21
        Width = 517
        Height = 148
        GlyphChecked.Data = {
          E6000000424DE60000000000000076000000280000000E0000000E0000000100
          0400000000007000000000000000000000001000000000000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3300333333333333330033333333333333003333333333333300333333333333
          330033333333333333003300000000003300330FFFFFFFF03300330000000000
          3300333333333333330033333333333333003333333333333300333333333333
          33003333333333333300}
        GlyphUnchecked.Data = {
          E6000000424DE60000000000000076000000280000000E0000000E0000000100
          0400000000007000000000000000000000001000000000000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3300333333333333330033333333333333003333333333333300333333333333
          330033333333333333003300000000003300330FFFFFFFF03300330000000000
          3300333333333333330033333333333333003333333333333300333333333333
          33003333333333333300}
        GlyphTopMargin = 0
        GlyphLeftMargin = 0
        TextLeftMargin = 3
        ReadOnly = True
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 16
        ItemIndex = 0
        ParentFont = False
        TabOrder = 4
      end
      object dbedtEvento: TwwDBEdit
        Left = 532
        Top = 21
        Width = 95
        Height = 21
        DataField = 'DATAEVENTO'
        DataSource = dtsUltEventoGerador
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbedDataRegistro: TwwDBEdit
        Left = 532
        Top = 63
        Width = 95
        Height = 21
        DataField = 'DATAREGISTRO'
        DataSource = dtsUltEventoGerador
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbedDataEfetivado: TwwDBEdit
        Left = 532
        Top = 102
        Width = 95
        Height = 21
        DataField = 'DATAEFETIVADO'
        DataSource = dtsUltEventoGerador
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbchkEfetivado: TDBCheckBox
        Left = 534
        Top = 141
        Width = 97
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Efetivado'
        DataField = 'FLGEFETIVADO'
        DataSource = dtsUltEventoGerador
        TabOrder = 3
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
    end
    object Panel2: TPanel
      Left = 14
      Top = 29
      Width = 283
      Height = 166
      Enabled = False
      TabOrder = 0
      object Label2: TLabel
        Left = 11
        Top = 8
        Width = 69
        Height = 13
        Caption = 'Participante'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblPatro: TLabel
        Left = 11
        Top = 83
        Width = 80
        Height = 13
        Caption = 'Patrocinadora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 11
        Top = 46
        Width = 55
        Height = 13
        Caption = 'Matrícula'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 11
        Top = 123
        Width = 118
        Height = 13
        Caption = 'Plano Previdenciário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edNome: TEdit
        Left = 11
        Top = 21
        Width = 260
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object edPatro: TEdit
        Left = 11
        Top = 96
        Width = 260
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object edMatricula: TEdit
        Left = 11
        Top = 59
        Width = 154
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object edPlano: TEdit
        Left = 11
        Top = 136
        Width = 260
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
    end
    object Panel5: TPanel
      Left = 300
      Top = 29
      Width = 259
      Height = 166
      Enabled = False
      TabOrder = 1
      object Label1: TLabel
        Left = 11
        Top = 8
        Width = 118
        Height = 13
        Caption = 'Número de Inscrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblSitPatro: TLabel
        Left = 11
        Top = 45
        Width = 152
        Height = 13
        Caption = 'Situação na Patrocinadora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 11
        Top = 83
        Width = 105
        Height = 13
        Caption = 'Situação no Plano'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label12: TLabel
        Left = 11
        Top = 121
        Width = 129
        Height = 13
        Caption = 'Situação na Fundação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edInscNumero: TEdit
        Left = 11
        Top = 21
        Width = 154
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object edSitPatro: TEdit
        Left = 11
        Top = 58
        Width = 230
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object edSitPlano: TEdit
        Left = 11
        Top = 96
        Width = 230
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object edSitFundacao: TEdit
        Left = 11
        Top = 134
        Width = 230
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
    end
    object Panel3: TPanel
      Left = 562
      Top = 29
      Width = 103
      Height = 166
      TabOrder = 2
      object ConsPart1: TConsPart
        Left = 7
        Top = 62
        Width = 91
        Height = 37
        Caption = '&Consulta'
        Enabled = False
        Glyph.Data = {
          76020000424D7602000000000000760000002800000020000000200000000100
          0400000000000002000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333333333333333333333333333333333333300333333
          3333333333333333333333330033333333333333333333333333333303333330
          3333333333333333333333330333333033333333333333333333333330333300
          0333333333333333333333333033330003333333333333333333333330033003
          3333333333333333333333333003300333333333333333333333333333030033
          3333333333333333333333333303003333333333333333333333333333000333
          3333333333333333333333333300033333333333333333330033333333000333
          3333333333333330003333333300033333333337000733000333333303300003
          333333000000000333333333033000033333307888EE70333333333330300333
          33337088888EE073333333333030033333330888888888033333333333000333
          33330888888888033333333333000333333308E8888888033333333333300333
          333308EEE888880333333333333003333333307EEE8870333333333333330033
          3333330088800333333333333333003333333337000733333333333333330033
          3333333333333333333333333333003333333333333333333333333333333333
          3333333333333333333333333333333333333333333333333333333333333333
          3333333333333333333333333333333333333333333333333333}
      end
      object bbtnProcurar: TBitBtn
        Left = 7
        Top = 18
        Width = 91
        Height = 37
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
      object bbtnOpcoes: TBitBtn
        Left = 7
        Top = 105
        Width = 91
        Height = 37
        Hint = 'Verificar Regra de Concessão do Benefício'
        Cancel = True
        Caption = '&Opções'
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        Glyph.Data = {
          42010000424D4201000000000000760000002800000011000000110000000100
          040000000000CC00000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
          DDDDD0000000DDDDDDDDDDDDDDDDD0000000D00000DDDDD00000D0000000D0FF
          F0DDDDD0FFF0D0000000D0FFF0DDDDD0FFF0D0000000D00000DD0DD00000D000
          0000DDD0DDD0F0DDD0DDD0000000DDD0DD0FFF0DD0DDD0000000DDD000FFFFF0
          00DDD0000000DDDDDD0FFF0DDDDDD0000000DDDDDDD0F0DDDDDDD0000000DDDD
          DDDD0DDDDDDDD0000000DDDDDD00000DDDDDD0000000DDDDDD0FFF0DDDDDD000
          0000DDDDDD0FFF0DDDDDD0000000DDDDDD00000DDDDDD0000000DDDDDDDDDDDD
          DDDDD0000000}
      end
    end
  end
  inherited Dock971: TDock97
    Top = 409
    Width = 679
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 375
    Top = 65521
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryContribAssociar: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  HS.IDCONTRIBUICAOF,HS.IDPLANOPREVF, EV.IDPESSJUR,'
      '        EV.IDPESSOA,EV.IDPLANOPREV,EV.SEQPROPOSTA, C.NOME,'
      '        HS.DATAINICIO, HS.DATAFINAL '
      'FROM    HSTCONTEVENTOSPR HS, EVENTOSPREV EV, CONTRIBUICAO C'
      'WHERE   HS.IDEVENTOSPREV = :IDEVENTOSPREV'
      'AND     HS.IDEVENTOSPREV = EV.IDEVENTOSPREV'
      'AND     HS.IDCONTRIBUICAOF = C.IDCONTRIBUICAO'
      'AND     HS.FLGASSOCIADA = 0'
      'ORDER BY C.NOME           '
      ' ')
    ValidateWithMask = True
    Left = 459
    Top = 65525
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDEVENTOSPREV'
        ParamType = ptUnknown
      end>
  end
  object qryUltEventoGerador: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  EP.IDEVENTOGERADOR, EP.IDCALCULO,'
      
        '  EP.IDEVENTOSPREV,   EP.IDPESSOA,       EP.IDPESSJUR,      EP.I' +
        'DPLANOPREV,'
      
        '  EP.IDSITPLANOATUAL, EP.IDSITPARTATUAL, EP.IDSITFUNCATUAL, EP.I' +
        'DSITPLANONOVO,'
      
        '  EP.IDSITPARTNOVO,   EP.IDSITFUNCNOVO,  EP.DATAREGISTRO,   EP.D' +
        'ATAEFETIVADO,'
      
        '  EP.DATAEVENTO,      EP.FLGEFETIVADO,   EP.MATRICULA,      EP.S' +
        'EQPROPOSTA,'
      ''
      '  TO_CHAR(EP.TRGDTINCLUSAO,'#39'DD/MM/YYYY'#39') AS TRGDTINCLUSAO,'
      ''
      '  SP.DESCRICAO  AS DESCSITPART,'
      '  SPP.DESCRICAO AS DESCSITPLANOPREV,'
      '  SF.DESCRICAO  AS DESCSITFUNC ,'
      ''
      
        '  EG.NOME, EG.FLGINTERNO, EG.FLGENCERRABENEFI, EG.FLGCANCELAMENT' +
        'O'
      'FROM'
      
        '  EVENTOSPREV EP, SITPART SP, SITFUNC SF, SITPLANOPREV SPP, EVEN' +
        'TOGERADOR EG'
      'WHERE'
      '      EP.IDEVENTOSPREV   = :IDEVENTOSPREV'
      '  AND EP.IDSITPARTATUAL  = SP.IDSITPART'
      '  AND EP.IDSITPLANOATUAL = SPP.IDSITPLANOPREV'
      '  AND EP.IDSITFUNCATUAL  = SF.IDSITFUNC'
      '  AND EP.IDEVENTOGERADOR = EG.IDEVENTOGERADOR'
      'ORDER BY'
      '  EP.DATAREGISTRO'
      '  ')
    ValidateWithMask = True
    Left = 486
    Top = 205
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDEVENTOSPREV'
        ParamType = ptUnknown
      end>
  end
  object dtsUltEventoGerador: TwwDataSource
    AutoEdit = False
    DataSet = qryUltEventoGerador
    Left = 651
    Top = 65531
  end
  object qryGrava: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 52
    Top = 274
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 57
    Top = 334
  end
  object MontaSelectPart: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Participante'
    Colunas.Strings = (
      'ELEGPATRO.MATRICULA'
      'PESSOA.NOME'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'EVENTOSPREV.DATAEVENTO'
      'EVENTOGERADOR.NOME'
      'PLANPREV.NOME'
      'PT.NOME'
      'PARTPREVPLAN.INSCRICAODATA')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'D'
      'C'
      'C'
      'C'
      'D')
    Descricao.Strings = (
      'Matrícula'
      'Participante'
      'N° Inscrição'
      'Data Evento'
      'Evento'
      'Plano Previdenciário'
      'Patrocinadora'
      'Data Inscrição')
    SensivelACaixa.Strings = (
      'S'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'PESSOA PT'
      'PESSOAFISICA'
      'PLANPREV'
      'SITFUNC'
      'SITPART'
      'SITPLANOPREV'
      'PATRO'
      'ELEGPATRO'
      'PARTPREVPLAN'
      'EVENTOGERADOR'
      'EVENTOSPREV')
    CamposChave.Strings = (
      'ELEGPATRO.IDPESSOA'
      'ELEGPATRO.IDPESSJUR'
      'PLANPREV.IDPLANOPREV'
      'PESSOA.NOME'
      'ELEGPATRO.MATRICULA'
      'PT.NOME AS PATRO'
      'PLANPREV.NOME AS PLANO'
      'SITFUNC.DESCRICAO'
      'SITPART.DESCRICAO'
      'SITPLANOPREV.DESCRICAO'
      'PESSOA.NUMDOCUMENTO'
      'PESSOAFISICA.DATANASC'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'PARTPREVPLAN.INSCRICAODATA'
      'ELEGPATRO.DATADEMISSAO'
      'PARTPREVPLAN.SALMANTIDO'
      'SITFUNC.IDSITFUNC'
      'SITPART.IDSITPART'
      'SITPLANOPREV.IDSITPLANOPREV'
      'PARTPREVPLAN.SEQPROPOSTA'
      'PATRO.NUMOPCOES'
      'PATRO.FLGOBRIGAOP1'
      'PATRO.FLGOBRIGAOP2'
      'PATRO.FLGOBRIGAOP3'
      'ELEGPATRO.VALORBASE1'
      'ELEGPATRO.VALORBASE2'
      'ELEGPATRO.VALORBASE3'
      'PARTPREVPLAN.TEMPOAFASTADO'
      'EVENTOSPREV.DATAEVENTO'
      'EVENTOSPREV.IDEVENTOSPREV'
      'EVENTOSPREV.FLGMIGRADO')
    Filtro.Strings = (
      'PESSOA.IDPESSOA              = PARTPREVPLAN.IDPESSOA'
      'PESSOAFISICA.IDPESSOA        = PARTPREVPLAN.IDPESSOA'
      'PT.IDPESSOA                  = ELEGPATRO.IDPESSJUR'
      'PATRO.IDPESSOA               = PARTPREVPLAN.IDPESSJUR'
      'ELEGPATRO.IDPESSJUR          = PARTPREVPLAN.IDPESSJUR'
      'ELEGPATRO.IDPESSOA           = PARTPREVPLAN.IDPESSOA'
      'PLANPREV.IDPLANOPREV         = PARTPREVPLAN.IDPLANOPREV'
      'ELEGPATRO.IDSITFUNC          = SITFUNC.IDSITFUNC'
      'PARTPREVPLAN.IDSITPART       = SITPART.IDSITPART'
      'PARTPREVPLAN.IDSITPLANOPREV  = SITPLANOPREV.IDSITPLANOPREV'
      'EVENTOSPREV.IDPESSJUR = PARTPREVPLAN.IDPESSJUR'
      'EVENTOSPREV.IDPLANOPREV = PARTPREVPLAN.IDPLANOPREV'
      'EVENTOSPREV.IDPESSOA = PARTPREVPLAN.IDPESSOA'
      'EVENTOSPREV.SEQPROPOSTA = PARTPREVPLAN.SEQPROPOSTA'
      'EVENTOGERADOR.IDEVENTOGERADOR = EVENTOSPREV.IDEVENTOGERADOR')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '30'
      '10'
      '12'
      '30'
      '30'
      '30'
      '12')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    ApenasLetraENum.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    ComparaMaiuscula.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    BeforeOpenCds = MontaSelectPartBeforeOpenCds
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 51
    Top = 399
  end
  object qryProcessoBenef: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT P.NUMEROPROCESSO'
      'FROM   PROCESSOBENEF P, BENEFBFCIARIO BF, BENEFICIO B'
      'WHERE  P.NUMEROPROCESSO = BF.NUMEROPROCESSO'
      'AND    P.IDEVENTOGERADOR = :IDEVENTOGERADOR'
      'AND    P.DTREGISTRO >= TO_DATE(:DATAREGISTRO,'#39'DD/MM/YYYY'#39')'
      'AND    BF.IDTITULAR   = :IDPESSOA'
      'AND    BF.IDPESSJUR   = :IDPESSJUR'
      'AND    BF.IDPLANOPREV = :IDPLANOPREV'
      'AND    BF.IDBENEFICIO = B.IDBENEFICIO'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 654
    Top = 47
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDEVENTOGERADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREGISTRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object qryContribEvento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDCONTRIBUICAO'
      'FROM   CONTPREVEVENTO'
      'WHERE  IDEVENTOGERADOR = :IDEVENTOGERADOR')
    ValidateWithMask = True
    Left = 284
    Top = 65526
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDEVENTOGERADOR'
        ParamType = ptUnknown
      end>
  end
  object qryVerificaDataFinal: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  CPP.DATAFINAL'
      
        'FROM    CONTRIBPREVPARTP CPP, HSTCONTEVENTOSPR HS, EVENTOSPREV E' +
        'V'
      'WHERE   HS.IDEVENTOSPREV    = :IDEVENTOSPREV'
      'AND     HS.IDEVENTOSPREV    = EV.IDEVENTOSPREV'
      'AND     HS.FLGASSOCIADA     = 1'
      'AND     CPP.IDPESSJUR       = EV.IDPESSJUR'
      'AND     CPP.IDPLANOPREV     = EV.IDPLANOPREV'
      'AND     CPP.IDPESSOA        = EV.IDPESSOA'
      'AND     CPP.SEQPROPOSTA     = EV.SEQPROPOSTA'
      'AND     CPP.IDCONTRIBUICAO  = HS.IDCONTRIBUICAOF'
      '')
    ValidateWithMask = True
    Left = 451
    Top = 254
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDEVENTOSPREV'
        ParamType = ptUnknown
      end>
  end
  object qryLogOcorrencia: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      
        'SELECT IDMOVBENEF, IDPLANOPREV, IDTITULAR, NUMEROPROCESSO, SEQPR' +
        'OPOSTA,  DATAMOV,'
      
        '       VALORTOTAL, DATAINICIO,  IDPESSJUR, IDBENEFICIO,    IDPES' +
        'SOA,     TIPOMOV,'
      
        '       VALORATUAL, VALORCOTAS,  DATAFINAL,DATAINICIOANT,   DATAF' +
        'INALANT, VALORATUALANT,'
      '       IDSITANTERIOR'
      'FROM   MOVBENEF'
      'WHERE  IDMOVBENEF = (SELECT MAX(IDMOVBENEF)'
      '                     FROM   MOVBENEF'
      '                     WHERE  IDPESSJUR       = :IDPESSJUR'
      '                     AND    IDPLANOPREV     = :IDPLANOPREV'
      '                     AND    IDTITULAR       = :IDTITULAR'
      '                     AND    SEQPROPOSTA     = :SEQPROPOSTA'
      '                     AND    IDPESSOA        = :IDPESSOA'
      '                     AND    IDBENEFICIO     = :IDBENEFICIO'
      '                     AND    NUMEROPROCESSO  = :NUMEROPROCESSO'
      '                     AND    TIPOMOV         <> 10'
      '                     AND    IDDESFAZER IS NULL)'
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 285
    Top = 186
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDBENEFICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'NUMEROPROCESSO'
        ParamType = ptUnknown
      end>
  end
  object qryEventoTransfPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   EP.IDEVENTOSPREV,'
      '   EP.IDEVENTOGERADOR,'
      '   EP.IDPESSOA,'
      '   EP.IDPESSJUR,'
      '   EP.IDPLANOPREV,'
      '   EP.IDSITPLANOATUAL,'
      '   EP.IDSITPARTATUAL,'
      '   EP.IDSITFUNCATUAL,'
      '   EP.IDSITPLANONOVO,'
      '   EP.IDSITPARTNOVO,'
      '   EP.IDSITFUNCNOVO,'
      '   EP.DATAREGISTRO,'
      '   EP.DATAEFETIVADO,'
      '   EP.DATAEVENTO,'
      '   EP.FLGEFETIVADO,'
      '   SP.DESCRICAO AS DESCSITPART,'
      '   SPP.DESCRICAO AS DESCSITPLANOPREV,'
      '   SF.DESCRICAO AS DESCSITFUNC ,'
      '   EP.SEQPROPOSTA,'
      '   EG.NOME, EG.FLGINTERNO, EG.FLGENCERRABENEFI  '
      'FROM'
      '   EVENTOSPREV EP,'
      '   SITPART SP,'
      '   SITFUNC SF,'
      '   SITPLANOPREV SPP,'
      '   EVENTOGERADOR EG'
      'WHERE  EP.IDEVENTOSPREV = :IDEVENTOSPREV'
      '       AND EP.IDSITPARTATUAL = SP.IDSITPART'
      '       AND EP.IDSITPLANOATUAL = SPP.IDSITPLANOPREV'
      '       AND EP.IDSITFUNCATUAL = SF.IDSITFUNC'
      '       AND EP.IDEVENTOGERADOR = EG.IDEVENTOGERADOR'
      'ORDER BY EP.DATAREGISTRO'
      ' ')
    ValidateWithMask = True
    Left = 489
    Top = 361
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDEVENTOSPREV'
        ParamType = ptUnknown
      end>
  end
  object qryDesfazDocumentos: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT -1 AS CODDOCUMENTO, '#39'0000/00'#39'  AS MESREFERENCIA FROM DUAL')
    UpdateObject = updDesfazDocumentos
    ValidateWithMask = True
    Left = 243
    Top = 260
  end
  object updDesfazDocumentos: TUpdateSQL
    ModifySQL.Strings = (
      'update DOCUMENTO'
      'set'
      '  MOECODIGO = :MOECODIGO'
      'where'
      '  CODDOCUMENTO = :OLD_CODDOCUMENTO')
    InsertSQL.Strings = (
      'insert into DOCUMENTO'
      '  (CODDOCUMENTO, MOECODIGO)'
      'values'
      '  (:CODDOCUMENTO, :MOECODIGO)')
    DeleteSQL.Strings = (
      'delete from DOCUMENTO'
      'where'
      '  CODDOCUMENTO = :OLD_CODDOCUMENTO')
    Left = 243
    Top = 302
  end
  object qryAux2: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 113
    Top = 334
  end
end
