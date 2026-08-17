inherited FrmRubricasCompoeSalarios: TFrmRubricasCompoeSalarios
  Left = 252
  Top = 108
  HelpContext = 320025
  Caption = 'Rubricas que compõem os salários'
  ClientHeight = 319
  ClientWidth = 432
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 432
    Height = 233
    inherited dbGrd: TwwDBGrid [0]
      Width = 430
      Height = 231
      Selected.Strings = (
        'NOME'#9'20'#9'Plano'
        'DESCRICAO'#9'40'#9'Rubrica'
        'FLGCOMPOEREMTOTAL'#9'10'#9'Remuneração Total'
        'FLGCOMPOESALBENEF'#9'10'#9'Salário Benefício'
        'FLGCOMPOESALPART'#9'10'#9'Salário Participação')
    end
    inherited pnlControles: TPanel [1]
      Width = 430
      Height = 231
      object Label1: TLabel
        Left = 8
        Top = 40
        Width = 118
        Height = 13
        Caption = 'Plano Previdenciário'
      end
      object Label2: TLabel
        Left = 8
        Top = 0
        Width = 49
        Height = 13
        Caption = 'Rubrica '
      end
      object SpeedButton1: TSpeedButton
        Left = 397
        Top = 16
        Width = 20
        Height = 19
        Hint = 'Busca Rubrica'
        Caption = 'B'
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton1Click
      end
      object GroupBox1: TGroupBox
        Left = 9
        Top = 81
        Width = 408
        Height = 137
        Caption = 'Somente para Previdência'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object dbchkCompoeSalPart: TDBCheckBox
          Left = 7
          Top = 15
          Width = 207
          Height = 17
          Caption = 'Compõe Salário de Participação'
          DataField = 'FLGCOMPOESALPART'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbchkCompoeSalBenef: TDBCheckBox
          Left = 7
          Top = 47
          Width = 216
          Height = 17
          Caption = 'Compõe Salário de Benefício'
          DataField = 'FLGCOMPOESALBENEF'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBCheckBox1: TDBCheckBox
          Left = 7
          Top = 63
          Width = 216
          Height = 17
          Caption = 'Compõe Remuneração Total'
          DataField = 'FLGCOMPOEREMTOTAL'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBCheckBox2: TDBCheckBox
          Left = 7
          Top = 79
          Width = 216
          Height = 17
          Caption = 'Salário de participação Retroativo'
          DataField = 'FLGSALPARTRETRO'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBCheckBox3: TDBCheckBox
          Left = 7
          Top = 95
          Width = 216
          Height = 17
          Caption = 'Salário de benefício Retroativo'
          DataField = 'FLGSALBENEFRETRO'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBCheckBox4: TDBCheckBox
          Left = 7
          Top = 111
          Width = 216
          Height = 17
          Caption = 'Salário de participação Atuarial'
          DataField = 'FLGSALPARTATUARIA'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBCheckBox5: TDBCheckBox
          Left = 7
          Top = 31
          Width = 207
          Height = 17
          Caption = 'Compõe Salário de Contribuição'
          DataField = 'FLGCOMPOESALCONT'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 6
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
      end
      object wwDBLookupCombo1: TwwDBLookupCombo
        Left = 8
        Top = 56
        Width = 409
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'50'#9'NOME')
        DataField = 'IDPLANOPREV'
        DataSource = ds
        LookupTable = qryPLANO
        LookupField = 'IDPLANOPREV'
        TabOrder = 1
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
      object dbidrubrica: TwwDBEdit
        Left = 8
        Top = 16
        Width = 73
        Height = 21
        DataField = 'IDRUBRICA'
        DataSource = ds
        TabOrder = 2
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object eddescidrubrica: TEdit
        Left = 88
        Top = 16
        Width = 305
        Height = 21
        TabOrder = 3
      end
    end
  end
  inherited Dock972: TDock97
    Width = 432
  end
  inherited Dock971: TDock97
    Top = 280
    Width = 432
    inherited tb97Fundo: TToolbar97
      Left = 260
      DockPos = 261
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 91
      DockPos = 92
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 303
    Top = 65522
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 345
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update provdescxplano'
      'set'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  FLGCOMPOESALPART = :FLGCOMPOESALPART,'
      '  FLGCOMPOESALCONT = :FLGCOMPOESALCONT,'
      '  FLGCOMPOESALBENEF = :FLGCOMPOESALBENEF,'
      '  FLGCOMPOEREMTOTAL = :FLGCOMPOEREMTOTAL,'
      '  FLGSALPARTRETRO = :FLGSALPARTRETRO,'
      '  FLGSALBENEFRETRO = :FLGSALBENEFRETRO,'
      '  FLGSALPARTATUARIA = :FLGSALPARTATUARIA,'
      '  IDRUBRICA = :IDRUBRICA'
      'where'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDRUBRICA = :OLD_IDRUBRICA')
    InsertSQL.Strings = (
      'insert into provdescxplano'
      '  (IDPLANOPREV, FLGCOMPOESALPART, FLGCOMPOESALBENEF, '
      'FLGCOMPOEREMTOTAL, '
      '   FLGSALPARTRETRO, FLGSALBENEFRETRO, FLGSALPARTATUARIA, '
      'IDRUBRICA,FLGCOMPOESALCONT)'
      'values'
      '  (:IDPLANOPREV, :FLGCOMPOESALPART, :FLGCOMPOESALBENEF, '
      ':FLGCOMPOEREMTOTAL, '
      '   :FLGSALPARTRETRO, :FLGSALBENEFRETRO, :FLGSALPARTATUARIA, '
      ':IDRUBRICA, :FLGCOMPOESALCONT)')
    DeleteSQL.Strings = (
      'delete from provdescxplano'
      'where'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDRUBRICA = :OLD_IDRUBRICA')
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PROVDESC.DESCRICAO'
      'PROVDESCXPLANO.IDRUBRICA')
    TipodeDado.Strings = (
      'C'
      'N')
    Descricao.Strings = (
      'Descrição '
      'Código')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'PROVDESC'
      'PROVDESCXPLANO')
    CamposChave.Strings = (
      'PROVDESCXPLANO.IDPLANOPREV'
      'PROVDESCXPLANO.IDRUBRICA')
    Filtro.Strings = (
      'PROVDESCXPLANO.IDRUBRICA = PROVDESC.IDPROVENTO')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '130'
      '10')
    OperComparador.Strings = (
      '-1'
      '-1')
    LookupSQL.Strings = (
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      '')
    Left = 266
    Top = 65528
  end
  inherited ImlPadrao: TImageList
    Left = 356
    Top = 65534
  end
  inherited CmeCadastro: TCmEventosCadastro
    AfterConfirma = CmeCadastroAfterConfirma
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      'PROVDESCXPLANO.IDPLANOPREV, PLANPREV.NOME, PROVDESC.DESCRICAO,'
      'PROVDESCXPLANO.FLGCOMPOESALPART,'
      'PROVDESCXPLANO.FLGCOMPOESALCONT,'
      'PROVDESCXPLANO.FLGCOMPOESALBENEF,'
      'PROVDESCXPLANO.FLGCOMPOEREMTOTAL,'
      'PROVDESCXPLANO.FLGSALPARTRETRO,'
      'PROVDESCXPLANO.FLGSALBENEFRETRO,'
      'PROVDESCXPLANO.FLGSALPARTATUARIA,'
      'IDRUBRICA'
      'FROM PROVDESCXPLANO, PLANPREV, PROVDESC'
      'WHERE PROVDESCXPLANO.IDPLANOPREV = PLANPREV.IDPLANOPREV'
      'AND   PROVDESCXPLANO.IDRUBRICA = PROVDESC.IDPROVENTO')
    ControlType.Strings = (
      'FLGCOMPOEREMTOTAL;CheckBox;1;0'
      'FLGCOMPOESALBENEF;CheckBox;1;0'
      'FLGCOMPOESALPART;CheckBox;1;0')
    Left = 306
    object qryNOME: TStringField
      DisplayLabel = 'Plano'
      DisplayWidth = 20
      FieldName = 'NOME'
      Origin = 'PLANPREV.NOME'
      Size = 50
    end
    object qryDESCRICAO: TStringField
      DisplayLabel = 'Rubrica'
      DisplayWidth = 40
      FieldName = 'DESCRICAO'
      Origin = 'PROVDESC.DESCRICAO'
      Size = 130
    end
    object qryFLGCOMPOEREMTOTAL: TFloatField
      DisplayLabel = 'Remuneração Total'
      DisplayWidth = 10
      FieldName = 'FLGCOMPOEREMTOTAL'
      Origin = 'PROVDESCXPLANO.FLGCOMPOEREMTOTAL'
    end
    object qryFLGCOMPOESALBENEF: TFloatField
      DisplayLabel = 'Salário Benefício'
      DisplayWidth = 10
      FieldName = 'FLGCOMPOESALBENEF'
      Origin = 'PROVDESCXPLANO.FLGCOMPOESALBENEF'
    end
    object qryFLGCOMPOESALPART: TFloatField
      DisplayLabel = 'Salário Participação'
      DisplayWidth = 10
      FieldName = 'FLGCOMPOESALPART'
      Origin = 'PROVDESCXPLANO.FLGCOMPOESALPART'
    end
    object qryIDPLANOPREV: TFloatField
      DisplayLabel = 'Plano'
      DisplayWidth = 30
      FieldName = 'IDPLANOPREV'
      Origin = 'PROVDESCXPLANO.IDPLANOPREV'
      Visible = False
    end
    object qryIDRUBRICA: TFloatField
      DisplayLabel = 'Rubrica'
      DisplayWidth = 30
      FieldName = 'IDRUBRICA'
      Origin = 'PROVDESCXPLANO.IDRUBRICA'
      Visible = False
    end
    object qryFLGSALPARTRETRO: TFloatField
      FieldName = 'FLGSALPARTRETRO'
      Origin = 'PROVDESCXPLANO.FLGSALPARTRETRO'
      Visible = False
    end
    object qryFLGSALBENEFRETRO: TFloatField
      FieldName = 'FLGSALBENEFRETRO'
      Origin = 'PROVDESCXPLANO.FLGSALBENEFRETRO'
      Visible = False
    end
    object qryFLGSALPARTATUARIA: TFloatField
      FieldName = 'FLGSALPARTATUARIA'
      Origin = 'PROVDESCXPLANO.FLGSALPARTATUARIA'
      Visible = False
    end
    object qryFLGCOMPOESALCONT: TFloatField
      FieldName = 'FLGCOMPOESALCONT'
      Origin = 'BASEDADOS.PROVDESCXPLANO.FLGCOMPOESALCONT'
    end
  end
  object qryPLANO: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM PLANPREV'
      
        'WHERE  IDPLANOPREV IN (SELECT PLP.IDPLANOPREV FROM PLANPREVPATRO' +
        ' PLP, PATRO PT WHERE PLP.IDPESSJUR = PT.IDPESSOA AND PT.IDFUNDAC' +
        'AO = :IDFUNDACAO)')
    ValidateWithMask = True
    Left = 293
    Top = 156
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object dtsPLANO: TwwDataSource
    DataSet = qryPLANO
    Left = 293
    Top = 104
  end
  object qryPROVDESC: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select * from provdesc')
    ValidateWithMask = True
    Left = 358
    Top = 157
    object qryPROVDESCDESCRICAO: TStringField
      DisplayLabel = 'Descrição da Rubrica'
      DisplayWidth = 130
      FieldName = 'DESCRICAO'
      Origin = 'PROVDESC.DESCRICAO'
      Size = 130
    end
    object qryPROVDESCIDPROVENTO: TFloatField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'IDPROVENTO'
      Origin = 'PROVDESC.IDPROVENTO'
    end
  end
  object dtsPROVDESC: TwwDataSource
    DataSet = qryPROVDESC
    Left = 360
    Top = 104
  end
  object MontaSelect1: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PROVDESC.IDPROVENTO'
      'PROVDESC.DESCRICAO')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'PROVDESC')
    CamposChave.Strings = (
      'PROVDESC.IDPROVENTO'
      'PROVDESC.DESCRICAO')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '130')
    OperComparador.Strings = (
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      '')
    Left = 358
    Top = 36
  end
end
