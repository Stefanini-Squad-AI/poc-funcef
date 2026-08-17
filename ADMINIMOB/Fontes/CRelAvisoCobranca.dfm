inherited cfgRelAvisoCobranca: TcfgRelAvisoCobranca
  Left = 521
  Top = 207
  HelpContext = 640006
  Caption = 'Emissão de Recibo e Aviso de Cobrança'
  ClientHeight = 446
  ClientWidth = 566
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 566
    Height = 413
    object Label2: TLabel
      Left = 16
      Top = 251
      Width = 96
      Height = 13
      Caption = 'Utilizar o Modelo'
    end
    object Label7: TLabel
      Left = 504
      Top = 350
      Width = 228
      Height = 13
      Caption = 'Modelo Word para impressão de recibos'
      Visible = False
    end
    object memImoveis: TMemo
      Left = 216
      Top = 415
      Width = 65
      Height = 26
      Color = clAqua
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      Lines.Strings = (
        '')
      ParentFont = False
      TabOrder = 4
    end
    object DBcboModeloAviso: TwwDBLookupCombo
      Left = 16
      Top = 265
      Width = 321
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'MODELOCARTA'#9'60'#9'Modelo')
      LookupTable = qryTemplate
      LookupField = 'IDCARTACOBRANCA'
      Style = csDropDownList
      DropDownWidth = 8
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      OnCloseUp = DBcboModeloAvisoCloseUp
    end
    object memReports: TMemo
      Left = 123
      Top = 418
      Width = 78
      Height = 21
      TabStop = False
      Color = clAqua
      Lines.Strings = (
        'memReports')
      TabOrder = 2
      Visible = False
      WordWrap = False
    end
    object rdgOrdenacao: TRadioGroup
      Left = 346
      Top = 244
      Width = 208
      Height = 58
      Caption = ' Ordenar por: '
      ItemIndex = 0
      Items.Strings = (
        'Imóvel, Data de Lançamento'
        'Data de Lançamento, Imóvel')
      TabOrder = 3
    end
    object edtWord: TEdit
      Left = 504
      Top = 364
      Width = 489
      Height = 21
      Enabled = False
      TabOrder = 5
      Visible = False
      OnChange = edtWordChange
    end
    object btnWord: TBitBtn
      Left = 505
      Top = 364
      Width = 24
      Height = 22
      Hint = 'Busca arquivo Word'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      Visible = False
      OnClick = btnWordClick
      Glyph.Data = {
        6E020000424D6E02000000000000760000002800000036000000120000000100
        040000000000F801000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        88888888888FFFFFFFFFFFF88888888888888888880088870000000000008888
        88777777777777F88887000000000000880088878888888888808888887F8888
        FFFF87F8888788888888888088008887FFFFFFFFFF808888887F8887777887F8
        8887FFFFFFFFFF8088008887FFFFF8888F808888887F8888888887F88887FFFF
        F8888F8088008887FFFFFFFFFF808888887F8FFFFFFF87F88887FFFFFFFFFF80
        88008887F88888888F80888888787777777887F88887F88888888F8088008887
        FFFFFFFFFF808888FFF8FF888FFFF7F88887FFFFFFFFFF8088008000700FF888
        8F808887778778F87777F7F88000700FF8888F80880080EE0EE0F88F8F808887
        F87F87F87887F7F880EE0EE0F88F8F80880080EE0EE0F88F8F808887F878878F
        7F87F7F880EE0EE0F88F8F80880080E0EE0E08FF8F808887F7FF7F78F77787F8
        80E0EE0E08FF8F80880080E00E00E0888F808887877F77878F8FF7F880E00E00
        E0888F8088000EEE0E0EEE0F0000887FFF7F7FFF7F7777880EEE0E0EEE0F0000
        880000000000000F7F088877777777777888788800000000000F7F0888008887
        FFFFFFFF70888888887F8888888788888887FFFFFFFF70888800888777777777
        7888888888777777777888888887777777777888880088888888888888888888
        888888888888888888888888888888888800}
      NumGlyphs = 3
    end
    object btnLimpaWord: TBitBtn
      Left = 529
      Top = 364
      Width = 23
      Height = 22
      Hint = 'Limpa arquivo Word'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      Visible = False
      OnClick = btnLimpaWordClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        88888888888FF8888888888888008888888888888F77F8888888888800F08888
        8888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0888
        88887788888F788888887FFFFFCF888888887F88FF7888FF88887FFCCCF88008
        888878F777888778F88887FFFF880110888887F88F8878878F8887FFC8809991
        0888878F7887F88878F8887FF88099991088887F88878F88878F887FF8880999
        03088878F88878F878788887F8888090B03088878F888787878788887888880B
        0B038888788888787878888888888880B0B38888888888878788888888888888
        0BBB88888888888878F888888888888880BB8888888888888788}
      NumGlyphs = 2
    end
    object rdoModelo: TRadioGroup
      Left = 16
      Top = 197
      Width = 537
      Height = 33
      Caption = 'Tipo de Modelo'
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'Analítico'
        'Consolidado'
        'Discriminado')
      TabOrder = 0
      OnClick = rdoModeloClick
    end
    object ChkVisualiza: TCheckBox
      Left = 512
      Top = 389
      Width = 257
      Height = 17
      Caption = 'Visualizar documento antes da impressão'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
      Visible = False
    end
    object GroupBox1: TGroupBox
      Left = 16
      Top = 4
      Width = 537
      Height = 174
      Caption = 'Filtros'
      TabOrder = 9
      inline molLocatario1: TmolLocatario
        Left = 3
        Top = 51
        Height = 37
        inherited Label5: TLabel
          Top = -1
        end
        inherited edtLocatario: TEdit
          Top = 13
        end
        inherited btnBuscaLocatario: TBitBtn
          Top = 13
          OnClick = molLocatario1btnBuscaLocatarioClick
        end
        inherited btnLimpaLocatario: TBitBtn
          Top = 13
        end
        inherited btnAbrePessoa: TBitBtn
          Left = 264
          Top = 13
          Visible = False
        end
      end
      inline molContrato1: TmolContrato
        Left = 3
        Top = 12
        Height = 39
        TabOrder = 1
        inherited Label2: TLabel
          Top = 1
        end
        inherited edtContrato: TEdit
          Top = 15
        end
        inherited btnBuscaContrato: TBitBtn
          Top = 15
          OnClick = molContrato1btnBuscaContratoClick
        end
        inherited btnLimpaContrato: TBitBtn
          Top = 15
        end
      end
      object chkPendente: TCheckBox
        Left = 327
        Top = 145
        Width = 204
        Height = 17
        Caption = 'Só incluir cobranças pendentes'
        Checked = True
        State = cbChecked
        TabOrder = 2
      end
      object GroupBox2: TGroupBox
        Left = 393
        Top = 19
        Width = 129
        Height = 118
        Caption = 'Período Vencimento'
        TabOrder = 3
        object Label1: TLabel
          Left = 11
          Top = 20
          Width = 66
          Height = 13
          Caption = 'Data Inicial'
        end
        object Label8: TLabel
          Left = 12
          Top = 71
          Width = 59
          Height = 13
          Caption = 'Data Final'
        end
        object edtDataIni: TCMDateTimePicker
          Left = 12
          Top = 34
          Width = 105
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          ButtonStyle = cbsCustom
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
          OnCloseUp = edtDataIniCloseUp
        end
        object edtDataFim: TCMDateTimePicker
          Left = 12
          Top = 85
          Width = 105
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          ButtonStyle = cbsCustom
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
          OnCloseUp = edtDataFimCloseUp
        end
      end
      object GroupBox3: TGroupBox
        Left = 11
        Top = 90
        Width = 265
        Height = 76
        Caption = 'Competência'
        TabOrder = 4
        object Label9: TLabel
          Left = 155
          Top = 16
          Width = 23
          Height = 13
          Caption = 'Ano'
        end
        object lblMesVencimento: TLabel
          Left = 8
          Top = 16
          Width = 24
          Height = 13
          Caption = 'Mês'
        end
        object cboMes: TComboBox
          Left = 8
          Top = 30
          Width = 145
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 0
          OnChange = cboMesChange
          Items.Strings = (
            'Janeiro'
            'Fevereiro'
            'Março'
            'Abril'
            'Maio'
            'Junho'
            'Julho'
            'Agosto'
            'Setembro'
            'Outubro'
            'Novembro'
            'Dezembro')
        end
        object DBspnAno: TwwDBSpinEdit
          Left = 154
          Top = 30
          Width = 57
          Height = 21
          Increment = 1
          TabOrder = 1
          UnboundDataType = wwDefault
          OnChange = DBspnAnoChange
        end
        object chkIgnoraCompetencia: TCheckBox
          Left = 8
          Top = 55
          Width = 249
          Height = 17
          Caption = 'Ignorar a competência dos lançamentos'
          TabOrder = 2
          OnClick = chkIgnoraCompetenciaClick
        end
      end
    end
    object GroupBox4: TGroupBox
      Left = 16
      Top = 309
      Width = 537
      Height = 82
      Caption = 'Descrição do Evento'
      TabOrder = 10
      object Panel1: TPanel
        Left = 2
        Top = 15
        Width = 533
        Height = 65
        Align = alClient
        BevelOuter = bvNone
        BorderWidth = 4
        TabOrder = 0
        object memEvento: TMemo
          Left = 4
          Top = 4
          Width = 525
          Height = 57
          Align = alClient
          TabOrder = 0
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 413
    Width = 566
    inherited tb97Fundo: TToolbar97
      Left = 382
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  object qryEmpresaClienteX: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   E.IDFORCLI, E.IDPESSOA, E.CONTACCLIENTE, E.CODSUBCONTA AS SUB' +
        'CONTACLIENTE,'
      '   L.CODSUBCONTA AS SUBCONTALOCATARIO,'
      '   P.NOME'
      'FROM'
      '   PESSOA P, EMPRESACLIENTE E, LOCATARIO L'
      'WHERE'
      '   ('
      '   ( E.IDPESSOA =:EMPRESAPROP )'
      '   )'
      '   AND'
      '   ('
      '   ( E.IDFORCLI = P.IDPESSOA ) AND'
      '   ( E.IDFORCLI = L.IDLOCATARIO(+) )'
      '   )'
      'ORDER BY'
      '   P.NOME')
    ValidateWithMask = True
    Left = 511
    Top = 330
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end>
    object qryEmpresaClienteXIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
    end
    object qryEmpresaClienteXIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryEmpresaClienteXCONTACCLIENTE: TStringField
      FieldName = 'CONTACCLIENTE'
      Size = 18
    end
    object qryEmpresaClienteXSUBCONTACLIENTE: TFloatField
      FieldName = 'SUBCONTACLIENTE'
    end
    object qryEmpresaClienteXSUBCONTALOCATARIO: TFloatField
      FieldName = 'SUBCONTALOCATARIO'
    end
    object qryEmpresaClienteXNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
  end
  object dsSql: TwwDataSource
    DataSet = qryCobranca
    Left = 368
    Top = 216
  end
  object pplconsulta: TppBDEPipeline
    DataSource = dsSql
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'lconsulta'
    Left = 168
    Top = 160
    object pplconsultappField1: TppField
      FieldAlias = 'DESCALC'
      FieldName = 'DESCALC'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object pplconsultappField2: TppField
      FieldAlias = 'DataPagamento'
      FieldName = 'DataPagamento'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 1
    end
    object pplconsultappField3: TppField
      FieldAlias = 'dataatual'
      FieldName = 'dataatual'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object pplconsultappField4: TppField
      FieldAlias = 'datajuros'
      FieldName = 'datajuros'
      FieldLength = 10
      DisplayWidth = 10
      Position = 3
    end
    object pplconsultappField5: TppField
      FieldAlias = 'datames'
      FieldName = 'datames'
      FieldLength = 15
      DisplayWidth = 15
      Position = 4
    end
    object pplconsultappField6: TppField
      FieldAlias = 'ContratoExtenso'
      FieldName = 'ContratoExtenso'
      FieldLength = 120
      DisplayWidth = 120
      Position = 5
    end
    object pplconsultappField7: TppField
      FieldAlias = 'IMONOME'
      FieldName = 'IMONOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 6
    end
    object pplconsultappField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDIMOVELMESTRE'
      FieldName = 'IDIMOVELMESTRE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object pplconsultappField9: TppField
      FieldAlias = 'CONNUMERO'
      FieldName = 'CONNUMERO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 8
    end
    object pplconsultappField10: TppField
      FieldAlias = 'CONNOME'
      FieldName = 'CONNOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 9
    end
    object pplconsultappField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'CODPORTFORMA'
      FieldName = 'CODPORTFORMA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object pplconsultappField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'CONDIASTOLERANCIA'
      FieldName = 'CONDIASTOLERANCIA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object pplconsultappField13: TppField
      FieldAlias = 'FLGTIPODIATOLERA'
      FieldName = 'FLGTIPODIATOLERA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 12
    end
    object pplconsultappField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCIDADES'
      FieldName = 'IDCIDADES'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object pplconsultappField15: TppField
      FieldAlias = 'NOME_IMOVEL'
      FieldName = 'NOME_IMOVEL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 14
    end
    object pplconsultappField16: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 15
    end
    object pplconsultappField17: TppField
      FieldAlias = 'NOME_CONTATO'
      FieldName = 'NOME_CONTATO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 16
    end
    object pplconsultappField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'CODPORTADOR'
      FieldName = 'CODPORTADOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object pplconsultappField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDBANCO'
      FieldName = 'IDBANCO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object pplconsultappField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDAGENCIA'
      FieldName = 'IDAGENCIA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 19
    end
    object pplconsultappField21: TppField
      FieldAlias = 'CONTA_CORRENTE'
      FieldName = 'CONTA_CORRENTE'
      FieldLength = 15
      DisplayWidth = 15
      Position = 20
    end
    object pplconsultappField22: TppField
      FieldAlias = 'NOME_BANCO'
      FieldName = 'NOME_BANCO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 21
    end
    object pplconsultappField23: TppField
      FieldAlias = 'NUMBANCO'
      FieldName = 'NUMBANCO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 22
    end
    object pplconsultappField24: TppField
      FieldAlias = 'NUMAGENCIA'
      FieldName = 'NUMAGENCIA'
      FieldLength = 15
      DisplayWidth = 15
      Position = 23
    end
    object pplconsultappField25: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDLANCIMOVEL'
      FieldName = 'IDLANCIMOVEL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 24
    end
    object pplconsultappField26: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDIMOVEL'
      FieldName = 'IDIMOVEL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 25
    end
    object pplconsultappField27: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCONTRATOIMOVEL'
      FieldName = 'IDCONTRATOIMOVEL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 26
    end
    object pplconsultappField28: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDTIPOCUSTORECIMO'
      FieldName = 'IDTIPOCUSTORECIMO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 27
    end
    object pplconsultappField29: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 28
    end
    object pplconsultappField30: TppField
      Alignment = taRightJustify
      FieldAlias = 'PLNCODIGO'
      FieldName = 'PLNCODIGO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 29
    end
    object pplconsultappField31: TppField
      Alignment = taRightJustify
      FieldAlias = 'CODDOCUMENTO'
      FieldName = 'CODDOCUMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 30
    end
    object pplconsultappField32: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRLANCPAGAR'
      FieldName = 'VLRLANCPAGAR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 31
    end
    object pplconsultappField33: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRLANCOMPAGAR'
      FieldName = 'VLRLANCOMPAGAR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 32
    end
    object pplconsultappField34: TppField
      Alignment = taRightJustify
      FieldAlias = 'MOEDAPAGAR'
      FieldName = 'MOEDAPAGAR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 33
    end
    object pplconsultappField35: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRLANCRECEB'
      FieldName = 'VLRLANCRECEB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 34
    end
    object pplconsultappField36: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRLANCOMRECEB'
      FieldName = 'VLRLANCOMRECEB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 35
    end
    object pplconsultappField37: TppField
      Alignment = taRightJustify
      FieldAlias = 'MOEDARECEB'
      FieldName = 'MOEDARECEB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 36
    end
    object pplconsultappField38: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRMULTA'
      FieldName = 'VLRMULTA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 37
    end
    object pplconsultappField39: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRJUROS'
      FieldName = 'VLRJUROS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 38
    end
    object pplconsultappField40: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRCORRECAOMON'
      FieldName = 'VLRCORRECAOMON'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 39
    end
    object pplconsultappField41: TppField
      FieldAlias = 'FLGTIPOLANCAMENTO'
      FieldName = 'FLGTIPOLANCAMENTO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 40
    end
    object pplconsultappField42: TppField
      FieldAlias = 'RECPAG'
      FieldName = 'RECPAG'
      FieldLength = 1
      DisplayWidth = 1
      Position = 41
    end
    object pplconsultappField43: TppField
      Alignment = taRightJustify
      FieldAlias = 'MESREFERENCIA'
      FieldName = 'MESREFERENCIA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 42
    end
    object pplconsultappField44: TppField
      Alignment = taRightJustify
      FieldAlias = 'ANOREFERENCIA'
      FieldName = 'ANOREFERENCIA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 43
    end
    object pplconsultappField45: TppField
      Alignment = taRightJustify
      FieldAlias = 'MESCOMPETENCIA'
      FieldName = 'MESCOMPETENCIA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 44
    end
    object pplconsultappField46: TppField
      Alignment = taRightJustify
      FieldAlias = 'ANOCOMPETENCIA'
      FieldName = 'ANOCOMPETENCIA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 45
    end
    object pplconsultappField47: TppField
      FieldAlias = 'DATALANCAMENTO'
      FieldName = 'DATALANCAMENTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 46
    end
    object pplconsultappField48: TppField
      FieldAlias = 'DATAVENCIMENTO'
      FieldName = 'DATAVENCIMENTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 47
    end
    object pplconsultappField49: TppField
      FieldAlias = 'DATACORRECAO'
      FieldName = 'DATACORRECAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 48
    end
    object pplconsultappField50: TppField
      Alignment = taRightJustify
      FieldAlias = 'FLGMULTACALCULADA'
      FieldName = 'FLGMULTACALCULADA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 49
    end
    object pplconsultappField51: TppField
      FieldAlias = 'FLGAGRUPAR'
      FieldName = 'FLGAGRUPAR'
      FieldLength = 1
      DisplayWidth = 1
      Position = 50
    end
    object pplconsultappField52: TppField
      Alignment = taRightJustify
      FieldAlias = 'FLGAGRUPADO'
      FieldName = 'FLGAGRUPADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 51
    end
    object pplconsultappField53: TppField
      Alignment = taRightJustify
      FieldAlias = 'CODTIPDOC'
      FieldName = 'CODTIPDOC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 52
    end
    object pplconsultappField54: TppField
      FieldAlias = 'DESCCUSTORECIMO'
      FieldName = 'DESCCUSTORECIMO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 53
    end
    object pplconsultappField55: TppField
      FieldAlias = 'RECCUSTO'
      FieldName = 'RECCUSTO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 54
    end
    object pplconsultappField56: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMLANCTO'
      FieldName = 'NUMLANCTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 55
    end
    object pplconsultappField57: TppField
      FieldAlias = 'OPERACAO'
      FieldName = 'OPERACAO'
      FieldLength = 2
      DisplayWidth = 2
      Position = 56
    end
    object pplconsultappField58: TppField
      FieldAlias = 'DATALANCTO'
      FieldName = 'DATALANCTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 57
    end
    object pplconsultappField59: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 35
      DisplayWidth = 35
      Position = 58
    end
    object pplconsultappField60: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 59
    end
    object pplconsultappField61: TppField
      FieldAlias = 'NOME_AGENCIA'
      FieldName = 'NOME_AGENCIA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 60
    end
    object pplconsultappField62: TppField
      FieldAlias = 'DATA'
      FieldName = 'DATA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 61
    end
    object pplconsultappField63: TppField
      FieldAlias = 'NOME_MESTRE'
      FieldName = 'NOME_MESTRE'
      FieldLength = 60
      DisplayWidth = 60
      Position = 62
    end
    object pplconsultappField64: TppField
      FieldAlias = 'NOME_EXTENSO'
      FieldName = 'NOME_EXTENSO'
      FieldLength = 123
      DisplayWidth = 123
      Position = 63
    end
    object pplconsultappField65: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPAIS'
      FieldName = 'IDPAIS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 64
    end
    object pplconsultappField66: TppField
      FieldAlias = 'CODESTADO'
      FieldName = 'CODESTADO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 65
    end
    object pplconsultappField67: TppField
      FieldAlias = 'desc'
      FieldName = 'desc'
      FieldLength = 1000
      DisplayWidth = 1000
      Position = 66
    end
    object pplconsultappField68: TppField
      FieldAlias = 'ValorExtenso'
      FieldName = 'ValorExtenso'
      FieldLength = 200
      DisplayWidth = 200
      Position = 67
    end
    object pplconsultappField69: TppField
      FieldAlias = 'mes'
      FieldName = 'mes'
      FieldLength = 200
      DisplayWidth = 200
      Position = 68
    end
    object pplconsultappField70: TppField
      FieldAlias = 'CONDATAREAJUSTE'
      FieldName = 'CONDATAREAJUSTE'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 69
    end
    object pplconsultappField71: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR_ATUAL_CONTRATO'
      FieldName = 'VLR_ATUAL_CONTRATO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 70
    end
    object pplconsultappField72: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR_ANT_CONTRATO'
      FieldName = 'VLR_ANT_CONTRATO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 71
    end
    object pplconsultappField73: TppField
      FieldAlias = 'AVISO_REAJUSTE'
      FieldName = 'AVISO_REAJUSTE'
      FieldLength = 50
      DisplayWidth = 50
      Position = 72
    end
    object pplconsultappField74: TppField
      FieldAlias = 'ENDERECO'
      FieldName = 'ENDERECO'
      FieldLength = 92
      DisplayWidth = 92
      Position = 73
    end
    object pplconsultappField75: TppField
      Alignment = taRightJustify
      FieldAlias = 'CONINDICEREAJUSTE'
      FieldName = 'CONINDICEREAJUSTE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 74
    end
    object pplconsultappField76: TppField
      Alignment = taRightJustify
      FieldAlias = 'CONPERREAJUSTE'
      FieldName = 'CONPERREAJUSTE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 75
    end
    object pplconsultappField77: TppField
      FieldAlias = 'DATAPROGRAMADA'
      FieldName = 'DATAPROGRAMADA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 76
    end
    object pplconsultappField78: TppField
      FieldAlias = 'CEP'
      FieldName = 'CEP'
      FieldLength = 8
      DisplayWidth = 8
      Position = 77
    end
    object pplconsultappField79: TppField
      Alignment = taRightJustify
      FieldAlias = 'AREA_LOCADA'
      FieldName = 'AREA_LOCADA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 78
    end
    object pplconsultappField80: TppField
      FieldAlias = 'DatasAnteriores'
      FieldName = 'DatasAnteriores'
      FieldLength = 20
      DisplayWidth = 20
      Position = 79
    end
    object pplconsultappField81: TppField
      FieldAlias = 'ImovelLocado'
      FieldName = 'ImovelLocado'
      FieldLength = 1000
      DisplayWidth = 1000
      Position = 80
    end
  end
  object rptImprime: TppReport
    AutoStop = False
    DataPipeline = pplconsulta
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Aviso de Cobrança'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.Format = ftASCII
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 216
    Top = 160
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'pplconsulta'
    object RpImprimeHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object RpImprimeDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object RpImprimeFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
  end
  object ds: TwwDataSource
    DataSet = qryTemplate
    Left = 453
    Top = 230
  end
  object qryTemplate: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDCARTACOBRANCA,'
      '   MODELOCARTA,'
      '   IDREPORTS,'
      '   ORIGEMCM,'
      '   FLGTIPOCARTA'
      'FROM'
      '   CARTACOBRANCA'
      'WHERE'
      
        '      ((:PFLGTIPOCARTA IS NULL) OR (FLGTIPOCARTA = :PFLGTIPOCART' +
        'A))'
      
        '  AND ((:PIDCARTACOBRANCA IS NULL) OR (IDCARTACOBRANCA = :PIDCAR' +
        'TACOBRANCA))'
      ' ')
    ValidateWithMask = True
    Left = 452
    Top = 218
    ParamData = <
      item
        DataType = ftString
        Name = 'PFLGTIPOCARTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PFLGTIPOCARTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCARTACOBRANCA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCARTACOBRANCA'
        ParamType = ptUnknown
      end>
    object qryTemplateIDCARTACOBRANCA: TFloatField
      FieldName = 'IDCARTACOBRANCA'
      Origin = 'CARTACOBRANCA.IDCARTACOBRANCA'
    end
    object qryTemplateMODELOCARTA: TStringField
      FieldName = 'MODELOCARTA'
      Origin = 'CARTACOBRANCA.MODELOCARTA'
      Size = 60
    end
    object qryTemplateIDREPORTS: TFloatField
      FieldName = 'IDREPORTS'
      Origin = 'CARTACOBRANCA.IDREPORTS'
    end
    object qryTemplateORIGEMCM: TFloatField
      FieldName = 'ORIGEMCM'
      Origin = 'CARTACOBRANCA.ORIGEMCM'
    end
    object qryTemplateFLGTIPOCARTA: TStringField
      FieldName = 'FLGTIPOCARTA'
      Origin = 'CARTACOBRANCA.FLGTIPOCARTA'
      Size = 1
    end
  end
  object qryReports: TwwQuery
    DatabaseName = 'BaseDados'
    RequestLive = True
    SQL.Strings = (
      'SELECT'
      '   REPORTS.NAME,'
      '   REPORTS.IDREPORTS,'
      '   REPORTS.ORIGEMCM,'
      '   REPORTS.TEMPLATE'
      'FROM'
      '   REPORTS'
      'WHERE'
      '   (REPORTS.IDREPORTS = :PIDREPORTS) AND'
      '   (REPORTS.ORIGEMCM  = :PORIGEMCM)'
      ' ')
    UpdateMode = upWhereKeyOnly
    ValidateWithMask = True
    Left = 505
    Top = 157
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDREPORTS'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PORIGEMCM'
        ParamType = ptUnknown
      end>
    object qryReportsNAME: TStringField
      FieldName = 'NAME'
      Origin = 'REPORTS.NAME'
      Size = 100
    end
    object qryReportsIDREPORTS: TFloatField
      FieldName = 'IDREPORTS'
      Origin = 'REPORTS.IDREPORTS'
    end
    object qryReportsORIGEMCM: TFloatField
      FieldName = 'ORIGEMCM'
      Origin = 'REPORTS.ORIGEMCM'
    end
    object qryReportsTEMPLATE: TBlobField
      FieldName = 'TEMPLATE'
      Origin = 'REPORTS.TEMPLATE'
      BlobType = ftBlob
      Size = 1
    end
  end
  object qryCobranca: TwwQuery
    OnCalcFields = qryCobrancaCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   I.IMONOME, I.IDIMOVELMESTRE, IM.IMONOME AS NOME_MESTRE,'
      '   CI.CONNUMERO, CI.CONNOME, CI.CODPORTFORMA,'
      '   CI.CONDIASTOLERANCIA, CI.FLGTIPODIATOLERA,'
      '   CI.IDPAIS, CI.CODESTADO, CI.IDCIDADES,'
      '   CI.CONDATAREAJUSTE,'
      '   CI.CONINDICEREAJUSTE, CI.CONPERREAJUSTE,'
      '   CI.CONVLRAJUSTADO AS VLR_ATUAL_CONTRATO,'
      '   CI.CONVLRTOTAL AS VLR_ANT_CONTRATO,'
      ''
      
        '   DECODE(CX.CIMDESCRICAO, NULL, I.IMONOME, CX.CIMDESCRICAO) AS ' +
        'NOME_IMOVEL,'
      ''
      
        '   IM.IMONOME||'#39' - '#39'||DECODE(CX.CIMDESCRICAO, NULL, I.IMONOME, C' +
        'X.CIMDESCRICAO) AS NOME_EXTENSO,'
      ''
      '   P.RAZAOSOCIAL,'
      '   CP.NOME AS NOME_CONTATO,'
      
        '   E.LOGRADOURO||'#39', '#39'||E.NUMERO||'#39', '#39'||E.COMPLEMENTO AS ENDERECO' +
        ','
      '   '
      '   -- Marchetti - Pendencia 19889'
      ''
      '   E.CEP,'
      '   I.IMOAREA AS AREA_LOCADA,'
      ''
      '   -- Fim Marchetti - Pendencia 19889'
      ''
      '   PF.CODPORTADOR,'
      '   PC.IDBANCO, PC.IDAGENCIA, PC.NOCONTACORR AS CONTA_CORRENTE,'
      ''
      '   PB.NOME AS NOME_BANCO, PA.NOME AS NOME_AGENCIA,'
      '   B.NUMBANCO, A.NUMAGENCIA,'
      ''
      '   LI.IDLANCIMOVEL,'
      '   LI.IDIMOVEL, LI.IDCONTRATOIMOVEL, LI.IDTIPOCUSTORECIMO,'
      '   LI.IDPESSOA, LI.PLNCODIGO, LI.CODDOCUMENTO,'
      '   LI.VLRLANCPAGAR, LI.VLRLANCOMPAGAR, LI.MOEDAPAGAR,'
      '   LI.VLRLANCRECEB, LI.VLRLANCOMRECEB, LI.MOEDARECEB,'
      '   LI.VLRMULTA, LI.VLRJUROS, LI.VLRCORRECAOMON,'
      '   LI.FLGTIPOLANCAMENTO, LI.RECPAG,'
      '   LI.MESREFERENCIA, LI.ANOREFERENCIA,'
      '   LI.MESCOMPETENCIA, LI.ANOCOMPETENCIA,'
      '   LI.DATALANCAMENTO, LI.DATAVENCIMENTO,'
      '   LI.DATACORRECAO, D.DATAPROGRAMADA,'
      '   LI.FLGMULTACALCULADA,'
      '   LI.FLGAGRUPAR, LI.FLGAGRUPADO,'
      ''
      '   TR.CODTIPDOC, TR.DESCCUSTORECIMO, TR.RECCUSTO,'
      '   LD.NUMLANCTO, LD.OPERACAO, LD.DATALANCTO,'
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'2'#39', LI.DATAVENCIMENTO, LD.DATALAN' +
        'CTO) AS DATA,'
      '   TA.DESCRICAO,'
      '   DECODE(LD.DEBCRE, '#39'D'#39', LD.VALOR, LD.VALOR * -1) AS VALOR'
      ''
      'FROM'
      '   PESSOA P, PESSOA PB, PESSOA PA,'
      '   LANCAMENTOSIMOVEL LI, TIPOCUSTORECIMOV  TR,'
      '   CONTRATOXIMOVEL CX, CONTRATOIMOVEL CI,'
      '   PORTADORFORMA PF, PORTADORCONTA PC,'
      '   IMOVEL I, IMOVEL IM, ENDPESS E,'
      '   LANCTODOCUM LD, TIPOALTERADOR TA, DOCUMENTO D,'
      '   BANCO B, AGENCIABANCARIA A,'
      ''
      '   ('
      '   SELECT'
      '      CXP.IDENDERECO, CXP.IDCONTATO, CXP.NOME'
      '   FROM'
      '      CONTATOPESS CXP,'
      '      ('
      '      SELECT'
      '         MIN(IDCONTATO) AS IDCONTATO, IDENDERECO'
      '      FROM'
      '         CONTATOPESS'
      '      GROUP BY'
      '         IDENDERECO'
      '      ) CON'
      '   WHERE'
      '      ( CON.IDCONTATO = CXP.IDCONTATO )'
      '   ) CP'
      ''
      'WHERE'
      '   ( LI.RECPAG = '#39'R'#39' )'
      ''
      '   AND ( LD.CODALTERADOR = TA.CODALTERADOR(+) )'
      '   AND ( LI.CODDOCUMENTO = LD.CODDOCUMENTO)'
      '   AND ( LI.CODDOCUMENTO = D.CODDOCUMENTO)'
      '   AND ( LI.IDIMOVEL = I.IDIMOVEL )'
      '   AND ( I.IDIMOVELMESTRE = IM.IDIMOVEL )'
      '   AND ( LI.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL )'
      '   AND ( LI.IDIMOVEL = CX.IDIMOVEL )'
      '   AND ( LI.IDCONTRATOIMOVEL = CX.IDCONTRATOIMOVEL )'
      '   AND ( CI.IDLOCATARIO = P.IDPESSOA )'
      '   AND ( P.IDENDCORRESP = E.IDENDERECO(+) )'
      '   AND ( P.IDPESSOA = E.IDPESSOA(+) )'
      '   AND ( TR.IDTIPOCUSTORECIMO = LI.IDTIPOCUSTORECIMO )'
      ''
      '   AND ( P.IDENDCOBRANCA = CP.IDENDERECO(+) )'
      '   AND ( CI.CODPORTFORMA = PF.CODPORTFORMA )'
      '   AND ( PF.CODPORTADOR = PC.CODPORTADOR )'
      '   AND ( PC.IDAGENCIA = PA.IDPESSOA )'
      '   AND ( PC.IDAGENCIA = A.IDPESSOA )'
      '   AND ( A.IDBANCO = PB.IDPESSOA )'
      '   AND ( A.IDBANCO = B.IDPESSOA )'
      ''
      'ORDER BY'
      '   LD.DATALANCTO, LI.IDIMOVEL, LI.CODDOCUMENTO'
      ''
      ''
      ''
      ''
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 288
    Top = 157
    object qryCobrancaDESCALC: TStringField
      FieldKind = fkCalculated
      FieldName = 'DESCALC'
      Size = 25
      Calculated = True
    end
    object qryCobrancaDataPagamento: TDateField
      FieldKind = fkCalculated
      FieldName = 'DataPagamento'
      Calculated = True
    end
    object qryCobrancadataatual: TStringField
      FieldKind = fkCalculated
      FieldName = 'dataatual'
      Size = 60
      Calculated = True
    end
    object qryCobrancadatajuros: TStringField
      FieldKind = fkCalculated
      FieldName = 'datajuros'
      Size = 10
      Calculated = True
    end
    object qryCobrancadatames: TStringField
      FieldKind = fkCalculated
      FieldName = 'datames'
      Size = 15
      Calculated = True
    end
    object qryCobrancaContratoExtenso: TStringField
      FieldKind = fkCalculated
      FieldName = 'ContratoExtenso'
      Size = 120
      Calculated = True
    end
    object qryCobrancaIMONOME: TStringField
      FieldName = 'IMONOME'
      Size = 60
    end
    object qryCobrancaIDIMOVELMESTRE: TFloatField
      FieldName = 'IDIMOVELMESTRE'
    end
    object qryCobrancaCONNUMERO: TStringField
      FieldName = 'CONNUMERO'
    end
    object qryCobrancaCONNOME: TStringField
      FieldName = 'CONNOME'
      Size = 60
    end
    object e: TFloatField
      FieldName = 'CODPORTFORMA'
    end
    object qryCobrancaCONDIASTOLERANCIA: TFloatField
      FieldName = 'CONDIASTOLERANCIA'
    end
    object qryCobrancaFLGTIPODIATOLERA: TStringField
      FieldName = 'FLGTIPODIATOLERA'
      Size = 1
    end
    object qryCobrancaIDCIDADES: TFloatField
      FieldName = 'IDCIDADES'
    end
    object qryCobrancaNOME_IMOVEL: TStringField
      FieldName = 'NOME_IMOVEL'
      Size = 60
    end
    object qryCobrancaRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object qryCobrancaNOME_CONTATO: TStringField
      FieldName = 'NOME_CONTATO'
      Size = 50
    end
    object qryCobrancaCODPORTADOR: TFloatField
      FieldName = 'CODPORTADOR'
    end
    object qryCobrancaIDBANCO: TFloatField
      FieldName = 'IDBANCO'
    end
    object qryCobrancaIDAGENCIA: TFloatField
      FieldName = 'IDAGENCIA'
    end
    object qryCobrancaCONTA_CORRENTE: TStringField
      FieldName = 'CONTA_CORRENTE'
      Size = 15
    end
    object qryCobrancaNOME_BANCO: TStringField
      FieldName = 'NOME_BANCO'
      Size = 60
    end
    object qryCobrancaNUMBANCO: TStringField
      FieldName = 'NUMBANCO'
      Size = 10
    end
    object qryCobrancaNUMAGENCIA: TStringField
      FieldName = 'NUMAGENCIA'
      Size = 15
    end
    object qryCobrancaIDLANCIMOVEL: TFloatField
      FieldName = 'IDLANCIMOVEL'
    end
    object qryCobrancaIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
    end
    object qryCobrancaIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
    end
    object qryCobrancaIDTIPOCUSTORECIMO: TFloatField
      FieldName = 'IDTIPOCUSTORECIMO'
    end
    object qryCobrancaIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryCobrancaPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
    end
    object qryCobrancaCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object qryCobrancaVLRLANCPAGAR: TFloatField
      FieldName = 'VLRLANCPAGAR'
    end
    object qryCobrancaVLRLANCOMPAGAR: TFloatField
      FieldName = 'VLRLANCOMPAGAR'
    end
    object qryCobrancaMOEDAPAGAR: TFloatField
      FieldName = 'MOEDAPAGAR'
    end
    object qryCobrancaVLRLANCRECEB: TFloatField
      FieldName = 'VLRLANCRECEB'
    end
    object qryCobrancaVLRLANCOMRECEB: TFloatField
      FieldName = 'VLRLANCOMRECEB'
    end
    object qryCobrancaMOEDARECEB: TFloatField
      FieldName = 'MOEDARECEB'
    end
    object qryCobrancaVLRMULTA: TFloatField
      FieldName = 'VLRMULTA'
    end
    object qryCobrancaVLRJUROS: TFloatField
      FieldName = 'VLRJUROS'
    end
    object qryCobrancaVLRCORRECAOMON: TFloatField
      FieldName = 'VLRCORRECAOMON'
    end
    object qryCobrancaFLGTIPOLANCAMENTO: TStringField
      FieldName = 'FLGTIPOLANCAMENTO'
      Size = 1
    end
    object qryCobrancaRECPAG: TStringField
      FieldName = 'RECPAG'
      Size = 1
    end
    object qryCobrancaMESREFERENCIA: TFloatField
      FieldName = 'MESREFERENCIA'
    end
    object qryCobrancaANOREFERENCIA: TFloatField
      FieldName = 'ANOREFERENCIA'
    end
    object qryCobrancaMESCOMPETENCIA: TFloatField
      FieldName = 'MESCOMPETENCIA'
    end
    object qryCobrancaANOCOMPETENCIA: TFloatField
      FieldName = 'ANOCOMPETENCIA'
    end
    object qryCobrancaDATALANCAMENTO: TDateTimeField
      FieldName = 'DATALANCAMENTO'
    end
    object qryCobrancaDATAVENCIMENTO: TDateTimeField
      FieldName = 'DATAVENCIMENTO'
    end
    object qryCobrancaDATACORRECAO: TDateTimeField
      FieldName = 'DATACORRECAO'
    end
    object qryCobrancaFLGMULTACALCULADA: TFloatField
      FieldName = 'FLGMULTACALCULADA'
    end
    object qryCobrancaFLGAGRUPAR: TStringField
      FieldName = 'FLGAGRUPAR'
      Size = 1
    end
    object qryCobrancaFLGAGRUPADO: TFloatField
      FieldName = 'FLGAGRUPADO'
    end
    object qryCobrancaCODTIPDOC: TFloatField
      FieldName = 'CODTIPDOC'
    end
    object qryCobrancaDESCCUSTORECIMO: TStringField
      FieldName = 'DESCCUSTORECIMO'
      Size = 60
    end
    object qryCobrancaRECCUSTO: TStringField
      FieldName = 'RECCUSTO'
      Size = 1
    end
    object qryCobrancaNUMLANCTO: TFloatField
      FieldName = 'NUMLANCTO'
    end
    object qryCobrancaOPERACAO: TStringField
      FieldName = 'OPERACAO'
      Size = 2
    end
    object qryCobrancaDATALANCTO: TDateTimeField
      FieldName = 'DATALANCTO'
    end
    object qryCobrancaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 35
    end
    object qryCobrancaVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object qryCobrancaNOME_AGENCIA: TStringField
      FieldName = 'NOME_AGENCIA'
      Size = 60
    end
    object qryCobrancaDATA: TDateTimeField
      FieldName = 'DATA'
    end
    object qryCobrancaNOME_MESTRE: TStringField
      FieldName = 'NOME_MESTRE'
      Size = 60
    end
    object qryCobrancaNOME_EXTENSO: TStringField
      FieldName = 'NOME_EXTENSO'
      Size = 123
    end
    object qryCobrancaIDPAIS: TFloatField
      FieldName = 'IDPAIS'
    end
    object qryCobrancaCODESTADO: TStringField
      FieldName = 'CODESTADO'
      Size = 3
    end
    object qryCobrancadesc: TStringField
      DisplayWidth = 1000
      FieldKind = fkCalculated
      FieldName = 'desc'
      Size = 1000
      Calculated = True
    end
    object qryCobrancaValorExtenso: TStringField
      FieldKind = fkCalculated
      FieldName = 'ValorExtenso'
      Size = 200
      Calculated = True
    end
    object qryCobrancames: TStringField
      FieldKind = fkCalculated
      FieldName = 'mes'
      Size = 200
      Calculated = True
    end
    object qryCobrancaCONDATAREAJUSTE: TDateTimeField
      FieldName = 'CONDATAREAJUSTE'
    end
    object qryCobrancaVLR_ATUAL_CONTRATO: TFloatField
      FieldName = 'VLR_ATUAL_CONTRATO'
    end
    object qryCobrancaVLR_ANT_CONTRATO: TFloatField
      FieldName = 'VLR_ANT_CONTRATO'
    end
    object qryCobrancaAVISO_REAJUSTE: TStringField
      FieldKind = fkCalculated
      FieldName = 'AVISO_REAJUSTE'
      Size = 50
      Calculated = True
    end
    object qryCobrancaENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 92
    end
    object qryCobrancaCONINDICEREAJUSTE: TFloatField
      FieldName = 'CONINDICEREAJUSTE'
    end
    object qryCobrancaCONPERREAJUSTE: TFloatField
      FieldName = 'CONPERREAJUSTE'
    end
    object qryCobrancaDATAPROGRAMADA: TDateTimeField
      FieldName = 'DATAPROGRAMADA'
    end
    object qryCobrancaCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object qryCobrancaAREA_LOCADA: TFloatField
      FieldName = 'AREA_LOCADA'
    end
    object qryCobrancaDatasAnteriores: TStringField
      FieldKind = fkCalculated
      FieldName = 'DatasAnteriores'
      Calculated = True
    end
    object qryCobrancaImovelLocado: TStringField
      FieldKind = fkCalculated
      FieldName = 'ImovelLocado'
      Calculated = True
    end
  end
  object qryNomesImovel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   I.IDIMOVELMESTRE, I.IDIMOVEL, IM.IMONOME NOME_MESTRE,'
      '   I.IMONOME NOME_IMOVEL, CX.CIMVLRAJUSTADO'
      ''
      'FROM'
      '   CONTRATOIMOVEL C, CONTRATOXIMOVEL CX,'
      '   IMOVEL I, IMOVEL IM'
      ''
      'WHERE ( C.IDCONTRATOIMOVEL =:CONTRATO )'
      ''
      '  AND ( ( C.IDCONTRATOIMOVEL = CX.IDCONTRATOIMOVEL ) AND'
      '        ( CX.IDIMOVEL = I.IDIMOVEL ) AND'
      '        ( I.IDIMOVELMESTRE = IM.IDIMOVEL ) AND'
      '        ( CX.CIMVLRAJUSTADO >= 0 ) )'
      ''
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 368
    Top = 258
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CONTRATO'
        ParamType = ptUnknown
      end>
    object qryNomesImovelIDIMOVELMESTRE: TFloatField
      FieldName = 'IDIMOVELMESTRE'
      Origin = 'IMOVEL.IDIMOVELMESTRE'
    end
    object qryNomesImovelIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
      Origin = 'IMOVEL.IDIMOVEL'
    end
    object qryNomesImovelNOME_MESTRE: TStringField
      FieldName = 'NOME_MESTRE'
      Origin = 'IMOVEL.IMONOME'
      Size = 60
    end
    object qryNomesImovelNOME_IMOVEL: TStringField
      FieldName = 'NOME_IMOVEL'
      Origin = 'IMOVEL.IMONOME'
      Size = 60
    end
    object qryNomesImovelCIMVLRAJUSTADO: TFloatField
      FieldName = 'CIMVLRAJUSTADO'
      Origin = 'CONTRATOXIMOVEL.CIMVLRAJUSTADO'
    end
  end
  object dlgWord: TOpenDialog
    Filter = 'Documentos Word|*.DOC'
    InitialDir = 'C:\CM'
    Left = 461
    Top = 354
  end
  object qryConsolidado: TwwQuery
    OnCalcFields = qryConsolidadoCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   TR.DESCCUSTORECIMO, TR.CODTIPDOC, TR.RECCUSTO,'
      '   CI.CONNUMERO, CI.CONNOME, CI.CODPORTFORMA,'
      '   CI.CONDIASTOLERANCIA, CI.FLGTIPODIATOLERA,'
      '   CI.IDPAIS, CI.CODESTADO, CI.IDCIDADES,'
      '   CI.CONDATAREAJUSTE,'
      
        '   CI.CONINDICEREAJUSTE, CI.CONPERREAJUSTE, I.AREA AS AREA_LOCAD' +
        'A,'
      '   CI.CONVLRAJUSTADO AS VLR_ATUAL_CONTRATO,'
      '   CI.CONVLRTOTAL AS VLR_ANT_CONTRATO,'
      ''
      '   P.RAZAOSOCIAL, CP.NOME AS NOME_CONTATO,'
      
        '  substr(E.LOGRADOURO||'#39', '#39'||E.NUMERO||'#39', '#39'||E.COMPLEMENTO, 0, 2' +
        '55) AS ENDERECO,'
      '   CD.NOME || '#39' - '#39' || UF.CODESTADO AS NOME_CIDADE, E.CEP,'
      ''
      '   PF.CODPORTADOR,'
      '   PC.IDBANCO, PC.IDAGENCIA, PC.NOCONTACORR AS CONTA_CORRENTE,'
      ''
      '   PB.NOME AS NOME_BANCO, PA.NOME AS NOME_AGENCIA,'
      '   B.NUMBANCO, A.NUMAGENCIA,'
      ''
      '   LI.IDCONTRATOIMOVEL, LI.IDTIPOCUSTORECIMO,'
      '   LI.IDPESSOA,'
      '   LI.FLGTIPOLANCAMENTO, LI.RECPAG,'
      '   LI.MESREFERENCIA, LI.ANOREFERENCIA,'
      '   LI.MESCOMPETENCIA, LI.ANOCOMPETENCIA,'
      '   LI.DATAVENCIMENTO, LI.CODDOCUMENTO,'
      '   LI.DATACORRECAO, LI.FLGMULTACALCULADA,'
      '   LI.FLGAGRUPAR, LI.FLGAGRUPADO,'
      ''
      '   LD.OPERACAO, LD.DATALANCTO, D.DATAPROGRAMADA,'
      ''
      '   DECODE(RTRIM(LD.OPERACAO), '#39'1'#39', LI.DATAVENCIMENTO,'
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'2'#39', LI.DATAVENCIMENTO, LD.DATALAN' +
        'CTO)) AS DATA,'
      ''
      '   TA.DESCRICAO,'
      '   SUM(DECODE(LD.DEBCRE, '#39'D'#39', LD.VALOR, LD.VALOR * -1)) AS VALOR'
      ''
      'FROM'
      '   PESSOA P, PESSOA PB, PESSOA PA,'
      '   LANCAMENTOSIMOVEL LI, TIPOCUSTORECIMOV  TR,'
      '   CONTRATOIMOVEL CI,'
      '   PORTADORFORMA PF, PORTADORCONTA PC,'
      '   DOCUMENTO D, ENDPESS E,'
      '   LANCTODOCUM LD, TIPOALTERADOR TA,'
      '   BANCO B, AGENCIABANCARIA A,'
      '   CIDADES CD, ESTADO UF,'
      '   ('
      '     SELECT'
      '        CXP.IDENDERECO, CXP.IDCONTATO, CXP.NOME'
      '     FROM'
      '        CONTATOPESS CXP,'
      '     ('
      '       SELECT'
      '         MIN(IDCONTATO) AS IDCONTATO, IDENDERECO'
      '       FROM'
      '         CONTATOPESS'
      '       GROUP BY'
      '         IDENDERECO'
      '     ) CON'
      '     WHERE'
      '     ( CON.IDCONTATO = CXP.IDCONTATO )'
      '     ) CP,'
      '    ('
      '     SELECT CXI.IDCONTRATOIMOVEL,'
      '            ROUND( SUM( DECODE(CXI.FLGRATEIO, 1,'
      
        '                               I.IMOAREA * (NVL(CXI.CIMPERCENTRA' +
        'TEIO,0)/100),'
      '                               I.IMOAREA) ), 2) AS AREA'
      '       FROM CONTRATOXIMOVEL CXI, IMOVEL I'
      '      WHERE CXI.IDIMOVEL = I.IDIMOVEL'
      '      GROUP BY CXI.IDCONTRATOIMOVEL'
      '     ) I'
      ''
      'WHERE'
      '   ( LI.RECPAG = '#39'R'#39' )'
      ''
      
        '   AND ((:PMESCOMPETENCIA IS NULL) OR (LI.MESCOMPETENCIA = :PMES' +
        'COMPETENCIA))'
      
        '   AND ((:PANOCOMPETENCIA IS NULL) OR (LI.ANOCOMPETENCIA = :PANO' +
        'COMPETENCIA))'
      
        '   AND ((:PIDCONTRATOIMOVEL IS NULL) OR (LI.IDCONTRATOIMOVEL = :' +
        'PIDCONTRATOIMOVEL))'
      
        '   AND ((:PIDLOCATARIO IS NULL) OR (CI.IDLOCATARIO = :PIDLOCATAR' +
        'IO))'
      
        '   AND ((:DATAINI IS NULL) OR (LI.DATAVENCIMENTO BETWEEN :DATAIN' +
        'I AND :DATAFIM))'
      ''
      '   AND'
      
        '   (((:STATUS = '#39'P'#39' AND RTRIM(D.STATUS) <> '#39'2'#39') OR (D.STATUS IS ' +
        'NULL))'
      '    OR (:STATUS IS NULL))'
      ''
      '   AND ( LD.CODALTERADOR = TA.CODALTERADOR(+) )'
      '   AND ( LI.CODDOCUMENTO = LD.CODDOCUMENTO )'
      '   AND ( LD.CODDOCUMENTO = D.CODDOCUMENTO )'
      '   AND ( LI.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL )'
      '   AND ( CI.IDLOCATARIO = P.IDPESSOA )'
      '   AND ( CI.IDCONTRATOIMOVEL = I.IDCONTRATOIMOVEL(+) )'
      '   AND ( P.IDENDCOBRANCA = E.IDENDERECO(+) )'
      '   AND ( P.IDPESSOA = E.IDPESSOA(+) )'
      '   AND ( E.IDCIDADES = CD.IDCIDADES(+) )'
      '   AND ( CD.IDESTADO = UF.IDESTADO(+) )'
      '   AND ( TR.IDTIPOCUSTORECIMO = LI.IDTIPOCUSTORECIMO )'
      '   AND ( P.IDENDCOBRANCA = CP.IDENDERECO(+) )'
      '   AND ( CI.CODPORTFORMA = PF.CODPORTFORMA )'
      '   AND ( PF.CODPORTADOR = PC.CODPORTADOR )'
      '   AND ( PC.IDAGENCIA = PA.IDPESSOA )'
      '   AND ( PC.IDAGENCIA = A.IDPESSOA )'
      '   AND ( A.IDBANCO = PB.IDPESSOA )'
      '   AND ( A.IDBANCO = B.IDPESSOA )'
      ''
      'GROUP BY'
      '   TR.DESCCUSTORECIMO, TR.CODTIPDOC, TR.RECCUSTO,'
      '   CI.CONNUMERO, CI.CONNOME, CI.CODPORTFORMA,'
      '   CI.CONDIASTOLERANCIA, CI.FLGTIPODIATOLERA,'
      '   CI.IDPAIS, CI.CODESTADO, CI.IDCIDADES,'
      '   CI.CONINDICEREAJUSTE, CI.CONPERREAJUSTE, I.AREA,'
      '   CI.CONDATAREAJUSTE, CI.CONVLRAJUSTADO,CI.CONVLRTOTAL,'
      ''
      '   P.RAZAOSOCIAL,'
      '   CP.NOME,'
      '   E.LOGRADOURO||'#39', '#39'||E.NUMERO||'#39', '#39'||E.COMPLEMENTO,'
      '   CD.NOME || '#39' - '#39' || UF.CODESTADO, E.CEP,'
      ''
      '   PF.CODPORTADOR,'
      '   PC.IDBANCO, PC.IDAGENCIA, PC.NOCONTACORR,'
      ''
      '   PB.NOME, PA.NOME,'
      '   B.NUMBANCO, A.NUMAGENCIA,'
      ''
      '   LI.IDCONTRATOIMOVEL, LI.IDTIPOCUSTORECIMO,'
      '   LI.IDPESSOA,'
      '   LI.FLGTIPOLANCAMENTO, LI.RECPAG,'
      '   LI.MESREFERENCIA, LI.ANOREFERENCIA,'
      '   LI.MESCOMPETENCIA, LI.ANOCOMPETENCIA,'
      '   LI.DATAVENCIMENTO, LI.CODDOCUMENTO,'
      '   LI.DATACORRECAO, LI.FLGMULTACALCULADA,'
      '   LI.FLGAGRUPAR, LI.FLGAGRUPADO,'
      ''
      '   LD.OPERACAO, LD.DATALANCTO, D.DATAPROGRAMADA,'
      ''
      '   DECODE(RTRIM(LD.OPERACAO), '#39'1'#39', LI.DATAVENCIMENTO,'
      
        '      DECODE(RTRIM(LD.OPERACAO), '#39'2'#39', LI.DATAVENCIMENTO, LD.DATA' +
        'LANCTO)),'
      ''
      '   TA.DESCRICAO'
      ''
      'ORDER BY'
      '   LI.ANOCOMPETENCIA, LI.MESCOMPETENCIA,'
      '   DECODE(RTRIM(LD.OPERACAO), '#39'1'#39', LI.DATAVENCIMENTO,'
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'2'#39', LI.DATAVENCIMENTO, LD.DATALAN' +
        'CTO))')
    ValidateWithMask = True
    Left = 359
    Top = 157
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PMESCOMPETENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PMESCOMPETENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PANOCOMPETENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PANOCOMPETENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDLOCATARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDLOCATARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STATUS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'STATUS'
        ParamType = ptUnknown
      end>
    object qryConsolidadoDESCALC: TStringField
      FieldKind = fkCalculated
      FieldName = 'DESCALC'
      Size = 25
      Calculated = True
    end
    object qryConsolidadoDataPagamento: TDateField
      FieldKind = fkCalculated
      FieldName = 'DataPagamento'
      Calculated = True
    end
    object qryConsolidadodataatual: TStringField
      FieldKind = fkCalculated
      FieldName = 'dataatual'
      Size = 60
      Calculated = True
    end
    object qryConsolidadodatajuros: TStringField
      FieldKind = fkCalculated
      FieldName = 'datajuros'
      Size = 10
      Calculated = True
    end
    object qryConsolidadodatames: TStringField
      FieldKind = fkCalculated
      FieldName = 'datames'
      Size = 15
      Calculated = True
    end
    object qryConsolidadoContratoExtenso: TStringField
      FieldKind = fkCalculated
      FieldName = 'ContratoExtenso'
      Size = 120
      Calculated = True
    end
    object qryConsolidadodesc: TStringField
      DisplayWidth = 1000
      FieldKind = fkCalculated
      FieldName = 'desc'
      Size = 1000
      Calculated = True
    end
    object qryConsolidadoValorExtenso: TStringField
      FieldKind = fkCalculated
      FieldName = 'ValorExtenso'
      Size = 200
      Calculated = True
    end
    object qryConsolidadomes: TStringField
      FieldKind = fkCalculated
      FieldName = 'mes'
      Size = 200
      Calculated = True
    end
    object qryConsolidadoDESCCUSTORECIMO: TStringField
      FieldName = 'DESCCUSTORECIMO'
      Size = 60
    end
    object qryConsolidadoCODTIPDOC: TFloatField
      FieldName = 'CODTIPDOC'
    end
    object qryConsolidadoRECCUSTO: TStringField
      FieldName = 'RECCUSTO'
      Size = 1
    end
    object qryConsolidadoCONNUMERO: TStringField
      FieldName = 'CONNUMERO'
    end
    object qryConsolidadoCONNOME: TStringField
      FieldName = 'CONNOME'
      Size = 60
    end
    object qryConsolidadoCODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
    end
    object qryConsolidadoCONDIASTOLERANCIA: TFloatField
      FieldName = 'CONDIASTOLERANCIA'
    end
    object qryConsolidadoFLGTIPODIATOLERA: TStringField
      FieldName = 'FLGTIPODIATOLERA'
      Size = 1
    end
    object qryConsolidadoIDPAIS: TFloatField
      FieldName = 'IDPAIS'
    end
    object qryConsolidadoCODESTADO: TStringField
      FieldName = 'CODESTADO'
      Size = 3
    end
    object qryConsolidadoIDCIDADES: TFloatField
      FieldName = 'IDCIDADES'
    end
    object qryConsolidadoRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object qryConsolidadoNOME_CONTATO: TStringField
      FieldName = 'NOME_CONTATO'
      Size = 50
    end
    object qryConsolidadoCODPORTADOR: TFloatField
      FieldName = 'CODPORTADOR'
    end
    object qryConsolidadoIDBANCO: TFloatField
      FieldName = 'IDBANCO'
    end
    object qryConsolidadoIDAGENCIA: TFloatField
      FieldName = 'IDAGENCIA'
    end
    object qryConsolidadoCONTA_CORRENTE: TStringField
      FieldName = 'CONTA_CORRENTE'
      Size = 15
    end
    object qryConsolidadoNOME_BANCO: TStringField
      FieldName = 'NOME_BANCO'
      Size = 60
    end
    object qryConsolidadoNOME_AGENCIA: TStringField
      FieldName = 'NOME_AGENCIA'
      Size = 60
    end
    object qryConsolidadoNUMBANCO: TStringField
      FieldName = 'NUMBANCO'
      Size = 10
    end
    object qryConsolidadoNUMAGENCIA: TStringField
      FieldName = 'NUMAGENCIA'
      Size = 15
    end
    object qryConsolidadoIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
    end
    object qryConsolidadoIDTIPOCUSTORECIMO: TFloatField
      FieldName = 'IDTIPOCUSTORECIMO'
    end
    object qryConsolidadoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryConsolidadoFLGTIPOLANCAMENTO: TStringField
      FieldName = 'FLGTIPOLANCAMENTO'
      Size = 1
    end
    object qryConsolidadoRECPAG: TStringField
      FieldName = 'RECPAG'
      Size = 1
    end
    object qryConsolidadoMESREFERENCIA: TFloatField
      FieldName = 'MESREFERENCIA'
    end
    object qryConsolidadoANOREFERENCIA: TFloatField
      FieldName = 'ANOREFERENCIA'
    end
    object qryConsolidadoMESCOMPETENCIA: TFloatField
      FieldName = 'MESCOMPETENCIA'
    end
    object qryConsolidadoANOCOMPETENCIA: TFloatField
      FieldName = 'ANOCOMPETENCIA'
    end
    object qryConsolidadoDATAVENCIMENTO: TDateTimeField
      FieldName = 'DATAVENCIMENTO'
    end
    object qryConsolidadoDATACORRECAO: TDateTimeField
      FieldName = 'DATACORRECAO'
    end
    object qryConsolidadoFLGMULTACALCULADA: TFloatField
      FieldName = 'FLGMULTACALCULADA'
    end
    object qryConsolidadoFLGAGRUPAR: TStringField
      FieldName = 'FLGAGRUPAR'
      Size = 1
    end
    object qryConsolidadoFLGAGRUPADO: TFloatField
      FieldName = 'FLGAGRUPADO'
    end
    object qryConsolidadoOPERACAO: TStringField
      FieldName = 'OPERACAO'
      Size = 2
    end
    object qryConsolidadoDATALANCTO: TDateTimeField
      FieldName = 'DATALANCTO'
    end
    object qryConsolidadoDATA: TDateTimeField
      FieldName = 'DATA'
    end
    object qryConsolidadoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 35
    end
    object qryConsolidadoVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object qryConsolidadoCONDATAREAJUSTE: TDateTimeField
      FieldName = 'CONDATAREAJUSTE'
    end
    object qryConsolidadoVLR_ATUAL_CONTRATO: TFloatField
      FieldName = 'VLR_ATUAL_CONTRATO'
    end
    object qryConsolidadoVLR_ANT_CONTRATO: TFloatField
      FieldName = 'VLR_ANT_CONTRATO'
    end
    object qryConsolidadoAVISO_REAJUSTE: TStringField
      FieldKind = fkCalculated
      FieldName = 'AVISO_REAJUSTE'
      Size = 50
      Calculated = True
    end
    object qryConsolidadoENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 92
    end
    object qryConsolidadoCONINDICEREAJUSTE: TFloatField
      FieldName = 'CONINDICEREAJUSTE'
    end
    object qryConsolidadoCONPERREAJUSTE: TFloatField
      FieldName = 'CONPERREAJUSTE'
    end
    object qryConsolidadoCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object qryConsolidadoAREA_LOCADA: TFloatField
      FieldName = 'AREA_LOCADA'
    end
    object qryConsolidadoNOME_CIDADE: TStringField
      FieldName = 'NOME_CIDADE'
      Size = 56
    end
    object qryConsolidadoCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object qryConsolidadoDATAPROGRAMADA: TDateTimeField
      FieldName = 'DATAPROGRAMADA'
    end
    object qryConsolidadoDatasAnteriores: TStringField
      FieldKind = fkCalculated
      FieldName = 'DatasAnteriores'
      Calculated = True
    end
    object qryConsolidadoImovelLocado: TStringField
      FieldKind = fkCalculated
      FieldName = 'ImovelLocado'
      Calculated = True
    end
  end
  object qryDiscriminado: TwwQuery
    OnCalcFields = qryDiscriminadoCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT TR.DESCCUSTORECIMO, CI.CONNUMERO, CI.CONNOME, CI.IDCONTRA' +
        'TOIMOVEL, CI.CODESTADO, CI.CONDATAASSINATURA,'
      
        '       CI.CONDATAINICIO, CI.CONDATAREAJUSTE, CI.CONINDICEREAJUST' +
        'E, CI.CONPERREAJUSTE,'
      
        '       CI.CONVLRAJUSTADO AS VLR_ATUAL_CONTRATO, CI.CONVLRTOTAL A' +
        'S VLR_ANT_CONTRATO, P.RAZAOSOCIAL, CP.NOME AS NOME_CONTATO,'
      
        '       E.LOGRADOURO||'#39', '#39'||E.NUMERO||'#39', '#39'||E.COMPLEMENTO AS ENDE' +
        'RECO, E.CEP, SUM(I.IMOAREA) AS AREA_LOCADA,'
      
        '       PC.NOCONTACORR AS CONTA_CORRENTE, PB.NOME AS NOME_BANCO, ' +
        'PA.NOME AS NOME_AGENCIA, B.NUMBANCO, A.NUMAGENCIA,'
      
        '       LI.MESREFERENCIA, LI.ANOREFERENCIA, LI.MESCOMPETENCIA, LI' +
        '.ANOCOMPETENCIA, LI.DATAVENCIMENTO, LI.CODDOCUMENTO,'
      
        '       D.DATAPROGRAMADA,  LD.VALOR, LD.VALOR_BAIXA, LD.VALOR_MUL' +
        'TA, LD.VALOR_JUROS, LD.VALOR_CORRMON, LD.VALOR_OUTROS'
      
        'FROM PESSOA P, PESSOA PB, PESSOA PA, LANCAMENTOSIMOVEL LI, TIPOC' +
        'USTORECIMOV  TR, CONTRATOIMOVEL CI, PORTADORFORMA PF,'
      
        '     PORTADORCONTA PC, DOCUMENTO D, ENDPESS E, TIPOALTERADOR TA,' +
        ' BANCO B, AGENCIABANCARIA A, IMOVEL I,'
      '   ( SELECT L.CODDOCUMENTO,'
      
        '--            SUM(DECODE(L.CODALTERADOR,NULL,DECODE(L.DEBCRE,'#39'D'#39 +
        ',L.VALOR,L.VALOR*-1),0)) AS VALOR,'
      
        '            SUM(DECODE(TRIM(L.OPERACAO),'#39'2'#39',DECODE(L.DEBCRE,'#39'D'#39',' +
        'L.VALOR,L.VALOR*-1),0)) AS VALOR,'
      
        '            SUM(DECODE(TRIM(L.OPERACAO),'#39'5'#39',DECODE(L.DEBCRE,'#39'C'#39',' +
        'L.VALOR,L.VALOR*-1),0)) AS VALOR_BAIXA,'
      ''
      '            SUM(DECODE(TI.CODALTMULTA,NULL,0,'
      '                       DECODE(L.CODALTERADOR,NULL,0,'
      
        '                              DECODE(L.CODALTERADOR,TI.CODALTMUL' +
        'TA,'
      
        '                                     DECODE(L.DEBCRE,'#39'D'#39',L.VALOR' +
        ',L.VALOR*-1),0)))) AS VALOR_MULTA,'
      ''
      '            SUM(DECODE(TI.CODALTJUROS,NULL,0,'
      '                       DECODE(L.CODALTERADOR,NULL,0,'
      
        '                              DECODE(L.CODALTERADOR,TI.CODALTJUR' +
        'OS,'
      
        '                                     DECODE(L.DEBCRE,'#39'D'#39',L.VALOR' +
        ',L.VALOR*-1),0)))) AS VALOR_JUROS,'
      ''
      '            SUM(DECODE(TI.CODALTCORRMON,NULL,0,'
      '                       DECODE(L.CODALTERADOR,NULL,0,'
      
        '                              DECODE(L.CODALTERADOR,TI.CODALTCOR' +
        'RMON,'
      
        '                                     DECODE(L.DEBCRE,'#39'D'#39',L.VALOR' +
        ',L.VALOR*-1),0)))) AS VALOR_CORRMON,'
      ''
      
        '            SUM(DECODE(L.CODALTERADOR,NULL,0,TI.CODALTCORRMON,0,' +
        'TI.CODALTJUROS,0,TI.CODALTMULTA,0,'
      
        '                       DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,L.VALOR*-1)))' +
        ' AS VALOR_OUTROS'
      '     FROM LANCTODOCUM L, DOCUMENTO D, TIPOIMOVEL TI,'
      '        ( SELECT DISTINCT CODDOCUMENTO, CODTIPIMOVEL'
      '          FROM LANCAMENTOSIMOVEL'
      '          WHERE RECPAG = '#39'R'#39' ) LI'
      '     WHERE RTRIM(L.OPERACAO) IN('#39'2'#39','#39'4'#39', '#39'5'#39')'
      '       AND D.CODDOCUMENTO  = L.CODDOCUMENTO'
      '       AND D.CODDOCUMENTO  = LI.CODDOCUMENTO'
      '       AND LI.CODTIPIMOVEL = TI.CODTIPIMOVEL'
      '       AND D.STATUS        = '#39'0'#39
      '       AND L.ESTORNO       IS NULL'
      '     GROUP BY L.CODDOCUMENTO ) LD,'
      ''
      '   ( SELECT CXP.IDENDERECO, CXP.IDCONTATO, CXP.NOME'
      '     FROM CONTATOPESS CXP,'
      '        ( SELECT MIN(IDCONTATO) AS IDCONTATO, IDENDERECO'
      '          FROM CONTATOPESS'
      '          GROUP BY IDENDERECO ) CON'
      '     WHERE ( CON.IDCONTATO = CXP.IDCONTATO ) ) CP'
      'WHERE ( LI.RECPAG = '#39'R'#39' )'
      
        '  AND ((:PMESCOMPETENCIA   IS NULL) OR (LI.MESCOMPETENCIA   = :P' +
        'MESCOMPETENCIA))'
      
        '  AND ((:PANOCOMPETENCIA   IS NULL) OR (LI.ANOCOMPETENCIA   = :P' +
        'ANOCOMPETENCIA))'
      
        '  AND ((:PIDCONTRATOIMOVEL IS NULL) OR (LI.IDCONTRATOIMOVEL = :P' +
        'IDCONTRATOIMOVEL))'
      
        '  AND ((:PIDLOCATARIO      IS NULL) OR (CI.IDLOCATARIO      = :P' +
        'IDLOCATARIO))'
      
        '  AND ((:DATAINI           IS NULL) OR (LI.DATAVENCIMENTO BETWEE' +
        'N :DATAINI AND :DATAFIM))'
      
        '  AND (((:STATUS = '#39'P'#39' AND RTRIM(D.STATUS) <> '#39'2'#39') OR (D.STATUS ' +
        'IS NULL)) OR (:STATUS IS NULL))'
      '  AND ( LI.CODDOCUMENTO      = LD.CODDOCUMENTO )'
      '  AND ( LD.CODDOCUMENTO      = D.CODDOCUMENTO )'
      '  AND ( LI.IDCONTRATOIMOVEL  = CI.IDCONTRATOIMOVEL )'
      '  AND ( CI.IDLOCATARIO       = P.IDPESSOA )'
      '  AND ( P.IDENDCOBRANCA      = E.IDENDERECO(+) )'
      '  AND ( P.IDPESSOA           = E.IDPESSOA(+) )'
      '  AND ( TR.IDTIPOCUSTORECIMO = LI.IDTIPOCUSTORECIMO )'
      '  AND ( P.IDENDCOBRANCA      = CP.IDENDERECO(+) )'
      '  AND ( CI.CODPORTFORMA      = PF.CODPORTFORMA )'
      '  AND ( PF.CODPORTADOR       = PC.CODPORTADOR )'
      '  AND ( PC.IDAGENCIA         = PA.IDPESSOA )'
      '  AND ( PC.IDAGENCIA         = A.IDPESSOA )'
      '  AND ( A.IDBANCO            = PB.IDPESSOA )'
      '  AND ( A.IDBANCO            = B.IDPESSOA )'
      '  AND ( CI.IDTIPOCUSTORECIMO = LI.IDTIPOCUSTORECIMO )'
      '  AND ( I.IDIMOVEL           = LI.IDIMOVEL )'
      
        'GROUP BY TR.DESCCUSTORECIMO, CI.CONNUMERO, CI.CONNOME, CI.IDCONT' +
        'RATOIMOVEL, CI.CODESTADO, CI.CONDATAASSINATURA,'
      
        '         CI.CONDATAINICIO, CI.CONDATAREAJUSTE, CI.CONINDICEREAJU' +
        'STE, CI.CONPERREAJUSTE, CI.CONVLRAJUSTADO, CI.CONVLRTOTAL,'
      
        '         P.RAZAOSOCIAL, CP.NOME, E.LOGRADOURO||'#39', '#39'||E.NUMERO||'#39 +
        ', '#39'||E.COMPLEMENTO, E.CEP, PC.NOCONTACORR, PB.NOME, PA.NOME,'
      
        '         B.NUMBANCO, A.NUMAGENCIA, LI.MESREFERENCIA, LI.ANOREFER' +
        'ENCIA, LI.MESCOMPETENCIA, LI.ANOCOMPETENCIA,'
      
        '         LI.DATAVENCIMENTO, LI.CODDOCUMENTO, D.DATAPROGRAMADA, L' +
        'D.VALOR, LD.VALOR_BAIXA, LD.VALOR_MULTA, LD.VALOR_JUROS, LD.VALO' +
        'R_CORRMON, LD.VALOR_OUTROS'
      
        'ORDER BY CI.CONNOME, LI.ANOCOMPETENCIA, LI.MESCOMPETENCIA, LI.CO' +
        'DDOCUMENTO'
      ''
      ''
      ''
      ''
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 437
    Top = 157
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PMESCOMPETENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PMESCOMPETENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PANOCOMPETENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PANOCOMPETENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDLOCATARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDLOCATARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STATUS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'STATUS'
        ParamType = ptUnknown
      end>
    object qryDiscriminadoValorTotal: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'ValorTotal'
      Calculated = True
    end
    object qryDiscriminadoMes: TStringField
      FieldKind = fkCalculated
      FieldName = 'Mes'
      Size = 15
      Calculated = True
    end
    object qryDiscriminadoValorExtenso: TStringField
      DisplayWidth = 200
      FieldKind = fkCalculated
      FieldName = 'ValorExtenso'
      Size = 200
      Calculated = True
    end
    object qryDiscriminadoContratoExtenso: TStringField
      FieldKind = fkCalculated
      FieldName = 'ContratoExtenso'
      Size = 120
      Calculated = True
    end
    object qryDiscriminadoDESCCUSTORECIMO: TStringField
      FieldName = 'DESCCUSTORECIMO'
      Size = 60
    end
    object qryDiscriminadoCONNUMERO: TStringField
      FieldName = 'CONNUMERO'
    end
    object qryDiscriminadoCONNOME: TStringField
      FieldName = 'CONNOME'
      Size = 60
    end
    object qryDiscriminadoCODESTADO: TStringField
      FieldName = 'CODESTADO'
      Size = 3
    end
    object qryDiscriminadoRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object qryDiscriminadoNOME_CONTATO: TStringField
      FieldName = 'NOME_CONTATO'
      Size = 50
    end
    object qryDiscriminadoCONTA_CORRENTE: TStringField
      FieldName = 'CONTA_CORRENTE'
      Size = 15
    end
    object qryDiscriminadoNOME_BANCO: TStringField
      FieldName = 'NOME_BANCO'
      Size = 60
    end
    object qryDiscriminadoNOME_AGENCIA: TStringField
      FieldName = 'NOME_AGENCIA'
      Size = 60
    end
    object qryDiscriminadoNUMBANCO: TStringField
      FieldName = 'NUMBANCO'
      Size = 10
    end
    object qryDiscriminadoNUMAGENCIA: TStringField
      FieldName = 'NUMAGENCIA'
      Size = 15
    end
    object qryDiscriminadoMESREFERENCIA: TFloatField
      FieldName = 'MESREFERENCIA'
    end
    object qryDiscriminadoANOREFERENCIA: TFloatField
      FieldName = 'ANOREFERENCIA'
    end
    object qryDiscriminadoMESCOMPETENCIA: TFloatField
      FieldName = 'MESCOMPETENCIA'
    end
    object qryDiscriminadoANOCOMPETENCIA: TFloatField
      FieldName = 'ANOCOMPETENCIA'
    end
    object qryDiscriminadoDATAVENCIMENTO: TDateTimeField
      FieldName = 'DATAVENCIMENTO'
    end
    object qryDiscriminadoVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object qryDiscriminadoVALOR_MULTA: TFloatField
      FieldName = 'VALOR_MULTA'
    end
    object qryDiscriminadoVALOR_JUROS: TFloatField
      FieldName = 'VALOR_JUROS'
    end
    object qryDiscriminadoVALOR_CORRMON: TFloatField
      FieldName = 'VALOR_CORRMON'
    end
    object qryDiscriminadoCONDATAASSINATURA: TDateTimeField
      FieldName = 'CONDATAASSINATURA'
    end
    object qryDiscriminadoCONDATAINICIO: TDateTimeField
      FieldName = 'CONDATAINICIO'
    end
    object qryDiscriminadoCONDATAREAJUSTE: TDateTimeField
      FieldName = 'CONDATAREAJUSTE'
    end
    object qryDiscriminadoVLR_ATUAL_CONTRATO: TFloatField
      FieldName = 'VLR_ATUAL_CONTRATO'
    end
    object qryDiscriminadoVLR_ANT_CONTRATO: TFloatField
      FieldName = 'VLR_ANT_CONTRATO'
    end
    object qryDiscriminadoAVISO_REAJUSTE: TStringField
      FieldKind = fkCalculated
      FieldName = 'AVISO_REAJUSTE'
      Size = 50
      Calculated = True
    end
    object qryDiscriminadoENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 92
    end
    object qryDiscriminadoCONINDICEREAJUSTE: TFloatField
      FieldName = 'CONINDICEREAJUSTE'
    end
    object qryDiscriminadoCONPERREAJUSTE: TFloatField
      FieldName = 'CONPERREAJUSTE'
    end
    object qryDiscriminadoDesc: TStringField
      DisplayWidth = 1000
      FieldKind = fkCalculated
      FieldName = 'Desc'
      Size = 1000
      Calculated = True
    end
    object qryDiscriminadoIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
    end
    object qryDiscriminadoCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object qryDiscriminadoDATAPROGRAMADA: TDateTimeField
      FieldName = 'DATAPROGRAMADA'
    end
    object qryDiscriminadoCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object qryDiscriminadoDatasAnteriores: TStringField
      FieldKind = fkCalculated
      FieldName = 'DatasAnteriores'
      Calculated = True
    end
    object qryDiscriminadoImovelLocado: TStringField
      DisplayWidth = 1000
      FieldKind = fkCalculated
      FieldName = 'ImovelLocado'
      Size = 100
      Calculated = True
    end
    object qryDiscriminadoAREA_LOCADA: TFloatField
      FieldName = 'AREA_LOCADA'
    end
    object qryDiscriminadoVALOR_OUTROS: TFloatField
      FieldName = 'VALOR_OUTROS'
    end
    object qryDiscriminadoVALOR_BAIXA: TFloatField
      FieldName = 'VALOR_BAIXA'
    end
  end
  object Extenso: TExtensoCM
    DescricaoMoeda.Singular = 'Real'
    DescricaoMoeda.Plural = 'Reais'
    TamanhoLinha = 0
    Idioma = iePortugues
    CompletaExtenso = False
    Left = 517
    Top = 269
  end
  object qryBuscaModelo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT E.CODDOCUMENTO,'
      '         E.IDCARTACOBRANCA,            '
      '         E.EVIDATA'
      '    FROM EVENTOIMOVEL E, LANCAMENTOSIMOVEL L,'
      '         DOCUMENTO D             '
      '   WHERE E.CODDOCUMENTO = L.CODDOCUMENTO'
      '     AND E.CODDOCUMENTO = D.CODDOCUMENTO'
      '     AND E.CODDOCUMENTO IS NOT NULL '
      '     AND E.FLGTIPOEVENTO = '#39'CC'#39'   '
      '     AND RTRIM(D.STATUS) <> '#39'2'#39'     '
      
        '     AND ( (:IDCONTRATOIMOVEL IS NULL) OR (L.IDCONTRATOIMOVEL = ' +
        ':IDCONTRATOIMOVEL) )'
      '     AND ( (:IDFORCLI IS NULL) OR (L.IDFORCLI = :IDFORCLI) )'
      '   ORDER BY EVIDATA DESC')
    ValidateWithMask = True
    Left = 343
    Top = 102
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDFORCLI'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDFORCLI'
        ParamType = ptUnknown
      end>
    object qryBuscaModeloCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object qryBuscaModeloIDCARTACOBRANCA: TFloatField
      FieldName = 'IDCARTACOBRANCA'
    end
    object qryBuscaModeloEVIDATA: TDateTimeField
      FieldName = 'EVIDATA'
    end
  end
  object qryEnviosAnteriores: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    EL.EVIDATA'
      'FROM'
      '    EVENTOIMOVEL EL'
      'WHERE'
      '    EL.FLGTIPOEVENTO = '#39'CC'#39
      'AND EL.CODDOCUMENTO  = :PCODDOCUMENTO'
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 96
    Top = 328
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PCODDOCUMENTO'
        ParamType = ptInput
      end>
    object qryEnviosAnterioresEVIDATA: TDateTimeField
      FieldName = 'EVIDATA'
      Origin = 'BASEDADOS.EVENTOIMOVEL.EVIDATA'
    end
  end
  object qryImovelLocado: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CX.IDCONTRATOIMOVEL,'
      
        '   IM.IMONOME||'#39' - '#39'||DECODE(CX.CIMDESCRICAO, NULL, I.IMONOME, C' +
        'X.CIMDESCRICAO) AS IMOVEL_LOCADO'
      'FROM'
      '   IMOVEL I,'
      '   IMOVEL IM,'
      '   CONTRATOXIMOVEL CX'
      'WHERE'
      '    I.IDIMOVELMESTRE = IM.IDIMOVEL'
      'AND CX.IDIMOVEL = I.IDIMOVEL      '
      'AND CX.IDCONTRATOIMOVEL = :PIDCONTRATOIMOVEL'
      'ORDER BY '
      
        '    IM.IMONOME||'#39' - '#39'||DECODE(CX.CIMDESCRICAO, NULL, I.IMONOME, ' +
        'CX.CIMDESCRICAO)'
      ''
      '')
    ValidateWithMask = True
    Left = 208
    Top = 336
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOIMOVEL'
        ParamType = ptInput
      end>
    object qryImovelLocadoIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
    end
    object qryImovelLocadoIMOVEL_LOCADO: TStringField
      DisplayWidth = 1000
      FieldName = 'IMOVEL_LOCADO'
      Size = 123
    end
  end
end
