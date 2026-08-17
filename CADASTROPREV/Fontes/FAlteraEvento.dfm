inherited frmAlteraEvento: TfrmAlteraEvento
  Left = 944
  Top = 287
  HelpContext = 160037
  Caption = 'Alteração de Eventos'
  ClientHeight = 555
  ClientWidth = 684
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 684
    Height = 516
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
    object Label4: TLabel
      Left = 15
      Top = 198
      Width = 139
      Height = 20
      Caption = 'Dados do Evento'
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
      Width = 650
      Height = 278
      TabOrder = 3
      object Label9: TLabel
        Left = 11
        Top = 203
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
      object Label5: TLabel
        Left = 11
        Top = 85
        Width = 72
        Height = 13
        Caption = 'Data Evento'
        FocusControl = DBEdit1
      end
      object Label11: TLabel
        Left = 11
        Top = 124
        Width = 61
        Height = 13
        Caption = 'Data Volta'
        FocusControl = DBEdit2
      end
      object Label13: TLabel
        Left = 11
        Top = 163
        Width = 79
        Height = 13
        Caption = 'Data Registro'
        FocusControl = DBEdit3
      end
      object Label14: TLabel
        Left = 320
        Top = 8
        Width = 192
        Height = 13
        Caption = 'Situação Participante Plano Atual'
        FocusControl = DBEdit4
      end
      object Label15: TLabel
        Left = 320
        Top = 163
        Width = 257
        Height = 13
        Caption = 'Situação Participante na Patrocinadora Atual'
        FocusControl = DBEdit5
      end
      object Label16: TLabel
        Left = 11
        Top = 47
        Width = 133
        Height = 13
        Caption = 'Código Evento Gerador'
        FocusControl = DBEdit6
      end
      object Label17: TLabel
        Left = 320
        Top = 85
        Width = 156
        Height = 13
        Caption = 'Situação Participante Atual'
        FocusControl = DBEdit7
      end
      object Label18: TLabel
        Left = 11
        Top = 8
        Width = 76
        Height = 13
        Caption = 'Código Plano'
        FocusControl = DBEdit8
      end
      object Label19: TLabel
        Left = 320
        Top = 47
        Width = 193
        Height = 13
        Caption = 'Situação Participante Plano Novo'
        FocusControl = DBEdit9
      end
      object Label20: TLabel
        Left = 320
        Top = 124
        Width = 157
        Height = 13
        Caption = 'Situação Participante Novo'
        FocusControl = DBEdit10
      end
      object Label22: TLabel
        Left = 320
        Top = 203
        Width = 258
        Height = 13
        Caption = 'Situação Participante na Patrocinadora Novo'
        FocusControl = DBEdit12
      end
      object dbedDataEfetivado: TwwDBEdit
        Left = 11
        Top = 220
        Width = 95
        Height = 21
        DataField = 'DATAEFETIVADO'
        DataSource = DsAlteraEvendo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbchkEfetivado: TDBCheckBox
        Left = 11
        Top = 248
        Width = 97
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Efetivado'
        DataField = 'FLGEFETIVADO'
        DataSource = DsAlteraEvendo
        TabOrder = 1
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBEdit1: TDBEdit
        Left = 11
        Top = 101
        Width = 95
        Height = 21
        DataField = 'DATAEVENTO'
        DataSource = DsAlteraEvendo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object DBEdit2: TDBEdit
        Left = 11
        Top = 140
        Width = 95
        Height = 21
        DataField = 'DATAVOLTA'
        DataSource = DsAlteraEvendo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object DBEdit3: TDBEdit
        Left = 11
        Top = 179
        Width = 95
        Height = 21
        DataField = 'DATAREGISTRO'
        DataSource = DsAlteraEvendo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
      object DBEdit4: TDBEdit
        Left = 320
        Top = 24
        Width = 30
        Height = 21
        DataField = 'IDSITPLANOATUAL'
        DataSource = DsAlteraEvendo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
      object DBEdit5: TDBEdit
        Left = 320
        Top = 179
        Width = 30
        Height = 21
        DataField = 'IDSITFUNCATUAL'
        DataSource = DsAlteraEvendo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
      end
      object DBEdit6: TDBEdit
        Left = 11
        Top = 63
        Width = 30
        Height = 21
        DataField = 'IDEVENTOGERADOR'
        DataSource = DsAlteraEvendo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
      end
      object DBEdit7: TDBEdit
        Left = 320
        Top = 101
        Width = 30
        Height = 21
        DataField = 'IDSITPARTATUAL'
        DataSource = DsAlteraEvendo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
      end
      object DBEdit8: TDBEdit
        Left = 11
        Top = 24
        Width = 30
        Height = 21
        DataField = 'IDPLANOPREV'
        DataSource = DsAlteraEvendo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
      end
      object DBEdit9: TDBEdit
        Left = 320
        Top = 63
        Width = 30
        Height = 21
        DataField = 'IDSITPLANONOVO'
        DataSource = DsAlteraEvendo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 10
      end
      object DBEdit10: TDBEdit
        Left = 320
        Top = 140
        Width = 30
        Height = 21
        DataField = 'IDSITPARTNOVO'
        DataSource = DsAlteraEvendo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 11
      end
      object DBEdit12: TDBEdit
        Left = 320
        Top = 220
        Width = 30
        Height = 21
        DataField = 'IDSITFUNCNOVO'
        DataSource = DsAlteraEvendo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 12
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 43
        Top = 24
        Width = 260
        Height = 21
        DataField = 'IDPLANOPREV'
        DataSource = DsAlteraEvendo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        KeyField = 'IDPLANOPREV'
        ListField = 'NOME'
        ListSource = DscPlanoDesc
        ParentFont = False
        TabOrder = 13
      end
      object DBLookupComboBox2: TDBLookupComboBox
        Left = 348
        Top = 24
        Width = 260
        Height = 21
        DataField = 'IDSITPLANOATUAL'
        DataSource = DsAlteraEvendo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        KeyField = 'IDSITPLANOPREV'
        ListField = 'DESCRICAO'
        ListSource = DscPlanoAtual
        ParentFont = False
        TabOrder = 14
      end
      object DBLookupComboBox3: TDBLookupComboBox
        Left = 43
        Top = 63
        Width = 260
        Height = 21
        DataField = 'IDEVENTOGERADOR'
        DataSource = DsAlteraEvendo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        KeyField = 'IDEVENTOGERADOR'
        ListField = 'NOME'
        ListSource = DscEventoGerador
        ParentFont = False
        TabOrder = 15
      end
      object DBLookupComboBox4: TDBLookupComboBox
        Left = 348
        Top = 63
        Width = 260
        Height = 21
        DataField = 'IDSITPLANONOVO'
        DataSource = DsAlteraEvendo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        KeyField = 'IDSITPLANOPREV'
        ListField = 'DESCRICAO'
        ListSource = DscPlanoNovo
        ParentFont = False
        TabOrder = 16
      end
      object DBLookupComboBox5: TDBLookupComboBox
        Left = 348
        Top = 101
        Width = 260
        Height = 21
        DataField = 'IDSITPARTATUAL'
        DataSource = DsAlteraEvendo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        KeyField = 'IDSITPART'
        ListField = 'DESCRICAO'
        ListSource = DscSitPartAtual
        ParentFont = False
        TabOrder = 17
      end
      object DBLookupComboBox6: TDBLookupComboBox
        Left = 348
        Top = 140
        Width = 260
        Height = 21
        DataField = 'IDSITPARTNOVO'
        DataSource = DsAlteraEvendo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        KeyField = 'IDSITPART'
        ListField = 'DESCRICAO'
        ListSource = DscSitPartNovo
        ParentFont = False
        TabOrder = 18
      end
      object DBLookupComboBox7: TDBLookupComboBox
        Left = 348
        Top = 179
        Width = 260
        Height = 21
        DataField = 'IDSITFUNCATUAL'
        DataSource = DsAlteraEvendo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        KeyField = 'IDSITFUNC'
        ListField = 'DESCRICAO'
        ListSource = DscSitPartPatrocAtual
        ParentFont = False
        TabOrder = 19
      end
      object DBLookupComboBox8: TDBLookupComboBox
        Left = 348
        Top = 219
        Width = 260
        Height = 21
        DataField = 'IDSITFUNCNOVO'
        DataSource = DsAlteraEvendo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        KeyField = 'IDSITFUNC'
        ListField = 'DESCRICAO'
        ListSource = DscSitPartPatrocNovo
        ParentFont = False
        TabOrder = 20
      end
    end
    object Panel2: TPanel
      Left = 15
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
      object bbtnProcurar: TBitBtn
        Left = 7
        Top = 62
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
    end
  end
  inherited Dock971: TDock97
    Top = 516
    Width = 684
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
      3
      (
        ''
        'Text'
        0)
      (
        ''
        'Filter'
        0)
      (
        ''
        'DisplayLabel'
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
    Left = 706
    Top = 233
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
    Left = 695
    Top = 3
  end
  object qryGrava: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 768
    Top = 230
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 685
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
    Left = 783
    Top = 27
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
    Left = 698
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
    Left = 743
    Top = 346
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
    Left = 741
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
    Left = 701
    Top = 285
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
    ValidateWithMask = True
    Left = 743
    Top = 128
  end
  object qryAux2: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 749
    Top = 282
  end
  object QryAlteraEvendo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM EVENTOSPREV'
      'WHERE IDEVENTOSPREV = :IDEVENTOSPREV')
    UpdateObject = updAlteraEvendo
    ValidateWithMask = True
    Left = 969
    Top = 424
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDEVENTOSPREV'
        ParamType = ptUnknown
      end>
    object QryAlteraEvendoIDEVENTOSPREV: TFloatField
      FieldName = 'IDEVENTOSPREV'
      Origin = 'HOM1.EVENTOSPREV.IDEVENTOSPREV'
    end
    object QryAlteraEvendoIDSITPLANOATUAL: TFloatField
      DisplayLabel = 'Situação Participante Plano Atual'
      FieldName = 'IDSITPLANOATUAL'
      Origin = 'HOM1.EVENTOSPREV.IDSITPLANOATUAL'
    end
    object QryAlteraEvendoIDREGRACALCBENEF: TFloatField
      FieldName = 'IDREGRACALCBENEF'
      Origin = 'HOM1.EVENTOSPREV.IDREGRACALCBENEF'
    end
    object QryAlteraEvendoIDBENEFICIO: TFloatField
      FieldName = 'IDBENEFICIO'
      Origin = 'HOM1.EVENTOSPREV.IDBENEFICIO'
    end
    object QryAlteraEvendoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'HOM1.EVENTOSPREV.IDPESSOA'
    end
    object QryAlteraEvendoIDSITFUNCATUAL: TFloatField
      DisplayLabel = 'Situação Participante na Patrocinadora Atual'
      FieldName = 'IDSITFUNCATUAL'
      Origin = 'HOM1.EVENTOSPREV.IDSITFUNCATUAL'
    end
    object QryAlteraEvendoIDEVENTOGERADOR: TFloatField
      DisplayLabel = 'Código Evento Gerador'
      FieldName = 'IDEVENTOGERADOR'
      Origin = 'HOM1.EVENTOSPREV.IDEVENTOGERADOR'
    end
    object QryAlteraEvendoIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
      Origin = 'HOM1.EVENTOSPREV.IDPESSJUR'
    end
    object QryAlteraEvendoIDSITPARTATUAL: TFloatField
      DisplayLabel = 'Situação Participante Atual'
      FieldName = 'IDSITPARTATUAL'
      Origin = 'HOM1.EVENTOSPREV.IDSITPARTATUAL'
    end
    object QryAlteraEvendoIDPLANOPREV: TFloatField
      DisplayLabel = 'Código Plano'
      FieldName = 'IDPLANOPREV'
      Origin = 'HOM1.EVENTOSPREV.IDPLANOPREV'
    end
    object QryAlteraEvendoIDSITPLANONOVO: TFloatField
      FieldName = 'IDSITPLANONOVO'
      Origin = 'HOM1.EVENTOSPREV.IDSITPLANONOVO'
    end
    object QryAlteraEvendoIDSITPARTNOVO: TFloatField
      DisplayLabel = 'Situação Participante Novo'
      FieldName = 'IDSITPARTNOVO'
      Origin = 'HOM1.EVENTOSPREV.IDSITPARTNOVO'
    end
    object QryAlteraEvendoDATAREGISTRO: TDateTimeField
      DisplayLabel = 'Data Registro'
      FieldName = 'DATAREGISTRO'
      Origin = 'HOM1.EVENTOSPREV.DATAREGISTRO'
    end
    object QryAlteraEvendoDATAEVENTO: TDateTimeField
      DisplayLabel = 'Data Evento'
      FieldName = 'DATAEVENTO'
      Origin = 'HOM1.EVENTOSPREV.DATAEVENTO'
    end
    object QryAlteraEvendoFLGEFETIVADO: TFloatField
      DisplayLabel = 'Efetivado'
      FieldName = 'FLGEFETIVADO'
      Origin = 'HOM1.EVENTOSPREV.FLGEFETIVADO'
    end
    object QryAlteraEvendoDATAEFETIVADO: TDateTimeField
      FieldName = 'DATAEFETIVADO'
      Origin = 'HOM1.EVENTOSPREV.DATAEFETIVADO'
    end
    object QryAlteraEvendoDATAALTERADO: TDateTimeField
      FieldName = 'DATAALTERADO'
      Origin = 'HOM1.EVENTOSPREV.DATAALTERADO'
    end
    object QryAlteraEvendoDATAVOLTA: TDateTimeField
      DisplayLabel = 'Data Volta'
      FieldName = 'DATAVOLTA'
      Origin = 'HOM1.EVENTOSPREV.DATAVOLTA'
    end
    object QryAlteraEvendoFLGSITFUNCIMED: TFloatField
      FieldName = 'FLGSITFUNCIMED'
      Origin = 'HOM1.EVENTOSPREV.FLGSITFUNCIMED'
    end
    object QryAlteraEvendoIDSITFUNCNOVO: TFloatField
      DisplayLabel = 'Situação Participante na Patrocinadora Novo'
      FieldName = 'IDSITFUNCNOVO'
      Origin = 'HOM1.EVENTOSPREV.IDSITFUNCNOVO'
    end
    object QryAlteraEvendoFLGSITPARTIMED: TFloatField
      FieldName = 'FLGSITPARTIMED'
      Origin = 'HOM1.EVENTOSPREV.FLGSITPARTIMED'
    end
    object QryAlteraEvendoFLGSITPLANOIMED: TFloatField
      FieldName = 'FLGSITPLANOIMED'
      Origin = 'HOM1.EVENTOSPREV.FLGSITPLANOIMED'
    end
    object QryAlteraEvendoSEQPROPOSTA: TFloatField
      FieldName = 'SEQPROPOSTA'
      Origin = 'HOM1.EVENTOSPREV.SEQPROPOSTA'
    end
    object QryAlteraEvendoFLGTPDEMISSAO: TFloatField
      FieldName = 'FLGTPDEMISSAO'
      Origin = 'HOM1.EVENTOSPREV.FLGTPDEMISSAO'
    end
    object QryAlteraEvendoIDREGRARESGATE: TFloatField
      FieldName = 'IDREGRARESGATE'
      Origin = 'HOM1.EVENTOSPREV.IDREGRARESGATE'
    end
    object QryAlteraEvendoFLGCOBROUPATRO: TFloatField
      FieldName = 'FLGCOBROUPATRO'
      Origin = 'HOM1.EVENTOSPREV.FLGCOBROUPATRO'
    end
    object QryAlteraEvendoTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'HOM1.EVENTOSPREV.TRGDTINCLUSAO'
    end
    object QryAlteraEvendoTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'HOM1.EVENTOSPREV.TRGUSERINCLUSAO'
      Size = 30
    end
    object QryAlteraEvendoSALPARTICIPACAO: TFloatField
      FieldName = 'SALPARTICIPACAO'
      Origin = 'HOM1.EVENTOSPREV.SALPARTICIPACAO'
    end
    object QryAlteraEvendoINSCRICAONUMERO: TFloatField
      FieldName = 'INSCRICAONUMERO'
      Origin = 'HOM1.EVENTOSPREV.INSCRICAONUMERO'
    end
    object QryAlteraEvendoFLGMIGRADO: TFloatField
      FieldName = 'FLGMIGRADO'
      Origin = 'HOM1.EVENTOSPREV.FLGMIGRADO'
    end
    object QryAlteraEvendoDATAREQUERIMENTO: TDateTimeField
      FieldName = 'DATAREQUERIMENTO'
      Origin = 'HOM1.EVENTOSPREV.DATAREQUERIMENTO'
    end
    object QryAlteraEvendoMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Origin = 'HOM1.EVENTOSPREV.MATRICULA'
      Size = 13
    end
    object QryAlteraEvendoIDCALCULO: TFloatField
      FieldName = 'IDCALCULO'
      Origin = 'HOM1.EVENTOSPREV.IDCALCULO'
    end
    object QryAlteraEvendoIDCONCESSAOBENEFICIOWEB: TFloatField
      FieldName = 'IDCONCESSAOBENEFICIOWEB'
      Origin = 'HOM1.EVENTOSPREV.IDCONCESSAOBENEFICIOWEB'
    end
  end
  object DsAlteraEvendo: TDataSource
    DataSet = QryAlteraEvendo
    Left = 979
    Top = 434
  end
  object updAlteraEvendo: TUpdateSQL
    ModifySQL.Strings = (
      ' update EVENTOSPREV set '
      '       IDSITPLANOATUAL = :IDSITPLANOATUAL,'
      '       IDREGRACALCBENEF = :IDREGRACALCBENEF,'
      '       IDBENEFICIO = :IDBENEFICIO,'
      '       IDPESSOA = :IDPESSOA,'
      '       IDSITFUNCATUAL = :IDSITFUNCATUAL,'
      '       IDEVENTOGERADOR = :IDEVENTOGERADOR,'
      '       IDPESSJUR = :IDPESSJUR,'
      '       IDSITPARTATUAL = :IDSITPARTATUAL,'
      '       IDPLANOPREV = :IDPLANOPREV,'
      '       IDSITPLANONOVO = :IDSITPLANONOVO,'
      '       IDSITPARTNOVO = :IDSITPARTNOVO,'
      '       DATAREGISTRO = :DATAREGISTRO,'
      '       DATAEVENTO = :DATAEVENTO,'
      '       FLGEFETIVADO = :FLGEFETIVADO,'
      '       DATAEFETIVADO = :DATAEFETIVADO,'
      '       DATAALTERADO = :DATAALTERADO,'
      '       DATAVOLTA = :DATAVOLTA,'
      '       FLGSITFUNCIMED = :FLGSITFUNCIMED,'
      '       IDSITFUNCNOVO = :IDSITFUNCNOVO,'
      '       FLGSITPARTIMED = :FLGSITPARTIMED,'
      '       FLGSITPLANOIMED = :FLGSITPLANOIMED,'
      '       SEQPROPOSTA = :SEQPROPOSTA,'
      '       FLGTPDEMISSAO = :FLGTPDEMISSAO,'
      '       IDREGRARESGATE = :IDREGRARESGATE,'
      '       FLGCOBROUPATRO = :FLGCOBROUPATRO,'
      '       TRGDTINCLUSAO = :TRGDTINCLUSAO,'
      '       TRGUSERINCLUSAO = :TRGUSERINCLUSAO,'
      '       SALPARTICIPACAO = :SALPARTICIPACAO,'
      '       INSCRICAONUMERO = :INSCRICAONUMERO,'
      '       FLGMIGRADO = :FLGMIGRADO,'
      '       DATAREQUERIMENTO = :DATAREQUERIMENTO,'
      '       MATRICULA = :MATRICULA,'
      '       IDCALCULO = :IDCALCULO,'
      '       IDCONCESSAOBENEFICIOWEB = :IDCONCESSAOBENEFICIOWEB'
      ' where IDEVENTOSPREV = :OLD_IDEVENTOSPREV')
    Left = 914
    Top = 423
  end
  object QryPlanoDesc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select IDPLANOPREV, NOME from PLANPREV')
    ValidateWithMask = True
    Left = 896
    Top = 252
    object QryPlanoDescIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object QryPlanoDescNOME: TStringField
      FieldName = 'NOME'
    end
  end
  object DscPlanoDesc: TDataSource
    DataSet = QryPlanoDesc
    Left = 903
    Top = 258
  end
  object QryPlanoAtual: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select IDSITPLANOPREV, DESCRICAO from SitPlanoPrev ')
    ValidateWithMask = True
    Left = 953
    Top = 248
    object QryPlanoAtualIDSITPLANOPREV: TFloatField
      FieldName = 'IDSITPLANOPREV'
    end
    object StringField1: TStringField
      FieldName = 'DESCRICAO'
    end
  end
  object DscPlanoAtual: TDataSource
    DataSet = QryPlanoAtual
    Left = 963
    Top = 254
  end
  object QryEventoGerador: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select IDEVENTOGERADOR, NOME from EVENTOGERADOR ')
    ValidateWithMask = True
    Left = 897
    Top = 292
    object QryEventoGeradorIDEVENTOGERADOR: TFloatField
      FieldName = 'IDEVENTOGERADOR'
    end
    object StringField2: TStringField
      FieldName = 'NOME'
    end
  end
  object DscEventoGerador: TDataSource
    DataSet = QryEventoGerador
    Left = 907
    Top = 298
  end
  object DscPlanoNovo: TDataSource
    DataSet = QryPlanoNovo
    Left = 967
    Top = 294
  end
  object QryPlanoNovo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select IDSITPLANOPREV, DESCRICAO from SitPlanoPrev ')
    ValidateWithMask = True
    Left = 957
    Top = 288
    object QryPlanoNovoIDSITPLANOPREV: TFloatField
      FieldName = 'IDSITPLANOPREV'
    end
    object StringField3: TStringField
      FieldName = 'DESCRICAO'
    end
  end
  object QrySitPartAtual: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select IDSITPART, DESCRICAO from SitPart ')
    ValidateWithMask = True
    Left = 897
    Top = 332
    object QrySitPartAtualIDSITPART: TFloatField
      FieldName = 'IDSITPART'
    end
    object StringField4: TStringField
      FieldName = 'DESCRICAO'
    end
  end
  object DscSitPartAtual: TDataSource
    DataSet = QrySitPartAtual
    Left = 907
    Top = 338
  end
  object QrySitPartNovo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select IDSITPART, DESCRICAO from SitPart ')
    ValidateWithMask = True
    Left = 961
    Top = 328
    object QrySitPartNovoIDSITPART: TFloatField
      FieldName = 'IDSITPART'
    end
    object StringField5: TStringField
      FieldName = 'DESCRICAO'
    end
  end
  object DscSitPartNovo: TDataSource
    DataSet = QrySitPartNovo
    Left = 971
    Top = 334
  end
  object QrySitPartPatrocNovo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select IDSITFUNC, DESCRICAO from SitFunc')
    ValidateWithMask = True
    Left = 965
    Top = 376
    object QrySitPartPatrocNovoIDSITFUNC: TFloatField
      FieldName = 'IDSITFUNC'
    end
    object StringField6: TStringField
      FieldName = 'DESCRICAO'
    end
  end
  object DscSitPartPatrocNovo: TDataSource
    DataSet = QrySitPartPatrocNovo
    Left = 975
    Top = 382
  end
  object QrySitPartPatrocAtual: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select IDSITFUNC, DESCRICAO from SitFunc')
    ValidateWithMask = True
    Left = 905
    Top = 376
    object QrySitPartPatrocAtualIDSITFUNC: TFloatField
      FieldName = 'IDSITFUNC'
    end
    object StringField7: TStringField
      FieldName = 'DESCRICAO'
    end
  end
  object DscSitPartPatrocAtual: TDataSource
    DataSet = QrySitPartPatrocAtual
    Left = 915
    Top = 382
  end
end
