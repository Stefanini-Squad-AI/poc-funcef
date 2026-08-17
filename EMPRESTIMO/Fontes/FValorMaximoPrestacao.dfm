inherited FrmValorMaximoPrestacao: TFrmValorMaximoPrestacao
  Left = 98
  Top = 111
  BorderIcons = [biSystemMenu]
  Caption = 'Cadastro do Valor Máximo de Prestação por Participante'
  ClientHeight = 532
  ClientWidth = 683
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 683
    Height = 290
    Align = alNone
    Enabled = False
    object Label1: TLabel
      Left = 5
      Top = 5
      Width = 55
      Height = 13
      Caption = 'Matrícula'
    end
    object Label2: TLabel
      Left = 97
      Top = 5
      Width = 50
      Height = 13
      Caption = 'Mutuário'
    end
    object Label3: TLabel
      Left = 5
      Top = 44
      Width = 123
      Height = 13
      Caption = 'Vlr Máximo Prestação'
    end
    object Label4: TLabel
      Left = 5
      Top = 200
      Width = 75
      Height = 13
      Caption = 'Observações'
    end
    object Label5: TLabel
      Left = 154
      Top = 45
      Width = 63
      Height = 13
      Caption = 'Data Inicio'
    end
    object Label6: TLabel
      Left = 282
      Top = 45
      Width = 51
      Height = 13
      Caption = 'Data Fim'
    end
    object edtMatricula: TEdit
      Left = 5
      Top = 21
      Width = 88
      Height = 21
      Color = clBtnFace
      Enabled = False
      TabOrder = 2
    end
    object edtMutuario: TEdit
      Left = 97
      Top = 21
      Width = 464
      Height = 21
      Color = clBtnFace
      Enabled = False
      TabOrder = 3
    end
    object edtVlrMaxPrest: TRealEdit
      Left = 5
      Top = 61
      Width = 125
      Height = 25
      Alignment = taRightJustify
      Lines.Strings = (
        '0,00')
      TabOrder = 0
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
    end
    object DBGrid1: TDBGrid
      Left = 5
      Top = 88
      Width = 671
      Height = 109
      DataSource = dsContratos
      TabOrder = 4
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      Columns = <
        item
          Expanded = False
          FieldName = 'IDCONTRATOEMPTMO'
          Title.Caption = 'Contrato'
          Width = 197
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TCEDESCRICAO'
          Title.Caption = 'Modalidade do Contrato'
          Width = 307
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VLRPARCELA'
          Title.Caption = 'Valor Prestação Base'
          Width = 129
          Visible = True
        end>
    end
    object edtData: TCMDateTimePicker
      Left = 154
      Top = 61
      Width = 121
      Height = 22
      TabStop = False
      AutoSize = False
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      ButtonStyle = cbsCustom
      Epoch = 1950
      ButtonWidth = 22
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
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ShowButton = True
      TabOrder = 1
      DisplayFormat = 'dd/mm/yyyy'
    end
    object edtObservacao: TRichEdit
      Left = 7
      Top = 216
      Width = 667
      Height = 70
      TabOrder = 5
    end
    object edtDataFim: TCMDateTimePicker
      Left = 282
      Top = 61
      Width = 121
      Height = 22
      TabStop = False
      AutoSize = False
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      ButtonStyle = cbsCustom
      Epoch = 1950
      ButtonWidth = 22
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
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ShowButton = True
      TabOrder = 6
      DisplayFormat = 'dd/mm/yyyy'
    end
  end
  inherited Dock972: TDock97
    Width = 683
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        OnClick = sbtnInserirClick
      end
      inherited sbtnAlterar: TToolbarButton97
        Enabled = False
        OnClick = sbtnAlterarClick
      end
      inherited sbtnProcurar: TToolbarButton97
        OnClick = sbtnProcurarClick
      end
      inherited sbtnApagar: TToolbarButton97
        Enabled = False
        OnClick = sbtnApagarClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 493
    Width = 683
    inherited tb97Fundo: TToolbar97
      Left = 367
      inherited bbtnAjuda: TmaHelpBitBtn
        Visible = False
        ClickHelpContext = 150025
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        Enabled = False
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  object PageControl1: TPageControl [3]
    Left = 6
    Top = 336
    Width = 677
    Height = 155
    ActivePage = tbUsuario
    TabOrder = 3
    object tbHistorico: TTabSheet
      Caption = 'Histórico de Valor Máximo'
      object DBGrid2: TDBGrid
        Left = 0
        Top = 0
        Width = 669
        Height = 127
        Align = alClient
        DataSource = dsMaxPrestEp
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            Expanded = False
            FieldName = 'VALORMAX'
            Title.Caption = 'Vlr.Máximo Prestação'
            Width = 127
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATAINICIO'
            Title.Caption = 'Data Inicio'
            Width = 76
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATAFIM'
            Title.Caption = 'Data Fim'
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATAEVENTO'
            Title.Caption = 'Data Evento'
            Width = 106
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'USUARIO'
            Title.Caption = 'Usuário'
            Width = 246
            Visible = True
          end>
      end
    end
    object tbUsuario: TTabSheet
      Caption = 'Histórico de Alterações'
      ImageIndex = 1
      object DBGrid3: TDBGrid
        Left = 0
        Top = 0
        Width = 669
        Height = 127
        Align = alClient
        DataSource = dsHistAlteracao
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        Visible = False
        Columns = <
          item
            Expanded = False
            FieldName = 'DESCOPERACAO'
            Title.Caption = 'Descrição da Alteração'
            Width = 370
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'USUARIO'
            Title.Caption = 'Usuário'
            Width = 165
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATA'
            Title.Caption = 'Data Alteração'
            Width = 109
            Visible = True
          end>
      end
      object wwDBGrid1: TwwDBGrid
        Left = 0
        Top = 0
        Width = 669
        Height = 127
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dsHistAlteracao
        KeyOptions = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgWordWrap]
        ReadOnly = True
        TabOrder = 1
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        OnDrawDataCell = wwDBGrid1DrawDataCell
        IndicatorColor = icBlack
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      5
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
        0)
      (
        ''
        'Filter'
        0)
      (
        ''
        'DisplayLabel'
        0))
  end
  inherited ds: TwwDataSource
    Left = 352
    Top = 12
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 496
    Top = 11
  end
  object MS: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'CONTRATOEMPTMO.IDCONTRATOEMPTMO'
      'TIPOCONTREMPTMO.TCEDESCRICAO'
      'DEPENTIT.MATRICULA'
      'PESSOA.NOME'
      'PESSOA.NUMDOCUMENTO'
      'VALORMAXPRESTEP.VALORMAX'
      'PLANPREV.NOME'
      'PATRO.NOME'
      'SITPLANOPREV.DESCRICAO'
      'SITFUNC.DESCRICAO')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'C'
      'C'
      'N'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Contrato'
      'Modalidade'
      'Matricula'
      'Nome'
      'CPF'
      'Valor Máximo Prestação'
      'Plano Previdenciário'
      'Patrocinadora'
      'Situação no Plano'
      'Situação na Patrocinadora')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'DEPENTIT'
      'PESSOA'
      'CONTRATOEMPTMO'
      'VALORMAXPRESTEP'
      'PLANPREV'
      'PARTPREVPLAN'
      'PESSOA PATRO'
      'SITPLANOPREV'
      'ELEGPATRO'
      'SITFUNC'
      'TIPOCONTREMPTMO')
    CamposChave.Strings = (
      'DEPENTIT.MATRICULA'
      'PESSOA.NOME'
      'DEPENTIT.IDTITULAR'
      'DEPENTIT.IDPESSOA'
      'CONTRATOEMPTMO.IDCONTRATOEMPTMO')
    Filtro.Strings = (
      '(CONTRATOEMPTMO.FLGSITUACAO = '#39'A'#39')'
      '(DEPENTIT.IDPESSOA           = PESSOA.IDPESSOA)'
      '(CONTRATOEMPTMO.IDPESSOA     = DEPENTIT.IDTITULAR)'
      '(CONTRATOEMPTMO.IDBENEF      = DEPENTIT.IDPESSOA)'
      
        '(CONTRATOEMPTMO.IDTIPOCONTREMPTMO = TIPOCONTREMPTMO.IDTIPOCONTRE' +
        'MPTMO)'
      
        '(VALORMAXPRESTEP.IDCONTRATOEMPTMO(+) = CONTRATOEMPTMO.IDCONTRATO' +
        'EMPTMO)'
      '(PLANPREV.IDPLANOPREV        = CONTRATOEMPTMO.IDPLANOPREV)'
      
        '  (PARTPREVPLAN.IDPESSJUR      = CONTRATOEMPTMO.IDPATRO) AND (PA' +
        'RTPREVPLAN.IDPESSOA       = DEPENTIT.IDPESSOA) AND (PARTPREVPLAN' +
        '.IDPLANOPREV    = CONTRATOEMPTMO.IDPLANOPREV)'
      
        ' (PARTPREVPLAN.IDSITPLANOPREV = SITPLANOPREV.IDSITPLANOPREV) AND' +
        ' (PATRO.IDPESSOA = CONTRATOEMPTMO.IDPATRO) AND (ELEGPATRO.IDPESS' +
        'JUR         = PARTPREVPLAN.IDPESSJUR) AND (ELEGPATRO.IDPESSOA   ' +
        '       = DEPENTIT.IDPESSOA)'
      '(ELEGPATRO.IDSITFUNC         = SITFUNC.IDSITFUNC )')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '15'
      '60'
      '18'
      '10'
      '10'
      '10'
      '10'
      '10'
      '0'
      '0')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
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
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 416
    Top = 15
  end
  object dsContratos: TDataSource
    DataSet = QryContratos
    Left = 80
    Top = 175
  end
  object QryContratos: TQuery
    AfterScroll = QryContratosAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT C.IDCONTRATOEMPTMO,'
      '       C.IDTIPOCONTREMPTMO,'
      '       T.TCEDESCRICAO,'
      '       C.VLRPARCELA'
      '  FROM CONTRATOEMPTMO C, TIPOCONTREMPTMO T'
      ' WHERE C.IDCONTRATOEMPTMO = :idcontrato  '
      ' AND C.IDTIPOCONTREMPTMO = T.IDTIPOCONTREMPTMO'
      '')
    Left = 144
    Top = 175
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idcontrato'
        ParamType = ptUnknown
      end>
  end
  object QryMaxPrestEp: TQuery
    AfterOpen = QryMaxPrestEpAfterOpen
    AfterScroll = QryMaxPrestEpAfterScroll
    DatabaseName = 'BaseDados'
    Left = 264
    Top = 207
  end
  object QryUpd: TQuery
    DatabaseName = 'BaseDados'
    Left = 392
    Top = 183
  end
  object dsMaxPrestEp: TDataSource
    DataSet = QryMaxPrestEp
    Left = 148
    Top = 399
  end
  object QryAux: TQuery
    DatabaseName = 'BaseDados'
    Left = 44
    Top = 399
  end
  object dsHistAlteracao: TDataSource
    DataSet = QryHistAlteracao
    Left = 506
    Top = 424
  end
  object QryHistAlteracao: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DESCOPERACAO,'
      
        '(SELECT NOME FROM PESSOA WHERE IDPESSOA = L.IDUSUARIO) AS USUARI' +
        'O,'
      'TRUNC(DATA) AS DATA FROM LOGTOTALPREV L'
      'WHERE IDPESQUISA1=:IDVALORMAXPRESTEP'
      'ORDER BY DATA DESC')
    Left = 442
    Top = 400
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDVALORMAXPRESTEP'
        ParamType = ptUnknown
      end>
    object QryHistAlteracaoDESCOPERACAO: TMemoField
      DisplayLabel = 'DESCRICAO'
      FieldName = 'DESCOPERACAO'
      OnGetText = QryHistAlteracaoDESCOPERACAOGetText
      BlobType = ftMemo
      Size = 2000
    end
    object QryHistAlteracaoUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 60
    end
    object QryHistAlteracaoDATA: TDateTimeField
      FieldName = 'DATA'
    end
  end
end
