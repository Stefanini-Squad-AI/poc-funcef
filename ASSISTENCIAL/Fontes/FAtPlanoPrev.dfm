inherited frmAtPlanoPrev: TfrmAtPlanoPrev
  Left = 203
  Top = 94
  Caption = 'Sincronização com Dados Previdenciários'
  ClientHeight = 380
  ClientWidth = 436
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 436
    Height = 341
    TabOrder = 2
  end
  inherited Dock971: TDock97
    Top = 341
    Width = 436
    object LbTotal: TLabel [0]
      Left = 9
      Top = 14
      Width = 30
      Height = 13
      Caption = 'Total'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inherited tb97Fundo: TToolbar97
      Left = 234
      DockPos = 328
      inherited sep1: TToolbarSep97
        Left = 195
      end
      inherited sep3: TToolbarSep97
        Left = 96
      end
      inherited bbtnSair: TBitBtn
        Width = 96
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 99
        Width = 96
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 35
      DockPos = 129
      inherited ToolbarSep971: TToolbarSep97
        Left = 96
      end
      inherited bbtnConfirmar: TBitBtn
        Width = 96
        Caption = 'Sincroniz&ar'
        ModalResult = 0
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 99
        Width = 96
        ModalResult = 0
      end
    end
  end
  object Panel2: TPanel [2]
    Left = 0
    Top = 0
    Width = 436
    Height = 341
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object LbTitulo: TLabel
      Left = 16
      Top = 11
      Width = 366
      Height = 13
      Caption = 'PARTICIPANTES COM  PLANO PREVIDENCIÁRIO CANCELADO'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object wwDBGrid1: TwwDBGrid
      Left = 10
      Top = 27
      Width = 414
      Height = 302
      Selected.Strings = (
        'INSCRICAONUMERO'#9'15'#9'Inscrição'
        'NOME'#9'30'#9'Nome'
        'SITUACAOPREV'#9'20'#9'Situação '
        'PATROCINADORA'#9'20'#9'Patrocinadora'
        'DATAENTRADA'#9'12'#9'Data Entrada')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = DsAtual
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      IndicatorColor = icBlack
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 579
    Top = 6
  end
  object ds: TwwDataSource
    AutoEdit = False
    DataSet = qry
    Left = 8
    Top = 154
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 248
    Top = 172
  end
  object qryAtual: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      ''
      'SELECT  P.NOME, PJ.NOME AS PATROCINADORA,'
      ''
      '         -- PARTASS'
      '       PT.IDPESSJUR, PT.SEQPROPOSTA,'
      '       PT.IDPLANOPREV, PT.IDPESSOA,'
      '       PT.IDPLANASS, PT.IDSITPART,'
      '       PT.DATAENTRADA, PT.FLGPARTBENEF,'
      '       PT.FLGINSCRICAOCANC, PT.IDNUCLEO,'
      '       PT.OPCAOB, PT.OPCAOA, PT.INSCRICAONUMERO,'
      '       ST.DESCRICAO AS SITUACAOPREV,'
      ''
      '       -- BENEFASS'
      '       BF.IDDEPENDENTE,'
      '       BF.RESPONSAVELPAG,'
      ''
      '       -- CONTASS'
      
        '       CT.IDCONTASS, CT.FLGATIVO AS FLAGATIVO, CT.RECPAG, CT.COD' +
        'PORTFORMA,'
      '       CT.FLGCOBCARNE, CT.IDPAGADOR'
      ''
      ''
      'FROM   PARTPREVPLAN PP,'
      '       PESSOA P,'
      '       PESSOA PJ,'
      '       PLANPREV PN,'
      '       PARTASS PT,'
      '       BENEFASS BF,'
      '       CONTASS CT,'
      '       SITPLANOPREV ST'
      ''
      ''
      'WHERE'
      '(PP.FLGDESATIVADO=1) AND'
      '(PP.IDPESSOA=PT.IDPESSOA) AND'
      '(PP.IDPESSOA=P.IDPESSOA) AND'
      '(PP.IDPESSJUR=PJ.IDPESSOA) AND'
      '(PP.IDPLANOPREV=PN.IDPLANOPREV) AND'
      '(PP.IDPLANOPREV=PT.IDPLANOPREV) AND'
      '(PP.IDSITPLANOPREV=ST.IDSITPLANOPREV) AND'
      ''
      '(PP.IDPESSJUR = BF.IDPESSJUR) AND'
      '(PT.IDPESSOA=BF.IDTITULAR) AND'
      '(PT.IDPLANOPREV=BF.IDPLANOPREV) AND'
      '(PT.IDPLANASS=BF.IDPLANASS) AND'
      ''
      '(PT.IDPESSOA=CT.IDTITULAR) AND'
      '(PT.IDPLANOPREV=CT.IDPLANOPREV) AND'
      '(PT.IDPLANASS=CT.IDPLANASS) AND'
      ''
      '(PT.FLGINSCRICAOCANC=0) AND'
      '(PT.DATACANCELAMENTO IS NULL)'
      ''
      'ORDER BY PATROCINADORA'
      '')
    ValidateWithMask = True
    Left = 357
    Top = 49
    object qryAtualINSCRICAONUMERO: TStringField
      DisplayLabel = 'Inscrição'
      DisplayWidth = 15
      FieldName = 'INSCRICAONUMERO'
    end
    object qryAtualNOME: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 30
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PESSOA.NOME'
      Size = 60
    end
    object qryAtualSITUACAOPREV: TStringField
      DisplayLabel = 'Situação '
      DisplayWidth = 20
      FieldName = 'SITUACAOPREV'
      Size = 50
    end
    object qryAtualPATROCINADORA: TStringField
      DisplayLabel = 'Patrocinadora'
      DisplayWidth = 20
      FieldName = 'PATROCINADORA'
      Origin = 'BASEDADOS.PESSOA.NOME'
      Size = 60
    end
    object qryAtualDATAENTRADA: TDateTimeField
      DisplayLabel = 'Data Entrada'
      DisplayWidth = 12
      FieldName = 'DATAENTRADA'
    end
    object qryAtualIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.PARTPREVPLAN.IDPESSOA'
      Visible = False
    end
    object qryAtualIDPLANOPREV: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.PARTPREVPLAN.IDPLANOPREV'
      Visible = False
    end
    object qryAtualIDPESSJUR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSJUR'
      Visible = False
    end
    object qryAtualSEQPROPOSTA: TFloatField
      DisplayWidth = 10
      FieldName = 'SEQPROPOSTA'
      Visible = False
    end
    object qryAtualIDPLANASS: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANASS'
      Visible = False
    end
    object qryAtualIDSITPART: TFloatField
      DisplayWidth = 10
      FieldName = 'IDSITPART'
      Visible = False
    end
    object qryAtualFLGPARTBENEF: TStringField
      DisplayWidth = 1
      FieldName = 'FLGPARTBENEF'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryAtualFLGINSCRICAOCANC: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGINSCRICAOCANC'
      Visible = False
    end
    object qryAtualIDNUCLEO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDNUCLEO'
      Visible = False
    end
    object qryAtualOPCAOB: TStringField
      DisplayWidth = 10
      FieldName = 'OPCAOB'
      Visible = False
      Size = 10
    end
    object qryAtualOPCAOA: TStringField
      DisplayWidth = 10
      FieldName = 'OPCAOA'
      Visible = False
      Size = 10
    end
    object qryAtualIDDEPENDENTE: TFloatField
      DisplayWidth = 10
      FieldName = 'IDDEPENDENTE'
      Visible = False
    end
    object qryAtualRESPONSAVELPAG: TFloatField
      DisplayWidth = 10
      FieldName = 'RESPONSAVELPAG'
      Visible = False
    end
    object qryAtualIDCONTASS: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONTASS'
      Visible = False
    end
    object qryAtualRECPAG: TStringField
      DisplayWidth = 1
      FieldName = 'RECPAG'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryAtualCODPORTFORMA: TFloatField
      DisplayWidth = 10
      FieldName = 'CODPORTFORMA'
      Visible = False
    end
    object qryAtualFLGCOBCARNE: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGCOBCARNE'
      Visible = False
    end
    object qryAtualIDPAGADOR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPAGADOR'
      Visible = False
    end
    object qryAtualFLAGATIVO: TFloatField
      DisplayWidth = 10
      FieldName = 'FLAGATIVO'
      Visible = False
    end
  end
  object qry: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 42
    Top = 154
  end
  object DsAtual: TwwDataSource
    DataSet = qryAtual
    Left = 360
    Top = 120
  end
  object qryDesativadoPrev: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 144
    Top = 120
  end
  object qrySincroniza: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 299
    Top = 103
  end
end
