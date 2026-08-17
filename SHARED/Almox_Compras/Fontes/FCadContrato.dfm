inherited FrmCadContrato: TFrmCadContrato
  Left = 158
  Top = 71
  Caption = 'Cadastro de Contrato'
  ClientHeight = 418
  ClientWidth = 492
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 492
    Height = 332
    object Label1: TLabel
      Left = 312
      Top = 149
      Width = 100
      Height = 13
      Caption = 'Prazo Pagamento'
    end
    object Label2: TLabel
      Left = 445
      Top = 173
      Width = 26
      Height = 13
      Caption = 'Dias'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 16
      Top = 80
      Width = 61
      Height = 13
      Caption = 'Comprador'
    end
    object cmpForn: TCMProcuraForCli
      Left = 16
      Top = 16
      Width = 457
      Height = 49
      Caption = ' Fornecedor '
      TabOrder = 0
      CampoEdit = ceRazaoSocial
      MostraMensagens = True
      DataSource = ds
      DataField = 'IDFORCLI'
      Mensagens.EmBranco = 'Fornecedor não pode estar em branco'
      Mensagens.NaoExiste = 'Fornecedor não existe'
      PermiteChaveInvalida = False
      PermiteChaveEmBranco = False
      ForCli = fcFornecedor
      MostraEndereco = False
      StatusForCli = fcAll
      MostraStatusCredito = False
    end
    object spPrazoPag: TSpinEdit
      Left = 312
      Top = 165
      Width = 129
      Height = 22
      MaxLength = 4
      MaxValue = 9999
      MinValue = 1
      TabOrder = 3
      Value = 1
    end
    object GrpData: TGroupBox
      Left = 16
      Top = 128
      Width = 290
      Height = 59
      Caption = ' Data '
      TabOrder = 2
      TabStop = True
      object Label4: TLabel
        Left = 16
        Top = 16
        Width = 35
        Height = 13
        Caption = 'Inicial'
      end
      object Label5: TLabel
        Left = 152
        Top = 16
        Width = 42
        Height = 13
        Caption = 'Témino'
      end
      object edDataIni: TCMDateTimePicker
        Left = 16
        Top = 32
        Width = 121
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DATAINICIO'
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
      object edDataFim: TCMDateTimePicker
        Left = 152
        Top = 32
        Width = 121
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DATATERMINO'
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
    object GrpArt: TGroupBox
      Left = 16
      Top = 192
      Width = 457
      Height = 121
      Caption = ' Artigo '
      TabOrder = 4
      TabStop = True
      object Label3: TLabel
        Left = 280
        Top = 72
        Width = 89
        Height = 13
        Caption = 'Qtde. Esperada'
      end
      object Label7: TLabel
        Left = 16
        Top = 24
        Width = 40
        Height = 13
        Caption = 'Código'
      end
      object Label6: TLabel
        Left = 144
        Top = 24
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object Label8: TLabel
        Left = 16
        Top = 72
        Width = 48
        Height = 13
        Caption = 'Unidade'
      end
      object Label9: TLabel
        Left = 144
        Top = 72
        Width = 78
        Height = 13
        Caption = 'Valor Unitário'
      end
      object edQtdeEsp: TDBRealEdit
        Left = 280
        Top = 88
        Width = 121
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '   0,00000')
        TabOrder = 4
        WordWrap = False
        IntDigits = 10
        DecDigits = 5
        NumberFormat = fNumber
        Signal = False
        DataField = 'QTDEESPERADA'
        DataSource = ds
      end
      object dblcItem: TwwDBLookupCombo
        Left = 16
        Top = 40
        Width = 113
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'CODARTIGO'#9'14'#9'Código'
          'DESCRICAO'#9'50'#9'Descrição')
        DataField = 'CODARTIGO'
        DataSource = ds
        LookupTable = qryArtigo
        LookupField = 'CODARTIGO'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnCloseUp = dblcItemCloseUp
      end
      object dblcDesc: TwwDBLookupCombo
        Left = 144
        Top = 40
        Width = 297
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'50'#9'Descrição'
          'CODARTIGO'#9'14'#9'Código')
        DataField = 'CODARTIGO'
        DataSource = ds
        LookupTable = qryArtigo
        LookupField = 'CODARTIGO'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnCloseUp = dblcDescCloseUp
      end
      object dblcUN: TwwDBLookupCombo
        Left = 16
        Top = 88
        Width = 113
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'CODMEDIDA'#9'4'#9'Código'
          'DESCMEDIDA'#9'25'#9'Descrição')
        DataField = 'CODMEDIDA'
        DataSource = ds
        LookupTable = qryUnidMed
        LookupField = 'CODMEDIDA'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object edVlrUnitario: TDBRealEdit
        Left = 144
        Top = 88
        Width = 121
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '   0,00000')
        TabOrder = 3
        WordWrap = False
        IntDigits = 10
        DecDigits = 5
        NumberFormat = fNumber
        Signal = False
        DataField = 'VLRUNITARIO'
        DataSource = ds
      end
    end
    object dblcComrpador: TCMDBLookupCombo
      Left = 16
      Top = 96
      Width = 457
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'60'#9'Nome')
      DataField = 'IDCOMPRADOR'
      DataSource = ds
      LookupTable = qryComprador
      LookupField = 'IDPESSOA'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
  end
  inherited Dock972: TDock97
    Width = 492
  end
  inherited Dock971: TDock97
    Top = 379
    Width = 492
    inherited tb97Fundo: TToolbar97
      Left = 320
      DockPos = 323
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 151
      DockPos = 154
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 763
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update CONTRATOPROD'
      'set'
      '  IDCONTRATOPROD = :IDCONTRATOPROD,'
      '  CODARTIGO = :CODARTIGO,'
      '  CODMEDIDA = :CODMEDIDA,'
      '  IDFORCLI = :IDFORCLI,'
      '  IDPESSOA = :IDPESSOA,'
      '  VLRUNITARIO = :VLRUNITARIO,'
      '  PRAZOPAG = :PRAZOPAG,'
      '  DATAINICIO = :DATAINICIO,'
      '  DATATERMINO = :DATATERMINO,'
      '  QTDEESPERADA = :QTDEESPERADA,'
      '  IDCOMPRADOR = :IDCOMPRADOR'
      'where'
      '  IDCONTRATOPROD = :OLD_IDCONTRATOPROD')
    InsertSQL.Strings = (
      'insert into CONTRATOPROD'
      '  (IDCONTRATOPROD, CODARTIGO, CODMEDIDA, IDFORCLI, IDPESSOA, '
      'VLRUNITARIO, '
      '   PRAZOPAG, DATAINICIO, DATATERMINO, QTDEESPERADA, IDCOMPRADOR)'
      'values'
      
        '  (:IDCONTRATOPROD, :CODARTIGO, :CODMEDIDA, :IDFORCLI, :IDPESSOA' +
        ', '
      ':VLRUNITARIO, '
      '   :PRAZOPAG, :DATAINICIO, :DATATERMINO, :QTDEESPERADA, '
      ':IDCOMPRADOR)')
    DeleteSQL.Strings = (
      'delete from CONTRATOPROD'
      'where'
      '  IDCONTRATOPROD = :OLD_IDCONTRATOPROD')
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'CONTRATOPROD.IDCONTRATOPROD'
      'PESSOA.RAZAOSOCIAL'
      'CONTRATOPROD.CODARTIGO'
      'PRODUTO.DESCPROD'
      'CONTRATOPROD.DATAINICIO'
      'CONTRATOPROD.DATATERMINO')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'C'
      'D'
      'D')
    Descricao.Strings = (
      'Nº do Contrato'
      'Fornecedor'
      'Código do Artigo'
      'Descrição do Produto'
      'Data de Início'
      'Data de Término')
    Tabelas.Strings = (
      'PESSOA'
      'CONTRATOPROD'
      'PRODUTO')
    CamposChave.Strings = (
      'CONTRATOPROD.IDCONTRATOPROD')
    Filtro.Strings = (
      'SUBSTR(CONTRATOPROD.CODARTIGO,1,6) = PRODUTO.CODPRODUTO'
      'PESSOA.IDPESSOA = CONTRATOPROD.IDFORCLI')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '60'
      '14'
      '40'
      '10'
      '10')
    Left = 221
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 358
    Top = 58
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '       IDCONTRATOPROD,'
      '       CODARTIGO,     '
      '       CODMEDIDA,     '
      '       IDFORCLI,      '
      '       IDPESSOA,      '
      '       VLRUNITARIO,   '
      '       PRAZOPAG,      '
      '       DATAINICIO,    '
      '       DATATERMINO,'
      '       QTDEESPERADA,'
      '       IDCOMPRADOR'
      'FROM'
      '       CONTRATOPROD'
      'WHERE'
      '      (IDCONTRATOPROD = :pIDCONTRATO)')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pIDCONTRATO'
        ParamType = ptUnknown
      end>
    object qryIDCONTRATOPROD: TFloatField
      FieldName = 'IDCONTRATOPROD'
      Origin = 'CONTRATOPROD.IDCONTRATOPROD'
    end
    object qryCODARTIGO: TStringField
      FieldName = 'CODARTIGO'
      Origin = 'CONTRATOPROD.CODARTIGO'
      Size = 14
    end
    object qryCODMEDIDA: TStringField
      FieldName = 'CODMEDIDA'
      Origin = 'CONTRATOPROD.CODMEDIDA'
      Size = 4
    end
    object qryIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = 'CONTRATOPROD.IDFORCLI'
    end
    object qryIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'CONTRATOPROD.IDPESSOA'
    end
    object qryVLRUNITARIO: TFloatField
      FieldName = 'VLRUNITARIO'
      Origin = 'CONTRATOPROD.VLRUNITARIO'
    end
    object qryPRAZOPAG: TFloatField
      FieldName = 'PRAZOPAG'
      Origin = 'CONTRATOPROD.PRAZOPAG'
    end
    object qryDATAINICIO: TDateTimeField
      FieldName = 'DATAINICIO'
      Origin = 'CONTRATOPROD.DATAINICIO'
    end
    object qryDATATERMINO: TDateTimeField
      FieldName = 'DATATERMINO'
      Origin = 'CONTRATOPROD.DATATERMINO'
    end
    object qryQTDEESPERADA: TFloatField
      FieldName = 'QTDEESPERADA'
      Origin = 'CONTRATOPROD.QTDEESPERADA'
    end
    object qryIDCOMPRADOR: TFloatField
      FieldName = 'IDCOMPRADOR'
      Origin = 'CONTRATOPROD.IDCOMPRADOR'
    end
  end
  object qryArtigo: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '       A.CODARTIGO,'
      '       P.CODMEDCUSTO,'
      
        '      (P.DESCPROD || '#39' '#39' || A.CODCOR || '#39' '#39' || A.CODTAMANHO) AS ' +
        'DESCRICAO'
      'FROM   '
      '       ARTIGO A,'
      '       PRODUTO P'
      'Where  '
      
        '            ((A.FLGBLOQUEADO <> '#39'R'#39')  OR (A.FLGBLOQUEADO <> '#39'A'#39')' +
        ') '
      '   AND ( A.CODPRODUTO = P.CODPRODUTO)'
      'ORDER BY DESCRICAO'
      '')
    ValidateWithMask = True
    Left = 382
    Top = 11
  end
  object qryUnidMed: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select '
      '         U.CodMedida, '
      '         U.DescMedida '
      'From'
      '         UnMedida U,'
      '         Conver   C '
      'Where  '
      '         (RTRIM(C.CodProduto) =  :pCodProd)'
      '  and (U.CodMedida  = C.CodMedida)'
      'Order By CodMedida ')
    ValidateWithMask = True
    Left = 433
    Top = 12
    ParamData = <
      item
        DataType = ftString
        Name = 'pCodProd'
        ParamType = ptUnknown
      end>
    object qryUnidMedCODMEDIDA: TStringField
      DisplayLabel = 'Código'
      FieldName = 'CODMEDIDA'
      Origin = 'UNMEDIDA.CODMEDIDA'
      Size = 4
    end
    object qryUnidMedDESCMEDIDA: TStringField
      DisplayLabel = 'Descrição'
      FieldName = 'DESCMEDIDA'
      Origin = 'UNMEDIDA.DESCMEDIDA'
      Size = 25
    end
  end
  object qryComprador: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '       C.IDPESSOA,'
      '       P.NOME'
      'FROM'
      '       COMPRADOR C,'
      '       PESSOA P'
      'Where'
      '    ( C.IDPESSOA = P.IDPESSOA)'
      'ORDER BY 2'
      '')
    ValidateWithMask = True
    Left = 398
    Top = 75
    object qryCompradorNOME: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 60
      FieldName = 'NOME'
      Origin = '"CM.PESSOA".NOME'
      Size = 60
    end
    object qryCompradorIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Origin = 'COMPRADOR.IDPESSOA'
      Visible = False
    end
  end
end
