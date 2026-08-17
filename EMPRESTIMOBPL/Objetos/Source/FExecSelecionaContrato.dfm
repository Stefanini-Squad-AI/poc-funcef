inherited frmExecSelecionaContrato: TfrmExecSelecionaContrato
  Left = 396
  Top = 168
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
            'IDCONTRATOEMPTMO'#9'10'#9'Nº Contrato'#9'F'
            'FLGSITUACAO'#9'20'#9'Status'#9'F'
            'NOME'#9'60'#9'Mutuário'#9'F'
            'MATRICULA'#9'15'#9'Matrícula'#9'F'
            'TIPO_CONTRATO'#9'60'#9'Tipo Contrato'#9'F'
            'CPF'#9'18'#9'CPF'#9'F'
            'NOME_TIT'#9'60'#9'Titular'#9'F'
            'DATACREDITO'#9'10'#9'Data de Crédito'#9'F')
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
      'SELECT DISTINCT'
      '   CON.IDCONTRATOEMPTMO,'
      
        '   DECODE(CON.FLGSITUACAO, '#39'A'#39', '#39'ATIVO'#39', '#39'E'#39', '#39'ENCERRADO'#39', '#39'J'#39', ' +
        #39'EM COBRANÇA JURÍDICA'#39', '#39'K'#39', '#39'EM QUITAÇÃO'#39', '#39'Q'#39', '#39'QUITADO'#39', '#39'R'#39',' +
        ' '#39'RENOVADO'#39','#39'C'#39','#39'CANCELADO'#39','#39'P'#39','#39'PENDENTE'#39') AS FLGSITUACAO,'
      '   MUT.NOME,'
      '   NVL(DEP.MATRICULA, ELP.MATRICULA) AS MATRICULA,'
      '   ELP.MATRICULA AS MATRICULA_TIT,'
      '   TCE.TCEDESCRICAO       AS TIPO_CONTRATO,'
      '   TEP.DESCTIPOEMPTMO     AS TIPO_EP,'
      '   MUT.NUMDOCUMENTO AS CPF,'
      '   TIT.NOME AS NOME_TIT,'
      '   TIT.NUMDOCUMENTO AS CPF_TIT,'
      '   CON.DATAASSINATURA AS C11,'
      '   CON.DATACREDITO,'
      '   PPA.NOME AS NOME_PATRO,'
      '   PLP.NOME AS NOME_PLANO,'
      '   DECODE( INS.FLGINTERNET, 1, '#39'SIM'#39', '#39'NÃO'#39' ) AS FLGINTERNET,'
      '   CON.IDCONTRATOEMPTMO,'
      '   CON.IDTIPOCONTREMPTMO,'
      '   CON.IDPESSOA,'
      '   CON.IDBENEF'
      'FROM'
      '   PESSOA          MUT,'
      '   PESSOA          TIT,'
      '   PESSOA          PPA,'
      '   CONTRATOEMPTMO  CON,'
      '   DEPENTIT        DEP,'
      '   ELEGPATRO       ELP,'
      '   PLANPREV        PLP,'
      '   TIPOCONTREMPTMO TCE,'
      '   TIPOEMPTMO      TEP,'
      '   INSCRICAOEMPTMO  INS'
      'WHERE'
      '   ( CON.IDBENEF           = MUT.IDPESSOA ) AND'
      '   ( CON.IDPESSOA          = TIT.IDPESSOA ) AND'
      '   ( CON.IDBENEF           = DEP.IDPESSOA ) AND'
      '   ( CON.IDPESSOA          = DEP.IDTITULAR ) AND'
      '   ( CON.IDPESSOA          = ELP.IDPESSOA ) AND'
      '   ( CON.IDPATRO           = ELP.IDPESSJUR ) AND'
      '   ( ELP.IDPESSOA          = TIT.IDPESSOA ) AND'
      '   ( ELP.IDPESSJUR         = PPA.IDPESSOA ) AND'
      '   ( ELP.IDPESSOA          = DEP.IDTITULAR ) AND'
      '   ( CON.IDPLANOPREV       = PLP.IDPLANOPREV ) AND'
      '   ( CON.IDTIPOCONTREMPTMO = TCE.IDTIPOCONTREMPTMO ) AND'
      '   ( TCE.IDTIPOEMPTMO      = TEP.IDTIPOEMPTMO ) AND'
      '   ( CON.IDINSCRICAOEMPTMO  = INS.IDINSCRICAOEMPTMO(+) ) AND'
      '   CON.FLGSITUACAO IN ('#39'A'#39','#39'E'#39','#39'K'#39') AND'
      
        '   DECODE(DEP.IDTITULAR, DEP.IDPESSOA, ELP.MATRICULA, DEP.MATRIC' +
        'ULA) = :PMATRICULA'
      ''
      ''
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 424
    Top = 104
    ParamData = <
      item
        DataType = ftString
        Name = 'PMATRICULA'
        ParamType = ptInput
        Value = '99000515-1'
      end>
    object qryResultadoIDCONTRATOEMPTMO: TFloatField
      DisplayLabel = 'Nº Contrato'
      DisplayWidth = 10
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryResultadoFLGSITUACAO: TStringField
      DisplayLabel = 'Status'
      DisplayWidth = 20
      FieldName = 'FLGSITUACAO'
    end
    object qryResultadoNOME: TStringField
      DisplayLabel = 'Mutuário'
      DisplayWidth = 60
      FieldName = 'NOME'
      Size = 60
    end
    object qryResultadoMATRICULA: TStringField
      DisplayLabel = 'Matrícula'
      DisplayWidth = 15
      FieldName = 'MATRICULA'
      Size = 15
    end
    object qryResultadoTIPO_CONTRATO: TStringField
      DisplayLabel = 'Tipo Contrato'
      DisplayWidth = 60
      FieldName = 'TIPO_CONTRATO'
      Size = 60
    end
    object qryResultadoCPF: TStringField
      DisplayWidth = 18
      FieldName = 'CPF'
      FixedChar = True
      Size = 18
    end
    object qryResultadoNOME_TIT: TStringField
      DisplayLabel = 'Titular'
      DisplayWidth = 60
      FieldName = 'NOME_TIT'
      Size = 60
    end
    object qryResultadoDATACREDITO: TDateTimeField
      DisplayLabel = 'Data de Crédito'
      DisplayWidth = 10
      FieldName = 'DATACREDITO'
    end
    object qryResultadoMATRICULA_TIT: TStringField
      FieldName = 'MATRICULA_TIT'
      Visible = False
      Size = 13
    end
    object qryResultadoTIPO_EP: TStringField
      FieldName = 'TIPO_EP'
      Visible = False
      Size = 60
    end
    object qryResultadoCPF_TIT: TStringField
      FieldName = 'CPF_TIT'
      Visible = False
      FixedChar = True
      Size = 18
    end
    object qryResultadoC11: TDateTimeField
      FieldName = 'C11'
      Visible = False
    end
    object qryResultadoNOME_PATRO: TStringField
      FieldName = 'NOME_PATRO'
      Visible = False
      Size = 60
    end
    object qryResultadoNOME_PLANO: TStringField
      FieldName = 'NOME_PLANO'
      Visible = False
      Size = 50
    end
    object qryResultadoFLGINTERNET: TStringField
      FieldName = 'FLGINTERNET'
      Visible = False
      Size = 3
    end
    object qryResultadoIDCONTRATOEMPTMO_1: TFloatField
      FieldName = 'IDCONTRATOEMPTMO_1'
      Visible = False
    end
    object qryResultadoIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
      Visible = False
    end
    object qryResultadoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object qryResultadoIDBENEF: TFloatField
      FieldName = 'IDBENEF'
      Visible = False
    end
  end
  object dsResultado: TDataSource
    DataSet = qryResultado
    Left = 421
    Top = 161
  end
end
