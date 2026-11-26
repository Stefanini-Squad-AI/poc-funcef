inherited frmPRelDemPag: TfrmPRelDemPag
  Left = 128
  Top = 63
  HelpContext = 180056
  Caption = 'Emissão de Demonstrativo de Pagamento'
  ClientHeight = 471
  ClientWidth = 517
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 517
    Height = 432
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    object Splitter1: TSplitter
      Left = 1
      Top = 425
      Width = 515
      Height = 6
      Cursor = crVSplit
      Align = alBottom
    end
    object pnlInformacoes: TPanel
      Left = 1
      Top = 1
      Width = 515
      Height = 424
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 0
      object grpMesRef: TGroupBox
        Left = 1
        Top = 1
        Width = 513
        Height = 43
        Align = alTop
        Caption = ' Histórico da Folha de Benefícios '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object dblcHistorico: TwwDBLookupCombo
          Left = 12
          Top = 15
          Width = 481
          Height = 23
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'HISTORICO'#9'50'#9'Histórico'#9'F'
            'DATAEFETIVACAO'#9'10'#9'Data Efetivação'#9'F'
            'DATAPREVPAGTO'#9'10'#9'Data Pagamento'#9'F'
            'MESREFERENCIA'#9'7'#9'Mês'#9'F')
          LookupTable = qryHistorico
          LookupField = 'IDHSTFOLHABENEF'
          Options = [loColLines, loRowLines, loTitles]
          TabOrder = 0
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
          OnChange = dblcHistoricoChange
          OnDblClick = dblcHistoricoChange
        end
      end
      object Panel1: TPanel
        Left = 1
        Top = 266
        Width = 513
        Height = 88
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 3
        object Label1: TLabel
          Left = 0
          Top = 0
          Width = 513
          Height = 14
          Align = alTop
          Alignment = taCenter
          AutoSize = False
          Caption = 'Observações (4 linhas x 60 caracteres)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
        end
        object mmMSG: TMemo
          Left = 0
          Top = 14
          Width = 513
          Height = 74
          Align = alClient
          TabOrder = 0
          WantTabs = True
        end
      end
      object Panel2: TPanel
        Left = 1
        Top = 44
        Width = 513
        Height = 77
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object Splitter2: TSplitter
          Left = 251
          Top = 0
          Width = 3
          Height = 77
          Cursor = crHSplit
        end
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 251
          Height = 77
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 0
          object Label2: TLabel
            Left = 0
            Top = 0
            Width = 251
            Height = 16
            Align = alTop
            Alignment = taCenter
            AutoSize = False
            Caption = 'Patrocinadora'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Layout = tlCenter
          end
          object chklstPatro: TCheckListBox
            Left = 0
            Top = 16
            Width = 251
            Height = 61
            OnClickCheck = chklstPatroClickCheck
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            ParentFont = False
            TabOrder = 0
            OnClick = chklstPatroClick
          end
          object cboxPatro: TCheckBox
            Left = 3
            Top = -1
            Width = 16
            Height = 17
            Enabled = False
            TabOrder = 1
            OnClick = cboxPatroClick
          end
        end
        object Panel4: TPanel
          Left = 254
          Top = 0
          Width = 259
          Height = 77
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object Label3: TLabel
            Left = 0
            Top = 0
            Width = 259
            Height = 16
            Align = alTop
            Alignment = taCenter
            AutoSize = False
            Caption = 'Plano Previdenciário'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Layout = tlCenter
          end
          object chklstPlano: TCheckListBox
            Left = 0
            Top = 16
            Width = 259
            Height = 61
            OnClickCheck = chklstPlanoClickCheck
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            ParentFont = False
            TabOrder = 0
            OnClick = chklstPlanoClick
          end
          object cboxPlano: TCheckBox
            Left = 3
            Top = -1
            Width = 15
            Height = 17
            Enabled = False
            TabOrder = 1
            OnClick = cboxPlanoClick
          end
        end
      end
      object gbSalva: TGroupBox
        Left = 1
        Top = 354
        Width = 513
        Height = 69
        Align = alBottom
        Caption = ' Arquivo a ser gerado '
        TabOrder = 2
        object Bevel1: TBevel
          Left = 9
          Top = 18
          Width = 380
          Height = 19
        end
        object lblSalvar: TLabel
          Left = 14
          Top = 22
          Width = 369
          Height = 12
          AutoSize = False
          Caption = 'C:\ArqCheque.dat'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object SpeedButton4: TSpeedButton
          Left = 401
          Top = 12
          Width = 94
          Height = 26
          Caption = 'Salvar em'
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
            555555500000000000005577777777777700557FB8B8B8B8B70057FB8B8B8B8B
            807057F8B8B8B8B870707F8B8B8B8B8B07707FFFFFFFFFF70870777777777777
            7B7057F8B8B8B8B8B87057FB8B8B8FFFFF7057F8B8B8F7777775557FFFFF7555
            5555555777775555555555555555555555555555555555555555}
          OnClick = SpeedButton4Click
        end
        object lblMsg: TLabel
          Left = 247
          Top = 46
          Width = 231
          Height = 15
          Caption = 'Montando contracheque 20000. Aguarde...'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Visible = False
        end
        object CboxSubMsg: TCheckBox
          Left = 11
          Top = 44
          Width = 129
          Height = 17
          Caption = 'Substiui Mensagem'
          TabOrder = 0
        end
        object mmMSGant: TMemo
          Left = 152
          Top = 44
          Width = 49
          Height = 17
          Lines.Strings = (
            'm'
            'm'
            'M'
            'S'
            'G'
            'a'
            'n'
            't')
          TabOrder = 1
          Visible = False
        end
      end
      object Panel5: TPanel
        Left = 1
        Top = 121
        Width = 513
        Height = 77
        Align = alTop
        TabOrder = 4
        object Label4: TLabel
          Left = 1
          Top = 1
          Width = 511
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
        object cboxPortforma: TCheckBox
          Left = 4
          Top = 2
          Width = 16
          Height = 15
          Enabled = False
          TabOrder = 0
          OnClick = cboxPortformaClick
        end
        object chklstPortforma: TCheckListBox
          Left = 1
          Top = 17
          Width = 511
          Height = 59
          OnClickCheck = chklstPortformaClickCheck
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          TabOrder = 1
          OnClick = chklstPortformaClick
        end
      end
      object Panel6: TPanel
        Left = 1
        Top = 198
        Width = 513
        Height = 68
        Align = alClient
        TabOrder = 5
        object Label5: TLabel
          Left = 1
          Top = 1
          Width = 511
          Height = 15
          Align = alTop
          Alignment = taCenter
          Caption = 'Cidade'
        end
        object chklstCidade: TCheckListBox
          Left = 1
          Top = 16
          Width = 511
          Height = 51
          OnClickCheck = chklstCidadeClickCheck
          Align = alClient
          ItemHeight = 15
          TabOrder = 0
          OnClick = chklstCidadeClick
        end
        object cboxCidade: TCheckBox
          Left = 4
          Top = 1
          Width = 14
          Height = 15
          Alignment = taLeftJustify
          TabOrder = 1
          Visible = False
          OnClick = cboxCidadeClick
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 432
    Width = 517
    inherited tb97Fundo: TToolbar97
      Left = 345
      DockPos = 375
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 160
      inherited ToolbarSep971: TToolbarSep97
        Left = 97
      end
      inherited bbtnConfirmar: TBitBtn
        Width = 97
        Caption = '&Gerar'
        Enabled = False
        ModalResult = 0
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 100
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 544
    Top = 11
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qry: TwwQuery
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
      '  PD.CODPROVDESC,'
      '  PD.DESCRPROVDESC,'
      '  H.VALORINFO,'
      
        '  DECODE(PD.FLGDESCONTO,1,'#39'D'#39',DECODE(PD.FLGDESCONTO,0,'#39'P'#39')) AS T' +
        'PRUBRICA,'
      '  H.VALORPROVENTO'
      'FROM HISTRUBSAL H, PARTPREVPLAN PP, ELEGPATRO E, PROVDESC PD,'
      
        '     PLANPREV PL, PORTADORFORMA POF, PESSOAFISICA PF, ENDPESS ED' +
        ', PESSOA RESP,'
      '     PESSOA TIT, PESSOA PAT, CIDADES CID, ESTADO EST'
      'WHERE H.IDHSTFOLHABENEF = 1'
      'AND (H.FLGESTORNO = 0 OR H.FLGESTORNO IS NULL)'
      'AND PP.IDPESSOA = H.IDTITULAR'
      'AND E.IDPESSOA = H.IDTITULAR'
      'AND PD.IDPROVENTO = H.IDRUBRICA'
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
    Left = 38
    Top = 424
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
      '')
    ValidateWithMask = True
    Left = 73
    Top = 425
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
    Left = 5
    Top = 424
  end
  object dlgArquivo: TSaveDialog
    DefaultExt = '*.dat'
    Filter = 'Arquivo Dat|*.dat|Arquivo Texto|*.txt|Todos Arquivos|*.*'
    Title = 'Arquivo Contra-Cheque'
    Left = 127
    Top = 453
  end
  object qryMSG: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDREGRA,MSG,FLGTIPOREGRA'
      '  FROM MSGCONTRACHEQUE'
      'WHERE'
      'FLGATIVO <> 0')
    ValidateWithMask = True
    Left = 128
    Top = 175
  end
  object qryCalendatas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DATAPAGBENEF FROM CALENDDATAS'
      ' WHERE'
      '    FLGINTERNO = '#39'AS'#39' '
      'AND ANOMESREF = :ANOMESREF')
    ValidateWithMask = True
    Left = 214
    Top = 175
    ParamData = <
      item
        DataType = ftString
        Name = 'ANOMESREF'
        ParamType = ptUnknown
      end>
  end
end
