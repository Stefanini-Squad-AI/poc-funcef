inherited frmCadTravasProc: TfrmCadTravasProc
  Left = 144
  Top = 193
  Caption = 'frmCadTravasProc'
  ClientHeight = 284
  ClientWidth = 508
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 508
    Height = 198
    inherited Bevel2: TBevel
      Width = 506
    end
    inherited dbGrd: TwwDBGrid [1]
      Width = 506
      Height = 152
      Selected.Strings = (
        'DESCTIPOINVEST'#9'18'#9'Tipo de Investimento'
        'DESCTIPOINVESTRV'#9'23'#9'Tipo de Investimento RV'
        'DESCTPMERCADOBMF'#9'21'#9'Tipo de Mercado BM&F'
        'DESCTIPOFUNDOINV'#9'80'#9'Tipo de Fundo'
        'DESCCLASSETIT'#9'30'#9'Classe de Títulos'
        'DESCINVESTIMENTO'#9'60'#9'Investimento'
        'DESCFUNDOINVEST'#9'60'#9'Fundo de Investimento')
    end
    inherited pnlControles: TPanel [2]
      Width = 506
      Height = 152
      object pnlBMF: TPanel
        Left = 241
        Top = 0
        Width = 265
        Height = 152
        Align = alClient
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 4
        object Label2: TLabel
          Left = 19
          Top = 24
          Width = 133
          Height = 13
          Caption = 'Tipo de Mercado BM&&F'
        end
        object Label10: TLabel
          Left = 19
          Top = 80
          Width = 73
          Height = 13
          Caption = 'Investimento'
        end
        object cblTipoMercadoBMF: TCMDBLookupCombo
          Left = 19
          Top = 40
          Width = 228
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCTPMERCADOBMF'#9'60'#9'Descrição'#9'F')
          DataField = 'IDTIPOMERCADOBMF'
          DataSource = ds
          LookupTable = qryTipoMercadoBMF
          LookupField = 'IDTIPOMERCADOBMF'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object dblInvestBMF: TCMDBLookupCombo
          Left = 19
          Top = 96
          Width = 228
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCINVESTIMENTO'#9'60'#9'Descrição'#9'F')
          DataField = 'IDINVESTIMENTO'
          DataSource = ds
          LookupTable = qryInvestimento
          LookupField = 'IDINVESTIMENTO'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
      end
      object pnlRV: TPanel
        Left = 241
        Top = 0
        Width = 265
        Height = 152
        Align = alClient
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 1
        object Label1: TLabel
          Left = 19
          Top = 24
          Width = 141
          Height = 13
          Caption = 'Tipo de Investimento RV'
        end
        object Label6: TLabel
          Left = 19
          Top = 80
          Width = 73
          Height = 13
          Caption = 'Investimento'
        end
        object dblTipoInvestRV: TCMDBLookupCombo
          Left = 19
          Top = 40
          Width = 228
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCTIPOINVESTRV'#9'60'#9'Descrição'#9'F')
          DataField = 'IDTIPOINVESTRV'
          DataSource = ds
          LookupTable = qryTipoInvestRV
          LookupField = 'IDTIPOINVESTRV'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
          OnExit = dblTipoInvestRVExit
        end
        object dblInvestimento: TCMDBLookupCombo
          Left = 19
          Top = 96
          Width = 228
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCINVESTIMENTO'#9'60'#9'Descrição'#9'F')
          DataField = 'IDINVESTIMENTO'
          DataSource = ds
          LookupTable = qryInvestimento
          LookupField = 'IDINVESTIMENTO'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
      end
      object pnlRF: TPanel
        Left = 241
        Top = 0
        Width = 265
        Height = 152
        Align = alClient
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 2
        object Label5: TLabel
          Left = 19
          Top = 24
          Width = 141
          Height = 13
          Caption = 'Tipo de Classe de Título'
        end
        object Label9: TLabel
          Left = 19
          Top = 80
          Width = 73
          Height = 13
          Caption = 'Investimento'
        end
        object dblClasseTit: TCMDBLookupCombo
          Left = 19
          Top = 40
          Width = 228
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCCLASSETIT'#9'30'#9'Descrição'#9'F')
          DataField = 'IDCLASSETIT'
          DataSource = ds
          LookupTable = qryClasseTit
          LookupField = 'IDCLASSETIT'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
          OnExit = dblClasseTitExit
        end
        object dblInvestRF: TCMDBLookupCombo
          Left = 19
          Top = 96
          Width = 228
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCINVESTIMENTO'#9'60'#9'Descrição'#9'F')
          DataField = 'IDINVESTIMENTO'
          DataSource = ds
          LookupTable = qryInvestimento
          LookupField = 'IDINVESTIMENTO'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
      end
      object pnlFundos: TPanel
        Left = 241
        Top = 0
        Width = 265
        Height = 152
        Align = alClient
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 3
        object Label3: TLabel
          Left = 19
          Top = 24
          Width = 177
          Height = 13
          Caption = 'Tipo de Fundo de Investimento'
        end
        object Label7: TLabel
          Left = 19
          Top = 80
          Width = 130
          Height = 13
          Caption = 'Fundo de Investimento'
        end
        object dblTipoFundoInvest: TCMDBLookupCombo
          Left = 19
          Top = 40
          Width = 228
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCTIPOFUNDOINV'#9'80'#9'Descrição'#9'F')
          DataField = 'IDTIPOFUNDOINVEST'
          DataSource = ds
          LookupTable = qryTipoFundoInvest
          LookupField = 'IDTIPOFUNDOINVEST'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
          OnExit = dblTipoFundoInvestExit
        end
        object dblFundoInvest: TCMDBLookupCombo
          Left = 19
          Top = 96
          Width = 228
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCFUNDOINVEST'#9'60'#9'Descrição'#9'F')
          DataField = 'IDFUNDOINVEST'
          DataSource = ds
          LookupTable = qryFundoInvest
          LookupField = 'IDFUNDOINVEST'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
      end
      object pnlPrinc: TPanel
        Left = 0
        Top = 0
        Width = 241
        Height = 152
        Align = alLeft
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 0
        object Label4: TLabel
          Left = 16
          Top = 80
          Width = 120
          Height = 13
          Caption = 'Tipo de Investimento'
        end
        object Label8: TLabel
          Left = 16
          Top = 24
          Width = 99
          Height = 13
          Caption = 'Data do Bloqueio'
        end
        object dblTipoInvest: TCMDBLookupCombo
          Left = 16
          Top = 96
          Width = 210
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCTIPOINVEST'#9'60'#9'Descrição'#9'F')
          DataField = 'IDTIPOINVEST'
          DataSource = ds
          LookupTable = qryTipoInvest
          LookupField = 'IDTIPOINVEST'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
          OnCloseUp = dblTipoInvestCloseUp
          OnExit = dblTipoInvestExit
        end
        object dbdDataBloq: TCMDateTimePicker
          Left = 16
          Top = 40
          Width = 126
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          ButtonStyle = cbsCustom
          DataField = 'DATABLOQUEIO'
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
      end
    end
    inherited pnlTitulo: TPanel
      Width = 506
      inherited lbNomItem: TfcLabel
        Width = 266
        Caption = 'Travas de Processamento'
      end
    end
  end
  inherited Dock972: TDock97
    Width = 508
  end
  inherited Dock971: TDock97
    Top = 245
    Width = 508
    inherited tb97Fundo: TToolbar97
      Left = 336
      DockPos = 546
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 167
      DockPos = 377
    end
    inherited fraMens: TfraMensagem
      Width = 176
      inherited pnlProgresso: TPanel
        Width = 176
        inherited pnlProgressoMensagem: TPanel
          Width = 104
          inherited lblProgressoMensagem: TfcLabel
            Width = 102
          end
        end
        inherited pnlProgressoBarra: TPanel
          Left = 105
          Width = 70
          inherited pgbProcesso: TProgressBar
            Width = 68
          end
        end
      end
    end
  end
  inherited ds: TwwDataSource
    AutoEdit = False
    Left = 347
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update TRAVASPROC'
      'set'
      '  IDTIPOINVEST = :IDTIPOINVEST,'
      '  IDTIPOINVESTRV = :IDTIPOINVESTRV,'
      '  IDTIPOMERCADOBMF = :IDTIPOMERCADOBMF,'
      '  IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST,'
      '  IDCLASSETIT = :IDCLASSETIT,'
      '  IDINVESTIMENTO = :IDINVESTIMENTO,'
      '  IDFUNDOINVEST = :IDFUNDOINVEST,'
      '  DATABLOQUEIO = :DATABLOQUEIO'
      'where'
      '  IDTRAVASPROC = :OLD_IDTRAVASPROC')
    InsertSQL.Strings = (
      'insert into TRAVASPROC'
      
        '  (IDTRAVASPROC, IDTIPOINVEST, IDTIPOINVESTRV, IDTIPOMERCADOBMF,' +
        ' '
      'IDTIPOFUNDOINVEST, '
      '   IDCLASSETIT, IDINVESTIMENTO, IDFUNDOINVEST, DATABLOQUEIO)'
      'values'
      
        '  (:IDTRAVASPROC, :IDTIPOINVEST, :IDTIPOINVESTRV, :IDTIPOMERCADO' +
        'BMF, '
      ':IDTIPOFUNDOINVEST, '
      '   :IDCLASSETIT, :IDINVESTIMENTO, :IDFUNDOINVEST, :DATABLOQUEIO)')
    DeleteSQL.Strings = (
      'delete from TRAVASPROC'
      'where'
      '  IDTRAVASPROC = :OLD_IDTRAVASPROC')
    Left = 379
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TIPOINVEST.DESCTIPOINVEST'
      'TIPOINVESTRV.DESCTIPOINVESTRV'
      'TIPOMERCADOBMF.DESCTPMERCADOBMF'
      'TIPOFUNDOINVEST.DESCTIPOFUNDOINV'
      'CLASSETITRENFIX.DESCCLASSETIT'
      'INVESTIMENTO.DESCINVESTIMENTO'
      'FUNDOINVEST.DESCFUNDOINVEST'
      'TRAVASPROC.DATABLOQUEIO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'D')
    Descricao.Strings = (
      'Tipo de Investimento'
      'Tipo de Investimento de Renda Variável'
      'Mercado de BM&F'
      'Tipo de Fundo de Investimento'
      'Classe de Renda Fixa'
      'Investimento'
      'Fundo de Investimento'
      'Data do Bloqueio')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'TRAVASPROC'
      'TIPOINVEST'
      'TIPOINVESTRV'
      'TIPOMERCADOBMF'
      'TIPOFUNDOINVEST'
      'CLASSETITRENFIX'
      'INVESTIMENTO'
      'FUNDOINVEST')
    CamposChave.Strings = (
      'TRAVASPROC.IDTRAVASPROC')
    Filtro.Strings = (
      'TRAVASPROC.IDTIPOINVEST = TIPOINVEST.IDTIPOINVEST'
      'TRAVASPROC.IDTIPOINVESTRV = TIPOINVESTRV.IDTIPOINVESTRV(+)'
      'TRAVASPROC.IDTIPOMERCADOBMF = TIPOMERCADOBMF.IDTIPOMERCADOBMF(+)'
      
        'TRAVASPROC.IDTIPOFUNDOINVEST = TIPOFUNDOINVEST.IDTIPOFUNDOINVEST' +
        '(+)'
      'TRAVASPROC.IDCLASSETIT = CLASSETITRENFIX.IDCLASSETIT(+)'
      'TRAVASPROC.IDINVESTIMENTO = INVESTIMENTO.IDINVESTIMENTO(+)'
      'TRAVASPROC.IDFUNDOINVEST = FUNDOINVEST.IDFUNDOINVEST(+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      'dd/mm/yyyy')
    Larguras.Strings = (
      '60'
      '60'
      '60'
      '80'
      '30'
      '60'
      '60'
      '18')
    Left = 469
  end
  inherited ImlPadrao: TImageList
    Left = 265
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyInsert = CmeCadastroApplyInsert
    Left = 428
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      
        'SELECT TI.DESCTIPOINVEST, TR.DESCTIPOINVESTRV, TB.DESCTPMERCADOB' +
        'MF, TF.DESCTIPOFUNDOINV,'
      
        '       CT.DESCCLASSETIT, IV.DESCINVESTIMENTO, FI.DESCFUNDOINVEST' +
        ', TP.DATABLOQUEIO,'
      
        '       TP.IDTRAVASPROC, TP.IDTIPOINVEST, TP.IDTIPOINVESTRV, TP.I' +
        'DTIPOMERCADOBMF,'
      
        '       TP.IDTIPOFUNDOINVEST, TP.IDCLASSETIT, TP.IDINVESTIMENTO, ' +
        'TP.IDFUNDOINVEST'
      
        'FROM TRAVASPROC TP, TIPOINVEST TI, TIPOINVESTRV TR, TIPOMERCADOB' +
        'MF TB, TIPOFUNDOINVEST TF,'
      '     CLASSETITRENFIX CT, INVESTIMENTO IV, FUNDOINVEST FI'
      'WHERE TP.IDTRAVASPROC = :IDTRAVASPROC'
      '  AND TP.IDTIPOINVEST = TI.IDTIPOINVEST'
      '  AND TP.IDTIPOINVESTRV = TR.IDTIPOINVESTRV(+)'
      '  AND TP.IDTIPOMERCADOBMF = TB.IDTIPOMERCADOBMF(+)'
      '  AND TP.IDTIPOFUNDOINVEST = TF.IDTIPOFUNDOINVEST(+)'
      '  AND TP.IDCLASSETIT = CT.IDCLASSETIT(+)'
      '  AND TP.IDINVESTIMENTO = IV.IDINVESTIMENTO(+)'
      '  AND TP.IDFUNDOINVEST = FI.IDFUNDOINVEST(+)'
      ''
      ' '
      ' ')
    Left = 314
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTRAVASPROC'
        ParamType = ptResult
      end>
    object qryDESCTIPOINVEST: TStringField
      DisplayLabel = 'Tipo de Investimento'
      DisplayWidth = 18
      FieldName = 'DESCTIPOINVEST'
      Size = 60
    end
    object qryDESCTIPOINVESTRV: TStringField
      DisplayLabel = 'Tipo de Investimento RV'
      DisplayWidth = 23
      FieldName = 'DESCTIPOINVESTRV'
      Size = 60
    end
    object qryDESCTPMERCADOBMF: TStringField
      DisplayLabel = 'Tipo de Mercado BM&F'
      DisplayWidth = 21
      FieldName = 'DESCTPMERCADOBMF'
      Size = 60
    end
    object qryDESCTIPOFUNDOINV: TStringField
      DisplayLabel = 'Tipo de Fundo'
      DisplayWidth = 80
      FieldName = 'DESCTIPOFUNDOINV'
      Size = 80
    end
    object qryDESCCLASSETIT: TStringField
      DisplayLabel = 'Classe de Títulos'
      DisplayWidth = 30
      FieldName = 'DESCCLASSETIT'
      Size = 30
    end
    object qryDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 60
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryDESCFUNDOINVEST: TStringField
      DisplayLabel = 'Fundo de Investimento'
      DisplayWidth = 60
      FieldName = 'DESCFUNDOINVEST'
      Size = 60
    end
    object qryIDTRAVASPROC: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTRAVASPROC'
      Visible = False
    end
    object qryIDTIPOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOINVEST'
      Visible = False
    end
    object qryIDTIPOINVESTRV: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOINVESTRV'
      Visible = False
    end
    object qryIDTIPOMERCADOBMF: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOMERCADOBMF'
      Visible = False
    end
    object qryIDTIPOFUNDOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOFUNDOINVEST'
      Visible = False
    end
    object qryIDCLASSETIT: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCLASSETIT'
      Visible = False
    end
    object qryIDINVESTIMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
    object qryIDFUNDOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFUNDOINVEST'
      Visible = False
    end
    object qryDATABLOQUEIO: TDateTimeField
      FieldName = 'DATABLOQUEIO'
      Visible = False
    end
  end
  object qryTipoInvest: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDTIPOINVEST, DESCTIPOINVEST'
      'FROM TIPOINVEST'
      'WHERE IDTIPOINVEST NOT IN (3,4)'
      'ORDER BY DESCTIPOINVEST')
    ValidateWithMask = True
    Left = 182
    Top = 180
    object qryTipoInvestDESCTIPOINVEST: TStringField
      DisplayWidth = 60
      FieldName = 'DESCTIPOINVEST'
      Size = 60
    end
    object qryTipoInvestIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Visible = False
    end
  end
  object qryTipoInvestRV: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDTIPOINVESTRV, DESCTIPOINVESTRV'
      'FROM TIPOINVESTRV'
      'ORDER BY DESCTIPOINVESTRV')
    ValidateWithMask = True
    Left = 346
    Top = 60
    object qryTipoInvestRVDESCTIPOINVESTRV: TStringField
      DisplayWidth = 60
      FieldName = 'DESCTIPOINVESTRV'
      Origin = 'BASEDADOS.TIPOINVESTRV.DESCTIPOINVESTRV'
      Size = 60
    end
    object qryTipoInvestRVIDTIPOINVESTRV: TFloatField
      FieldName = 'IDTIPOINVESTRV'
      Origin = 'BASEDADOS.TIPOINVESTRV.IDTIPOINVESTRV'
      Visible = False
    end
  end
  object qryTipoMercadoBMF: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDTIPOMERCADOBMF, DESCTPMERCADOBMF '
      'FROM TIPOMERCADOBMF'
      'ORDER BY DESCTPMERCADOBMF '
      ' ')
    ValidateWithMask = True
    Left = 666
    Top = 108
    object qryTipoMercadoBMFDESCTPMERCADOBMF: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'DESCTPMERCADOBMF'
      Origin = 'BASEDADOS.TIPOMERCADOBMF.DESCTPMERCADOBMF'
      Size = 60
    end
    object qryTipoMercadoBMFIDTIPOMERCADOBMF: TFloatField
      FieldName = 'IDTIPOMERCADOBMF'
      Origin = 'BASEDADOS.TIPOMERCADOBMF.IDTIPOMERCADOBMF'
      Visible = False
    end
  end
  object qryTipoFundoInvest: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDTIPOFUNDOINVEST, DESCTIPOFUNDOINV'
      'FROM TIPOFUNDOINVEST'
      'WHERE IDTIPOINVEST = :IDTIPOINVEST'
      'ORDER BY DESCTIPOFUNDOINV ')
    ValidateWithMask = True
    Left = 402
    Top = 60
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end>
    object qryTipoFundoInvestDESCTIPOFUNDOINV: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 80
      FieldName = 'DESCTIPOFUNDOINV'
      Origin = 'BASEDADOS.TIPOFUNDOINVEST.DESCTIPOFUNDOINV'
      Size = 80
    end
    object qryTipoFundoInvestIDTIPOFUNDOINVEST: TFloatField
      FieldName = 'IDTIPOFUNDOINVEST'
      Origin = 'BASEDADOS.TIPOFUNDOINVEST.IDTIPOFUNDOINVEST'
      Visible = False
    end
  end
  object qryClasseTit: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDCLASSETIT, DESCCLASSETIT'
      'FROM CLASSETITRENFIX'
      'ORDER BY DESCCLASSETIT')
    ValidateWithMask = True
    Left = 374
    Top = 60
    object qryClasseTitDESCCLASSETIT: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 30
      FieldName = 'DESCCLASSETIT'
      Origin = 'BASEDADOS.CLASSETITRENFIX.DESCCLASSETIT'
      Size = 30
    end
    object qryClasseTitIDCLASSETIT: TFloatField
      FieldName = 'IDCLASSETIT'
      Origin = 'BASEDADOS.CLASSETITRENFIX.IDCLASSETIT'
      Visible = False
    end
  end
  object qryInvestimento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDINVESTIMENTO, DESCINVESTIMENTO'
      'FROM INVESTIMENTO'
      
        'WHERE ((:IDTIPOINVEST IS NULL) OR (IDTIPOINVEST = :IDTIPOINVEST)' +
        ')'
      '  AND ((:IDCLASSETIT IS NULL) OR (IDCLASSETIT = :IDCLASSETIT))'
      'ORDER BY DESCINVESTIMENTO'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 667
    Top = 164
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCLASSETIT'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCLASSETIT'
        ParamType = ptResult
      end>
  end
  object qryFundoInvest: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT F.IDFUNDOINVEST, F.DESCFUNDOINVEST'
      'FROM FUNDOINVEST F, TIPOFUNDOINVEST T'
      
        'WHERE ((:IDTIPOFUNDOINVEST IS NULL) OR (F.IDTIPOFUNDOINVEST = :I' +
        'DTIPOFUNDOINVEST))'
      
        '  AND ((:IDTIPOINVEST IS NULL) OR (T.IDTIPOINVEST = :IDTIPOINVES' +
        'T))'
      '  AND F.IDTIPOFUNDOINVEST = T.IDTIPOFUNDOINVEST'
      'ORDER BY DESCFUNDOINVEST'
      '')
    ValidateWithMask = True
    Left = 647
    Top = 212
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end>
    object qryFundoInvestDESCFUNDOINVEST: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'DESCFUNDOINVEST'
      Origin = 'BASEDADOS.FUNDOINVEST.DESCFUNDOINVEST'
      Size = 60
    end
    object qryFundoInvestIDFUNDOINVEST: TFloatField
      FieldName = 'IDFUNDOINVEST'
      Origin = 'BASEDADOS.FUNDOINVEST.IDFUNDOINVEST'
      Visible = False
    end
  end
end
