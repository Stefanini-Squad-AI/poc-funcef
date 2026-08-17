inherited FrmCancPartAss: TFrmCancPartAss
  Left = 288
  Top = 86
  Caption = 'Cancelamento de Participante Assistencial'
  ClientHeight = 416
  ClientWidth = 443
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 443
    Height = 330
    object pnlTitular: TPanel
      Left = 1
      Top = 1
      Width = 441
      Height = 152
      Align = alTop
      TabOrder = 0
      object Label1: TLabel
        Left = 14
        Top = 45
        Width = 97
        Height = 13
        Caption = 'Plano Previdenciário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 320
        Top = 9
        Width = 45
        Height = 13
        Caption = 'Matrícula'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 320
        Top = 45
        Width = 43
        Height = 13
        Caption = 'Inscrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 14
        Top = 79
        Width = 85
        Height = 13
        Caption = 'Plano Assistencial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label11: TLabel
        Left = 16
        Top = 114
        Width = 66
        Height = 13
        Caption = 'Patrocinadora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 318
        Top = 79
        Width = 84
        Height = 13
        Caption = 'Data da Inscrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 14
        Top = 8
        Width = 29
        Height = 13
        Caption = 'Titular'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBText1: TDBText
        Left = 16
        Top = 24
        Width = 50
        Height = 13
        AutoSize = True
        DataField = 'NOME'
        DataSource = ds
      end
      object DBText2: TDBText
        Left = 320
        Top = 24
        Width = 50
        Height = 13
        AutoSize = True
        DataField = 'MATRICULA'
        DataSource = ds
      end
      object DBText3: TDBText
        Left = 16
        Top = 59
        Width = 50
        Height = 13
        AutoSize = True
        DataField = 'PLANOPREVIDENCIARIO'
        DataSource = ds
      end
      object DBText4: TDBText
        Left = 320
        Top = 59
        Width = 50
        Height = 13
        AutoSize = True
        DataField = 'INSCRICAONUMERO'
        DataSource = ds
      end
      object DBText5: TDBText
        Left = 16
        Top = 95
        Width = 50
        Height = 13
        AutoSize = True
        DataField = 'PLANOASSISTENCIAL'
        DataSource = ds
      end
      object DBText6: TDBText
        Left = 320
        Top = 95
        Width = 50
        Height = 13
        AutoSize = True
        DataField = 'DATAENTRADA'
        DataSource = ds
      end
      object DBText7: TDBText
        Left = 16
        Top = 130
        Width = 50
        Height = 13
        AutoSize = True
        DataField = 'NOMEPATRO'
        DataSource = ds
      end
    end
    object grpDadosBenef: TGroupBox
      Left = 1
      Top = 153
      Width = 441
      Height = 176
      Align = alClient
      TabOrder = 1
      object Label6: TLabel
        Left = 12
        Top = 12
        Width = 130
        Height = 13
        Caption = 'Data do Cancelamento'
      end
      object Label5: TLabel
        Left = 12
        Top = 60
        Width = 177
        Height = 13
        Caption = 'Observações do Cancelamento'
      end
      object Label4: TLabel
        Left = 175
        Top = 12
        Width = 175
        Height = 13
        Caption = 'Nova Situação do Participante'
      end
      object dtpDataCancel: TwwDBDateTimePicker
        Left = 12
        Top = 30
        Width = 121
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        DataField = 'DATACANCELAMENTO'
        DataSource = ds
        Epoch = 1950
        ShowButton = True
        TabOrder = 0
      end
      object dbmObservacao: TDBMemo
        Left = 12
        Top = 75
        Width = 421
        Height = 89
        DataField = 'OBSCANCEL'
        DataSource = ds
        TabOrder = 2
      end
      object lkbNovaSituacao: TwwDBLookupCombo
        Left = 176
        Top = 30
        Width = 257
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'50'#9'Nova Situação'#9'F')
        DataField = 'IDSITPART'
        DataSource = ds
        LookupTable = qrySituacao
        LookupField = 'IDSITPLANOASS'
        TabOrder = 1
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
    end
  end
  inherited Dock972: TDock97
    Width = 443
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
    Top = 377
    Width = 443
    inherited tb97Fundo: TToolbar97
      Left = 271
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 102
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 216
    Top = 65534
    TargetsData = (
      1
      2
      (
        'TMemo'
        'Text'
        0)
      (
        'TDBMemo'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 339
    Top = 65534
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PARTASS'
      'set'
      '  IDSITPART = :IDSITPART,'
      '  DATAENTRADA = :DATAENTRADA,'
      '  FLGINSCRICAOCANC = :FLGINSCRICAOCANC,'
      '  INSCRICAONUMERO = :INSCRICAONUMERO,'
      '  DATACANCELAMENTO = :DATACANCELAMENTO,'
      '  INSCRICAOTIPO = :INSCRICAOTIPO,'
      '  OBSCANCEL = :OBSCANCEL,'
      '  FLGPARTBENEF = :FLGPARTBENEF,'
      '  OPCAOA = :OPCAOA,'
      '  OPCAOB = :OPCAOB,'
      '  IDFORNSERV2 = :IDFORNSERV2,'
      '  COMISSFORN = :COMISSFORN,'
      '  COMISSFUND = :COMISSFUND,'
      '  FLGOPCAOA = :FLGOPCAOA,'
      '  TIPOFORNSERV2 = :TIPOFORNSERV2,'
      '  FLGOPCAOB = :FLGOPCAOB,'
      '  IDNUCLEO = :IDNUCLEO,'
      '  VALORBASE1 = :VALORBASE1,'
      '  VALORBASE2 = :VALORBASE2,'
      '  VALORBASE3 = :VALORBASE3,'
      '  VALORBASE4 = :VALORBASE4,'
      '  VALORBASE5 = :VALORBASE5,'
      '  VALORBASE6 = :VALORBASE6,'
      '  VALORBASE7 = :VALORBASE7,'
      '  VALORBASE8 = :VALORBASE8'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDPLANASS = :OLD_IDPLANASS'
      ' ')
    InsertSQL.Strings = (
      'insert into PARTASS'
      '  (IDPESSJUR, SEQPROPOSTA, IDPLANOPREV, IDPESSOA, IDPLANASS, '
      'IDSITPART, '
      '   DATAENTRADA, FLGINSCRICAOCANC, INSCRICAONUMERO,'
      'DATACANCELAMENTO, '
      '   INSCRICAOTIPO, OBSCANCEL, FLGPARTBENEF, '
      '   OPCAOA, OPCAOB, IDFORNSERV2, COMISSFORN, COMISSFUND, '
      'FLGOPCAOA, TIPOFORNSERV2, '
      '   FLGOPCAOB, IDNUCLEO, VALORBASE1, VALORBASE2, VALORBASE3, '
      'VALORBASE4, '
      '   VALORBASE5, VALORBASE6, VALORBASE7, VALORBASE8)'
      'values'
      
        '  (:IDPESSJUR, :SEQPROPOSTA, :IDPLANOPREV, :IDPESSOA, :IDPLANASS' +
        ', '
      ':IDSITPART, '
      '   :DATAENTRADA, :FLGINSCRICAOCANC, '
      ':INSCRICAONUMERO, :DATACANCELAMENTO, '
      '   :INSCRICAOTIPO, :OBSCANCEL, :FLGPARTBENEF, '
      '   :OPCAOA, :OPCAOB, :IDFORNSERV2, :COMISSFORN, :COMISSFUND, '
      ':FLGOPCAOA, '
      
        '   :TIPOFORNSERV2, :FLGOPCAOB, :IDNUCLEO, :VALORBASE1, :VALORBAS' +
        'E2, '
      ':VALORBASE3, '
      
        '   :VALORBASE4, :VALORBASE5, :VALORBASE6, :VALORBASE7, :VALORBAS' +
        'E8)'
      ' ')
    DeleteSQL.Strings = (
      'delete from PARTASS'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDPLANASS = :OLD_IDPLANASS')
    Left = 379
    Top = 65534
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Participante Assistencial Ativo'
    Colunas.Strings = (
      'PP.INSCRICAONUMERO'
      'EL.MATRICULA'
      'PE.NOME'
      'PJ.NOME'
      'PL.NOME')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Número de Inscricao'
      'Matrícula'
      'Nome do Participante'
      'Patrocinadora'
      'Plano Assistencial')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PARTASS PA'
      'PARTPREVPLAN PP'
      'PESSOA PE'
      'PESSOA PJ'
      'ELEGPATRO EL'
      'PLANASS PL')
    CamposChave.Strings = (
      'PA.IDPESSOA'
      'PA.IDPESSJUR'
      'PA.SEQPROPOSTA'
      'PA.IDPLANOPREV'
      'PA.IDPLANASS')
    Filtro.Strings = (
      'PE.IDPESSOA = PA.IDPESSOA'
      'PJ.IDPESSOA = PA.IDPESSJUR'
      'PA.IDPESSOA = PP.IDPESSOA'
      'PA.IDPESSJUR = PP.IDPESSJUR'
      'PA.IDPLANOPREV = PP.IDPLANOPREV'
      'PA.SEQPROPOSTA = PP.SEQPROPOSTA'
      'PA.DATACANCELAMENTO IS NULL'
      'PP.FLGDESATIVADO = 0'
      'EL.IDPESSOA = PP.IDPESSOA'
      'EL.IDPESSJUR = PP.IDPESSJUR'
      'PL.IDPLANASS = PA.IDPLANASS')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '13'
      '60'
      '60'
      '40')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    Left = 53
    Top = 374
  end
  inherited ImlPadrao: TImageList
    Left = 257
    Top = 65534
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 12
    Top = 374
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      
        'SELECT PA.IDPESSJUR, PA.SEQPROPOSTA, PA.IDPLANOPREV, PA.IDPESSOA' +
        ',  PA.IDPLANASS,'
      
        '       PA.IDSITPART, PA.IDSITPART, PA.DATAENTRADA, PA.FLGINSCRIC' +
        'AOCANC,'
      
        '       PA.INSCRICAONUMERO, PA.DATACANCELAMENTO, PA.INSCRICAOTIPO' +
        ', PA.OBSCANCEL,'
      
        '       PA.FLGPARTBENEF, PA.OPCAOA, PA.OPCAOB, PA.IDFORNSERV2, PA' +
        '.COMISSFORN, PA.COMISSFUND,'
      
        '       PA.FLGOPCAOA,  PA.TIPOFORNSERV2, PA.FLGOPCAOB, PA.IDNUCLE' +
        'O,'
      
        '       PA.VALORBASE1, PA.VALORBASE2, PA.VALORBASE3, PA.VALORBASE' +
        '4,'
      
        '       PA.VALORBASE5, PA.VALORBASE6, PA.VALORBASE7, PA.VALORBASE' +
        '8,'
      '       PE.NOME, PV.INSCRICAONUMERO, EL.MATRICULA,'
      
        '       PL.NOME AS PLANOASSISTENCIAL, PP.NOME AS PLANOPREVIDENCIA' +
        'RIO,'
      '       PJ.NOME AS NOMEPATRO'
      'FROM PARTASS PA, PESSOA PE, PLANASS PL, PLANPREV PP,'
      '     ELEGPATRO EL, PARTPREVPLAN PV, PESSOA PJ'
      'WHERE PA.IDPLANASS     = :IDPLANASS'
      '  AND PA.IDPESSOA      = :IDPESSOA'
      '  AND PA.IDPLANOPREV   = :IDPLANOPREV'
      '  AND PA.IDPESSJUR     = :IDPESSJUR'
      '  AND PA.SEQPROPOSTA   = :SEQPROPOSTA'
      '  AND PL.IDPLANASS     = PA.IDPLANASS'
      '  AND PE.IDPESSOA      = PA.IDPESSOA'
      '  AND PV.IDPESSJUR     = PA.IDPESSJUR'
      '  AND PV.IDPLANOPREV   = PA.IDPLANOPREV'
      '  AND PV.IDPESSOA      = PA.IDPESSOA'
      '  AND PV.SEQPROPOSTA   = PA.SEQPROPOSTA'
      '  AND PV.FLGDESATIVADO = 0'
      '  AND EL.IDPESSOA      = PV.IDPESSOA'
      '  AND EL.IDPESSJUR     = PV.IDPESSJUR'
      '  AND PJ.IDPESSOA      = EL.IDPESSJUR'
      '  AND PP.IDPLANOPREV   = PV.IDPLANOPREV'
      ' '
      ' '
      ' ')
    Left = 298
    Top = 65534
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANASS'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end>
  end
  object qrySituacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDSITPLANOASS, DESCRICAO'
      'FROM SITPLANOASS'
      'WHERE FLGINTERNO IN ('#39'CA'#39','#39'CI'#39')'
      'ORDER BY DESCRICAO'
      '')
    ValidateWithMask = True
    Left = 152
    Top = 56
    object qrySituacaoDESCRICAO: TStringField
      DisplayLabel = 'Nova Situação'
      DisplayWidth = 50
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.SITPLANOASS.DESCRICAO'
      Size = 50
    end
    object qrySituacaoIDSITPLANOASS: TFloatField
      FieldName = 'IDSITPLANOASS'
      Origin = 'BASEDADOS.SITPLANOASS.IDSITPLANOASS'
      Visible = False
    end
  end
  object qryBenefAss: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDPESSJUR, IDTITULAR, IDPLANOPREV, IDPLANASS, IDDEPENDENT' +
        'E, SEQPROPOSTA,'
      '       FLGATIVO, DTCANCELAMENTO, OBSCANCEL'
      'FROM BENEFASS'
      'WHERE IDPESSJUR    = :IDPESSJUR'
      '  AND IDTITULAR    = :IDTITULAR'
      '  AND IDPLANOPREV  = :IDPLANOPREV'
      '  AND IDPLANASS    = :IDPLANASS'
      '  AND SEQPROPOSTA  = :SEQPROPOSTA'
      '  AND FLGATIVO     = 1')
    UpdateObject = updBenefAss
    ValidateWithMask = True
    Left = 161
    Top = 128
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANASS'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end>
  end
  object dsBenefAss: TwwDataSource
    DataSet = qryBenefAss
    Left = 161
    Top = 144
  end
  object updBenefAss: TUpdateSQL
    ModifySQL.Strings = (
      'update BENEFASS'
      'set'
      '  FLGATIVO = :FLGATIVO,'
      '  DTCANCELAMENTO = :DTCANCELAMENTO,'
      '  OBSCANCEL = :OBSCANCEL'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPLANASS = :OLD_IDPLANASS and'
      '  IDDEPENDENTE = :OLD_IDDEPENDENTE and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA')
    InsertSQL.Strings = (
      'insert into BENEFASS'
      
        '  (IDPESSJUR, IDTITULAR, IDPLANOPREV, IDPLANASS, IDDEPENDENTE, S' +
        'EQPROPOSTA, '
      '   FLGATIVO, DTCANCELAMENTO, OBSCANCEL)'
      'values'
      
        '  (:IDPESSJUR, :IDTITULAR, :IDPLANOPREV, :IDPLANASS, :IDDEPENDEN' +
        'TE, :SEQPROPOSTA, '
      '   :FLGATIVO, :DTCANCELAMENTO, :OBSCANCEL)')
    DeleteSQL.Strings = (
      'delete from BENEFASS'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPLANASS = :OLD_IDPLANASS and'
      '  IDDEPENDENTE = :OLD_IDDEPENDENTE and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA')
    Left = 161
    Top = 158
  end
  object qryContAss: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDPLANASS, IDPLANOPREV, IDPESSJUR, IDTITULAR, IDDEPENDENT' +
        'E, IDCONTASS, SEQPROPOSTA,'
      '       FLGATIVO'
      'FROM CONTASS'
      'WHERE IDPLANASS    = :IDPLANASS'
      '  AND IDPLANOPREV  = :IDPLANOPREV'
      '  AND IDPESSJUR    = :IDPESSJUR'
      '  AND IDTITULAR    = :IDTITULAR'
      '  AND SEQPROPOSTA  = :SEQPROPOSTA'
      ' ')
    UpdateObject = updContAss
    ValidateWithMask = True
    Left = 254
    Top = 128
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANASS'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end>
  end
  object dsContAss: TwwDataSource
    DataSet = qryContAss
    Left = 254
    Top = 144
  end
  object updContAss: TUpdateSQL
    ModifySQL.Strings = (
      'update CONTASS'
      'set'
      '  FLGATIVO = :FLGATIVO'
      'where'
      '  IDPLANASS = :OLD_IDPLANASS and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDDEPENDENTE = :OLD_IDDEPENDENTE and'
      '  IDCONTASS = :OLD_IDCONTASS and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA')
    InsertSQL.Strings = (
      'insert into CONTASS'
      '  (IDPLANASS, IDPLANOPREV, IDPESSJUR, IDTITULAR, IDDEPENDENTE, '
      'IDCONTASS, '
      '   SEQPROPOSTA, FLGATIVO)'
      'values'
      
        '  (:IDPLANASS, :IDPLANOPREV, :IDPESSJUR, :IDTITULAR, :IDDEPENDEN' +
        'TE, '
      ':IDCONTASS, '
      '   :SEQPROPOSTA, :FLGATIVO)')
    DeleteSQL.Strings = (
      'delete from CONTASS'
      'where'
      '  IDPLANASS = :OLD_IDPLANASS and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDDEPENDENTE = :OLD_IDDEPENDENTE and'
      '  IDCONTASS = :OLD_IDCONTASS and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA')
    Left = 254
    Top = 158
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 216
    Top = 56
    object FloatField1: TFloatField
      FieldName = 'IDSITPLANOASS'
      Origin = 'BASEDADOS.SITPLANOASS.IDSITPLANOASS'
    end
    object StringField1: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.SITPLANOASS.DESCRICAO'
      Size = 50
    end
  end
end
