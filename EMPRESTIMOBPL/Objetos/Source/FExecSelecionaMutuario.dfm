inherited frmExecSelecionaMutuario: TfrmExecSelecionaMutuario
  Left = 64
  Top = 226
  ActiveControl = wwDBGrid1
  Caption = 'Seleciona'
  ClientHeight = 446
  ClientWidth = 646
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 646
    Height = 413
    object PageControl: TPageControl
      Left = 0
      Top = 0
      Width = 646
      Height = 413
      ActivePage = TabSheet2
      Align = alClient
      TabOrder = 0
      object TabSheet2: TTabSheet
        Caption = 'Resultado'
        ImageIndex = 1
        object wwDBGrid1: TwwDBGrid
          Left = 0
          Top = 0
          Width = 638
          Height = 385
          Selected.Strings = (
            'NOME'#9'55'#9'Mutuário'
            'MATRICULA'#9'15'#9'Matrícula'
            'ACPDATAASSINAT'#9'11'#9'Assinatura'
            'CTPDESCRICAO'#9'60'#9'Contrato Padrão')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsResultado
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          ParentFont = False
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          OnDblClick = btnOKClick
          OnKeyDown = wwDBGrid1KeyDown
          IndicatorColor = icBlack
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 413
    Width = 646
    inherited tb97Fundo: TToolbar97
      Left = 443
      DockPos = 443
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited ToolbarSep974: TToolbarSep97
        Left = 247
      end
      inherited bbtnConfirmar: TBitBtn
        Caption = '&Buscar'
        Enabled = False
        ModalResult = 0
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        Enabled = False
        ModalResult = 0
        Visible = False
      end
      object btnOK: TBitBtn
        Left = 166
        Top = 0
        Width = 81
        Height = 27
        Caption = '&OK'
        Default = True
        TabOrder = 2
        OnClick = btnOKClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888002222200
          88888887788888778F88887222222222088888788888888878F887A228822222
          208887F88FFF888887F887A2FFF8222220888788777FF888878F7A22FFFF8222
          22087F887777FF88887F7A22FFFFF82222087F8877777FF8887F7A22FF8FFF82
          22087F8877F777FF887F7A22FF82FFF822087F8877F8777F887F7A22FF222FF8
          220878F87788877FF87887A2222222FF208887F88888887787F887A222222222
          2088878F888888888788887AA222222208888878FF88888F788888877AAAAA77
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
      end
    end
  end
  object qryResultado: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   ACP.ACPDATAASSINAT,'
      '   CTP.CTPDESCRICAO,'
      '   DEP.MATRICULA,'
      '   PES.NOME,'
      '   PES.IDPESSOA,'
      '   ACP.IDCONTRATOPADRAO,'
      '   ACP.IDBENEF,'
      '   PPP.IDPLANOPREV,'
      '   SIP.FLGINTERNO,'
      '   PPA.NOME AS NOME_PATRO,'
      '   PLP.NOME AS NOME_PLANO'
      'FROM'
      '   ASSINCONTRPADRAO ACP,'
      '   PESSOA PES,'
      '   PESSOA       PPA,'
      '   CONTRATOPADRAO CTP,'
      '   DEPENTIT DEP,'
      '   PLANPREV     PLP,'
      '   ELEGPATRO ELP,'
      '   PARTPREVPLAN PPP,'
      '   SITPART SIP'
      'WHERE'
      '   ACP.IDPESSOA(+)      = DEP.IDTITULAR         AND'
      '   ACP.IDBENEF(+)       = DEP.IDPESSOA          AND'
      '   ACP.IDCONTRATOPADRAO = CTP.IDCONTRATOPADRAO(+) AND'
      '   ELP.IDPESSJUR      = PPA.IDPESSOA AND'
      '   PPP.IDPLANOPREV    = PLP.IDPLANOPREV AND'
      '   DEP.IDPESSOA         = PES.IDPESSOA          AND'
      '   ELP.IDPESSJUR      = PPP.IDPESSJUR  AND'
      '   ELP.IDPESSOA       = PPP.IDPESSOA  AND'
      '   ELP.IDPESSOA       = DEP.IDTITULAR(+)  AND'
      '   PPP.IDSITPART      = SIP.IDSITPART  AND'
      '   PPP.FLGDESATIVADO  = 0 AND'
      '   DEP.IDPESSOA = :PIDPESSOA'
      '')
    ValidateWithMask = True
    Left = 424
    Top = 104
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end>
    object qryResultadoNOME: TStringField
      DisplayLabel = 'Mutuário'
      DisplayWidth = 55
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PESSOA.NOME'
      Size = 60
    end
    object qryResultadoMATRICULA: TStringField
      DisplayLabel = 'Matrícula'
      DisplayWidth = 15
      FieldName = 'MATRICULA'
      Origin = 'BASEDADOS.DEPENTIT.MATRICULA'
      Size = 15
    end
    object qryResultadoACPDATAASSINAT: TDateTimeField
      DisplayLabel = 'Assinatura'
      DisplayWidth = 11
      FieldName = 'ACPDATAASSINAT'
      Origin = 'BASEDADOS.ASSINCONTRPADRAO.ACPDATAASSINAT'
    end
    object qryResultadoCTPDESCRICAO: TStringField
      DisplayLabel = 'Contrato Padrão'
      DisplayWidth = 60
      FieldName = 'CTPDESCRICAO'
      Origin = 'BASEDADOS.CONTRATOPADRAO.CTPDESCRICAO'
      Size = 60
    end
    object qryResultadoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.ASSINCONTRPADRAO.IDPESSOA'
      Visible = False
    end
    object qryResultadoIDCONTRATOPADRAO: TFloatField
      FieldName = 'IDCONTRATOPADRAO'
      Origin = 'BASEDADOS.ASSINCONTRPADRAO.IDCONTRATOPADRAO'
      Visible = False
    end
    object qryResultadoIDBENEF: TFloatField
      FieldName = 'IDBENEF'
      Origin = 'BASEDADOS.ASSINCONTRPADRAO.IDBENEF'
      Visible = False
    end
    object qryResultadoIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryResultadoFLGINTERNO: TStringField
      FieldName = 'FLGINTERNO'
      FixedChar = True
      Size = 2
    end
    object qryResultadoNOME_PATRO: TStringField
      FieldName = 'NOME_PATRO'
      Size = 60
    end
    object qryResultadoNOME_PLANO: TStringField
      FieldName = 'NOME_PLANO'
      Size = 50
    end
  end
  object dsResultado: TDataSource
    DataSet = qryResultado
    Left = 421
    Top = 161
  end
end
