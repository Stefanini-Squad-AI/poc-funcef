inherited frmprelportformaversao: Tfrmprelportformaversao
  Left = 467
  Top = 383
  HelpContext = 180099
  Caption = 'Relatório de Portador Forma por Versão'
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    object Label4: TLabel
      Left = 1
      Top = 52
      Width = 526
      Height = 16
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Caption = 'Portador Forma de Pagamento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    object grpMesRef: TGroupBox
      Left = 1
      Top = 1
      Width = 526
      Height = 51
      Align = alTop
      Caption = 'Versão da Folha de Benefícios '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object dblcHistorico: TwwDBLookupCombo
        Left = 12
        Top = 19
        Width = 481
        Height = 23
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'HISTORICO'#9'50'#9'Histórico'#9'F'
          'DATAEFETIVACAO'#9'12'#9'Data Efetivação'#9'F'
          'DATAPREVPAGTO'#9'12'#9'Data Pagto.'#9'F'
          'MESREFERENCIA'#9'7'#9'Mês Ref.'#9'F')
        LookupTable = qryHistorico
        LookupField = 'IDHSTFOLHABENEF'
        Options = [loTitles]
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnChange = dblcHistoricoChange
      end
    end
    object chklstPortforma: TCheckListBox
      Left = 1
      Top = 68
      Width = 526
      Height = 165
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      TabOrder = 1
    end
  end
  inherited Dock971: TDock97
    inherited TB97oKCancelar: TToolbar97
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 83
  end
  object qryHistorico: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDHSTFOLHABENEF,'
      '  IDHSTFOLHABENEF||'#39' - '#39'||HISTORICO AS HISTORICO,'
      '  DATAEFETIVACAO,'
      '  DATAPREVPAGTO,'
      '  MESREFERENCIA'
      ''
      'FROM'
      '  HSTFOLHABENEF'
      ''
      'WHERE'
      '  FLGESTADO <> 2'
      ''
      'ORDER BY'
      '  IDHSTFOLHABENEF DESC'
      ''
      ' ')
    ValidateWithMask = True
    Left = 105
    Top = 89
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  H.IDHSTFOLHABENEF,'
      '  H.MES AS MESREFERENCIA,'
      '  E.MATRICULA,'
      '  PP.INSCRICAONUMERO,'
      '  H.IDTITULAR,'
      '  PD.IDPROVENTO,'
      '  PAT.NOME AS PATRO,'
      '  PL.NOME AS PLANO,'
      '  RESP.NOME AS NOMERECEBEDOR,'
      '  TIT.NOME AS NOMETITULAR,'
      '  PF.DATANASC,'
      '  PF.FLGISENTOIRRF,'
      '  PF.NUMDEPIRRF,'
      '  POF.DESCRICAO AS FORMAPAGTO,'
      '  H.NUMBANCO,'
      '  H.NUMAGENCIA,'
      '  H.CONTACORRENTE,'
      '  ED.LOGRADOURO,'
      '  ED.NUMERO,'
      '  ED.COMPLEMENTO,'
      '  ED.BAIRRO,'
      '  CID.NOME AS CIDADE,'
      '  ED.CEP,'
      '  EST.CODESTADO AS UF,'
      '  RP.CODPROVDESC,'
      '  RP.DESCRPROVDESC,'
      '  H.VALORINFO,'
      
        '  DECODE(PD.FLGDESCONTO,1,'#39'D'#39',DECODE(PD.FLGDESCONTO,0,'#39'P'#39')) AS T' +
        'PRUBRICA,'
      '  H.VALORPROVENTO'
      
        'FROM HISTRUBSAL H, PARTPREVPLAN PP, ELEGPATRO E, PROVDESC PD, RU' +
        'BRICAXPESS RP,'
      
        '     PLANPREV PL, PORTADORFORMA POF, PESSOAFISICA PF, ENDPESS ED' +
        ', PESSOA RESP,'
      '     PESSOA TIT, PESSOA PAT, CIDADES CID, ESTADO EST'
      'WHERE H.IDHSTFOLHABENEF = 1'
      'AND (H.FLGESTORNO = 0 OR H.FLGESTORNO IS NULL)'
      'AND PP.IDPESSOA = H.IDTITULAR'
      'AND E.IDPESSOA = H.IDTITULAR'
      'AND PD.IDPROVENTO = H.IDRUBRICA'
      'AND RP.IDPESSOA = H.IDPESSJUR'
      'AND RP.IDRUBRICA = PD.IDPROVENTO'
      'AND PL.IDPLANOPREV = H.IDPLANOPREV'
      'AND POF.CODPORTFORMA = H.CODPORTFORMA'
      'AND ED.IDPESSOA = H.IDTITULAR'
      'AND RESP.IDPESSOA = H.IDRESPONSAVEL'
      'AND TIT.IDPESSOA = H.IDTITULAR'
      'AND PF.IDPESSOA = H.IDTITULAR'
      'AND PAT.IDPESSOA = H.IDPATRO'
      'AND CID.IDCIDADES = ED.IDCIDADES'
      'AND EST.CODESTADO = CID.CODESTADO'
      'ORDER BY ED.CEP, PP.INSCRICAONUMERO'
      '')
    ValidateWithMask = True
    Left = 169
    Top = 81
  end
end
