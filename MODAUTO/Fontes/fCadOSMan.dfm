inherited frmCadOSMan: TfrmCadOSMan
  Left = 19
  Top = 53
  HelpContext = 4170027
  Caption = 'Cadastro de Ordem de Serviço de Manutenção'
  ClientHeight = 453
  ClientWidth = 746
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 746
    Height = 367
    inherited pnlMestre: TPanel
      Width = 736
      Height = 124
      object Label8: TLabel
        Left = 8
        Top = 8
        Width = 25
        Height = 13
        Caption = 'Bem'
      end
      object Label2: TLabel
        Left = 296
        Top = 8
        Width = 108
        Height = 13
        Caption = 'Usuário Solicitante'
      end
      object Label3: TLabel
        Left = 8
        Top = 56
        Width = 69
        Height = 13
        Caption = 'Observação'
      end
      object Label11: TLabel
        Left = 606
        Top = 8
        Width = 100
        Height = 13
        Caption = 'Data de Cadastro'
      end
      object dblcUsuario: TCMDBLookupCombo
        Left = 296
        Top = 24
        Width = 297
        Height = 26
        AutoSize = False
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEUSUARIO'#9'20'#9'Nome')
        DataField = 'IDUSUARIOSOLI'
        DataSource = ds
        LookupTable = QryUsuSist
        LookupField = 'IDUSUARIO'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object RgDispon: TDBRadioGroup
        Left = 586
        Top = 67
        Width = 141
        Height = 55
        Caption = ' Tipo de Manutenção '
        DataField = 'FLGTIPOMANUT'
        DataSource = ds
        Enabled = False
        Items.Strings = (
          'Corretiva'
          'Preventiva')
        TabOrder = 4
        Values.Strings = (
          'C'
          'P')
      end
      object edDataCad: TCMDateTimePicker
        Left = 606
        Top = 24
        Width = 121
        Height = 26
        AutoSize = False
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DATAOS'
        DataSource = ds
        Epoch = 1950
        ButtonGlyph.Data = {
          06050000424D06050000000000003604000028000000100000000D0000000100
          080000000000D000000000000000000000000001000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
          A6000020400000206000002080000020A0000020C0000020E000004000000040
          20000040400000406000004080000040A0000040C0000040E000006000000060
          20000060400000606000006080000060A0000060C0000060E000008000000080
          20000080400000806000008080000080A0000080C0000080E00000A0000000A0
          200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
          200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
          200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
          20004000400040006000400080004000A0004000C0004000E000402000004020
          20004020400040206000402080004020A0004020C0004020E000404000004040
          20004040400040406000404080004040A0004040C0004040E000406000004060
          20004060400040606000406080004060A0004060C0004060E000408000004080
          20004080400040806000408080004080A0004080C0004080E00040A0000040A0
          200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
          200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
          200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
          20008000400080006000800080008000A0008000C0008000E000802000008020
          20008020400080206000802080008020A0008020C0008020E000804000008040
          20008040400080406000804080008040A0008040C0008040E000806000008060
          20008060400080606000806080008060A0008060C0008060E000808000008080
          20008080400080806000808080008080A0008080C0008080E00080A0000080A0
          200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
          200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
          200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
          2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
          2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
          2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
          2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
          2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
          2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
          2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
          000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
          A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
          A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
          A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
          FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
          04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
          000000000000000000FF}
        ShowButton = True
        TabOrder = 1
      end
      object DBMemObserv: TDBMemo
        Left = 8
        Top = 72
        Width = 569
        Height = 49
        DataField = 'OBSOS'
        DataSource = ds
        MaxLength = 200
        TabOrder = 2
      end
      object CMProcBem: TCMProcura
        Left = 8
        Top = 24
        Width = 281
        Height = 27
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MostraMensagens = True
        Mensagens.EmBranco = 'Bem não pode estar em branco'
        Mensagens.NaoExiste = 'Bem não existe'
        PermiteChaveInvalida = False
        PermiteChaveEmBranco = False
        DataSource = ds
        DataField = 'IDBEM'
        LookupChave = 'IDBEM'
        LookupDescricao = 'DESBEM'
        MontaSelect = MsBem
        LookupTabela = 'CM.BEM'
        DataBaseName = 'BaseDados'
        ReadOnly = False
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 129
      Width = 736
      Height = 233
      Tabs.Strings = (
        'Serviços')
      inherited pgctrlDetalhe: TPageControl
        Width = 638
        Height = 174
        inherited tbsDet: TTabSheet
          Caption = 'Serviços'
          inherited dbgrdDet: TwwDBGrid
            Width = 630
            Height = 146
            Selected.Strings = (
              'DESCSERVICO'#9'40'#9'Serviço'
              'NOME'#9'35'#9'Operador'
              'PRIORIDADE'#9'10'#9'Prioridade')
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            TitleAlignment = taCenter
            TitleLines = 2
          end
          inherited pnlControlesDet: TPanel
            Width = 630
            Height = 146
            object Label9: TLabel
              Left = 528
              Top = 40
              Width = 58
              Height = 13
              Caption = 'Prioridade'
            end
            object Label4: TLabel
              Left = 8
              Top = 80
              Width = 69
              Height = 13
              Caption = 'Observação'
            end
            object StaticText1: TStaticText
              Left = 8
              Top = 40
              Width = 56
              Height = 17
              Caption = 'Operador'
              TabOrder = 3
            end
            object dblcOpManut: TCMDBLookupCombo
              Left = 8
              Top = 56
              Width = 513
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'60'#9'NOME')
              DataField = 'IDOPERADORMANUT'
              DataSource = dsDet
              LookupTable = qryOpeManut
              LookupField = 'IDOPERADORMANUT'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object StaticText2: TStaticText
              Left = 8
              Top = 0
              Width = 139
              Height = 17
              Caption = 'Serviço de Manutenção'
              TabOrder = 4
            end
            object dblcServManut: TCMDBLookupCombo
              Left = 8
              Top = 16
              Width = 617
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCSERVICO'#9'200'#9'Descrição')
              DataField = 'IDSERVICOMANUT'
              DataSource = dsDet
              LookupTable = qryServMan
              LookupField = 'IDSERVICOMANUT'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
              OnCloseUp = dblcServManutCloseUp
            end
            object DBMemServOb: TDBMemo
              Left = 8
              Top = 96
              Width = 617
              Height = 57
              DataField = 'OBSSERVICOOS'
              DataSource = dsDet
              MaxLength = 200
              TabOrder = 2
            end
            object edPriorid: TDBRealEdit
              Left = 528
              Top = 56
              Width = 97
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0')
              MaxLength = 3
              TabOrder = 5
              WordWrap = False
              IntDigits = 10
              DecDigits = 0
              NumberFormat = iNumber
              Signal = False
              DataField = 'PRIORIDADE'
              DataSource = dsDet
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 728
      end
      inherited Dock974: TDock97
        Left = 642
        Height = 174
      end
    end
  end
  inherited Dock972: TDock97
    Width = 746
    object Label1: TLabel [0]
      Left = 600
      Top = 5
      Width = 62
      Height = 13
      Caption = 'Nº da O.S.'
      FocusControl = edOS
    end
    object edOS: TDBEdit
      Left = 600
      Top = 19
      Width = 137
      Height = 21
      TabStop = False
      Color = clGray
      DataField = 'IDORDEMSERVICO'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
  end
  inherited Dock971: TDock97
    Top = 414
    Width = 746
    inherited tb97Fundo: TToolbar97
      Left = 539
      DockPos = 539
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 371
      DockPos = 371
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '     IDORDEMSERVICO,'
      '     IDBEM,'
      '     IDPESSOA,'
      '     IDUSUARIOSOLI,'
      '     FLGTIPOMANUT,'
      '     DATAOS,'
      '     OBSOS'
      'FROM'
      '     ORDEMSERVICOMANUT'
      'WHERE'
      '     IDORDEMSERVICO = :pIDORDEM')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pIDORDEM'
        ParamType = ptUnknown
      end>
    object qryIDORDEMSERVICO: TFloatField
      FieldName = 'IDORDEMSERVICO'
      Origin = 'ORDEMSERVICOMANUT.IDORDEMSERVICO'
    end
    object qryIDBEM: TFloatField
      FieldName = 'IDBEM'
      Origin = 'ORDEMSERVICOMANUT.IDBEM'
    end
    object qryIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'ORDEMSERVICOMANUT.IDPESSOA'
    end
    object qryIDUSUARIOSOLI: TFloatField
      FieldName = 'IDUSUARIOSOLI'
      Origin = 'ORDEMSERVICOMANUT.IDUSUARIOSOLI'
    end
    object qryFLGTIPOMANUT: TStringField
      FieldName = 'FLGTIPOMANUT'
      Origin = 'ORDEMSERVICOMANUT.FLGTIPOMANUT'
      Size = 1
    end
    object qryDATAOS: TDateTimeField
      FieldName = 'DATAOS'
      Origin = 'ORDEMSERVICOMANUT.DATAOS'
    end
    object qryOBSOS: TStringField
      FieldName = 'OBSOS'
      Origin = 'ORDEMSERVICOMANUT.OBSOS'
      Size = 200
    end
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 338
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 91
    Top = 491
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update ORDEMSERVICOMANUT'
      'set'
      '  IDORDEMSERVICO = :IDORDEMSERVICO,'
      '  IDBEM = :IDBEM,'
      '  IDPESSOA = :IDPESSOA,'
      '  IDUSUARIOSOLI = :IDUSUARIOSOLI,'
      '  FLGTIPOMANUT = :FLGTIPOMANUT,'
      '  DATAOS = :DATAOS,'
      '  OBSOS = :OBSOS'
      'where'
      '  IDORDEMSERVICO = :OLD_IDORDEMSERVICO')
    InsertSQL.Strings = (
      'insert into ORDEMSERVICOMANUT'
      
        '  (IDORDEMSERVICO, IDBEM, IDPESSOA, IDUSUARIOSOLI, FLGTIPOMANUT,' +
        ' DATAOS, '
      '   OBSOS)'
      'values'
      
        '  (:IDORDEMSERVICO, :IDBEM, :IDPESSOA, :IDUSUARIOSOLI, :FLGTIPOM' +
        'ANUT, :DATAOS, '
      '   :OBSOS)')
    DeleteSQL.Strings = (
      'delete from ORDEMSERVICOMANUT'
      'where'
      '  IDORDEMSERVICO = :OLD_IDORDEMSERVICO')
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'ORDEMSERVICOMANUT.IDORDEMSERVICO'
      'ORDEMSERVICOMANUT.DATAOS'
      'BEM.DESBEM'
      'USUARIOSISTEMA.NOMEUSUARIO'
      'ORDEMSERVICOMANUT.OBSOS')
    TipodeDado.Strings = (
      'N'
      'D'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Ordem'
      'Data Ordem'
      'Bem'
      'Usuário Solic.'
      'Observação')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'ORDEMSERVICOMANUT'
      'BEM'
      'USUARIOSISTEMA')
    CamposChave.Strings = (
      'ORDEMSERVICOMANUT.IDORDEMSERVICO')
    Filtro.Strings = (
      'ORDEMSERVICOMANUT.IDBEM = BEM.IDBEM'
      'ORDEMSERVICOMANUT.IDPESSOA = BEM.IDPESSOA'
      'ORDEMSERVICOMANUT.IDUSUARIOSOLI = USUARIOSISTEMA.IDUSUARIO')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '10'
      '100'
      '20'
      '200')
    Left = 391
    Top = 5
  end
  inherited ds: TwwDataSource
    Left = 245
    Top = 6
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 358
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 408
    Top = 108
  end
  object qryBem: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     PRIORIDADE'
      'FROM'
      '       BEM'
      'Where'
      '       (IDBEM = :pIDBEM)')
    ValidateWithMask = True
    Left = 214
    Top = 411
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pIDBEM'
        ParamType = ptUnknown
      end>
    object qryBemPRIORIDADE: TFloatField
      FieldName = 'PRIORIDADE'
      Origin = '"CM.BEM".PRIORIDADE'
    end
  end
  object QryUsuSist: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     IDUSUARIO,'
      '     NOMEUSUARIO'
      'FROM'
      '     USUARIOSISTEMA'
      'ORDER BY NOMEUSUARIO')
    ValidateWithMask = True
    Left = 262
    Top = 411
  end
  object qryServMan: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    DataSource = dsDet
    SQL.Strings = (
      'select'
      '   IDSERVICOMANUT,'
      '   DESCSERVICO,'
      '   PRIORIDADE'
      'from'
      '   SERVICOMANUT'
      'ORDER BY DESCSERVICO'
      '  ')
    ValidateWithMask = True
    Left = 334
    Top = 411
    object qryServManIDSERVICOMANUT: TFloatField
      FieldName = 'IDSERVICOMANUT'
      Origin = 'SERVICOMANUT.IDSERVICOMANUT'
    end
    object qryServManDESCSERVICO: TStringField
      FieldName = 'DESCSERVICO'
      Origin = 'SERVICOMANUT.DESCSERVICO'
      Size = 200
    end
    object qryServManPRIORIDADE: TFloatField
      FieldName = 'PRIORIDADE'
      Origin = 'SERVICOMANUT.PRIORIDADE'
    end
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     SE.IDORDEMSERVICO,'
      '     SE.IDSERVICOMANUT,'
      '     SE.IDOPERADORMANUT,'
      '     SE.IDPESSOA,'
      '     SE.PRIORIDADE,'
      '     SE.OBSSERVICOOS,'
      '     SM.DESCSERVICO,'
      '     P.NOME,'
      '     SE.DATAMANUTENCAO'
      'FROM'
      '     SERVICOSXOS SE,'
      '     SERVICOMANUT SM,'
      '     PESSOA P '
      'WHERE'
      '       (SE.IDORDEMSERVICO =:pIDOS)'
      '   AND (SE.IDOPERADORMANUT = P.IDPESSOA(+) )'
      '   AND (SE.IDSERVICOMANUT = SM.IDSERVICOMANUT)')
    UpdateObject = updDet
    ValidateWithMask = True
    Left = 462
    Top = 3
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pIDOS'
        ParamType = ptUnknown
      end>
    object qryDetDESCSERVICO: TStringField
      DisplayLabel = 'Serviço'
      DisplayWidth = 40
      FieldName = 'DESCSERVICO'
      Origin = 'SERVICOMANUT.DESCSERVICO'
      Size = 200
    end
    object qryDetNOME: TStringField
      DisplayLabel = 'Operador'
      DisplayWidth = 35
      FieldName = 'NOME'
      Origin = 'PESSOA.NOME'
      Size = 60
    end
    object qryDetPRIORIDADE: TFloatField
      DisplayLabel = 'Prioridade'
      DisplayWidth = 10
      FieldName = 'PRIORIDADE'
      Origin = 'SERVICOSXOS.PRIORIDADE'
    end
    object qryDetOBSSERVICOOS: TStringField
      DisplayLabel = 'Observação'
      DisplayWidth = 200
      FieldName = 'OBSSERVICOOS'
      Origin = 'SERVICOSXOS.OBSSERVICOOS'
      Visible = False
      Size = 200
    end
    object qryDetIDORDEMSERVICO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDORDEMSERVICO'
      Origin = 'SERVICOSXOS.IDORDEMSERVICO'
      Visible = False
    end
    object qryDetIDSERVICOMANUT: TFloatField
      DisplayWidth = 10
      FieldName = 'IDSERVICOMANUT'
      Origin = 'SERVICOSXOS.IDSERVICOMANUT'
      Visible = False
    end
    object qryDetIDOPERADORMANUT: TFloatField
      DisplayWidth = 10
      FieldName = 'IDOPERADORMANUT'
      Origin = 'SERVICOSXOS.IDOPERADORMANUT'
      Visible = False
    end
    object qryDetIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Origin = 'SERVICOSXOS.IDPESSOA'
      Visible = False
    end
    object qryDetDATAMANUTENCAO: TDateTimeField
      FieldName = 'DATAMANUTENCAO'
    end
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update SERVICOSXOS'
      'set'
      '  IDORDEMSERVICO = :IDORDEMSERVICO,'
      '  IDSERVICOMANUT = :IDSERVICOMANUT,'
      '  IDOPERADORMANUT = :IDOPERADORMANUT,'
      '  IDPESSOA = :IDPESSOA,'
      '  PRIORIDADE = :PRIORIDADE,'
      '  OBSSERVICOOS = :OBSSERVICOOS'
      'where'
      '  IDORDEMSERVICO = :OLD_IDORDEMSERVICO and'
      '  IDSERVICOMANUT = :OLD_IDSERVICOMANUT')
    InsertSQL.Strings = (
      'insert into SERVICOSXOS'
      
        '  (IDORDEMSERVICO, IDSERVICOMANUT, IDOPERADORMANUT, IDPESSOA, PR' +
        'IORIDADE, '
      '   OBSSERVICOOS)'
      'values'
      
        '  (:IDORDEMSERVICO, :IDSERVICOMANUT, :IDOPERADORMANUT, :IDPESSOA' +
        ', :PRIORIDADE, '
      '   :OBSSERVICOOS)')
    DeleteSQL.Strings = (
      'delete from SERVICOSXOS'
      'where'
      '  IDORDEMSERVICO = :OLD_IDORDEMSERVICO and'
      '  IDSERVICOMANUT = :OLD_IDSERVICOMANUT')
    Left = 512
    Top = 1
  end
  object qryOpeManut: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      'SELECT '
      '              OP.IDOPERADORMANUT,'
      '               P.NOME '
      'FROM'
      '              EMPRESAOPERADOR OP,               '
      '              PESSOA P'
      'WHERE'
      '            (P.IDPESSOA = OP.IDOPERADORMANUT)'
      '   AND (OP.IDPESSOA = :pIDPESS)'
      'ORDER BY P.NOME')
    ValidateWithMask = True
    Left = 152
    Top = 408
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDPESS'
        ParamType = ptUnknown
      end>
    object qryOpeManutIDOPERADORMANUT: TFloatField
      FieldName = 'IDOPERADORMANUT'
      Origin = 'OPERADORMANUT.IDOPERADORMANUT'
    end
    object qryOpeManutNOME: TStringField
      FieldName = 'NOME'
      Origin = 'PESSOA.NOME'
      Size = 60
    end
  end
  object MsBem: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'BEM.DESBEM'
      'BEM.IDBEM'
      'BEM.PLACA'
      'LOCALIZACAO.NOME')
    TipodeDado.Strings = (
      'C'
      'N'
      'N'
      'C')
    Descricao.Strings = (
      'Descrição'
      'Código'
      'Placa'
      'Localização')
    Tabelas.Strings = (
      'BEM'
      'CONJUNTO'
      'LOCALIZACAO')
    CamposChave.Strings = (
      'BEM.IDBEM')
    Filtro.Strings = (
      'CONJUNTO.IDCONJUNTO = BEM.IDCONJUNTO'
      'CONJUNTO.IDLOCALIZACAO = LOCALIZACAO.IDLOCALIZACAO(+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '10'
      '10'
      '45')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 552
    Top = 15
  end
end
