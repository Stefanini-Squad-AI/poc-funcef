inherited FrmMigraPlano: TFrmMigraPlano
  Left = 232
  Top = 114
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Migração de Plano Assistencial'
  ClientHeight = 310
  ClientWidth = 534
  PixelsPerInch = 96
  TextHeight = 13
  object memResult: TMemo [0]
    Left = 373
    Top = 72
    Width = 185
    Height = 89
    Lines.Strings = (
      'Memo1')
    TabOrder = 2
  end
  inherited pnlFundo: TPanel
    Width = 1024
    Height = 561
    Align = alNone
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 1022
      Height = 144
      Align = alTop
      Caption = '  Parâmetros Obrigatórios  '
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 16
        Width = 94
        Height = 13
        Caption = 'Plano de Origem'
      end
      object Label2: TLabel
        Left = 288
        Top = 16
        Width = 98
        Height = 13
        Caption = 'Plano de Destino'
      end
      object Label7: TLabel
        Left = 8
        Top = 56
        Width = 108
        Height = 13
        Caption = 'Data Desligamento'
      end
      object Label8: TLabel
        Left = 392
        Top = 56
        Width = 84
        Height = 13
        Caption = 'Data Inscrição'
      end
      object Label9: TLabel
        Left = 8
        Top = 99
        Width = 90
        Height = 13
        Caption = 'Motivo (padrão)'
      end
      object dblkPlanosOrigem: TDBLookupComboBox
        Left = 8
        Top = 32
        Width = 225
        Height = 21
        KeyField = 'IDPLANASS'
        ListField = 'NOME'
        ListSource = dsPlanos
        TabOrder = 0
      end
      object dblkPlanosDestino: TDBLookupComboBox
        Left = 288
        Top = 32
        Width = 225
        Height = 21
        KeyField = 'IDPLANASS'
        ListField = 'NOME'
        ListSource = dsPlanos
        TabOrder = 1
        OnExit = dblkPlanosDestinoExit
      end
      object dtpDataDesligamento: TwwDBDateTimePicker
        Left = 8
        Top = 72
        Width = 121
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        Epoch = 1950
        ShowButton = True
        TabOrder = 2
      end
      object dtpDataInscricao: TwwDBDateTimePicker
        Left = 392
        Top = 72
        Width = 121
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        Epoch = 1950
        ShowButton = True
        TabOrder = 3
      end
      object edtMotivoPadrao: TEdit
        Left = 8
        Top = 112
        Width = 505
        Height = 21
        TabOrder = 4
        Text = 'MIGRAÇÃO PARA UM NOVO PLANO ASSISTENCIAL'
      end
    end
    object GroupBox2: TGroupBox
      Left = 1
      Top = 145
      Width = 1022
      Height = 120
      Align = alTop
      Caption = '  Filtros  (preenchimento não obrigatório)  '
      TabOrder = 1
      object Label3: TLabel
        Left = 8
        Top = 16
        Width = 80
        Height = 13
        Caption = 'Patrocinadora'
      end
      object Label4: TLabel
        Left = 288
        Top = 16
        Width = 118
        Height = 13
        Caption = 'Plano Previdenciário'
      end
      object Label5: TLabel
        Left = 8
        Top = 64
        Width = 129
        Height = 13
        Caption = 'Situação na Fundação'
      end
      object Label6: TLabel
        Left = 288
        Top = 64
        Width = 152
        Height = 13
        Caption = 'Situação na Patrocinadora'
      end
      object dblkFiltroPatro: TDBLookupComboBox
        Left = 8
        Top = 32
        Width = 225
        Height = 21
        KeyField = 'IDPESSOA'
        ListField = 'NOME'
        ListSource = dsPatro
        TabOrder = 0
      end
      object dblkFiltroPlanPrev: TDBLookupComboBox
        Left = 288
        Top = 32
        Width = 225
        Height = 21
        KeyField = 'IDPLANOPREV'
        ListField = 'NOME'
        ListSource = dsPlanPrev
        TabOrder = 1
      end
      object dblkFiltroSitPart: TDBLookupComboBox
        Left = 8
        Top = 80
        Width = 225
        Height = 21
        KeyField = 'IDSITPART'
        ListField = 'DESCRICAO'
        ListSource = dsSitPart
        TabOrder = 2
      end
      object dblkFiltroSitFunc: TDBLookupComboBox
        Left = 288
        Top = 80
        Width = 225
        Height = 21
        KeyField = 'IDSITFUNC'
        ListField = 'DESCRICAO'
        ListSource = dsSitFunc
        TabOrder = 3
      end
    end
  end
  inherited Dock971: TDock97
    Top = 271
    Width = 534
    LimitToOneRow = False
    inherited tb97Fundo: TToolbar97
      Left = 362
      DockPos = 440
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 112
      inherited ToolbarSep971: TToolbarSep97
        Left = 162
      end
      inherited bbtnConfirmar: TBitBtn
        Left = 81
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        Left = 165
      end
      object btnMigra: TBitBtn
        Left = 0
        Top = 0
        Width = 81
        Height = 33
        Caption = '&Migrar'
        Default = True
        TabOrder = 2
        OnClick = btnMigraClick
        Glyph.Data = {
          6E020000424D6E02000000000000760000002800000036000000120000000100
          040000000000F801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777777777777FFFFFF777777777777777777777770077777770000007777777
          777FF888888F7777777777777777777777007777700111111077017777F88777
          77787F8777777700000077777700777701111111110011777F877FFFFF7788F8
          7777004444440770470077701119999911111177F877F88888F777F877704444
          4444400447007701119777779111117F877F8777778F77F8770444CCCCC44444
          47007701197777777111117F87F87777777877F870444C77777C444447007700
          0977777711111177888877777F8FFFF87044C777777744444700777777777779
          99999977FFFFF777788888887000C77777744444470070000007777777777778
          888887777777FFF77777777777CCCCCCC7007044444C777777000C787777F877
          7777888800000077777777777700704444C7777777044C7877778777777F87F8
          011111C77777700097007044440077777044C778777788FFFFF8778701111C77
          7777701197007044444400000444C7787FF7778888877F870111100777770119
          7700704CC4444444444C7778F88FF777777FF8770111111000001119770077C7
          7CC444444CC7777787788FFFFFF88777019911111111119777007777777CCCCC
          C777777777777888888777777977991111119977770077777777777777777777
          777777777777777777777799999977777700}
        NumGlyphs = 3
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 3
    Top = 443
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
  object dsPlanos: TwwDataSource
    DataSet = qryPlanos
    Left = 249
    Top = 28
  end
  object qryPlanos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPLANASS, IDPRODASS, NOME'
      'FROM PLANASS')
    ValidateWithMask = True
    Left = 249
    Top = 9
  end
  object dsPatro: TwwDataSource
    DataSet = qryPatro
    Left = 209
    Top = 169
  end
  object qryPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.IDPESSOA, P.NOME'
      'FROM PESSOA P, PATRO PA'
      'WHERE PA.IDPESSOA = P.IDPESSOA'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 209
    Top = 153
  end
  object dsPlanPrev: TwwDataSource
    DataSet = qryPlanPrev
    Left = 481
    Top = 169
  end
  object qryPlanPrev: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPLANOPREV, NOME'
      'FROM PLANPREV'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 481
    Top = 153
  end
  object dsSitPart: TwwDataSource
    DataSet = qrySitPart
    Left = 209
    Top = 232
  end
  object qrySitPart: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDSITPART, DESCRICAO, FLGINTERNO'
      'FROM SITPART'
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 209
    Top = 216
  end
  object dsSitFunc: TwwDataSource
    DataSet = qrySitFunc
    Left = 481
    Top = 231
  end
  object qrySitFunc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDSITFUNC, DESCRICAO'
      'FROM SITFUNC'
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 481
    Top = 215
  end
  object qryPartass: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 9
    Top = 249
  end
  object qryInsContribPlanPrevA: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'INSERT INTO CONTRIBPLANPREVA (CODALTERADORCORR, CODALTERADORJURO' +
        'S, CODCCUSTOCDEVBAN, CODCCUSTOCDEVPAT,'
      
        '                              CODCENTROCUSTOC, CODCENTROCUSTOD, ' +
        'CODCENTRORESPON, CODPORTFORMA, '
      
        '                              CODSUBCONTA, CODTIPDESEMBCAR, CODT' +
        'IPDESEMBDEVOL, CODTIPRECDES,                    '
      
        '                              IDCONTASS, IDEMPRESA, IDEMPRESAPRO' +
        'P, IDPESSJUR, IDPESSOA, '
      #9#9#9'      IDPLANASS, IDPLANOPREV, PLACONTAC, PLACONTACDEVBANCO, '
      
        #9#9#9'      PLACONTACDEVPAT, PLACONTAD, PLACONTADAUTPATR, PLANO, RE' +
        'CPAG,                          '
      '                              RECPAGDEVOL, TIPCODIGO, UNIDNEGOC)'
      
        'VALUES (:CODALTERADORCORR, :CODALTERADORJUROS, :CODCCUSTOCDEVBAN' +
        ', :CODCCUSTOCDEVPAT,'
      
        '        :CODCENTROCUSTOC, :CODCENTROCUSTOD, :CODCENTRORESPON, :C' +
        'ODPORTFORMA,'
      
        '        :CODSUBCONTA, :CODTIPDESEMBCAR, :CODTIPDESEMBDEVOL, :COD' +
        'TIPRECDES,'
      
        '        :IDCONTASS, :IDEMPRESA, :IDEMPRESAPROP, :IDPESSJUR, :IDP' +
        'ESSOA,'
      #9':IDPLANASS, :IDPLANOPREV, :PLACONTAC, :PLACONTACDEVBANCO,'
      
        #9':PLACONTACDEVPAT, :PLACONTAD, :PLACONTADAUTPATR, :PLANO, :RECPA' +
        'G,'
      '        :RECPAGDEVOL, :TIPCODIGO, :UNIDNEGOC)'
      ' ')
    ValidateWithMask = True
    Left = 153
    Top = 65
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODALTERADORCORR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODALTERADORJUROS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODCCUSTOCDEVBAN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODCCUSTOCDEVPAT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODCENTROCUSTOC'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODCENTROCUSTOD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODCENTRORESPON'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODPORTFORMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODSUBCONTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODTIPDESEMBCAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODTIPDESEMBDEVOL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODTIPRECDES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDCONTASS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDEMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANASS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PLACONTAC'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PLACONTACDEVBANCO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PLACONTACDEVPAT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PLACONTAD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PLACONTADAUTPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RECPAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RECPAGDEVOL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TIPCODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'UNIDNEGOC'
        ParamType = ptUnknown
      end>
  end
  object qryInsBenefass: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'INSERT INTO BENEFASS (DATAENTRADA, DTCANCELAMENTO, FLGATIVO, IDD' +
        'EPENDENTE, IDPESSJUR,                       '
      
        '                      IDPLANASS, IDPLANOPREV, IDTITULAR, OBSCANC' +
        'EL, PERCPAGMTO,                      '
      '                      RESPONSAVELPAG, SEQPROPOSTA, TIPO)'
      
        'VALUES (:DATAENTRADA, :DTCANCELAMENTO, :FLGATIVO, :IDDEPENDENTE,' +
        ' :IDPESSJUR,'
      
        '        :IDPLANASS, :IDPLANOPREV, :IDTITULAR, :OBSCANCEL, :PERCP' +
        'AGMTO,'
      '        :RESPONSAVELPAG, :SEQPROPOSTA, :TIPO)'
      '')
    ValidateWithMask = True
    Left = 245
    Top = 65
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DATAENTRADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DTCANCELAMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FLGATIVO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDDEPENDENTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANASS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OBSCANCEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PERCPAGMTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RESPONSAVELPAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TIPO'
        ParamType = ptUnknown
      end>
  end
  object qryExec: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 65
    Top = 250
  end
end
