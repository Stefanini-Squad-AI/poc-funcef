inherited FrmCadValParamInstFin: TFrmCadValParamInstFin
  Left = 15
  Top = 110
  Caption = 'Cadastro de Indicadores '
  ClientHeight = 416
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 330
    inherited pnlMestre: TPanel
      Height = 68
      object Label1: TLabel
        Left = 21
        Top = 8
        Width = 118
        Height = 13
        Caption = 'Nome da Instituição '
        FocusControl = DBEdit1
      end
      object DBEdit1: TDBEdit
        Left = 21
        Top = 24
        Width = 443
        Height = 21
        DataField = 'NOME'
        DataSource = ds
        Enabled = False
        TabOrder = 0
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 69
      Height = 260
      Tabs.Strings = (
        'Indicadores')
      inherited pgctrlDetalhe: TPageControl
        Height = 201
        inherited tbsDet: TTabSheet
          Caption = 'Eventos '
          inherited dbgrdDet: TwwDBGrid
            Height = 173
            Selected.Strings = (
              'DESCINDICADOR'#9'30'#9'Indicadores'
              'DATAREFPRINSTFIN'#9'10'#9'Data'
              'VLRPARAMINSTFIN'#9'13'#9'Valor')
          end
          inherited pnlControlesDet: TPanel
            Height = 173
            object Label2: TLabel
              Left = 9
              Top = 10
              Width = 54
              Height = 13
              Caption = 'Indicador'
            end
            object LbLValor: TLabel
              Left = 9
              Top = 50
              Width = 30
              Height = 13
              Caption = 'Valor'
            end
            object Label3: TLabel
              Left = 208
              Top = 50
              Width = 28
              Height = 13
              Caption = 'Data'
            end
            object Label4: TLabel
              Left = 8
              Top = 96
              Width = 35
              Height = 13
              Caption = 'Regra'
            end
            object DBlkTipoEvento: TwwDBLookupCombo
              Left = 8
              Top = 26
              Width = 369
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCPARAMINSTFIN'#9'40'#9'Indicador')
              DataField = 'DESCINDICADOR'
              DataSource = dsDet
              LookupTable = QryTipoIndicador
              LookupField = 'IDPARAMINSTFIN'
              Options = [loColLines, loRowLines, loTitles]
              TabOrder = 0
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
            end
            object dbreValor: TDBRealEdit
              Left = 9
              Top = 66
              Width = 121
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '      0,00')
              TabOrder = 1
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLRPARAMINSTFIN'
              DataSource = dsDet
            end
            object DBData: TCMDateTimePicker
              Left = 208
              Top = 66
              Width = 121
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAREFPRINSTFIN'
              DataSource = dsDet
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
              TabOrder = 2
            end
            object wwDBLookupCombo1: TwwDBLookupCombo
              Left = 8
              Top = 112
              Width = 369
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMEREGRA'#9'40'#9'Regras')
              DataField = 'DATAREFPRINSTFIN'
              DataSource = dsDet
              LookupTable = QryRegras
              LookupField = 'IDREGRA'
              Options = [loColLines, loRowLines, loTitles]
              TabOrder = 3
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
            end
          end
        end
      end
      inherited Dock974: TDock97 [1]
        Height = 201
      end
      inherited Dock973: TDock97 [2]
      end
    end
  end
  inherited Dock972: TDock97
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Enabled = False
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Enabled = False
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Enabled = False
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 377
  end
  inherited dsDet: TwwDataSource
    AutoEdit = True
    DataSet = QryDetalhe
    Left = 454
    Top = 145
  end
  inherited ds: TwwDataSource
    Left = 333
    Top = 8
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'INSTFIN.SIGLAINSTFIN'
      'PESSOA.NOME'
      'PESSOA.RAZAOSOCIAL')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Sigla'
      'Nome da Instituição '
      'Razão Social')
    Tabelas.Strings = (
      'PESSOA'
      'INSTFIN')
    CamposChave.Strings = (
      'INSTFIN.IDINSTFIN')
    Filtro.Strings = (
      'INSTFIN.IDINSTFIN = PESSOA.IDPESSOA ')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '40'
      '40')
    Left = 363
    Top = 8
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'#9'IF.IDINSTFIN,PS.NOME '
      'FROM '#9'INSTFIN IF, PESSOA PS'
      'WHERE'#9'IF.IDINSTFIN = PS.IDPESSOA ')
    object qryIDINSTFIN: TFloatField
      FieldName = 'IDINSTFIN'
    end
    object qryNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
  end
  object QryDetalhe: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = ds
    RequestLive = True
    SQL.Strings = (
      'SELECT'#9' IDPARAMINSTFIN,IDINSTFIN,DATAREFPRINSTFIN,'
      #9' VLRPARAMINSTFIN,IDREGRAUSOINSTFIN'
      'FROM '#9' VALPARAMXINSTFIN'
      'WHERE'#9' IDINSTFIN = :IDINSTFIN'
      'ORDER'#9' BY DATAREFPRINSTFIN')
    ValidateWithMask = True
    Left = 424
    Top = 145
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDINSTFIN'
        ParamType = ptUnknown
      end>
    object QryDetalheDESCINDICADOR: TStringField
      DisplayLabel = 'Indicadores'
      DisplayWidth = 30
      FieldKind = fkLookup
      FieldName = 'DESCINDICADOR'
      LookupDataSet = QryTipoIndicador
      LookupKeyFields = 'IDPARAMINSTFIN'
      LookupResultField = 'DESCPARAMINSTFIN'
      KeyFields = 'IDPARAMINSTFIN'
      Size = 40
      Lookup = True
    end
    object QryDetalheDATAREFPRINSTFIN: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 10
      FieldName = 'DATAREFPRINSTFIN'
      Origin = 'VALPARAMXINSTFIN.DATAREFPRINSTFIN'
    end
    object QryDetalheVLRPARAMINSTFIN: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 13
      FieldName = 'VLRPARAMINSTFIN'
      Origin = 'VALPARAMXINSTFIN.VLRPARAMINSTFIN'
      DisplayFormat = '###,###,###,##0.00'
    end
    object QryDetalheIDPARAMINSTFIN: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPARAMINSTFIN'
      Origin = 'VALPARAMXINSTFIN.IDPARAMINSTFIN'
      Visible = False
    end
    object QryDetalheIDINSTFIN: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINSTFIN'
      Origin = 'VALPARAMXINSTFIN.IDINSTFIN'
      Visible = False
    end
    object QryDetalheIDREGRAUSOINSTFIN: TFloatField
      DisplayWidth = 10
      FieldName = 'IDREGRAUSOINSTFIN'
      Origin = 'VALPARAMXINSTFIN.IDREGRAUSOINSTFIN'
      Visible = False
    end
  end
  object QryExibeDetalhe: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      'SELECT '#9'EM.IDTIPOEVENEMISSOR,TE.DESCTPEVENEMISSOR,EM.IDEMISSOR,'
      ' '#9'EM.DATAEVENTOEMISSOR,EM.VLREVENTOEMISSOR,'
      #9'EM.STATEVENTOEMISSOR'
      ''
      'FROM   '#9'EVENTOEMISSOR EM, TIPOEVENEMISSOR TE'
      ''
      'WHERE  '#9'EM.IDEMISSOR = :IDEMISSOR AND '
      #9'EM.IDTIPOEVENEMISSOR = TE.IDTIPOEVENEMISSOR  '
      '')
    ValidateWithMask = True
    Left = 314
    Top = 145
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDEMISSOR'
        ParamType = ptUnknown
      end>
    object QryExibeDetalheDESCTPEVENEMISSOR: TStringField
      DisplayLabel = 'Tipo de Evento'
      DisplayWidth = 33
      FieldName = 'DESCTPEVENEMISSOR'
      Origin = 'TIPOEVENEMISSOR.DESCTPEVENEMISSOR'
      Size = 60
    end
    object QryExibeDetalheDATAEVENTOEMISSOR: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 10
      FieldName = 'DATAEVENTOEMISSOR'
      Origin = 'EVENTOEMISSOR.DATAEVENTOEMISSOR'
    end
    object QryExibeDetalheVLREVENTOEMISSOR: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 10
      FieldName = 'VLREVENTOEMISSOR'
      Origin = 'EVENTOEMISSOR.VLREVENTOEMISSOR'
    end
    object QryExibeDetalheIDTIPOEVENEMISSOR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOEVENEMISSOR'
      Origin = 'EVENTOEMISSOR.IDTIPOEVENEMISSOR'
      Visible = False
    end
    object QryExibeDetalheIDEMISSOR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDEMISSOR'
      Origin = 'EVENTOEMISSOR.IDEMISSOR'
      Visible = False
    end
    object QryExibeDetalheSTATEVENTOEMISSOR: TStringField
      DisplayWidth = 1
      FieldName = 'STATEVENTOEMISSOR'
      Origin = 'EVENTOEMISSOR.STATEVENTOEMISSOR'
      Visible = False
      Size = 1
    end
  end
  object DsExibeDetalhe: TwwDataSource
    DataSet = QryExibeDetalhe
    Left = 346
    Top = 145
  end
  object QryTipoIndicador: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      'SELECT '#9'PIF.IDPARAMINSTFIN,PIF.DESCPARAMINSTFIN,PIF.IDREGRA'
      'FROM'#9'PARAMINSTFIN PIF')
    ValidateWithMask = True
    Left = 344
    Top = 217
    object QryTipoIndicadorDESCPARAMINSTFIN: TStringField
      DisplayLabel = 'Indicador'
      DisplayWidth = 40
      FieldName = 'DESCPARAMINSTFIN'
      Origin = 'PARAMINSTFIN.DESCPARAMINSTFIN'
      Size = 60
    end
    object QryTipoIndicadorIDPARAMINSTFIN: TFloatField
      FieldName = 'IDPARAMINSTFIN'
      Origin = 'PARAMINSTFIN.IDPARAMINSTFIN'
      Visible = False
    end
    object QryTipoIndicadorIDREGRA: TFloatField
      FieldName = 'IDREGRA'
      Origin = 'PARAMINSTFIN.IDREGRA'
      Visible = False
    end
  end
  object QryRegras: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDREGRA,NOMEREGRA '
      'FROM REGRA'
      'ORDER BY NOMEREGRA')
    ValidateWithMask = True
    Left = 341
    Top = 303
  end
end
