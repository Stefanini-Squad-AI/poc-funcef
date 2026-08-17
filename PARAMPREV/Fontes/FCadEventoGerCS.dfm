inherited frmCadEventoGerCS: TfrmCadEventoGerCS
  Left = 284
  Top = 252
  HelpContext = 160166
  Caption = 'Cadastro de Evento Gerador'
  ClientHeight = 392
  ClientWidth = 509
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 509
    Height = 306
    object Label1: TLabel
      Left = 15
      Top = 46
      Width = 55
      Height = 13
      Caption = 'Categoria'
    end
    object Label3: TLabel
      Left = 15
      Top = 10
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object dbedDescEventoGerador: TwwDBEdit
      Left = 15
      Top = 24
      Width = 285
      Height = 21
      DataField = 'NOME'
      DataSource = ds
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
    object dbrgrpTpEvento: TDBRadioGroup
      Left = 319
      Top = 10
      Width = 185
      Height = 39
      Caption = ' Tipo de Evento '
      Columns = 2
      DataField = 'FLGRISCO'
      DataSource = ds
      Items.Strings = (
        '&Risco'
        '&Não Risco')
      TabOrder = 1
      TabStop = True
      Values.Strings = (
        'R'
        'S')
    end
    object cbFlgInterno: TComboBox
      Left = 15
      Top = 60
      Width = 285
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      TabOrder = 2
      Text = 'cbFlgInterno'
      OnChange = cbFlgInternoChange
      Items.Strings = (
        'Acidente'
        'Doença'
        'Outros Eventos Temporários'
        'Afastamento com Manutenção'
        'Afastamento sem Manutenção'
        'Cancelamento por Inadimplência'
        'Cancelamento por Iniciativa do Participante'
        'Cancelamento por Descumprimento de Prazo'
        'Demissão da Patrocinadora'
        'Demissão com Cancelamento'
        'Demissão com Manutenção de Contribuição'
        'Manutenção Parcial'
        'Demissão com Manutenção de Saldo de Conta'
        'Demissão para Aposentadoria'
        'Programa de Demissão Voluntária'
        'Falecimento'
        'Idade'
        'Invalidez'
        'Registro de Inadimplência'
        'Tempo de Serviço'
        'Transferência de Reserva'
        'Transferência de Plano'
        'Retorno de Mantido Para Ativo'
        'Inscrição do Participante'
        'Reinscrição do Participante'
        'Reclusão'
        'Transferência de Patrocinadora'
        'Aposentadoria INSS'
        'Falecimento INSS'
        ' ')
    end
    object gbSituacoes: TGroupBox
      Left = 15
      Top = 92
      Width = 283
      Height = 86
      Caption = ' Atualizar imediatamente no registro do evento '
      TabOrder = 3
      object dbchkFLGSITFUNCIMEDIA: TDBCheckBox
        Left = 16
        Top = 15
        Width = 189
        Height = 17
        Caption = 'Situação na Patrocinadora'
        DataField = 'FLGSITFUNCIMEDIA'
        DataSource = ds
        TabOrder = 0
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object dbchkFLGSITPLANOIMEDI: TDBCheckBox
        Left = 16
        Top = 31
        Width = 133
        Height = 17
        Caption = 'Situação no Plano'
        DataField = 'FLGSITPLANOIMEDI'
        DataSource = ds
        TabOrder = 1
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object dbchkFLGSITPARTIMEDIA: TDBCheckBox
        Left = 16
        Top = 48
        Width = 161
        Height = 17
        Caption = 'Situação na Fundação'
        DataField = 'FLGSITPARTIMEDIA'
        DataSource = ds
        TabOrder = 2
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBCheckBox1: TDBCheckBox
        Left = 16
        Top = 64
        Width = 189
        Height = 17
        Caption = 'Inclui Histórico Funcional'
        DataField = 'FLGINCLUIHISTFUNC'
        DataSource = ds
        TabOrder = 3
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
    end
    object dbrgrpEncerraBenef: TDBRadioGroup
      Left = 319
      Top = 52
      Width = 185
      Height = 39
      Caption = ' Evento Encerra Benefícios '
      Columns = 2
      DataField = 'FLGENCERRABENEFI'
      DataSource = ds
      Items.Strings = (
        'Sim'
        'Não')
      TabOrder = 4
      TabStop = True
      Values.Strings = (
        '1'
        '0')
    end
    object dbrgrpPermiteRetorno: TDBRadioGroup
      Left = 319
      Top = 178
      Width = 185
      Height = 39
      Caption = ' Permite Retorno '
      Columns = 2
      DataField = 'FLGACEITARETORNO'
      DataSource = ds
      Items.Strings = (
        'Sim'
        'Não')
      TabOrder = 8
      Values.Strings = (
        '1'
        '0')
    end
    object dbrgrpAltsitPatro: TDBRadioGroup
      Left = 15
      Top = 181
      Width = 283
      Height = 46
      Caption = 'Permite Alterar Situação na Patrocinadora'
      Columns = 2
      DataField = 'FLGALTERASITFUNC'
      DataSource = ds
      Items.Strings = (
        'Sim'
        'Não')
      TabOrder = 6
      Values.Strings = (
        '1'
        '0')
    end
    object dbrgrpGeraSalVirtual: TDBRadioGroup
      Left = 319
      Top = 94
      Width = 185
      Height = 39
      Caption = ' Gerar Salário Virtual '
      Columns = 2
      DataField = 'FLGGERASALVIRTUAL'
      DataSource = ds
      Items.Strings = (
        'Sim'
        'Não')
      TabOrder = 5
      Values.Strings = (
        '1'
        '0')
    end
    object dbrgrpSimula: TDBRadioGroup
      Left = 319
      Top = 221
      Width = 185
      Height = 39
      Caption = ' Simular Antes de Registrar '
      Columns = 2
      DataField = 'FLGSIMULA'
      DataSource = ds
      Items.Strings = (
        'Sim'
        'Não')
      TabOrder = 9
      Values.Strings = (
        '1'
        '0')
    end
    object btnCarta: TBitBtn
      Left = 15
      Top = 262
      Width = 283
      Height = 41
      Caption = 'Criar Carta do Evento'
      TabOrder = 10
      OnClick = btnCartaClick
    end
    object dbrgrpMantemInscricao: TDBRadioGroup
      Left = 319
      Top = 263
      Width = 185
      Height = 39
      Caption = ' Manter No. Inscrição Origem '
      Columns = 2
      DataField = 'FLGMANTEMINSC'
      DataSource = ds
      Items.Strings = (
        'Sim'
        'Não')
      TabOrder = 11
      Values.Strings = (
        '1'
        '0')
    end
    object dbrgrpCancelamento: TDBRadioGroup
      Left = 319
      Top = 136
      Width = 185
      Height = 39
      Caption = 'Permite Cancelar Evento'
      Columns = 2
      DataField = 'FLGCANCELAMENTO'
      DataSource = ds
      Items.Strings = (
        'Sim'
        'Não')
      TabOrder = 7
      Values.Strings = (
        '1'
        '0')
    end
  end
  inherited Dock972: TDock97
    Width = 509
  end
  inherited Dock971: TDock97
    Top = 353
    Width = 509
    inherited tb97Fundo: TToolbar97
      Left = 302
      DockPos = 302
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 133
      DockPos = 133
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 13
    Top = 300
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 247
    Top = 65535
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update EVENTOGERADOR'
      'set'
      '  NOME = :NOME,'
      '  FLGRISCO = :FLGRISCO,'
      '  FLGINTERNO = :FLGINTERNO,'
      '  FLGSITFUNCIMEDIA = :FLGSITFUNCIMEDIA,'
      '  FLGSITPARTIMEDIA = :FLGSITPARTIMEDIA,'
      '  FLGSITPLANOIMEDI = :FLGSITPLANOIMEDI,'
      '  FLGENCERRABENEFI = :FLGENCERRABENEFI,'
      '  CODPORTFORMAULT = :CODPORTFORMAULT,'
      '  FLGCOBRAULTIMA = :FLGCOBRAULTIMA,'
      '  FLGDESCFOLHAULT = :FLGDESCFOLHAULT,'
      '  FLGCOBRAULT13 = :FLGCOBRAULT13,'
      '  FLGACEITARETORNO = :FLGACEITARETORNO,'
      '  FLGALTERASITFUNC = :FLGALTERASITFUNC,'
      '  FLGGERASALVIRTUAL = :FLGGERASALVIRTUAL,'
      '  FLGSIMULA = :FLGSIMULA,'
      '  IDFUNDACAO = :IDFUNDACAO,'
      '  FLGINCLUIHISTFUNC = :FLGINCLUIHISTFUNC,'
      '  FLGMANTEMINSC = :FLGMANTEMINSC,'
      '  FLGCANCELAMENTO = :FLGCANCELAMENTO'
      'where'
      '  IDEVENTOGERADOR = :OLD_IDEVENTOGERADOR')
    InsertSQL.Strings = (
      'insert into EVENTOGERADOR'
      
        '  (IDEVENTOGERADOR, NOME, FLGRISCO, FLGINTERNO, FLGSITFUNCIMEDIA' +
        ', FLGSITPARTIMEDIA, '
      
        '   FLGSITPLANOIMEDI, FLGENCERRABENEFI, CODPORTFORMAULT, FLGCOBRA' +
        'ULTIMA, '
      
        '   FLGDESCFOLHAULT, FLGCOBRAULT13, FLGACEITARETORNO, FLGALTERASI' +
        'TFUNC, '
      '   FLGGERASALVIRTUAL, FLGSIMULA, IDFUNDACAO, FLGINCLUIHISTFUNC,'
      '   FLGMANTEMINSC, FLGCANCELAMENTO)'
      'values'
      
        '  (:IDEVENTOGERADOR, :NOME, :FLGRISCO, :FLGINTERNO, :FLGSITFUNCI' +
        'MEDIA, '
      
        '   :FLGSITPARTIMEDIA, :FLGSITPLANOIMEDI, :FLGENCERRABENEFI, :COD' +
        'PORTFORMAULT, '
      
        '   :FLGCOBRAULTIMA, :FLGDESCFOLHAULT, :FLGCOBRAULT13, :FLGACEITA' +
        'RETORNO, '
      
        '   :FLGALTERASITFUNC, :FLGGERASALVIRTUAL, :FLGSIMULA, :IDFUNDACA' +
        'O, :FLGINCLUIHISTFUNC, '
      '   :FLGMANTEMINSC, :FLGCANCELAMENTO)'
      ' ')
    DeleteSQL.Strings = (
      'delete from EVENTOGERADOR'
      'where'
      '  IDEVENTOGERADOR = :OLD_IDEVENTOGERADOR')
    Left = 287
    Top = 65535
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'NOME')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Evento Gerador')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'EVENTOGERADOR')
    CamposChave.Strings = (
      'IDEVENTOGERADOR')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '80')
    ExibePergunta = False
    Left = 393
    Top = 4
  end
  inherited ImlPadrao: TImageList
    Left = 47
    Top = 271
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 214
    Top = 154
  end
  inherited qry: TwwQuery
    BeforePost = qryBeforePost
    AfterPost = qryAfterPost
    AfterScroll = qryAfterScroll
    SQL.Strings = (
      'SELECT  IDEVENTOGERADOR,     NOME,          FLGRISCO,'
      '        FLGINTERNO,    FLGSITFUNCIMEDIA,   FLGSITPARTIMEDIA,'
      
        '        FLGSITPLANOIMEDI,    FLGENCERRABENEFI,  CODPORTFORMAULT,' +
        ' FLGCOBRAULTIMA,'
      
        '        FLGDESCFOLHAULT,     FLGCOBRAULT13, FLGACEITARETORNO, FL' +
        'GALTERASITFUNC ,'
      
        '        NVL(FLGGERASALVIRTUAL,0) FLGGERASALVIRTUAL, FLGCANCELAME' +
        'NTO, '
      '        NVL(FLGSIMULA,0) FLGSIMULA, IDFUNDACAO,'
      '        FLGINCLUIHISTFUNC, TEMPLATE, FLGMANTEMINSC'
      'FROM  EVENTOGERADOR'
      'WHERE IDEVENTOGERADOR = :IDEVENTOGERADOR'
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 324
    Top = 65535
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDEVENTOGERADOR'
        ParamType = ptUnknown
      end>
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 471
    Top = 62
  end
  object qryPortForma: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM PORTADORFORMA'
      'WHERE RECPAG = '#39'R'#39
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 481
    Top = 8
  end
  object qryModCarta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT PE.NOME, PE.NUMDOCUMENTO AS CPF, EL.MATRICULA, PT.NOME AS' +
        ' PATRO,'
      '       PV.NOME AS PLANO,'
      '       EP.LOGRADOURO AS ENDERECO, EP.NUMERO, EP.COMPLEMENTO,'
      '       EP.BAIRRO, CD.NOME AS CIDADE, CD.UF,'
      '       PF.DATANASC, EG.NOME AS DESCRICAOEVENTO,'
      '       EV.DATAEVENTO AS DATAEVENTO,'
      '       SFA.DESCRICAO AS SITUACAOANTPATRO,'
      '       SLA.DESCRICAO AS SITUACAOANTPLANO,'
      '       SPA.DESCRICAO AS SITUACAOANTFUNDACAO,'
      '       SFN.DESCRICAO AS SITUACAONOVAPATRO,'
      '       SLN.DESCRICAO AS SITUACAONOVAPLANO,'
      '       SPN.DESCRICAO AS SITUACAONOVAFUNDACAO,'
      '       EG.TEMPLATE'
      'FROM PESSOA PE, PESSOA PT, PESSOAFISICA PF, ELEGPATRO EL,'
      '     PARTPREVPLAN PP, PLANPREV PV, ENDPESS EP, CIDADES CD,'
      '     EVENTOSPREV EV, EVENTOGERADOR EG,'
      '     SITFUNC SFA, SITPLANOPREV SLA, SITPART SPA,'
      '     SITFUNC SFN, SITPLANOPREV SLN, SITPART SPN'
      'WHERE (EV.IDPESSOA        = -1)'
      '  AND (EV.IDPESSJUR       = -1)'
      '  AND (EV.IDPLANOPREV     = -1)'
      '  AND (EV.IDEVENTOGERADOR = -1)'
      '  AND (EV.IDEVENTOSPREV = (SELECT MAX(EV1.IDEVENTOSPREV)'
      '                           FROM EVENTOSPREV EV1'
      
        '                           WHERE EV1.IDPESSOA        = EV.IDPESS' +
        'OA'
      
        '                            AND  EV1.IDPESSJUR       = EV.IDPESS' +
        'JUR'
      
        '                            AND  EV1.IDEVENTOGERADOR = EV.IDEVEN' +
        'TOGERADOR'
      
        '                            AND  EV1.IDPLANOPREV     = EV.IDPLAN' +
        'OPREV))'
      '  AND (EV.IDEVENTOGERADOR = EG.IDEVENTOGERADOR)'
      '  AND (EL.IDPESSOA        = EV.IDPESSOA)'
      '  AND (EL.IDPESSJUR       = EV.IDPESSJUR)'
      '  AND (PE.IDPESSOA        = EL.IDPESSOA)'
      '  AND (PT.IDPESSOA        = EL.IDPESSJUR)'
      '  AND (PE.IDPESSOA        = PF.IDPESSOA)'
      '  AND (PP.IDPESSOA        = EL.IDPESSOA)'
      '  AND (PP.IDPESSJUR       = EL.IDPESSJUR)'
      '  AND (PP.IDPLANOPREV     = EV.IDPLANOPREV)'
      '  AND (PP.SEQPROPOSTA     = -1)'
      '  AND (PP.IDPLANOPREV     = PV.IDPLANOPREV)'
      '  AND (PE.IDENDCORRESP    = EP.IDENDERECO)'
      '  AND (PE.IDPESSOA        = EP.IDPESSOA)'
      '  AND (EP.IDCIDADES       = CD.IDCIDADES)'
      '  AND (EV.IDSITFUNCATUAL  = SFA.IDSITFUNC)'
      '  AND (EV.IDSITPLANOATUAL = SLA.IDSITPLANOPREV)'
      '  AND (EV.IDSITPARTATUAL  = SPA.IDSITPART)'
      '  AND (EV.IDSITFUNCNOVO   = SFN.IDSITFUNC)'
      '  AND (EV.IDSITPLANONOVO  = SLN.IDSITPLANOPREV)'
      '  AND (EV.IDSITPARTNOVO   = SPN.IDSITPART)'
      '')
    ValidateWithMask = True
    Left = 215
    Top = 211
  end
  object dsModCarta: TwwDataSource
    DataSet = qryModCarta
    Left = 216
    Top = 224
  end
  object ppbModCarta: TppBDEPipeline
    DataSource = dsModCarta
    CloseDataSource = True
    UserName = 'bModCarta'
    Left = 216
    Top = 240
    object ppbModCartappField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppbModCartappField2: TppField
      FieldAlias = 'CPF'
      FieldName = 'CPF'
      FieldLength = 18
      DisplayWidth = 18
      Position = 1
    end
    object ppbModCartappField3: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 13
      DisplayWidth = 13
      Position = 2
    end
    object ppbModCartappField4: TppField
      FieldAlias = 'PATRO'
      FieldName = 'PATRO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 3
    end
    object ppbModCartappField5: TppField
      FieldAlias = 'PLANO'
      FieldName = 'PLANO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 4
    end
    object ppbModCartappField6: TppField
      FieldAlias = 'ENDERECO'
      FieldName = 'ENDERECO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 5
    end
    object ppbModCartappField7: TppField
      FieldAlias = 'NUMERO'
      FieldName = 'NUMERO'
      FieldLength = 8
      DisplayWidth = 8
      Position = 6
    end
    object ppbModCartappField8: TppField
      FieldAlias = 'COMPLEMENTO'
      FieldName = 'COMPLEMENTO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 7
    end
    object ppbModCartappField9: TppField
      FieldAlias = 'BAIRRO'
      FieldName = 'BAIRRO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 8
    end
    object ppbModCartappField10: TppField
      FieldAlias = 'CIDADE'
      FieldName = 'CIDADE'
      FieldLength = 50
      DisplayWidth = 50
      Position = 9
    end
    object ppbModCartappField11: TppField
      FieldAlias = 'UF'
      FieldName = 'UF'
      FieldLength = 3
      DisplayWidth = 3
      Position = 10
    end
    object ppbModCartappField12: TppField
      FieldAlias = 'DATANASC'
      FieldName = 'DATANASC'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 11
    end
    object ppbModCartappField13: TppField
      FieldAlias = 'DESCRICAOEVENTO'
      FieldName = 'DESCRICAOEVENTO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 12
    end
    object ppbModCartappField14: TppField
      FieldAlias = 'DATAEVENTO'
      FieldName = 'DATAEVENTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 13
    end
    object ppbModCartappField15: TppField
      FieldAlias = 'SITUACAOANTPATRO'
      FieldName = 'SITUACAOANTPATRO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 14
    end
    object ppbModCartappField16: TppField
      FieldAlias = 'SITUACAOANTPLANO'
      FieldName = 'SITUACAOANTPLANO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 15
    end
    object ppbModCartappField17: TppField
      FieldAlias = 'SITUACAOANTFUNDACAO'
      FieldName = 'SITUACAOANTFUNDACAO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 16
    end
    object ppbModCartappField18: TppField
      FieldAlias = 'SITUACAONOVAPATRO'
      FieldName = 'SITUACAONOVAPATRO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 17
    end
    object ppbModCartappField19: TppField
      FieldAlias = 'SITUACAONOVAPLANO'
      FieldName = 'SITUACAONOVAPLANO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 18
    end
    object ppbModCartappField20: TppField
      FieldAlias = 'SITUACAONOVAFUNDACAO'
      FieldName = 'SITUACAONOVAFUNDACAO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 19
    end
    object ppbModCartappField21: TppField
      FieldAlias = 'TEMPLATE'
      FieldName = 'TEMPLATE'
      FieldLength = 1
      DataType = dtBLOB
      DisplayWidth = 10
      Position = 20
      Searchable = False
      Sortable = False
    end
  end
  object DsgnCM: TppDesigner
    Caption = 'Gerador de Carta do Evento'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Icon.Data = {
      0000010001002020100000000000E80200001600000028000000200000004000
      0000010004000000000080020000000000000000000000000000000000000000
      000000008000008000000080800080000000800080008080000080808000C0C0
      C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
      0000000000033333300003333330000000000000003BBBBBB3003BBBBBB30000
      00000000003BBBBBB3003BBBBBB30000000000000003BBBB3003BBBBBB300000
      000000000003BBBB3003BBBBB3000000000000000003BBBB3003BBBB30000000
      000000000003BBBBB33BBBBB30000000000000000003BBBBBBBBBBB300000000
      000000000003BBBBBBBBBBB300000000000000700003BBBB333BBBBB30000000
      000000800003BBBB3003BBBBB30000000000F8F00003BBBB3003BBBBB3000000
      008F8F800003BBBB3003BBBBB3000070F8F877F80003BBBB333BBBBBB300007F
      8F00F08F003BBBBBBBBBBBBB3000007800FFF048003BBBBBBBBBBBB300000000
      FFFFF08F8003333333333330000070FFFFCCF804F07000000000000000007FFF
      CCFFFF0F8F0000000000000000007FCCFFFCCF074807000000000000000078FF
      FCCFFFF08F80700000000000000007FCCFFFCCF044F8070000000000000007FF
      FFCCFFFF0F8F8000000000000000078FCCFFFCCF07F77000000000000000007F
      FFFCCFFFF07000000000000000000078FCCFFFCCFF0700000000000000000007
      FFFFCCFFFF80000000000000000000078FCCFFFF877000000000000000000000
      7FFFFF8770000000000000000000000007FF8770000000000000000000000000
      007770000000000000000000000000000000000000000000000000000000FFFE
      0781FFFC0300FFFC0300FFFE0601FFFE0603FFFE0607FFFE0007FFFE000FFFFE
      000FFFDE0007FF0E0603FC0E0603F00E0603C0060003C0040007C004000FC002
      001F0001FFFF0001FFFF0000FFFF00007FFF80003FFF80003FFF80007FFFC001
      FFFFC000FFFFE000FFFFE001FFFFF007FFFFF81FFFFFFC7FFFFFFFFFFFFF}
    Position = poScreenCenter
    ShowComponents = [scLabel, scMemo, scRichText, scCalc, scImage, scShape, scLine, scBarCode, scTeeChart, scDBText, scDBMemo, scDBRichText, scDBCalc, scDBImage, scDBBarCode, scDBTeeChart, scRegion]
    Report = pprModCarta
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    WindowState = wsMaximized
    Left = 272
    Top = 152
  end
  object pprModCarta: TppReport
    AutoStop = False
    DataPipeline = ppbModCarta
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'rptDvr'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.DatabaseSettings.Name = 'Carta do Evento'
    Template.Format = ftASCII
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 272
    Top = 208
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'ppbModCarta'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppDetailBand2: TppDetailBand
      Save = True
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 229394
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'rpCartaInadimplLabel2'
        Caption = 
          'Texto a Ser Alterado Texto a Ser Alterado Texto a Ser Alterado T' +
          'exto a Ser Alterado Texto a Ser Alterado Texto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 12435
        mmTop = 74083
        mmWidth = 177536
        BandType = 4
      end
      object ppLabel2: TppLabel
        UserName = 'rpCartaInadimplLabel4'
        Caption = 
          'Texto a Ser Alterado Texto a Ser Alterado Texto a Ser Alterado T' +
          'exto a Ser Alterado Texto a Ser Alterado Texto a Ser Alterado '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 1852
        mmTop = 84667
        mmWidth = 202142
        BandType = 4
      end
      object ppLabel3: TppLabel
        UserName = 'rpCartaInadimplLabel7'
        Caption = 
          'Texto a Ser Alterado Texto a Ser Alterado Texto a Ser Alterado T' +
          'exto a Ser Alterado Texto a Ser Alterado Texto a Ser Alterado '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 2646
        mmTop = 95250
        mmWidth = 202142
        BandType = 4
      end
      object ppLabel4: TppLabel
        UserName = 'rpCartaInadimplLabel9'
        Caption = 
          'Texto a Ser Alterado Texto a Ser Alterado Texto a Ser Alterado T' +
          'exto a Ser Alterado Texto a Ser Alterado '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 12171
        mmTop = 119327
        mmWidth = 168540
        BandType = 4
      end
      object ppLabel5: TppLabel
        UserName = 'rpCartaInadimplLblData'
        Caption = 'Rio de Janeiro, 10 de Outubro de 2003'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 1058
        mmTop = 4763
        mmWidth = 61119
        BandType = 4
      end
      object ppLabel6: TppLabel
        UserName = 'rpCartaInadimplLabel11'
        Caption = 'Prezado Senhor(a):'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 1058
        mmTop = 25135
        mmWidth = 30692
        BandType = 4
      end
      object ppLine1: TppLine
        UserName = 'rpCartaInadimplLine1'
        Weight = 0.75
        mmHeight = 1852
        mmLeft = 105569
        mmTop = 171450
        mmWidth = 90488
        BandType = 4
      end
      object ppLabel7: TppLabel
        UserName = 'rpCartaInadimplLabel12'
        Caption = 'Responsável'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 140229
        mmTop = 172773
        mmWidth = 19315
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 12171
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'ppLine54'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 7144
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel8: TppLabel
        UserName = 'ppLabel129'
        AutoSize = False
        Caption = 'AdmPREV'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 8467
        mmWidth = 197909
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'Calc46'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 8467
        mmWidth = 197380
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'Calc47'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 171450
        mmTop = 8467
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'NOME'
      DataPipeline = ppbModCarta
      OutlineSettings.CreateNode = True
      NewPage = True
      ReprintOnSubsequentPage = False
      UserName = 'rptDvrGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppbModCarta'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        Save = True
        mmBottomOffset = 0
        mmHeight = 30163
        mmPrintPosition = 0
        object ppLabel9: TppLabel
          UserName = 'ppLabel93'
          Caption = 'Aviso ao Participante - MODELO A SER ALTERADO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 5292
          mmLeft = 60590
          mmTop = 3175
          mmWidth = 103981
          BandType = 3
          GroupNo = 0
        end
        object ppLine3: TppLine
          UserName = 'ppLine53'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 28046
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
        object ppDBImage1: TppDBImage
          UserName = 'rpCartaInadimplDBImage1'
          MaintainAspectRatio = True
          Stretch = True
          DataField = 'IMAGEM'
          GraphicType = 'Bitmap'
          ParentDataPipeline = False
          mmHeight = 25135
          mmLeft = 1058
          mmTop = 2381
          mmWidth = 39688
          BandType = 3
          GroupNo = 0
        end
        object ppLabel10: TppLabel
          UserName = 'rpCartaInadimplLabel1'
          Caption = 'CEP'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 134673
          mmTop = 21167
          mmWidth = 5821
          BandType = 3
          GroupNo = 0
        end
        object ppDBText1: TppDBText
          UserName = 'rpCartaInadimplDBText1'
          DataField = 'CEP'
          DataPipeline = ppbModCarta
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppbModCarta'
          mmHeight = 3704
          mmLeft = 146315
          mmTop = 21166
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppDBText2: TppDBText
          UserName = 'rpCartaInadimplDBText2'
          DataField = 'BAIRRO'
          DataPipeline = ppbModCarta
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppbModCarta'
          mmHeight = 3704
          mmLeft = 140494
          mmTop = 15611
          mmWidth = 20108
          BandType = 3
          GroupNo = 0
        end
        object ppDBText3: TppDBText
          UserName = 'rpCartaInadimplDBText3'
          DataField = 'CIDADE'
          DataPipeline = ppbModCarta
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppbModCarta'
          mmHeight = 3704
          mmLeft = 42333
          mmTop = 21166
          mmWidth = 48419
          BandType = 3
          GroupNo = 0
        end
        object ppDBText4: TppDBText
          UserName = 'rpCartaInadimplDBText4'
          DataField = 'CODESTADO'
          DataPipeline = ppbModCarta
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppbModCarta'
          mmHeight = 3704
          mmLeft = 112977
          mmTop = 21166
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppDBText5: TppDBText
          UserName = 'rpCartaInadimplDBText5'
          DataField = 'NUMERO'
          DataPipeline = ppbModCarta
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppbModCarta'
          mmHeight = 3704
          mmLeft = 116946
          mmTop = 15610
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppDBText6: TppDBText
          UserName = 'rpCartaInadimplDBText6'
          DataField = 'ENDERECO'
          DataPipeline = ppbModCarta
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppbModCarta'
          mmHeight = 3704
          mmLeft = 42333
          mmTop = 15611
          mmWidth = 69586
          BandType = 3
          GroupNo = 0
        end
        object ppDBText7: TppDBText
          UserName = 'rpCartaInadimplDBText8'
          DataField = 'NOME'
          DataPipeline = ppbModCarta
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 14
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppbModCarta'
          mmHeight = 5821
          mmLeft = 42598
          mmTop = 8996
          mmWidth = 133615
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
end
