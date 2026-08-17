inherited frmCadBem: TfrmCadBem
  Left = 81
  Top = 146
  Caption = 'Cadastro de Bens Novos'
  ClientHeight = 322
  ClientWidth = 592
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 592
    Height = 254
    object Label35: TLabel
      Left = 16
      Top = 106
      Width = 51
      Height = 13
      Caption = 'Conjunto'
    end
    object Label48: TLabel
      Left = 16
      Top = 58
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object Label49: TLabel
      Left = 16
      Top = 154
      Width = 35
      Height = 13
      Caption = 'Grupo'
    end
    object Label50: TLabel
      Left = 472
      Top = 154
      Width = 109
      Height = 13
      Caption = 'Depreciação Anual'
    end
    object Label51: TLabel
      Left = 560
      Top = 168
      Width = 16
      Height = 20
      Caption = '%'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label52: TLabel
      Left = 16
      Top = 202
      Width = 51
      Height = 13
      Caption = 'Situação'
    end
    object Label4: TLabel
      Left = 344
      Top = 202
      Width = 38
      Height = 13
      Caption = 'Classe'
    end
    object Label36: TLabel
      Left = 16
      Top = 10
      Width = 109
      Height = 13
      Caption = 'Nº de Tombamento'
    end
    object Label58: TLabel
      Left = 472
      Top = 10
      Width = 98
      Height = 13
      Caption = 'Data de Inclusão'
    end
    object DBcboSituacao: TwwDBLookupCombo
      Left = 16
      Top = 216
      Width = 313
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCSITUACAO'#9'45'#9'DESCSITUACAO')
      DataField = 'IDSITUACAO'
      DataSource = ds
      LookupTable = qryLookSituacao
      LookupField = 'IDSITUACAO'
      Style = csDropDownList
      DropDownWidth = 8
      TabOrder = 7
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
    end
    object DBcboConjunto: TwwDBLookupCombo
      Left = 16
      Top = 120
      Width = 537
      Height = 21
      TabStop = False
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCCONJUNTO'#9'200'#9'DESCCONJUNTO')
      DataField = 'IDCONJUNTO'
      DataSource = ds
      LookupTable = qryLookConjunto
      LookupField = 'IDCONJUNTO'
      Style = csDropDownList
      DropDownWidth = 8
      Enabled = False
      TabOrder = 3
      AutoDropDown = False
      ShowButton = False
      UseTFields = False
      AllowClearKey = False
    end
    object btnNovoConjuntoEdif: TBitBtn
      Left = 497
      Top = 119
      Width = 23
      Height = 22
      Enabled = False
      TabOrder = 9
      Visible = False
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF008888888B8888
        8888888888888F8888888B8888BB778888B88888888F77F8888888BB8800F088
        BB8888888F7787F8888888BB00FFF0BBBB88888F7788878F88888800FFFFFF0B
        B888887788888F7F8888887FFFFFCF0B8888887F88FF7878F888887FFCCCFFF0
        B8888878F77788F7F88888B7FFFFFCF0BB888887F88FF7878F88BBB7FFCCCFFF
        0BBB88878F77788F78F888BB7FFFFFCFF08888887F88FF78878F888B7FFCCCFF
        FF08888878F777888F78888BB7FFFFFF77888888878F888F778888BBBB7FFF77
        BB8888888878FF77888888BB88B77788BB8888888887778888888B88888B8888
        88B888888888888888888888888B888888888888888888888888}
      NumGlyphs = 2
    end
    object btnBuscaConjunto: TBitBtn
      Left = 553
      Top = 119
      Width = 23
      Height = 22
      Hint = 'Busca um Conjunto'
      TabOrder = 4
      OnClick = btnBuscaConjuntoClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
        777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
        77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
        77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
        077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
        FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
        F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
        7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
        777777787FFF8777777777770000777777777777888877777777}
      NumGlyphs = 2
    end
    object edtPlaca: TDBRealEdit
      Left = 16
      Top = 24
      Width = 137
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '         0')
      TabOrder = 0
      WordWrap = False
      IntDigits = 10
      DecDigits = 0
      NumberFormat = fNumber
      Signal = False
      DataField = 'PLACA'
      DataSource = ds
    end
    object edtDeprecAnual: TDBRealEdit
      Left = 472
      Top = 168
      Width = 81
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '    0,0000')
      TabOrder = 6
      WordWrap = False
      IntDigits = 10
      DecDigits = 4
      NumberFormat = fNumber
      Signal = False
      DataField = 'TAXADEP'
      DataSource = ds
    end
    object DBedtDescricao: TDBEdit
      Left = 16
      Top = 72
      Width = 561
      Height = 21
      DataField = 'DESBEM'
      DataSource = ds
      TabOrder = 2
    end
    object DBcboGrupo: TwwDBLookupCombo
      Left = 16
      Top = 168
      Width = 441
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'30'#9'NOME'
        'CLASSE'#9'15'#9'CLASSE')
      DataField = 'IDGRUPO'
      DataSource = ds
      LookupTable = qryLookGrupo
      LookupField = 'IDGRUPO'
      Style = csDropDownList
      DropDownWidth = 8
      TabOrder = 5
      AutoDropDown = True
      ShowButton = True
      UseTFields = False
      AllowClearKey = False
      OnCloseUp = DBcboGrupoCloseUp
    end
    object DBcboClasseBem: TwwDBLookupCombo
      Left = 344
      Top = 216
      Width = 233
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'50'#9'DESCRICAO')
      DataField = 'IDCLASSEBEM'
      DataSource = ds
      LookupTable = qryLookClasse
      LookupField = 'IDCLASSEBEM'
      Style = csDropDownList
      DropDownWidth = 8
      TabOrder = 8
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
    end
    object DBedtDataInclusao: TCMDateTimePicker
      Left = 472
      Top = 24
      Width = 105
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      ButtonStyle = cbsCustom
      DataField = 'DTAINCLUSAO'
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
  end
  inherited Dock972: TDock97
    Width = 592
    inherited Toolbar971: TToolbar97
      inherited btnRefresh: TToolbarButton97
        Left = 467
      end
      inherited btnTrazer: TToolbarButton97
        Left = 552
      end
      object sbtnNovoConj: TToolbarButton97
        Left = 346
        Top = 0
        Width = 121
        Height = 29
        AllowAllUp = True
        GroupIndex = 1
        DropdownArrow = False
        Caption = 'Novo &Conjunto'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF008888888B8888
          8888888888888F8888888B8888BB778888B88888888F77F8888888BB8800F088
          BB8888888F7787F8888888BB00FFF0BBBB88888F7788878F88888800FFFFFF0B
          B888887788888F7F8888887FFFFFCF0B8888887F88FF7878F888887FFCCCFFF0
          B8888878F77788F7F88888B7FFFFFCF0BB888887F88FF7878F88BBB7FFCCCFFF
          0BBB88878F77788F78F888BB7FFFFFCFF08888887F88FF78878F888B7FFCCCFF
          FF08888878F777888F78888BB7FFFFFF77888888878F888F778888BBBB7FFF77
          BB8888888878FF77888888BB88B77788BB8888888887778888888B88888B8888
          88B888888888888888888888888B888888888888888888888888}
        NumGlyphs = 2
        Opaque = False
        OnClick = sbtnNovoConjClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 289
    Width = 592
    inherited tb97Fundo: TToolbar97
      Left = 420
      DockPos = 437
      inherited bbtnSair: TBitBtn
        ModalResult = 2
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 248
      DockPos = 265
      inherited bbtnConfirmar: TBitBtn
        ModalResult = 0
      end
      inherited bbtnCancelar: TBitBtn
        ModalResult = 0
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 65503
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 280
    Top = 160
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update BEM'
      'set'
      '  IDBEM = :IDBEM,'
      '  IDPESSOA = :IDPESSOA,'
      '  IDSITUACAO = :IDSITUACAO,'
      '  IDCONJUNTO = :IDCONJUNTO,'
      '  IDGRUPO = :IDGRUPO,'
      '  PLACA = :PLACA,'
      '  DESBEM = :DESBEM,'
      '  TAXADEP = :TAXADEP,'
      '  CONTROLE = :CONTROLE,'
      '  DATAINICIODEP = :DATAINICIODEP,'
      '  VALHISTORICO = :VALHISTORICO,'
      '  CMBEM = :CMBEM,'
      '  CMDEP = :CMDEP,'
      '  DEPLANC = :DEPLANC,'
      '  DTAINCLUSAO = :DTAINCLUSAO,'
      '  DATAULTDEP = :DATAULTDEP,'
      '  VALORG = :VALORG,'
      '  REGISTRO = :REGISTRO,'
      '  IDCLASSEBEM = :IDCLASSEBEM,'
      '  IDMODULO = :IDMODULO'
      'where'
      '  IDBEM = :OLD_IDBEM')
    InsertSQL.Strings = (
      'insert into BEM'
      
        '  (IDBEM, IDPESSOA, IDSITUACAO, IDCONJUNTO, IDGRUPO, PLACA, DESB' +
        'EM, TAXADEP, '
      
        '   CONTROLE, DATAINICIODEP, VALHISTORICO, CMBEM, CMDEP, DEPLANC,' +
        ' DTAINCLUSAO, '
      '   DATAULTDEP, VALORG, REGISTRO, IDCLASSEBEM, IDMODULO)'
      'values'
      
        '  (:IDBEM, :IDPESSOA, :IDSITUACAO, :IDCONJUNTO, :IDGRUPO, :PLACA' +
        ', :DESBEM, '
      
        '   :TAXADEP, :CONTROLE, :DATAINICIODEP, :VALHISTORICO, :CMBEM, :' +
        'CMDEP, '
      
        '   :DEPLANC, :DTAINCLUSAO, :DATAULTDEP, :VALORG, :REGISTRO, :IDC' +
        'LASSEBEM, '
      '   :IDMODULO)')
    DeleteSQL.Strings = (
      'delete from BEM'
      'where'
      '  IDBEM = :OLD_IDBEM')
    Left = 216
    Top = 160
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'BEM.PLACA'
      'BEM.DESBEM'
      'CONJUNTO.DESCCONJUNTO'
      'LOCALIZACAO.NOME')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nº de Tombamento'
      'Descrição'
      'Conjunto'
      'Localização')
    Tabelas.Strings = (
      'BEM'
      'CONJUNTO'
      'LOCALIZACAO')
    CamposChave.Strings = (
      'BEM.IDBEM')
    Filtro.Strings = (
      'BEM.IDCONJUNTO = CONJUNTO.IDCONJUNTO (+)'
      'CONJUNTO.IDLOCALIZACAO = LOCALIZACAO.IDLOCALIZACAO (+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '14'
      '40'
      '40'
      '45')
    Left = 336
    Top = 76
  end
  inherited ImlPadrao: TImageList
    Left = 129
    Top = 174
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
    Top = 58
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '   IDBEM, IDPESSOA, IDSITUACAO, IDCONJUNTO, IDGRUPO,'
      '   PLACA, DESBEM, TAXADEP, CONTROLE, DATAINICIODEP,'
      '   VALHISTORICO, CMBEM, CMDEP, DEPLANC, DTAINCLUSAO,'
      '   DATAULTDEP, VALORG, REGISTRO, IDCLASSEBEM,'
      '   IDMODULO'
      'FROM'
      '   BEM'
      'WHERE'
      '   ( IDBEM =:BEM )'
      '')
    Left = 248
    Top = 160
    ParamData = <
      item
        DataType = ftInteger
        Name = 'BEM'
        ParamType = ptUnknown
      end>
    object qryIDBEM: TFloatField
      FieldName = 'IDBEM'
      Origin = 'BEM.IDBEM'
    end
    object qryIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BEM.IDPESSOA'
    end
    object qryIDSITUACAO: TFloatField
      FieldName = 'IDSITUACAO'
      Origin = 'BEM.IDSITUACAO'
    end
    object qryIDCONJUNTO: TFloatField
      FieldName = 'IDCONJUNTO'
      Origin = 'BEM.IDCONJUNTO'
    end
    object qryIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
      Origin = 'BEM.IDGRUPO'
    end
    object qryPLACA: TFloatField
      FieldName = 'PLACA'
      Origin = 'BEM.PLACA'
    end
    object qryDESBEM: TStringField
      FieldName = 'DESBEM'
      Origin = 'BEM.DESBEM'
      Size = 200
    end
    object qryTAXADEP: TFloatField
      FieldName = 'TAXADEP'
      Origin = 'BEM.TAXADEP'
    end
    object qryCONTROLE: TStringField
      FieldName = 'CONTROLE'
      Origin = 'BEM.CONTROLE'
      Size = 1
    end
    object qryDATAINICIODEP: TDateTimeField
      FieldName = 'DATAINICIODEP'
      Origin = 'BEM.DATAINICIODEP'
    end
    object qryVALHISTORICO: TFloatField
      FieldName = 'VALHISTORICO'
      Origin = 'BEM.VALHISTORICO'
    end
    object qryCMBEM: TFloatField
      FieldName = 'CMBEM'
      Origin = 'BEM.CMBEM'
    end
    object qryCMDEP: TFloatField
      FieldName = 'CMDEP'
      Origin = 'BEM.CMDEP'
    end
    object qryDEPLANC: TFloatField
      FieldName = 'DEPLANC'
      Origin = 'BEM.DEPLANC'
    end
    object qryDTAINCLUSAO: TDateTimeField
      FieldName = 'DTAINCLUSAO'
      Origin = 'BEM.DTAINCLUSAO'
    end
    object qryDATAULTDEP: TDateTimeField
      FieldName = 'DATAULTDEP'
      Origin = 'BEM.DATAULTDEP'
    end
    object qryVALORG: TFloatField
      FieldName = 'VALORG'
      Origin = 'BEM.VALORG'
    end
    object qryREGISTRO: TStringField
      FieldName = 'REGISTRO'
      Origin = 'BEM.REGISTRO'
      Size = 1
    end
    object qryIDCLASSEBEM: TFloatField
      FieldName = 'IDCLASSEBEM'
      Origin = 'BEM.IDCLASSEBEM'
    end
    object qryIDMODULO: TFloatField
      FieldName = 'IDMODULO'
      Origin = 'BEM.IDMODULO'
    end
  end
  object qryLookSituacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDSITUACAO, DESCSITUACAO'
      'FROM'
      '   SITUACAO'
      'ORDER BY '
      '   DESCSITUACAO')
    ValidateWithMask = True
    Left = 384
    Top = 196
    object qryLookSituacaoIDSITUACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDSITUACAO'
      Origin = 'SITUACAO.IDSITUACAO'
      Visible = False
    end
    object qryLookSituacaoDESCSITUACAO: TStringField
      FieldName = 'DESCSITUACAO'
      Origin = 'SITUACAO.DESCSITUACAO'
      Size = 45
    end
  end
  object qryLookGrupo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDGRUPO, NOME, DEPRECIACAO, CLASSE'
      'FROM'
      '   GRUPO'
      'WHERE'
      '   ( TIPO = '#39'A'#39' )'
      'ORDER BY'
      '   NOME, CLASSE')
    ValidateWithMask = True
    Left = 384
    Top = 184
    object qryLookGrupoIDGRUPO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDGRUPO'
      Origin = 'GRUPO.IDGRUPO'
      Visible = False
    end
    object qryLookGrupoDEPRECIACAO: TFloatField
      FieldName = 'DEPRECIACAO'
      Origin = 'GRUPO.DEPRECIACAO'
      Visible = False
    end
    object qryLookGrupoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'GRUPO.NOME'
      Size = 60
    end
    object qryLookGrupoCLASSE: TStringField
      FieldName = 'CLASSE'
      Origin = 'GRUPO.CLASSE'
      Size = 15
    end
  end
  object qryLookConjunto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDCONJUNTO, DESCCONJUNTO'
      'FROM'
      '  CONJUNTO'
      'WHERE'
      '  ( IDCONJUNTO =:CONJUNTO )')
    ValidateWithMask = True
    Left = 384
    Top = 172
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CONJUNTO'
        ParamType = ptUnknown
      end>
    object qryLookConjuntoIDCONJUNTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONJUNTO'
      Origin = 'CONJUNTO.IDCONJUNTO'
      Visible = False
    end
    object qryLookConjuntoDESCCONJUNTO: TStringField
      FieldName = 'DESCCONJUNTO'
      Origin = 'CONJUNTO.DESCCONJUNTO'
      Size = 200
    end
  end
  object qryDuplicidadePlaca: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDBEM, PLACA'
      'FROM'
      '   BEM'
      'WHERE'
      '   PLACA =:PLACA')
    ValidateWithMask = True
    Left = 232
    Top = 64
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PLACA'
        ParamType = ptUnknown
      end>
    object qryDuplicidadePlacaIDBEM: TFloatField
      FieldName = 'IDBEM'
      Origin = 'BEM.IDBEM'
    end
    object qryDuplicidadePlacaPLACA: TFloatField
      FieldName = 'PLACA'
      Origin = 'BEM.PLACA'
    end
  end
  object MontaSelectConj: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'C.DESCCONJUNTO'
      'L.NOME')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Conjunto'
      'Localização')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'CONJUNTO C'
      'LOCALIZACAO L')
    CamposChave.Strings = (
      'C.IDCONJUNTO')
    Filtro.Strings = (
      'C.IDLOCALIZACAO = L.IDLOCALIZACAO(+)')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '40'
      '45')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 336
    Top = 64
  end
  object qryLookClasse: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDCLASSEBEM, CODHIERARQ, DESCRICAO'
      'FROM'
      '  CLASSEDEBEM'
      'WHERE'
      '   ANASINT = '#39'A'#39
      'ORDER BY'
      '   DESCRICAO')
    ValidateWithMask = True
    Left = 384
    Top = 160
    object qryLookClasseIDCLASSEBEM: TFloatField
      FieldName = 'IDCLASSEBEM'
      Origin = 'CLASSEDEBEM.IDCLASSEBEM'
      Visible = False
    end
    object qryLookClasseCODHIERARQ: TStringField
      FieldName = 'CODHIERARQ'
      Origin = 'CLASSEDEBEM.CODHIERARQ'
      Visible = False
      Size = 15
    end
    object qryLookClasseDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'CLASSEDEBEM.DESCRICAO'
      Size = 60
    end
  end
end
