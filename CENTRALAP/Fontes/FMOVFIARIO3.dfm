inherited FRMMOVFIARIO3: TFRMMOVFIARIO3
  Left = 98
  Top = 145
  Caption = 'Movimento no Protocolo'
  ClientHeight = 327
  ClientWidth = 623
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 623
    Height = 241
    object Label1: TLabel
      Left = 13
      Top = 12
      Width = 144
      Height = 13
      Caption = 'Participante/Dependente'
    end
    object Label2: TLabel
      Left = 13
      Top = 58
      Width = 111
      Height = 13
      Caption = 'Grupo de Protocolo'
    end
    object Assunto: TLabel
      Left = 15
      Top = 102
      Width = 124
      Height = 13
      Caption = 'Descrição do assunto'
    end
    object Label3: TLabel
      Left = 488
      Top = 12
      Width = 97
      Height = 13
      Caption = 'Data de inclusão'
    end
    object dbdataInclusao: TCMDateTimePicker
      Left = 489
      Top = 28
      Width = 109
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      ButtonStyle = cbsCustom
      DataField = 'DATAINCLUSAO'
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
      TabOrder = 0
    end
    object MemoAssunto: TDBMemo
      Left = 15
      Top = 120
      Width = 585
      Height = 89
      DataField = 'DESCRICAO'
      DataSource = ds
      TabOrder = 1
    end
    object edparticipante: TEdit
      Left = 14
      Top = 27
      Width = 464
      Height = 21
      Color = clInactiveCaption
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object dblkGrupo: TwwDBLookupCombo
      Left = 16
      Top = 74
      Width = 465
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'100'#9'Descrição'#9'F')
      DataField = 'IDGRUPO'
      DataSource = ds
      LookupTable = qryassunto
      LookupField = 'IDFIARASS'
      TabOrder = 3
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
  end
  inherited Dock972: TDock97
    Width = 623
  end
  inherited Dock971: TDock97
    Top = 288
    Width = 623
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'select'
      'IDTITULAR,'
      'IDPESSOA,'
      'IDMODULO,'
      'IDRUBS,'
      'DESCRICAO,'
      'DATAINCLUSAO,'
      'IDGRUPO,'
      'IDFIARIOA,'
      'IDUSUARIO'
      'from fiario'
      'where IDTITULAR = :IDTITULAR'
      '           and IDPESSOA = :IDPESSOA'
      '           and  IDGRUPO = :IDGRUPO'
      '           and  DATAINCLUSAO = :DATAINCLUSAO'
      '         '
      ' ')
    Left = 386
    Top = 6
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDTITULAR'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDGRUPO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATAINCLUSAO'
        ParamType = ptInput
      end>
    object qryIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
      Origin = 'BASEDADOS.FIARIO.IDTITULAR'
    end
    object qryIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.FIARIO.IDPESSOA'
    end
    object qryIDMODULO: TFloatField
      FieldName = 'IDMODULO'
      Origin = 'BASEDADOS.FIARIO.IDMODULO'
    end
    object qryIDRUBS: TFloatField
      FieldName = 'IDRUBS'
      Origin = 'BASEDADOS.FIARIO.IDRUBS'
    end
    object qryDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.FIARIO.DESCRICAO'
      Size = 200
    end
    object qryDATAINCLUSAO: TDateTimeField
      FieldName = 'DATAINCLUSAO'
      Origin = 'BASEDADOS.FIARIO.DATAINCLUSAO'
    end
    object qryIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
      Origin = 'BASEDADOS.FIARIO.IDGRUPO'
    end
    object qryIDFIARIOA: TFloatField
      FieldName = 'IDFIARIOA'
      Origin = 'BASEDADOS.FIARIO.IDFIARIOA'
    end
    object qryIDUSUARIO: TFloatField
      FieldName = 'IDUSUARIO'
      Origin = 'BASEDADOS.FIARIO.IDUSUARIO'
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 304
    Top = 6
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
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update fiario'
      'set'
      '  IDTITULAR = :IDTITULAR,'
      '  IDPESSOA = :IDPESSOA,'
      '  IDMODULO = :IDMODULO,'
      '  IDRUBS = :IDRUBS,'
      '  DESCRICAO = :DESCRICAO,'
      '  DATAINCLUSAO = :DATAINCLUSAO,'
      '  IDGRUPO = :IDGRUPO,'
      '  IDFIARIOA = :IDFIARIOA,'
      '  IDUSUARIO = :IDUSUARIO'
      'where'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDGRUPO = :OLD_IDGRUPO and'
      '  IDFIARIOA = :OLD_IDFIARIOA')
    InsertSQL.Strings = (
      'insert into fiario'
      
        '  (IDTITULAR, IDPESSOA, IDMODULO, IDRUBS, DESCRICAO, DATAINCLUSA' +
        'O, '
      'IDGRUPO, '
      '   IDFIARIOA, IDUSUARIO)'
      'values'
      '  (:IDTITULAR, :IDPESSOA, :IDMODULO, :IDRUBS, :DESCRICAO, '
      ':DATAINCLUSAO, '
      '   :IDGRUPO, :IDFIARIOA, :IDUSUARIO)')
    DeleteSQL.Strings = (
      'delete from fiario'
      'where'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDGRUPO = :OLD_IDGRUPO and'
      '  IDFIARIOA = :OLD_IDFIARIOA')
    Left = 467
    Top = 6
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Protocolo'
    Colunas.Strings = (
      'PARTICIPDEPEN.MATRICULA'
      'PARTICIPDEPEN.NOME'
      'FIARIO.DESCRICAO'
      'FIARIO.DATAINCLUSAO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'D')
    Descricao.Strings = (
      'Matrícula'
      'Nome'
      'Assunto'
      'Data de Inclusão')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PARTICIPDEPEN'
      'FIARIO'
      'FIARIOASSUNTO')
    CamposChave.Strings = (
      'PARTICIPDEPEN.MATRICULA'
      'PARTICIPDEPEN.IDTITULAR'
      'PARTICIPDEPEN.IDPESSOA'
      'PARTICIPDEPEN.NOME'
      'PARTICIPDEPEN.IDDEPENDENCIA'
      'PARTICIPDEPEN.IDDEPENDENCIA'
      'PARTICIPDEPEN.NUMDOCUMENTO'
      'FIARIO.IDTITULAR'
      'FIARIO.IDFIARIOA'
      'FIARIO.IDPESSOA'
      'FIARIO.IDUSUARIO'
      'FIARIO.IDMODULO'
      'FIARIO.IDRUBS'
      'FIARIO.DESCRICAO'
      'FIARIO.DATAINCLUSAO'
      'FIARIO.IDGRUPO'
      'FIARIOASSUNTO.DESCRICAO')
    Filtro.Strings = (
      'FIARIO.IDTITULAR = PARTICIPDEPEN.IDPESSOA'
      'FIARIO.IDGRUPO = FIARIOASSUNTO.IDFIARASS')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '30'
      '40'
      '18')
    Left = 549
    Top = 6
  end
  inherited ds: TwwDataSource
    Left = 427
    Top = 6
  end
  inherited ImlPadrao: TImageList
    Left = 345
    Top = 6
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 524
    Top = 6
  end
  object qryassunto: TwwQuery
    DatabaseName = 'BaseDados'
    Filtered = True
    DataSource = ds
    SQL.Strings = (
      'select  IDFIARASS, DESCRICAO'
      'from FIARIOASSUNTO'
      '')
    ValidateWithMask = True
    Left = 504
    Top = 103
    object qryassuntoDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 100
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.FIARIOASSUNTO.DESCRICAO'
      Size = 100
    end
    object qryassuntoIDFIARASS: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFIARASS'
      Origin = 'BASEDADOS.FIARIOASSUNTO.IDFIARASS'
      Visible = False
    end
  end
  object DataSource1: TDataSource
    DataSet = qryassunto
    Left = 560
    Top = 111
  end
  object MontaSelect1: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Participante e/ou Dependente'
    Colunas.Strings = (
      'PARTICIPDEPEN.MATRICULA'
      'PARTICIPDEPEN.NOME'
      'PARTICIPDEPEN.NUMDOCUMENTO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Nome'
      'Num. Documento')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PARTICIPDEPEN')
    CamposChave.Strings = (
      'PARTICIPDEPEN.MATRICULA'
      'PARTICIPDEPEN.IDTITULAR'
      'PARTICIPDEPEN.IDPESSOA'
      'PARTICIPDEPEN.NOME'
      'PARTICIPDEPEN.IDDEPENDENCIA'
      'PARTICIPDEPEN.NUMDOCUMENTO')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '30'
      '18')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 248
    Top = 24
  end
end
