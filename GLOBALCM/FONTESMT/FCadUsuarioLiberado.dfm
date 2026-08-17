inherited FrmCadUsuarioLiberado: TFrmCadUsuarioLiberado
  Left = 315
  Caption = 'Usuários Liberados'
  ClientHeight = 401
  ClientWidth = 697
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 697
    Height = 315
    inherited pnlMestre: TPanel
      Width = 695
      Height = 81
      object lblMatricula: TLabel
        Left = 12
        Top = 21
        Width = 55
        Height = 13
        Caption = 'Matrícula'
      end
      object lblNomeFunc: TLabel
        Left = 141
        Top = 21
        Width = 33
        Height = 13
        Caption = 'Nome'
      end
      object dbtxtSituacao: TDBText
        Left = 602
        Top = 37
        Width = 83
        Height = 17
        DataField = 'SITUACAO'
        DataSource = ds
      end
      object lblNomeUsuario: TLabel
        Left = 458
        Top = 21
        Width = 92
        Height = 13
        Caption = 'Usuário Sistema'
      end
      object dbedtMatricula: TwwDBEdit
        Left = 12
        Top = 35
        Width = 121
        Height = 21
        DataField = 'MATRICULA'
        DataSource = ds
        Enabled = False
        ReadOnly = True
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbedtNomeFunc: TwwDBEdit
        Left = 141
        Top = 35
        Width = 308
        Height = 21
        DataField = 'NOME'
        DataSource = ds
        Enabled = False
        ReadOnly = True
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbedtNomeUsuario: TwwDBEdit
        Left = 458
        Top = 35
        Width = 139
        Height = 21
        DataField = 'NOMEUSUARIO'
        DataSource = ds
        Enabled = False
        ReadOnly = True
        TabOrder = 2
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 82
      Width = 695
      Height = 232
      Tabs.Strings = (
        'Módulos Liberados')
      inherited pgctrlDetalhe: TPageControl
        Width = 597
        Height = 173
        inherited tbsDet: TTabSheet
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 589
            Height = 145
            Selected.Strings = (
              'NOME_ID'#9'40'#9'Módulo'#9'F'
              'DATA_INICIO_LIBERACAO'#9'20'#9'Início Liberação'#9'F'
              'DATA_FIM_LIBERACAO'#9'20'#9'Fim Liberação'#9'F')
            KeyOptions = []
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 589
            Height = 145
            object lblModulo: TLabel
              Left = 16
              Top = 27
              Width = 42
              Height = 13
              Caption = 'Módulo'
            end
            object lblDtInicio: TLabel
              Left = 268
              Top = 27
              Width = 94
              Height = 13
              Caption = 'Início Liberação'
            end
            object lblDtFim: TLabel
              Left = 427
              Top = 27
              Width = 80
              Height = 13
              Caption = 'Fim Liberação'
            end
            object dblkpModulo: TCMDBLookupCombo
              Left = 16
              Top = 42
              Width = 241
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME_ID'#9'30'#9'Módulo - ID'#9'F')
              DataField = 'IDMODULO'
              DataSource = dsDet
              LookupTable = CdsModulo
              LookupField = 'IDMODULO'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object dbdtInicio: TCMDateTimePicker
              Left = 268
              Top = 42
              Width = 148
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATA_INICIO_LIBERACAO'
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
              Enabled = False
              ReadOnly = True
              ShowButton = True
              TabOrder = 1
              DisplayFormat = 'dd/mm/yyyy hh:nn:ss'
            end
            object dbdtFim: TCMDateTimePicker
              Left = 427
              Top = 42
              Width = 148
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATA_FIM_LIBERACAO'
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
              DisplayFormat = 'dd/mm/yyyy hh:nn:ss'
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 687
      end
      inherited Dock974: TDock97
        Left = 601
        Height = 173
      end
    end
  end
  inherited Dock972: TDock97
    Width = 697
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
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
    Top = 362
    Width = 697
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 404
    Top = 0
  end
  inherited ds: TwwDataSource
    Left = 468
    Top = 0
  end
  inherited ImlPadrao: TImageList
    Left = 372
    Top = 0
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyEdit = CmeCadastroApplyEdit
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 308
    Top = 0
  end
  inherited Cds: TCMClientDataSet
    Left = 244
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'FUNCIONARIO.MATRICULA'
      'PESSOA.NOME'
      'USUARIOSISTEMA.NOMEUSUARIO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Nome'
      'Usuário Sistema')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'FUNCIONARIO'
      'PESSOA'
      'USUARIOSISTEMA')
    CamposChave.Strings = (
      'FUNCIONARIO.IDPESSOA')
    Filtro.Strings = (
      'FUNCIONARIO.IDPESSOA = PESSOA.IDPESSOA'
      'FUNCIONARIO.IDPESSOA = USUARIOSISTEMA.IDUSUARIO')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '50'
      '30')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1')
    ApenasLetraENum.Strings = (
      'N'
      'N'
      'N')
    ComparaMaiuscula.Strings = (
      'S'
      'S'
      'N')
    LookupSQL.Strings = (
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      '')
    Left = 436
    Top = 0
  end
  inherited CmeDetalhe: TCmEventosCadastro
    OnAbortConfirma = CmeDetalheAbortConfirma
    Left = 340
    Top = 0
  end
  inherited dsDet: TwwDataSource
    DataSet = CdsDet
    Left = 500
    Top = 0
  end
  object CdsDet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 276
  end
  object CdsModulo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 121
    Top = 232
  end
  object sqlModulo: TCMSqlParams
    SQL.Strings = (
      'SELECT IDMODULO, TRIM(NOMEMODULO) NOMEMODULO, '
      '       TRIM(NOMEMODULO) || '#39' - '#39' || IDMODULO NOME_ID'
      '  FROM MODULO'
      ' ORDER BY NOMEMODULO')
    ClientDataSet = CdsModulo
    Left = 121
    Top = 220
  end
  object CdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 585
  end
end
