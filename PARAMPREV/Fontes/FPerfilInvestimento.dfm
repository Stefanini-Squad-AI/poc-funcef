inherited FrmPerfilInvestimento: TFrmPerfilInvestimento
  Left = 356
  Top = 90
  Caption = 'Cadastro de Perfil de Investimento'
  ClientHeight = 532
  ClientWidth = 731
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 731
    Height = 446
    object Nome: TLabel
      Left = 12
      Top = 15
      Width = 33
      Height = 13
      Caption = 'Nome'
    end
    object Label2: TLabel
      Left = 12
      Top = 52
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object lblPlanoContab: TLabel
      Left = 261
      Top = 91
      Width = 83
      Height = 13
      Caption = 'Plano Contábil'
    end
    object lblPlano: TLabel
      Left = 12
      Top = 90
      Width = 118
      Height = 13
      Caption = 'Plano Previdenciário'
    end
    object DBNome: TwwDBEdit
      Left = 12
      Top = 28
      Width = 485
      Height = 21
      DataField = 'NOME'
      DataSource = ds
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object DBDescricao: TwwDBEdit
      Left = 12
      Top = 66
      Width = 485
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = ds
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblcPlanoContab: TwwDBLookupCombo
      Left = 261
      Top = 104
      Width = 236
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'35'#9'NOME'#9'F'
        'IDPLANOPREV'#9'10'#9'IDPLANOPREV'#9'F')
      DataField = 'IDPLANPREVCONTAB'
      DataSource = ds
      LookupTable = qryPlaContab
      LookupField = 'IDPLANOPREV'
      Style = csDropDownList
      ParentFont = False
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
    end
    object dblcPlano: TwwDBLookupCombo
      Left = 12
      Top = 104
      Width = 242
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'35'#9'NOME'#9'F'
        'IDPLANOPREV'#9'10'#9'IDPLANOPREV'#9'F')
      DataField = 'IDPLANOPREV'
      DataSource = ds
      LookupTable = qryPlanPrev
      LookupField = 'IDPLANOPREV'
      Style = csDropDownList
      ParentFont = False
      TabOrder = 2
      AutoDropDown = False
      ShowButton = True
      SeqSearchOptions = []
      AllowClearKey = False
    end
    object GBSitpart: TGroupBox
      Left = 12
      Top = 132
      Width = 485
      Height = 105
      Caption = 'Situação do Participante'
      TabOrder = 4
      object ChLBSitPart: TCheckListBox
        Left = 2
        Top = 15
        Width = 481
        Height = 88
        Align = alClient
        ItemHeight = 13
        TabOrder = 0
        OnClick = ChLBSitPartClick
      end
    end
    object PGEvento: TPageControl
      Left = 1
      Top = 252
      Width = 729
      Height = 193
      ActivePage = TSEvento
      Align = alBottom
      TabOrder = 7
      object TSEvento: TTabSheet
        Caption = 'Evento'
        object ChLBEvento: TCheckListBox
          Left = 0
          Top = 0
          Width = 721
          Height = 165
          Align = alClient
          ItemHeight = 13
          TabOrder = 0
          OnClick = ChLBEventoClick
        end
      end
    end
    object DBPadINSS: TDBCheckBox
      Left = 513
      Top = 148
      Width = 97
      Height = 17
      Caption = 'Padrão INSS'
      DataField = 'FLGPADRAOINSS'
      DataSource = ds
      TabOrder = 5
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object DBativo: TDBCheckBox
      Left = 513
      Top = 170
      Width = 97
      Height = 17
      Caption = 'Ativo'
      DataField = 'FLGATIVO'
      DataSource = ds
      TabOrder = 6
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
  end
  inherited Dock972: TDock97
    Width = 731
  end
  inherited Dock971: TDock97
    Top = 493
    Width = 731
    inherited tb97Fundo: TToolbar97
      Left = 559
      DockPos = 627
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 390
      DockPos = 458
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 372
    Top = 2
  end
  inherited ds: TwwDataSource
    Left = 495
    Top = 2
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PERFILINVEST'
      'set'
      '  NOME = :NOME,'
      '  DESCRICAO = :DESCRICAO,'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  IDPLANPREVCONTAB = :IDPLANPREVCONTAB,'
      '  FLGPADRAOINSS = :FLGPADRAOINSS,'
      '  FLGATIVO = :FLGATIVO'
      'where'
      '  IDPERFILINVEST = :OLD_IDPERFILINVEST')
    InsertSQL.Strings = (
      'insert into PERFILINVEST'
      
        '  (idperfilinvest, NOME, DESCRICAO, IDPLANOPREV, IDPLANPREVCONTA' +
        'B, FLGPADRAOINSS, '
      'FLGATIVO)'
      'values'
      
        '  (:idperfilinvest, :NOME, :DESCRICAO, :IDPLANOPREV, :IDPLANPREV' +
        'CONTAB, '
      ':FLGPADRAOINSS,    :FLGATIVO)')
    DeleteSQL.Strings = (
      'delete from PERFILINVEST'
      'where'
      '  IDPERFILINVEST = :OLD_IDPERFILINVEST')
    Left = 535
    Top = 2
  end
  inherited MontaSelect: TMontaSelect
    Caption = ''
    Colunas.Strings = (
      'PI.NOME'
      'PI.DESCRICAO'
      'PP.NOME'
      'PPC.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nome'
      'Descrição'
      'Plano Previdenciário'
      'Plano Contábil')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      ' PERFILINVEST PI'
      ' PLANPREV PP'
      ' PLANPREVCONTABIL PPC')
    CamposChave.Strings = (
      'PI.IDPERFILINVEST')
    Filtro.Strings = (
      'PI.IDPLANOPREV = PP.IDPLANOPREV'
      'PI.IDPLANPREVCONTAB = PPC.IDPLANOPREV')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '23'
      '23'
      '23'
      '23')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1')
    ApenasLetraENum.Strings = (
      'N'
      'N'
      'N'
      'N')
    ComparaMaiuscula.Strings = (
      ''
      ''
      ''
      '')
    LookupSQL.Strings = (
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      '')
    Left = 637
    Top = 2
  end
  inherited ImlPadrao: TImageList
    Left = 413
    Top = 2
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 576
    Top = 2
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT '
      '   PI.NOME,'
      '   PI.DESCRICAO,'
      '   PI.IDPLANOPREV,'
      '   PP.NOME as PlanPrev,'
      '   PI.IDPLANPREVCONTAB,'
      '   PPC.NOME as PlanContabil,'
      '   PI.IDPERFILINVEST,'
      '   PI.FLGATIVO,'
      '   PI.FLGPADRAOINSS'
      'FROM'
      '    PERFILINVEST PI,'
      '    PLANPREV PP,'
      '    PLANPREVCONTABIL PPC'
      'WHERE '
      '   ( PI.IDPLANOPREV = PP.IDPLANOPREV ) AND'
      '   ( PI.IDPLANPREVCONTAB = PPC.IDPLANOPREV )'
      'AND PI.IDPERFILINVEST=  :IDPERFILINVEST')
    Left = 454
    Top = 2
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPERFILINVEST'
        ParamType = ptUnknown
      end>
    object qryIDPERFILINVEST: TFloatField
      FieldName = 'IDPERFILINVEST'
      Origin = 'BASEDADOS.PERFILINVEST.IDPERFILINVEST'
    end
    object qryNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PERFILINVEST.NOME'
      Size = 60
    end
    object qryPLANCONTABIL: TStringField
      FieldName = 'PLANCONTABIL'
      Origin = 'BASEDADOS.PLANPREVCONTABIL.NOME'
      Size = 50
    end
    object qryDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.PERFILINVEST.DESCRICAO'
      Size = 100
    end
    object qryIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.PERFILINVEST.IDPLANOPREV'
    end
    object qryPLANPREV2: TStringField
      FieldName = 'PLANPREV'
      Origin = 'BASEDADOS.PLANPREV.NOME'
      Size = 50
    end
    object qryIDPLANPREVCONTAB: TFloatField
      FieldName = 'IDPLANPREVCONTAB'
      Origin = 'BASEDADOS.PERFILINVEST.IDPLANPREVCONTAB'
    end
    object qryFLGATIVO: TFloatField
      FieldName = 'FLGATIVO'
      Origin = 'BASEDADOS.PERFILINVEST.FLGATIVO'
    end
    object qryFLGPADRAOINSS: TFloatField
      FieldName = 'FLGPADRAOINSS'
      Origin = 'BASEDADOS.PERFILINVEST.FLGPADRAOINSS'
    end
  end
  object qryPlanPrev: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT nome,'
      '       idplanoprev'
      'FROM   planprev ')
    ValidateWithMask = True
    Left = 538
    Top = 66
  end
  object qryPlaContab: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT nome,'
      '       idplanoprev'
      'FROM   planprevcontabil ')
    ValidateWithMask = True
    Left = 542
    Top = 118
  end
  object qrySitPart: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT S.descricao, '
      '       S.idsitpart, '
      '       Decode(PS.idperfilinvest, NULL, '#39'N'#39', '
      '                                 '#39'S'#39') AS MARCADO '
      'FROM   sitpart S '
      '       LEFT JOIN (SELECT P.idsitpart, '
      '                         P.idperfilinvest '
      '                  FROM   perfilinvxsitpart P '
      '                  WHERE  P.idperfilinvest = :IDPERFIL) PS '
      '              ON PS.idsitpart = S.idsitpart '
      'order by s.descricao')
    ValidateWithMask = True
    Left = 26
    Top = 198
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPERFIL'
        ParamType = ptUnknown
      end>
  end
  object qryEvento: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT E.nome,'
      '       E.ideventogerador,'
      '       Decode(PS.idperfilinvest, NULL, '#39'N'#39','
      '                                 '#39'S'#39') AS MARCADO'
      'FROM   eventogerador E'
      '       LEFT JOIN (SELECT P.ideventogerador,'
      '                         P.idperfilinvest'
      '                  FROM   perfilinvxevento P'
      '                  WHERE  P.idperfilinvest = :IDPERFIL) PS'
      '              ON PS.ideventogerador = E.ideventogerador'
      'order by E.Nome')
    ValidateWithMask = True
    Left = 34
    Top = 326
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPERFIL'
        ParamType = ptUnknown
      end>
  end
  object qryDetSitpart: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.* '
      'FROM   perfilinvxsitpart P '
      'WHERE  P.idperfilinvest = :IDPERFIL')
    UpdateObject = updSitPart
    ValidateWithMask = True
    Left = 90
    Top = 202
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPERFIL'
        ParamType = ptUnknown
      end>
  end
  object updSitPart: TUpdateSQL
    ModifySQL.Strings = (
      'UPDATE perfilinvest '
      'SET    nome = :NOME, '
      '       descricao = :DESCRICAO, '
      '       idplanoprev = :IDPLANOPREV, '
      '       idplanprevcontab = :IDPLANPREVCONTAB, '
      '       flgpadraoinss = :FLGPADRAOINSS, '
      '       flgativo = :FLGATIVO '
      'WHERE  idperfilinvest = :OLD_IDPERFILINVEST ')
    InsertSQL.Strings = (
      'INSERT INTO perfilinvxsitpart '
      '            (idperfilinvxsitpart, '
      '             idperfilinvest, '
      '             idsitpart) '
      'VALUES      (seqperfilinvxsitpart.nextval, '
      '             :IDPERFILINVEST, '
      '             :IDSITPART) ')
    DeleteSQL.Strings = (
      'DELETE FROM perfilinvxsitpart '
      'WHERE  idperfilinvxsitpart = :OLD_IDPERFILINVXSITPART ')
    Left = 155
    Top = 197
  end
  object qryDetEvento: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.*'
      'FROM   perfilinvxevento P'
      'WHERE  P.idperfilinvest = :IDPERFIL ')
    UpdateObject = updEvento
    ValidateWithMask = True
    Left = 103
    Top = 325
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPERFIL'
        ParamType = ptUnknown
      end>
  end
  object updEvento: TUpdateSQL
    ModifySQL.Strings = (
      'UPDATE perfilinvest'
      'SET nome = :NOME,'
      '       descricao = :DESCRICAO,'
      '       idplanoprev = :IDPLANOPREV,'
      '       idplanprevcontab = :IDPLANPREVCONTAB,'
      '       flgpadraoinss = :FLGPADRAOINSS,'
      '       flgativo = :FLGATIVO'
      'WHERE  idperfilinvest = :OLD_IDPERFILINVEST ')
    InsertSQL.Strings = (
      'INSERT INTO perfilinvxevento'
      '            (idperfilinvxevento,'
      '             idperfilinvest,'
      '             ideventogerador)'
      'VALUES      (seqperfilinvxevento.nextval,'
      '             :IDPERFILINVEST,'
      '             :IDEVENTOGERADOR)')
    DeleteSQL.Strings = (
      'DELETE FROM perfilinvxevento'
      'WHERE idperfilinvxevento = :OLD_idperfilinvxevento ')
    Left = 180
    Top = 325
  end
  object qryVerificaINSS: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT FLGPADRAOINSS'
      'FROM'
      'PERFILINVEST PI'
      'WHERE FLGPADRAOINSS = 1'
      'AND IDPLANOPREV = :IDPLANOPREV')
    ValidateWithMask = True
    Left = 634
    Top = 154
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
end
