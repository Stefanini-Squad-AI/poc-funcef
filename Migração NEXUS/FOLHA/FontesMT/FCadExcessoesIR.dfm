inherited FrmCadExcessoesIR: TFrmCadExcessoesIR
  Left = 12
  Top = 84
  Caption = 'Informações Individuais do Assistido'
  ClientHeight = 447
  ClientWidth = 758
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 758
    Height = 361
    object Label2: TLabel
      Left = 14
      Top = 12
      Width = 42
      Height = 16
      Caption = 'Nome'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 12
      Top = 37
      Width = 99
      Height = 16
      Caption = 'Patrocinadora'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 13
      Top = 63
      Width = 146
      Height = 16
      Caption = 'Plano Previdenciário'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Bevel1: TBevel
      Left = 6
      Top = 90
      Width = 746
      Height = 3
    end
    object Label1: TLabel
      Left = 11
      Top = 235
      Width = 215
      Height = 16
      Caption = 'Excessões no Cálculo do IRRF'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edNome: TEdit
      Left = 165
      Top = 8
      Width = 580
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
    object edPatro: TEdit
      Left = 165
      Top = 35
      Width = 580
      Height = 21
      ReadOnly = True
      TabOrder = 1
    end
    object edPlano: TEdit
      Left = 165
      Top = 61
      Width = 580
      Height = 21
      ReadOnly = True
      TabOrder = 2
    end
    object rdgdestino: TRadioGroup
      Left = 7
      Top = 192
      Width = 743
      Height = 43
      Caption = 'Destino do Demonstrativo de Proventos'
      Columns = 2
      Items.Strings = (
        'Residência'
        'Agência Bancária')
      TabOrder = 3
    end
    object GroupBox1: TGroupBox
      Left = 7
      Top = 96
      Width = 743
      Height = 45
      Caption = 'Informações Referentes ao I.R.R.F.'
      TabOrder = 4
      object Label10: TLabel
        Left = 6
        Top = 21
        Width = 94
        Height = 13
        Caption = 'Nº Dependentes'
      end
      object chkisento: TCheckBox
        Left = 166
        Top = 19
        Width = 73
        Height = 17
        Caption = 'ISENTO'
        TabOrder = 0
      end
      object chkirtotal: TCheckBox
        Left = 241
        Top = 18
        Width = 444
        Height = 17
        Caption = 
          'Junta Proventos de Suplementação e INSS para formação de Base Ún' +
          'ica'
        TabOrder = 1
      end
      object edtnumdepirrf: TEdit
        Left = 106
        Top = 17
        Width = 41
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
    end
    object wwDBGrid1: TwwDBGrid
      Left = 9
      Top = 253
      Width = 739
      Height = 100
      Selected.Strings = (
        'BENEFICIO'#9'77'#9'BENEFICIO'
        'FLGDESCIRMES'#9'21'#9'ISENTA DE IRRF NO MÊS')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MultiSelectOptions = [msoShiftSelect]
      ParentFont = False
      TabOrder = 5
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindow
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      IndicatorColor = icBlack
    end
    object grbInfSalFam: TGroupBox
      Left = 7
      Top = 145
      Width = 743
      Height = 45
      Caption = 'Informações Referentes ao Salário Família'
      TabOrder = 6
      object lblNumDepSalFam: TLabel
        Left = 6
        Top = 21
        Width = 94
        Height = 13
        Caption = 'Nº Dependentes'
      end
      object edtNumDepSalFam: TEdit
        Left = 106
        Top = 17
        Width = 41
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
    end
  end
  inherited Dock972: TDock97
    Width = 758
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 408
    Width = 758
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 272
    Top = 6
    TargetsData = (
      1
      1
      (
        'TRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 416
    Top = 2
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update BENEFBFCIARIO'
      'set'
      '  FLGDESCIRMES = :FLGDESCIRMES'
      'where'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDBENEFICIO = :OLD_IDBENEFICIO')
    InsertSQL.Strings = (
      'insert into BENEFBFCIARIO'
      '  (FLGDESCIRMES)'
      'values'
      '  (:FLGDESCIRMES)')
    DeleteSQL.Strings = (
      'delete from BENEFBFCIARIO'
      'where'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDBENEFICIO = :OLD_IDBENEFICIO')
    Left = 451
    Top = 2
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona o Participante'
    Left = 578
    Top = 3
  end
  inherited ImlPadrao: TImageList
    Left = 313
    Top = 6
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 507
    Top = 4
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '  BBF.IDPLANOPREV,'
      #9'BBF.IDPESSJUR,'
      #9'BBF.IDPESSOA,'
      #9'BEN.NOME AS BENEFICIO,'
      #9'BBF.FLGDESCIRMES,'
      '  BBF.IDBENEFICIO,'
      '  BBF.IDSITBENEFICIO'
      ''
      'FROM'
      #9'BENEFBFCIARIO BBF,'
      #9'BENEFICIO BEN'
      ''
      'WHERE'
      #9'BBF.IDPLANOPREV    = :PIDPLANOPREV AND'
      #9'BBF.IDPESSJUR      = :PIDPESSJUR   AND'
      #9'BBF.IDPESSOA       = :PIDPESSOA    AND'
      #9'BBF.IDSITBENEFICIO = 1             AND'
      #9'BEN.IDBENEFICIO    = BBF.IDBENEFICIO'
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
    ControlType.Strings = (
      'FLGDESCIRMES;CheckBox;1;0')
    Left = 383
    Top = 2
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryBENEFICIO: TStringField
      DisplayWidth = 77
      FieldName = 'BENEFICIO'
      Origin = 'BASEDADOS.BENEFICIO.NOME'
      Size = 60
    end
    object qryFLGDESCIRMES: TFloatField
      DisplayLabel = 'ISENTA DE IRRF NO MÊS'
      DisplayWidth = 21
      FieldName = 'FLGDESCIRMES'
      Origin = 'BASEDADOS.BENEFBFCIARIO.FLGDESCIRMES'
    end
    object qryIDPLANOPREV: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.BENEFBFCIARIO.IDPLANOPREV'
      Visible = False
    end
    object qryIDPESSJUR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSJUR'
      Origin = 'BASEDADOS.BENEFBFCIARIO.IDPESSJUR'
      Visible = False
    end
    object qryIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.BENEFBFCIARIO.IDPESSOA'
      Visible = False
    end
    object qryIDBENEFICIO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDBENEFICIO'
      Origin = 'BASEDADOS.BENEFBFCIARIO.IDBENEFICIO'
      Visible = False
    end
    object qryIDSITBENEFICIO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDSITBENEFICIO'
      Origin = 'BASEDADOS.BENEFBFCIARIO.IDSITBENEFICIO'
      Visible = False
    end
  end
  object MontaSelectPart: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'ELEGPATRO.MATRICULA'
      'DEP.MATRICULA'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'PARTICIPANTE.NUMDOCUMENTO'
      'PDEP.NOME'
      'PP.NOME'
      'PATROCINADORA.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Mat. do Titular'
      'Mat. do Beneficiário'
      'Número de Inscrição'
      'CPF'
      'Pessoa'
      'Plano'
      'Patrocinadora')
    SensivelACaixa.Strings = (
      'S'
      'S'
      'N'
      'S'
      'S'
      'S'
      'S')
    Tabelas.Strings = (
      'PESSOA PARTICIPANTE'
      'PESSOA PATROCINADORA'
      'PLANPREV'
      'ELEGPATRO'
      'PARTPREVPLAN'
      'PESSOAFISICA'
      'DEPENTIT DEP'
      'PESSOA PDEP'
      'PLANPREV PP'
      'BFCIARIOTITPLAN BF')
    CamposChave.Strings = (
      'PARTICIPANTE.NOME'
      'PP.NOME'
      'PATROCINADORA.NOME'
      'PARTPREVPLAN.IDPESSOA'
      'PARTPREVPLAN.IDPESSJUR'
      'PARTPREVPLAN.IDPLANOPREV'
      'PESSOAFISICA.DATANASC'
      'PESSOAFISICA.NUMDEPIRRF'
      'PESSOAFISICA.FLGISENTOIRRF'
      'PDEP.IDPESSOA'
      'PDEP.NOME')
    Filtro.Strings = (
      'PARTPREVPLAN.IDPESSOA = PARTICIPANTE.IDPESSOA'
      'PARTPREVPLAN.IDPLANOPREV = PLANPREV.IDPLANOPREV'
      'PARTPREVPLAN.IDPESSJUR = PATROCINADORA.IDPESSOA'
      'PARTPREVPLAN.IDPESSJUR = ELEGPATRO.IDPESSJUR'
      'PARTPREVPLAN.IDPESSOA = ELEGPATRO.IDPESSOA'
      'PESSOAFISICA.IDPESSOA = PARTICIPANTE.IDPESSOA'
      'PARTPREVPLAN.FLGDESATIVADO = 0'
      'PARTICIPANTE.IDPESSOA = DEP.IDTITULAR'
      'DEP.IDPESSOA = PDEP.IDPESSOA'
      'PARTPREVPLAN.IDPESSJUR = BF.IDPESSJUR'
      'DEP.IDTITULAR = BF.IDTITULAR'
      'BF.IDPESSOA = PDEP.IDPESSOA'
      'BF.IDPLANOPREV = PP.IDPLANOPREV')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '10'
      '18'
      '20'
      '30'
      '30'
      '30')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = True
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 656
    Top = 3
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 718
    Top = 4
  end
end
