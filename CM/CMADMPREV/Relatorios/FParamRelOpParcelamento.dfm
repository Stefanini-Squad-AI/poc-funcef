inherited frmParamRelOpParcelamento: TfrmParamRelOpParcelamento
  Left = 93
  Top = 112
  Caption = 'Relatório de opções de parcelamento'
  ClientHeight = 314
  ClientWidth = 524
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 524
    Height = 275
    object Panel7: TPanel
      Left = 5
      Top = 5
      Width = 514
      Height = 157
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Label7: TLabel
        Left = 22
        Top = 10
        Width = 98
        Height = 13
        Caption = 'Saldo devedor inicial'
      end
      object Label10: TLabel
        Left = 145
        Top = 10
        Width = 70
        Height = 13
        Caption = 'N. de Parcelas'
      end
      object Label12: TLabel
        Left = 401
        Top = 9
        Width = 99
        Height = 13
        Caption = 'Percentual do salário'
      end
      object Label3: TLabel
        Left = 277
        Top = 10
        Width = 95
        Height = 13
        Caption = 'Vlr. Prestação inicial'
      end
      object Label11: TLabel
        Left = 22
        Top = 104
        Width = 125
        Height = 13
        Caption = 'Situação do Parcelamento'
      end
      object Label18: TLabel
        Left = 22
        Top = 58
        Width = 113
        Height = 13
        Caption = 'N. de Parcelas Geradas'
      end
      object sbtnProcParticip: TSpeedButton
        Left = 408
        Top = 110
        Width = 94
        Height = 38
        Hint = 'Procurar novo participante'
        Caption = 'Procurar'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
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
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = sbtnProcParticipClick
      end
      object dbSdoDevedor: TDBRealEdit
        Left = 22
        Top = 26
        Width = 99
        Height = 21
        Alignment = taRightJustify
        Color = clMenu
        Enabled = False
        Lines.Strings = (
          '288.843,28')
        ReadOnly = True
        TabOrder = 0
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'SDODEVEDOR'
        DataSource = dsparcelamento
      end
      object DBRealEdit4: TDBRealEdit
        Left = 401
        Top = 26
        Width = 99
        Height = 21
        Alignment = taRightJustify
        Color = clMenu
        Enabled = False
        Lines.Strings = (
          '9')
        ReadOnly = True
        TabOrder = 1
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'PERCENTUAL'
        DataSource = dsparcelamento
      end
      object DBRealEdit5: TDBRealEdit
        Left = 273
        Top = 26
        Width = 99
        Height = 21
        Alignment = taRightJustify
        Color = clMenu
        Enabled = False
        Lines.Strings = (
          '100,00')
        ReadOnly = True
        TabOrder = 2
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'VLRPRIMPRESTACAO'
        DataSource = dsparcelamento
      end
      object rdbNumarcelas: TDBRealEdit
        Left = 145
        Top = 26
        Width = 99
        Height = 21
        Alignment = taRightJustify
        Color = clMenu
        Enabled = False
        Lines.Strings = (
          '0')
        ReadOnly = True
        TabOrder = 3
        WordWrap = False
        IntDigits = 10
        DecDigits = 0
        NumberFormat = iNumber
        Signal = False
        DataField = 'NUMPARCELAS'
        DataSource = dsparcelamento
      end
      object edsitparcelamento: TEdit
        Left = 22
        Top = 120
        Width = 281
        Height = 21
        Color = clMenu
        Enabled = False
        ReadOnly = True
        TabOrder = 4
      end
      object DBRealEdit1: TDBRealEdit
        Left = 22
        Top = 74
        Width = 99
        Height = 21
        Alignment = taRightJustify
        Color = clMenu
        Enabled = False
        Lines.Strings = (
          '0')
        ReadOnly = True
        TabOrder = 5
        WordWrap = False
        IntDigits = 10
        DecDigits = 0
        NumberFormat = iNumber
        Signal = False
        DataField = 'PARCGERADAS'
        DataSource = dsparcelamento
      end
    end
    object GroupBox1: TGroupBox
      Left = 5
      Top = 162
      Width = 514
      Height = 108
      Align = alClient
      Caption = 'Opções'
      TabOrder = 1
      object grdOpcoes: TwwDBGrid
        Left = 2
        Top = 15
        Width = 510
        Height = 91
        Selected.Strings = (
          'FLGSELECIONADO'#9'9'#9'Selecionar'#9'F'
          'NMESES'#9'10'#9'N. de Meses'#9'F'
          'PERCENTUAL'#9'14'#9'Percentual do Sal.'#9'F'
          'VALOR'#9'14'#9'Valor. Prim. Prestação'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
        Align = alClient
        DataSource = dsOpcoes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        KeyOptions = []
        ParentFont = False
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 2
        TitleButtons = False
        IndicatorColor = icBlack
      end
    end
  end
  inherited Dock971: TDock97
    Top = 275
    Width = 524
    inherited tb97Fundo: TToolbar97
      Left = 354
      DockPos = 381
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 187
      DockPos = 214
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 11
    Top = 65531
    TargetsData = (
      1
      4
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        'TRealEdit'
        'Text'
        0)
      (
        'TMemo'
        'Text'
        0)
      (
        'TRichEdit'
        'Text'
        0))
  end
  object qryopcoes: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT 0.00 AS FLGSELECIONADO,'
      'VLR.VALOR ,  MES.VALOR NMESES, PER.VALOR PERCENTUAL,'
      'SEGURO.VALOR SEGURO'
      'FROM  DETCALCULO VLR, DETCALCULO PER, DETCALCULO MES,'
      'DETCALCULO SEGURO'
      'WHERE VLR.IDCALCULO = :idcalculo '
      'AND LTRIM(RTRIM(VLR.DESCRICAO)) = '#39'1'#39
      'AND MES.IDCALCULO = VLR.IDCALCULO'
      'AND MES.IDDETCALCULO = VLR.IDDETCALCULO +1'
      'AND LTRIM(RTRIM(MES.DESCRICAO)) = '#39'2'#39
      'AND PER.IDCALCULO = VLR.IDCALCULO'
      'AND LTRIM(RTRIM(PER.DESCRICAO)) = '#39'3'#39'  '
      'AND PER.IDDETCALCULO = MES.IDDETCALCULO +1'
      'AND SEGURO.IDCALCULO = VLR.IDCALCULO'
      'AND LTRIM(RTRIM(SEGURO.DESCRICAO)) = '#39'4'#39'  '
      'AND SEGURO.IDDETCALCULO = PER.IDDETCALCULO +1'
      'ORDER BY VLR.IDDETCALCULO'
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    UpdateObject = UpdOpcoes
    ControlType.Strings = (
      'FLGSELECIONADO;CheckBox;1;0')
    ValidateWithMask = True
    Left = 386
    Top = 106
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idcalculo'
        ParamType = ptUnknown
        Value = '684'
      end>
    object qryopcoesFLGSELECIONADO: TFloatField
      DisplayLabel = 'Selecionar'
      DisplayWidth = 9
      FieldName = 'FLGSELECIONADO'
    end
    object qryopcoesNMESES: TStringField
      Alignment = taCenter
      DisplayLabel = 'N. de Meses'
      DisplayWidth = 10
      FieldName = 'NMESES'
      Size = 50
    end
    object qryopcoesPERCENTUAL: TStringField
      Alignment = taCenter
      DisplayLabel = 'Percentual do Sal.'
      DisplayWidth = 14
      FieldName = 'PERCENTUAL'
      Size = 50
    end
    object qryopcoesVALOR: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Valor. Prim. Prestação'
      DisplayWidth = 14
      FieldName = 'VALOR'
      Size = 50
    end
  end
  object MontaSelectPart: TMontaSelect
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
      'ELEGPATRO.MATRICULA'
      'PATRO.NOME AS PATRO'
      'PLANPREV.NOME AS PLANO'
      'SITFUNC.DESCRICAO'
      'SITPART.DESCRICAO'
      'SITPLANOPREV.DESCRICAO'
      'PESSOA.NUMDOCUMENTO'
      'PESSOAFISICA.DATANASC'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'PARTPREVPLAN.INSCRICAODATA'
      'ELEGPATRO.DATAINICIOAFAST'
      'ELEGPATRO.DATAFIMAFAST'
      'PARTPREVPLAN.SEQPROPOSTA'
      'PARTPREVPLAN.DTINICIOINSC')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = ELEGPATRO.IDPESSOA'
      'ELEGPATRO.IDPESSOA = PARTPREVPLAN.IDPESSOA'
      'ELEGPATRO.IDPESSJUR = PARTPREVPLAN.IDPESSJUR'
      'PARTPREVPLAN.IDPLANOPREV = PLANPREV.IDPLANOPREV'
      'PATRO.IDPESSOA = ELEGPATRO.IDPESSJUR'
      'ELEGPATRO.IDSITFUNC = SITFUNC.IDSITFUNC'
      'PARTPREVPLAN.IDSITPART = SITPART.IDSITPART'
      'PARTPREVPLAN.IDSITPLANOPREV = SITPLANOPREV.IDSITPLANOPREV'
      'PESSOA.IDPESSOA = PESSOAFISICA.IDPESSOA'
      
        'EXISTS (SELECT 1 FROM PARCELAMENTO WHERE IDPESSJUR = ELEGPATRO.I' +
        'DPESSJUR AND IDPLANOPREV = PARTPREVPLAN.IDPLANOPREV AND IDPESSOA' +
        ' = ELEGPATRO.IDPESSOA AND DATAINICIO IS NOT NULL )')
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
    Left = 42
    Top = 98
  end
  object dsparcelamento: TwwDataSource
    AutoEdit = False
    DataSet = qryParcelamento
    Left = 201
    Top = 72
  end
  object qryParcelamento: TwwQuery
    CachedUpdates = True
    AfterScroll = qryParcelamentoAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT    IDPARCELAMENTO,   IDPESSJUR'#9',   IDPLANOPREV'#9',   IDPESS' +
        'OA,'
      
        '   FLGDESCFOLHA'#9',   NUMPARCELAS'#9',   PARCPAGAS,   PARCGERADAS,   ' +
        'VLRPRIMPRESTACAO,'
      
        '   PERCENTUAL,   VLRSALBASE ,   NVL(SITPARCELAMENTO,0) SITPARCEL' +
        'AMENTO ,   DATAINICIO,   DATACANCELAMENTO,'
      
        '   MOTIVOCANCEL,   IDCALCULOREGRA ,   VLRDIVIDAPART ,   VLRDIVID' +
        'APATRO ,'
      '   SDODEVEDOR   , TPCOMPRACARENCIA'
      'FROM PARCELAMENTO'
      'WHERE IDPESSJUR = :IDPESSJUR'
      'AND IDPLANOPREV = :IDPLANOPREV'
      'AND IDPESSOA = :IDPESSOA'
      'AND DATAINICIO IS NOT NULL'
      'ORDER BY DATAINICIO DESC'
      ' ')
    ControlType.Strings = (
      'FLGSELECIONADO;CheckBox;1;0'
      'FLGDEVOLUCAO;CheckBox;1;0')
    ValidateWithMask = True
    Left = 170
    Top = 90
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
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object dsOpcoes: TwwDataSource
    DataSet = qryopcoes
    Left = 362
    Top = 78
  end
  object UpdOpcoes: TUpdateSQL
    ModifySQL.Strings = (
      'update HSTCONTRIBPREV'
      'set'
      '  FLGSELECIONADO = :FLGSELECIONADO,'
      '  VALOR  = :VALOR,'
      '  NMESES = :NMESES,'
      ' PERCENTUAL = :PERCENTUAL'
      ''
      ''
      ' ')
    Left = 348
    Top = 64
  end
end
