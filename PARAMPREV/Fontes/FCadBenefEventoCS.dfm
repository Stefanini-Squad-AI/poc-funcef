inherited frmCadBenefEventoCS: TfrmCadBenefEventoCS
  Left = 322
  Top = 300
  HelpContext = 160109
  Caption = 'Cadastro de Benefício'
  ClientHeight = 520
  ClientWidth = 702
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 702
    Height = 434
    object Label1: TLabel
      Left = 364
      Top = 77
      Width = 120
      Height = 13
      Caption = 'Forma de Pagamento'
    end
    object lbBeneficio: TLabel
      Left = 364
      Top = 42
      Width = 56
      Height = 13
      Caption = 'Benefício'
    end
    object Label3: TLabel
      Left = 364
      Top = 6
      Width = 118
      Height = 13
      Caption = 'Código na Fundação'
    end
    object Label9: TLabel
      Left = 533
      Top = 77
      Width = 101
      Height = 13
      Caption = 'Tipo de Beneficio'
    end
    object Label10: TLabel
      Left = 364
      Top = 118
      Width = 306
      Height = 13
      Caption = 'Descrição para RUB (Requisição Única de Benefício)'
    end
    object dblkcmbPgtoBenef: TwwDBLookupCombo
      Left = 364
      Top = 91
      Width = 165
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'20'#9'Tipo de Pagamento')
      DataField = 'IDTPPAGTOBENEFIC'
      DataSource = ds
      LookupTable = qryTpPgto
      LookupField = 'IDTPPAGTOBENEFIC'
      Options = [loTitles]
      ParentFont = False
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
    end
    object dbedNomeBenef: TwwDBEdit
      Left = 364
      Top = 55
      Width = 325
      Height = 21
      DataField = 'NOME'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbrgrpDestBenef: TDBRadioGroup
      Left = 364
      Top = 371
      Width = 325
      Height = 57
      Caption = 'Destino do Pagamento'
      Columns = 2
      DataField = 'FLGDESTBENEF'
      DataSource = ds
      Items.Strings = (
        '&Beneficiário'
        '&Participante'
        '&Ambos'
        '&Outras EPP')
      TabOrder = 5
      TabStop = True
      Values.Strings = (
        'B'
        'P'
        'A'
        'E')
      OnClick = dbrgrpDestBenefClick
    end
    object dbedIDBeneficio: TDBEdit
      Left = 364
      Top = 20
      Width = 117
      Height = 21
      Color = clWhite
      DataField = 'CODBENEFICIO'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object pnlLeft: TPanel
      Left = 1
      Top = 1
      Width = 344
      Height = 432
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 8
      object Label4: TLabel
        Left = 0
        Top = 49
        Width = 344
        Height = 19
        Align = alTop
        Caption = ' Benefícios associados ao  Evento Gerador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 344
        Height = 49
        Align = alTop
        TabOrder = 0
        object Label2: TLabel
          Left = 1
          Top = 1
          Width = 342
          Height = 19
          Align = alTop
          Caption = ' Evento Gerador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindow
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dblkcmbEventoGera: TwwDBLookupCombo
          Left = 5
          Top = 20
          Width = 318
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'20'#9'Evento Gerador')
          DataField = 'IDEVENTOGERADOR'
          DataSource = ds
          LookupTable = qryEvento
          LookupField = 'IDEVENTOGERADOR'
          Options = [loTitles]
          ParentFont = False
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
          OnCloseUp = dblkcmbEventoGeraCloseUp
        end
      end
      object dbgrdBenefEventos: TwwDBGrid
        Left = 0
        Top = 68
        Width = 344
        Height = 364
        TabStop = False
        Selected.Strings = (
          'NUMORDEMEVENTO'#9'10'#9'Nº de ~Ordem'
          'NOME'#9'60'#9'Benefício')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 1
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dsBenefEvento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        KeyOptions = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        ParentFont = False
        TabOrder = 1
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 2
        TitleButtons = False
        IndicatorColor = icBlack
      end
    end
    object grpFlags: TGroupBox
      Left = 363
      Top = 275
      Width = 326
      Height = 57
      TabOrder = 7
      object dbchkBenefResgate: TDBCheckBox
        Left = 5
        Top = 33
        Width = 146
        Height = 17
        Hint = 'Indica se o benefício é um benefício de resgate'
        Caption = 'Benefício de Resgate'
        DataField = 'FLGRESGATE'
        DataSource = ds
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object dbchkBenefObrigatorio: TDBCheckBox
        Left = 5
        Top = 11
        Width = 148
        Height = 17
        Hint = 
          'Indica se ao ocorrer o evento gerador o benefício obrigatoriamen' +
          'te será concedido'
        Caption = 'Benefício Obrigatório'
        DataField = 'FLGBENEFOBRIGATO'
        DataSource = ds
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object dbchkBenefTemp: TDBCheckBox
        Left = 165
        Top = 11
        Width = 148
        Height = 17
        Caption = 'Benefício Temporário'
        DataField = 'FLGBENEFTEMP'
        DataSource = ds
        TabOrder = 2
        ValueChecked = '1'
        ValueUnchecked = '0'
        OnClick = dbchkBenefTempClick
      end
      object dbchkPeculio: TDBCheckBox
        Left = 165
        Top = 33
        Width = 148
        Height = 14
        Caption = 'Benefício de Pecúlio'
        DataField = 'FLGPECULIO'
        DataSource = ds
        TabOrder = 3
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
    end
    object grpOutros: TGroupBox
      Left = 362
      Top = 211
      Width = 328
      Height = 63
      TabOrder = 6
      object Label5: TLabel
        Left = 8
        Top = 7
        Width = 137
        Height = 13
        Caption = 'Ordem de Requerimento'
      end
      object Label7: TLabel
        Left = 161
        Top = 8
        Width = 136
        Height = 28
        AutoSize = False
        Caption = 'Prazo Máximo para Concessão Provisória'
        WordWrap = True
      end
      object Label8: TLabel
        Left = 235
        Top = 39
        Width = 36
        Height = 13
        Caption = 'meses'
      end
      object spedNumOrdem: TwwDBSpinEdit
        Left = 8
        Top = 35
        Width = 70
        Height = 21
        Increment = 1
        MaxValue = 1000
        MinValue = 1
        Value = 1
        DataField = 'NUMORDEMEVENTO'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
      end
      object dbedPrazoProv: TwwDBEdit
        Left = 161
        Top = 35
        Width = 70
        Height = 21
        DataField = 'PRAZOPROVISORIO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    object dbcbTipoBen: TwwDBComboBox
      Left = 533
      Top = 91
      Width = 165
      Height = 21
      ShowButton = True
      Style = csDropDown
      MapList = True
      AllowClearKey = False
      AutoDropDown = True
      DataField = 'TIPOBENEFICIO'
      DataSource = ds
      DropDownCount = 8
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 0
      Items.Strings = (
        'Aposentadoria por Tempo de Servico'#9'0'
        'Invalidez'#9'1'
        'Auxilio Doenca'#9'2'
        'Auxilio Reclusao'#9'3'
        'Pensao'#9'4'
        'Peculio'#9'5'
        'Resgate de Reserva'#9'6'
        'Acidente de Trabalho'#9'7'
        'Aposentadoria por Idade'#9'8'
        'Aposentadoria  Ex-Combatente'#9'9'
        'Aposentadoria Especial'#9'10'
        'Aposentadoria Proporcional'#9'11'
        'Aposentadoria Postergada'#9'12'
        'Auxílio Funeral'#9'13'
        'Auxílio Natalidade'#9'14'
        'Auxílio Nupcial'#9'15'
        'Auxílio Educação'#9'16'
        'Portabilidade'#9'17'
        'Outros'#9'99')
      ParentFont = False
      Sorted = False
      TabOrder = 3
      UnboundDataType = wwDefault
    end
    object dbedRub: TwwDBEdit
      Left = 364
      Top = 132
      Width = 321
      Height = 21
      DataField = 'DESCRUB'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbrgrpDtPrevisao: TDBRadioGroup
      Left = 363
      Top = 332
      Width = 325
      Height = 36
      Columns = 2
      DataSource = ds
      Items.Strings = (
        'Data Final Prevista'
        'Data Final Efetiva')
      TabOrder = 9
      Values.Strings = (
        '1'
        '0')
      Visible = False
    end
    object GroupBox1: TGroupBox
      Left = 362
      Top = 157
      Width = 328
      Height = 57
      Caption = 'Parâmetros para SPC'
      TabOrder = 10
      object Label6: TLabel
        Left = 8
        Top = 15
        Width = 86
        Height = 13
        Caption = 'Código na SPC'
      end
      object Label11: TLabel
        Left = 108
        Top = 15
        Width = 186
        Height = 13
        Caption = 'Regra de separação entre linhas'
      end
      object dbedCodBenefSPC: TwwDBEdit
        Left = 8
        Top = 29
        Width = 88
        Height = 21
        DataField = 'CODBENEFSPC'
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
      object cmbregraspc: TwwDBLookupCombo
        Left = 108
        Top = 29
        Width = 214
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEREGRA'#9'60'#9'Regra de Negócio')
        DataField = 'IDREGRALINHASPC'
        DataSource = ds
        LookupTable = qryRegra
        LookupField = 'IDREGRA'
        Options = [loTitles]
        ParentFont = False
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
      end
    end
  end
  inherited Dock972: TDock97
    Width = 702
  end
  inherited Dock971: TDock97
    Top = 481
    Width = 702
    inherited tb97Fundo: TToolbar97
      Left = 335
      DockPos = 335
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 166
      DockPos = 166
    end
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 348
    Top = 5
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update BENEFICIO'
      'set'
      '  IDEVENTOGERADOR = :IDEVENTOGERADOR,'
      '  IDTPPAGTOBENEFIC = :IDTPPAGTOBENEFIC,'
      '  NOME = :NOME,'
      '  FLGDESTBENEF = :FLGDESTBENEF,'
      '  FLGBENEFOBRIGATO = :FLGBENEFOBRIGATO,'
      '  NUMORDEMEVENTO = :NUMORDEMEVENTO,'
      '  FLGRESGATE = :FLGRESGATE,'
      '  FLGBENEFTEMP = :FLGBENEFTEMP,'
      '  FLGBENEFPROV = :FLGBENEFPROV,'
      '  FLGPECULIO = :FLGPECULIO,'
      '  CODBENEFSPC = :CODBENEFSPC,'
      '  PRAZOPROVISORIO = :PRAZOPROVISORIO,'
      '  DESCRUB = :DESCRUB,'
      '  TIPOBENEFICIO = :TIPOBENEFICIO,'
      '  CODBENEFICIO = :CODBENEFICIO,'
      '  IDREGRALINHASPC  = :IDREGRALINHASPC'
      'where'
      '  IDBENEFICIO = :OLD_IDBENEFICIO')
    InsertSQL.Strings = (
      'insert into BENEFICIO'
      
        '  (IDBENEFICIO, IDEVENTOGERADOR, IDTPPAGTOBENEFIC, NOME, FLGDEST' +
        'BENEF, '
      '   FLGBENEFOBRIGATO,  NUMORDEMEVENTO, FLGRESGATE, FLGBENEFTEMP, '
      
        '   FLGBENEFPROV, FLGPECULIO, CODBENEFSPC, PRAZOPROVISORIO, DESCR' +
        'UB, TIPOBENEFICIO, '
      '   CODBENEFICIO, IDREGRALINHASPC)'
      'values'
      
        '  (:IDBENEFICIO, :IDEVENTOGERADOR, :IDTPPAGTOBENEFIC, :NOME, :FL' +
        'GDESTBENEF, '
      '   :FLGBENEFOBRIGATO, :NUMORDEMEVENTO, :FLGRESGATE, '
      
        '   :FLGBENEFTEMP, :FLGBENEFPROV, :FLGPECULIO, :CODBENEFSPC, :PRA' +
        'ZOPROVISORIO, '
      '   :DESCRUB, :TIPOBENEFICIO, :CODBENEFICIO, :IDREGRALINHASPC)')
    DeleteSQL.Strings = (
      'delete from BENEFICIO'
      'where'
      '  IDBENEFICIO = :OLD_IDBENEFICIO')
    Left = 247
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Benefício'
    Colunas.Strings = (
      'NOME'
      'CODBENEFICIO'
      'CODBENEFSPC')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Benefício'
      'Código na Fundação'
      'Código na SPC')
    SensivelACaixa.Strings = (
      'S'
      'N'
      'N')
    Tabelas.Strings = (
      'BENEFICIO')
    CamposChave.Strings = (
      'IDBENEFICIO')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '40'
      '10'
      '10')
    ExibePergunta = False
    Left = 432
    Top = 65535
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 550
    Top = 7
  end
  inherited qry: TwwQuery
    AfterInsert = qryAfterInsert
    BeforePost = qryBeforePost
    AfterScroll = qryAfterScroll
    SQL.Strings = (
      
        'SELECT IDBENEFICIO , IDEVENTOGERADOR  , IDTPPAGTOBENEFIC , NOME ' +
        ','
      '       FLGDESTBENEF, FLGBENEFOBRIGATO , NUMORDEMEVENTO,'
      
        '       FLGRESGATE,   FLGBENEFTEMP, FLGBENEFPROV, FLGPECULIO, COD' +
        'BENEFSPC,'
      '       PRAZOPROVISORIO, DESCRUB, TIPOBENEFICIO, CODBENEFICIO , '
      '       IDREGRALINHASPC '
      'FROM BENEFICIO'
      'WHERE IDBENEFICIO = :IDBENEFICIO'
      'ORDER BY NOME')
    Left = 300
    Top = 2
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDBENEFICIO'
        ParamType = ptUnknown
      end>
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 23
    Top = 373
  end
  object qryEvento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM EVENTOGERADOR'
      'WHERE IDFUNDACAO = :IDFUNDACAO'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 22
    Top = 325
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object qryTpPgto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *  FROM TPPAGTOBENEFICIO')
    ValidateWithMask = True
    Left = 186
    Top = 331
  end
  object qryBenefEvento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDBENEFICIO,NOME,NUMORDEMEVENTO,FLGBENEFOBRIGATO'
      'FROM   BENEFICIO'
      'WHERE  IDEVENTOGERADOR = :IDEVENTOGERADOR'
      'AND    IDBENEFICIO IN (SELECT BP.IDBENEFICIO'
      
        '                       FROM   BENEFPLANPREV BP, PLANPREVPATRO PL' +
        'P, PATRO PT'
      '                       WHERE  PT.IDFUNDACAO = :IDFUNDACAO'
      '                       AND    PLP.IDPESSJUR = PT.IDPESSOA'
      '                       AND    BP.IDPLANOPREV = PLP.IDPLANOPREV )'
      'ORDER BY NUMORDEMEVENTO'
      ' '
      ' ')
    ControlType.Strings = (
      'FLGBENEFOBRIGATO;CheckBox;1;0')
    ValidateWithMask = True
    Left = 105
    Top = 326
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDEVENTOGERADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object dsBenefEvento: TwwDataSource
    DataSet = qryBenefEvento
    Left = 102
    Top = 371
  end
  object qryRegra: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DESCRICAOREGRA, IDREGRA, IDTIPOREGRA,'
      '       NOMEREGRA, PUBLICADA'
      'FROM   REGRA'
      'ORDER  BY NOMEREGRA')
    ValidateWithMask = True
    Left = 652
    Top = 388
  end
end
