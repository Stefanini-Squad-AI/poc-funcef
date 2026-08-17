inherited FrmCadRelatorio: TFrmCadRelatorio
  Left = 327
  Top = 19
  Caption = 'Cadastro de Relatórios '
  ClientHeight = 691
  ClientWidth = 649
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label12: TLabel [0]
    Left = 400
    Top = 504
    Width = 46
    Height = 13
    Caption = 'Label12'
  end
  inherited pnlFundo: TPanel
    Width = 649
    Height = 605
    inherited pnlMestre: TPanel
      Width = 647
      Height = 400
      TabOrder = 16
      object Label2: TLabel
        Left = 20
        Top = 12
        Width = 33
        Height = 13
        Caption = 'Nome'
      end
      object Label3: TLabel
        Left = 20
        Top = 52
        Width = 50
        Height = 13
        Caption = 'Consulta'
      end
      object Label4: TLabel
        Left = 314
        Top = 52
        Width = 45
        Height = 13
        Caption = 'Sistema'
      end
      object Label5: TLabel
        Left = 20
        Top = 96
        Width = 35
        Height = 13
        Caption = 'Grupo'
      end
      object Label1: TLabel
        Left = 20
        Top = 168
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object BtnConsGrupo: TSpeedButton
        Left = 280
        Top = 104
        Width = 25
        Height = 25
        Hint = 'Procura Grupo'
        Glyph.Data = {
          4E010000424D4E01000000000000760000002800000014000000120000000100
          040000000000D800000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777BBBBBBBBB
          BBBBB777000077BBBBBBBBBBBBBBBB7700007BBB777777777777BBB700007BB8
          8000000000008BB700007BB77777777777777BB700007BBB878787870087BBB7
          000077BBBBBBB00BB0BBBB770000777BBBB003B338BBB77700007777770FFF33
          0777777700007787808FFFF308787877000077770378FFF07777777700007780
          37338FF078787877000077037333380777777777000070373333807878787877
          0000737333380777777777770000773333807878787878770000733338077777
          777777770000733380787878787878770000}
        ParentShowHint = False
        ShowHint = True
        OnClick = BtnConsGrupoClick
      end
      object BtnConsSql: TSpeedButton
        Left = 280
        Top = 61
        Width = 25
        Height = 25
        Hint = 'Procura Consultas'
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777770000000
          0000777770FF7FFF7FF0777770FF7FFF7FF0777770FF7FFF7FF0777770FF7FFF
          7FF0777770FF7FFF7FF000000088888888800FF7F0CCCCCCCCC00FF7F0000000
          00000FF7FFF7FF0777770FF7FFF7FF0777770FF7FFF7FF077777088888888807
          77770CCCCCCCCC07777700000000000777777777777777777777}
        ParentShowHint = False
        ShowHint = True
        OnClick = BtnConsSqlClick
      end
      object Label6: TLabel
        Left = 508
        Top = 12
        Width = 40
        Height = 13
        Caption = 'Código'
      end
      object Label7: TLabel
        Left = 596
        Top = 28
        Width = 7
        Height = 13
        Caption = '/'
      end
      object BtnSubCons1Sql: TSpeedButton
        Left = 288
        Top = 261
        Width = 25
        Height = 25
        Hint = 'Procura Consultas'
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777770000000
          0000777770FF7FFF7FF0777770FF7FFF7FF0777770FF7FFF7FF0777770FF7FFF
          7FF0777770FF7FFF7FF000000088888888800FF7F0CCCCCCCCC00FF7F0000000
          00000FF7FFF7FF0777770FF7FFF7FF0777770FF7FFF7FF077777088888888807
          77770CCCCCCCCC07777700000000000777777777777777777777}
        ParentShowHint = False
        ShowHint = True
        OnClick = BtnSubConsSqlClick
      end
      object lblSubConsulta1: TLabel
        Left = 20
        Top = 253
        Width = 87
        Height = 13
        Caption = 'Sub Consulta 1'
      end
      object lblSubConsulta2: TLabel
        Left = 332
        Top = 253
        Width = 87
        Height = 13
        Caption = 'Sub Consulta 2'
      end
      object BtnSubCons2Sql: TSpeedButton
        Tag = 1
        Left = 600
        Top = 261
        Width = 25
        Height = 25
        Hint = 'Procura Consultas'
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777770000000
          0000777770FF7FFF7FF0777770FF7FFF7FF0777770FF7FFF7FF0777770FF7FFF
          7FF0777770FF7FFF7FF000000088888888800FF7F0CCCCCCCCC00FF7F0000000
          00000FF7FFF7FF0777770FF7FFF7FF0777770FF7FFF7FF077777088888888807
          77770CCCCCCCCC07777700000000000777777777777777777777}
        ParentShowHint = False
        ShowHint = True
        OnClick = BtnSubConsSqlClick
      end
      object lblSubConsulta3: TLabel
        Left = 20
        Top = 301
        Width = 87
        Height = 13
        Caption = 'Sub Consulta 3'
      end
      object BtnSubCons3Sql: TSpeedButton
        Tag = 2
        Left = 288
        Top = 309
        Width = 25
        Height = 25
        Hint = 'Procura Consultas'
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777770000000
          0000777770FF7FFF7FF0777770FF7FFF7FF0777770FF7FFF7FF0777770FF7FFF
          7FF0777770FF7FFF7FF000000088888888800FF7F0CCCCCCCCC00FF7F0000000
          00000FF7FFF7FF0777770FF7FFF7FF0777770FF7FFF7FF077777088888888807
          77770CCCCCCCCC07777700000000000777777777777777777777}
        ParentShowHint = False
        ShowHint = True
        OnClick = BtnSubConsSqlClick
      end
      object lblSubConsulta4: TLabel
        Left = 332
        Top = 301
        Width = 87
        Height = 13
        Caption = 'Sub Consulta 4'
      end
      object BtnSubCons4Sql: TSpeedButton
        Tag = 3
        Left = 600
        Top = 309
        Width = 25
        Height = 25
        Hint = 'Procura Consultas'
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777770000000
          0000777770FF7FFF7FF0777770FF7FFF7FF0777770FF7FFF7FF0777770FF7FFF
          7FF0777770FF7FFF7FF000000088888888800FF7F0CCCCCCCCC00FF7F0000000
          00000FF7FFF7FF0777770FF7FFF7FF0777770FF7FFF7FF077777088888888807
          77770CCCCCCCCC07777700000000000777777777777777777777}
        ParentShowHint = False
        ShowHint = True
        OnClick = BtnSubConsSqlClick
      end
      object BtnSubCons5Sql: TSpeedButton
        Tag = 4
        Left = 288
        Top = 357
        Width = 25
        Height = 25
        Hint = 'Procura Consultas'
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777770000000
          0000777770FF7FFF7FF0777770FF7FFF7FF0777770FF7FFF7FF0777770FF7FFF
          7FF0777770FF7FFF7FF000000088888888800FF7F0CCCCCCCCC00FF7F0000000
          00000FF7FFF7FF0777770FF7FFF7FF0777770FF7FFF7FF077777088888888807
          77770CCCCCCCCC07777700000000000777777777777777777777}
        ParentShowHint = False
        ShowHint = True
        OnClick = BtnSubConsSqlClick
      end
      object BtnSubCons6Sql: TSpeedButton
        Tag = 5
        Left = 600
        Top = 357
        Width = 25
        Height = 25
        Hint = 'Procura Consultas'
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777770000000
          0000777770FF7FFF7FF0777770FF7FFF7FF0777770FF7FFF7FF0777770FF7FFF
          7FF0777770FF7FFF7FF000000088888888800FF7F0CCCCCCCCC00FF7F0000000
          00000FF7FFF7FF0777770FF7FFF7FF0777770FF7FFF7FF077777088888888807
          77770CCCCCCCCC07777700000000000777777777777777777777}
        ParentShowHint = False
        ShowHint = True
        OnClick = BtnSubConsSqlClick
      end
      object lblSubConsulta5: TLabel
        Left = 20
        Top = 349
        Width = 87
        Height = 13
        Caption = 'Sub Consulta 5'
      end
      object lblSubConsulta6: TLabel
        Left = 332
        Top = 349
        Width = 87
        Height = 13
        Caption = 'Sub Consulta 6'
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 401
      Width = 647
      Height = 203
      TabOrder = 17
      Tabs.Strings = (
        'Filtros da Consulta')
      inherited Dock974: TDock97 [0]
        Left = 553
        Height = 144
      end
      inherited pgctrlDetalhe: TPageControl [1]
        Width = 549
        Height = 144
        inherited tbsDet: TTabSheet
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 541
            Height = 116
            Selected.Strings = (
              'NAME'#9'21'#9'Consulta'
              'NOMECAMPO'#9'21'#9'Filtro da Consulta'
              'NAMEFILTRO'#9'21'#9'Consulta de Filtro'
              'FILTRO'#9'21'#9'Filtro')
            DataSource = dsConsultaGrid
            TabOrder = 0
            OnDblClick = nil
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 541
            Height = 116
            TabOrder = 1
            object Label8: TLabel
              Left = 13
              Top = 17
              Width = 50
              Height = 13
              Caption = 'Consulta'
            end
            object Label9: TLabel
              Left = 276
              Top = 17
              Width = 100
              Height = 13
              Caption = 'Filtro da Consulta'
            end
            object Label10: TLabel
              Left = 13
              Top = 73
              Width = 100
              Height = 13
              Caption = 'Consulta de Filtro'
            end
            object BtnSubConsFiltro: TSpeedButton
              Tag = 3
              Left = 226
              Top = 85
              Width = 25
              Height = 25
              Hint = 'Procura Consultas'
              Glyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                0400000000008000000000000000000000001000000010000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777770000000
                0000777770FF7FFF7FF0777770FF7FFF7FF0777770FF7FFF7FF0777770FF7FFF
                7FF0777770FF7FFF7FF000000088888888800FF7F0CCCCCCCCC00FF7F0000000
                00000FF7FFF7FF0777770FF7FFF7FF0777770FF7FFF7FF077777088888888807
                77770CCCCCCCCC07777700000000000777777777777777777777}
              ParentShowHint = False
              ShowHint = True
              OnClick = BtnSubConsFiltroClick
            end
            object Label13: TLabel
              Left = 276
              Top = 73
              Width = 29
              Height = 13
              Caption = 'Filtro'
            end
            object cbxFiltro: TwwDBLookupCombo
              Left = 274
              Top = 89
              Width = 223
              Height = 21
              DropDownAlignment = taLeftJustify
              DataField = 'FILTRO'
              DataSource = dsConsultaGrid
              LookupTable = cdsFiltro
              LookupField = 'NOME'
              DragCursor = crArrow
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object cbxNomeCampo: TwwDBLookupCombo
              Left = 274
              Top = 33
              Width = 223
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'30'#9'NOMECAMPO'#9'F')
              DataField = 'NOMECAMPO'
              DataSource = dsConsultaGrid
              LookupTable = cdsNome
              LookupField = 'NOME'
              DragCursor = crArrow
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
              OnClick = cbxNomeCampoClick
              OnDropDown = cbxNomeCampoDropDown
              OnKeyPress = cbxNomeCampoKeyPress
            end
            object cbxNomeConsulta: TwwDBLookupCombo
              Left = 10
              Top = 33
              Width = 239
              Height = 21
              DropDownAlignment = taLeftJustify
              DataField = 'NAME'
              DataSource = dsConsultaGrid
              LookupTable = cdsNomeConsulta
              LookupField = 'NAME'
              DragCursor = crArrow
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
              OnChange = cbxNomeConsultaChange
              OnKeyPress = cbxNomeConsultaKeyPress
            end
            object dbConsultaFiltro: TDBEdit
              Left = 12
              Top = 88
              Width = 213
              Height = 21
              DataField = 'NAMEFILTRO'
              DataSource = dsConsultaGrid
              TabOrder = 3
            end
          end
        end
      end
      inherited Dock973: TDock97 [2]
        Width = 639
      end
    end
    object CbModulo: TwwDBLookupCombo
      Left = 312
      Top = 64
      Width = 314
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOMEMODULO'#9'50'#9'NOMEMODULO')
      DataField = 'IDMODULO'
      DataSource = ds
      LookupTable = CdsModulo
      LookupField = 'IDMODULO'
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object EdNome: TwwDBEdit
      Left = 20
      Top = 24
      Width = 477
      Height = 21
      DataField = 'NAME'
      DataSource = ds
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object BtnDesenho: TBitBtn
      Left = 508
      Top = 92
      Width = 117
      Height = 53
      Caption = '&Desenho'
      TabOrder = 5
      OnClick = BtnDesenhoClick
      Glyph.Data = {
        1E040000424D1E04000000000000760000002800000030000000270000000100
        040000000000A803000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888888888888888888888888888888888888888888888888888888888
        8888888888888888888888888888888888888888888888888888888888888888
        8888888888888888888888888888888888888888888888888888888888888888
        8777777777777777888888888888888888888880000000000000000000000007
        888888888888888888888880FBFBFBFBFBFBFBFBFBFBFB078888888888888888
        88888880B0BFBFB0BFBFB0BFBFB0BF07888888888888888888888880F0FB0BF0
        FB0BF0FB0BF0FB07888888888888888888888880000000000000000000000008
        88888888888888888888888880EEEEEEEEEEEEE0788888888888888888888888
        8888888880EEEEEEEEEEEE078888888888888888888888888888888880EE0000
        0EEEE07F8F8F8F8888888888888888888888888880EE0870EEEE07F8F8F8F8F8
        88888888888888888888888880EE080EEEE0077F8F8F8F888888888888888888
        8888888880EE00EEEE0770007788888888888888888888888888888880EE0EEE
        E07887F70077888888888888888888888888888880EEEEEE078887FF77077788
        88888888888888888888888880EEEEE08888887FF70088778888888888888888
        8888888880EEEE088888887FF033087778888888888888888888888880EEE088
        88888880F003307778888888888888888888888880EE0888888888880BB03307
        78778888888888888888888880E088888888888880BB03307888888888888888
        888888888008888888888888880BB03308777777787888888888888880888888
        888888888880BB0330F888888877888888888888888888888888888888880BB0
        3308877777777788888888888888888888888888888880BB0330888777777777
        8888888888888888888888888888880BB0330888877777777888888888888888
        8888888888888880BB0330888880000008888888888888888888888888888888
        0BB03308888880008888888888888888888888888888888880BB006088888888
        88888888888888888888888888888888880B0E00088888888888888888888888
        88888888888888888880E0870088888888888888888888888888888888888888
        88880F887088888888888888888888888888888888888888888880F808888888
        8888888888888888888888888888888888888800888888888888888888888888
        8888888888888888888888888888888888888888888888888888888888888888
        8888888888888888888888888888888888888888888888888888888888888888
        8888}
    end
    object EdConsulta: TEdit
      Left = 20
      Top = 64
      Width = 261
      Height = 21
      ReadOnly = True
      TabOrder = 1
    end
    object EdGrupo: TEdit
      Left = 20
      Top = 108
      Width = 261
      Height = 21
      ReadOnly = True
      TabOrder = 3
    end
    object DbEdCodigo: TwwDBEdit
      Left = 508
      Top = 24
      Width = 85
      Height = 21
      DataField = 'IDREPORTS'
      DataSource = ds
      Enabled = False
      TabOrder = 6
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object DbEdOrigem: TwwDBEdit
      Left = 606
      Top = 24
      Width = 19
      Height = 21
      DataField = 'ORIGEMCM'
      DataSource = ds
      Enabled = False
      TabOrder = 7
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object GroupBox1: TGroupBox
      Left = 312
      Top = 88
      Width = 169
      Height = 89
      Caption = 'Outros'
      TabOrder = 4
      object ChkFiltro: TDBCheckBox
        Left = 14
        Top = 16
        Width = 131
        Height = 17
        Caption = 'Exibe Tela de Filtro'
        DataField = 'FLGFILTROMANUAL'
        DataSource = ds
        TabOrder = 0
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object chkSubReport: TDBCheckBox
        Left = 14
        Top = 40
        Width = 131
        Height = 17
        Caption = 'Tem Sub-Relatorio?'
        DataField = 'FLGSUBREPORT'
        DataSource = ds
        TabOrder = 1
        ValueChecked = 'S'
        ValueUnchecked = 'N'
        OnClick = chkSubReportClick
      end
      object chkRelatAtivo: TDBCheckBox
        Left = 14
        Top = 64
        Width = 131
        Height = 17
        Caption = 'Relatório ativo?'
        DataField = 'FLGRELATATIVO'
        DataSource = ds
        TabOrder = 2
        ValueChecked = 'S'
        ValueUnchecked = 'N'
        OnClick = chkSubReportClick
      end
    end
    object edSubConsulta1: TEdit
      Left = 20
      Top = 265
      Width = 269
      Height = 21
      ReadOnly = True
      TabOrder = 8
    end
    object edSubConsulta2: TEdit
      Left = 332
      Top = 265
      Width = 269
      Height = 21
      ReadOnly = True
      TabOrder = 9
    end
    object edSubConsulta3: TEdit
      Left = 20
      Top = 313
      Width = 269
      Height = 21
      ReadOnly = True
      TabOrder = 10
    end
    object edSubConsulta4: TEdit
      Left = 332
      Top = 313
      Width = 269
      Height = 21
      ReadOnly = True
      TabOrder = 11
    end
    object MemDescricao: TDBMemo
      Left = 20
      Top = 184
      Width = 605
      Height = 65
      DataField = 'DESCRIPTION'
      DataSource = ds
      ScrollBars = ssVertical
      TabOrder = 12
    end
    object ckbExporta: TDBCheckBox
      Left = 22
      Top = 144
      Width = 131
      Height = 17
      Caption = 'Exporta Relatório'
      DataField = 'FLGEXPORTADADOS'
      DataSource = ds
      TabOrder = 13
      ValueChecked = 'S'
      ValueUnchecked = 'N'
      OnClick = ckbExportaClick
    end
    object edSubConsulta5: TEdit
      Left = 20
      Top = 361
      Width = 269
      Height = 21
      ReadOnly = True
      TabOrder = 14
    end
    object edSubConsulta6: TEdit
      Left = 332
      Top = 361
      Width = 269
      Height = 21
      ReadOnly = True
      TabOrder = 15
    end
  end
  inherited Dock972: TDock97
    Width = 649
  end
  inherited Dock971: TDock97
    Top = 652
    Width = 649
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        ModalResult = 0
      end
      inherited bbtnCancelar: TBitBtn
        ModalResult = 0
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 344
    Top = 216
    TargetsData = (
      1
      3
      (
        'TDBMemo'
        'Text'
        0)
      (
        'TwwDBRichEdit'
        'Text'
        0)
      (
        ''
        'DisplayLabel'
        0))
  end
  inherited ds: TwwDataSource
    Left = 128
    Top = 84
  end
  inherited ImlPadrao: TImageList
    Left = 216
    Top = 264
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 320
    Top = 24
  end
  inherited Cds: TCMClientDataSet
    Left = 84
    Top = 84
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'REPORTS.NAME'
      'DATAVIEW.NAME'
      'GRUPORELATORIO.DESCRICAO'
      'MODULO.NOMEMODULO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nome do Relatório'
      'Nome da Consulta'
      'Grupo do Relatório'
      'Módulo Relacionado')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'MODULO'
      'GRUPORELATORIO'
      'REPORTS'
      'DATAVIEW')
    CamposChave.Strings = (
      'REPORTS.IDREPORTS'
      'REPORTS.ORIGEMCM')
    Filtro.Strings = (
      'REPORTS.IDMODULO = MODULO.IDMODULO'
      'REPORTS.IDDATAVIEW = DATAVIEW.IDDATAVIEW'
      'REPORTS.ORIGEMCMDV = DATAVIEW.ORIGEMCMDV'
      'REPORTS.IDGRUPORELATORIO = GRUPORELATORIO.IDGRUPORELATORIO'
      'REPORTS.ORIGEMCMGR = GRUPORELATORIO.ORIGEMCMGR')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '50'
      '40'
      '40'
      '30')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1')
    ApenasLetraENum.Strings = (
      'N'
      'N'
      'N'
      'N')
    ComparaMaiuscula.Strings = (
      ''
      ''
      ''
      '')
    LookupSQL.Strings = (
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      '')
    Top = 88
  end
  object ppConsulta: TppBDEPipeline
    SkipWhenNoRecords = False
    UserName = 'Consulta'
    Left = 504
    Top = 264
  end
  object DsgnCM: TppDesigner
    Caption = 'Gerador de Relatórios e Gráficos'
    DataSettings.DatabaseName = 'BaseDados'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Icon.Data = {
      0000010001002020100000000000E80200001600000028000000200000004000
      0000010004000000000080020000000000000000000000000000000000000000
      000000008000008000000080800080000000800080008080000080808000C0C0
      C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
      0000000000033333300003333330000000000000003BBBBBB3003BBBBBB30000
      00000000003BBBBBB3003BBBBBB30000000000000003BBBB3003BBBBBB300000
      000000000003BBBB3003BBBBB3000000000000000003BBBB3003BBBB30000000
      000000000003BBBBB33BBBBB30000000000000000003BBBBBBBBBBB300000000
      000000000003BBBBBBBBBBB300000000000000700003BBBB333BBBBB30000000
      000000800003BBBB3003BBBBB30000000000F8F00003BBBB3003BBBBB3000000
      008F8F800003BBBB3003BBBBB3000070F8F877F80003BBBB333BBBBBB300007F
      8F00F08F003BBBBBBBBBBBBB3000007800FFF048003BBBBBBBBBBBB300000000
      FFFFF08F8003333333333330000070FFFFCCF804F07000000000000000007FFF
      CCFFFF0F8F0000000000000000007FCCFFFCCF074807000000000000000078FF
      FCCFFFF08F80700000000000000007FCCFFFCCF044F8070000000000000007FF
      FFCCFFFF0F8F8000000000000000078FCCFFFCCF07F77000000000000000007F
      FFFCCFFFF07000000000000000000078FCCFFFCCFF0700000000000000000007
      FFFFCCFFFF80000000000000000000078FCCFFFF877000000000000000000000
      7FFFFF8770000000000000000000000007FF8770000000000000000000000000
      007770000000000000000000000000000000000000000000000000000000FFFE
      0781FFFC0300FFFC0300FFFE0601FFFE0603FFFE0607FFFE0007FFFE000FFFFE
      000FFFDE0007FF0E0603FC0E0603F00E0603C0060003C0040007C004000FC002
      001F0001FFFF0001FFFF0000FFFF00007FFF80003FFF80003FFF80007FFFC001
      FFFFC000FFFFE000FFFFE001FFFFF007FFFFF81FFFFFFC7FFFFFFFFFFFFF}
    MergeMenu = MergeMenu
    Position = poScreenCenter
    ShowComponents = [scLabel, scMemo, scRichText, scCalc, scImage, scShape, scLine, scBarCode, scDBText, scDBMemo, scDBRichText, scDBCalc, scDBImage, scDBBarCode, scRegion, scSubReport, scSystemVariable, scVariable]
    RAPInterface = [riNotebookTab]
    Report = RptCM
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    WindowState = wsMaximized
    OnCreate = DsgnCMCreate
    Left = 448
    Top = 264
  end
  object RptModelo: TppReport
    AutoStop = False
    DataPipeline = ppConsulta
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Template.Format = ftASCII
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 456
    Top = 216
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppConsulta'
    object HeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 17727
      mmPrintPosition = 0
      object Label11: TppLabel
        UserName = 'Label11'
        Caption = 'Título do Relatório'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 0
        mmTop = 8731
        mmWidth = 197380
        BandType = 0
      end
      object Line1: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 16669
        mmWidth = 197300
        BandType = 0
      end
      object LblEmpresa: TppLabel
        UserName = 'LblEmpresa'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 84138
        mmTop = 1588
        mmWidth = 29633
        BandType = 0
      end
    end
    object DetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object FooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object Line2: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object LblSistema: TppLabel
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 3175
        mmWidth = 197909
        BandType = 8
      end
      object Calc2: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 3175
        mmWidth = 197380
        BandType = 8
      end
      object Calc1: TppSystemVariable
        UserName = 'Calc1'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 171450
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
  end
  object MsConsulta_new: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'DATAVIEW.NAME'
      'SUBSTR(DATAVIEW.DESCRIPTION,1,200)')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Consulta'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'DATAVIEW'
      'DATAVIEW DT'
      'REPORTSLISTADATAVIEW RP')
    CamposChave.Strings = (
      'DATAVIEW.IDDATAVIEW'
      'DATAVIEW.ORIGEMCMDV'
      'DATAVIEW.NAME'
      'RP.FILTRO')
    Filtro.Strings = (
      'DATAVIEW.IDDATAVIEW = RP.IDDATAVIEWORIGEM'
      'DATAVIEW.ORIGEMCMDV = RP.ORIGEMCMDV'
      'DT.IDDATAVIEW = RP.IDDATAVIEWCONSULTA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '50'
      '200')
    OperComparador.Strings = (
      '-1'
      '-1')
    ApenasLetraENum.Strings = (
      'N'
      'N')
    ComparaMaiuscula.Strings = (
      ''
      '')
    DataBaseName = 'BASEDADOS'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      '')
    Left = 204
    Top = 136
  end
  object MsGrupo: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'GRUPORELATORIO.DESCRICAO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Grupo')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'GRUPORELATORIO')
    CamposChave.Strings = (
      'GRUPORELATORIO.IDGRUPORELATORIO'
      'GRUPORELATORIO.ORIGEMCMGR'
      'GRUPORELATORIO.DESCRICAO')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    OperComparador.Strings = (
      '-1')
    ApenasLetraENum.Strings = (
      'N')
    ComparaMaiuscula.Strings = (
      '')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      '')
    LookupCampoChave.Strings = (
      '')
    LookupCampoExibe.Strings = (
      '')
    Left = 320
    Top = 256
  end
  object CdsModulo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 216
    Top = 216
  end
  object CdsAux: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 48
    Top = 264
    Data = {
      C50100009619E0BD01000000180000000E000000000003000000C501044E414D
      4501004900000001000557494454480200020064000949445245504F52545308
      00040000000000084F524947454D434D0800040000000000104944475255504F
      52454C41544F52494F08000400000000000849444D4F44554C4F080004000000
      00000A4F524947454D434D475208000400000000000B4445534352495054494F
      4E04004B00000002000753554254595045020049000500546578740005574944
      544802000200F4010854454D504C41544504004B000000020007535542545950
      4502004900070042696E617279000557494454480200020001000A4944444154
      415649455708000400000000000A4F524947454D434D44560800040000000000
      0F464C4746494C54524F4D414E55414C01004900000002000753554254595045
      020049000A00466978656443686172000557494454480200020001000B464F52
      4D4556454E544F530100490000000100055749445448020002001E000C464F52
      4D504152414D52454C0100490000000100055749445448020002001E00085050
      5245504F52540100490000000100055749445448020002001E000100044C4349
      440400010009080000}
  end
  object SqlParReports: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   NAME,'
      '   IDREPORTS,'
      '   ORIGEMCM,'
      '   IDGRUPORELATORIO,'
      '   IDMODULO,'
      '   ORIGEMCMGR,'
      '   DESCRIPTION,'
      '   TEMPLATE,'
      '   IDDATAVIEW,'
      '   ORIGEMCMDV,'
      '   FLGFILTROMANUAL,'
      '   FORMEVENTOS,'
      '   FORMPARAMREL,'
      '   PPREPORT'
      'FROM'
      '   REPORTS'
      'WHERE'
      '   IDREPORTS = :PIDREPORTS  AND'
      '   ORIGEMCM  = :PORIGEMCM')
    ClientDataSet = CdsAux
    Left = 48
    Top = 216
  end
  object MergeMenu: TMainMenu
    Left = 408
    Top = 240
    object mniFile: TMenuItem
      Caption = '&Arquivo'
      GroupIndex = 10
      object mnuAbrir: TMenuItem
        Caption = '&Abrir'
        OnClick = mnuAbrirClick
      end
      object mniFileSave: TMenuItem
        Caption = '&Salvar'
        ShortCut = 16467
        OnClick = mniFileSaveClick
      end
      object mnuSalvarComo: TMenuItem
        Caption = 'Salvar &como...'
        OnClick = mnuSalvarComoClick
      end
      object mniFileLine3: TMenuItem
        Caption = '-'
      end
      object mniFilePageSetup: TMenuItem
        Caption = 'Configurar &Página'
        OnClick = mniFilePageSetupClick
      end
      object mniFilePrintToFileSetup: TMenuItem
        Caption = 'Configuração da &Impressão Para Arquivo'
        OnClick = mniFilePrintToFileSetupClick
      end
      object mniFileLine4: TMenuItem
        Caption = '-'
      end
      object mniFilePrint: TMenuItem
        Caption = '&Imprimir'
        ShortCut = 16464
        OnClick = mniFilePrintClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Sair1: TMenuItem
        Caption = 'Sair'
        OnClick = Sair1Click
      end
    end
  end
  object CdsConsulta: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 120
    Top = 216
  end
  object dsConsulta: TDataSource
    DataSet = CdsConsulta
    Left = 120
    Top = 264
  end
  object RptCM: TppReport
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 512
    Top = 216
    Version = '7.04'
    mmColumnWidth = 0
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppParameterList1: TppParameterList
    end
  end
  object dlgAbrir: TOpenDialog
    DefaultExt = '*.rcm'
    Filter = 'Relatórios CM|*.rcm'
    Left = 560
    Top = 216
  end
  object dlgSalvar: TSaveDialog
    DefaultExt = '*.rcm'
    Filter = 'Relatórios CM|*.rcm'
    Left = 560
    Top = 264
  end
  object ppSubConsulta1: TppBDEPipeline
    SkipWhenNoRecords = False
    UserName = 'SubConsulta1'
    Left = 128
    Top = 312
  end
  object ppSubConsulta2: TppBDEPipeline
    SkipWhenNoRecords = False
    UserName = 'SubConsulta2'
    Left = 440
    Top = 312
  end
  object ppSubConsulta3: TppBDEPipeline
    SkipWhenNoRecords = False
    UserName = 'SubConsulta3'
    Left = 128
    Top = 360
  end
  object ppSubConsulta4: TppBDEPipeline
    SkipWhenNoRecords = False
    UserName = 'SubConsulta4'
    Left = 440
    Top = 360
  end
  object cdsSub1: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 232
    Top = 312
  end
  object cdsSub4: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 552
    Top = 360
  end
  object dsSub4: TwwDataSource
    DataSet = cdsSub4
    Left = 496
    Top = 360
  end
  object dsSub3: TwwDataSource
    DataSet = cdsSub3
    Left = 176
    Top = 360
  end
  object dsSub2: TwwDataSource
    DataSet = cdsSub2
    Left = 496
    Top = 312
  end
  object dsSub1: TwwDataSource
    DataSet = cdsSub1
    Left = 176
    Top = 312
  end
  object cdsSub2: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 552
    Top = 312
  end
  object SqlConsulta: TCMSqlParams
    ClientDataSet = CdsConsulta
    Left = 484
    Top = 180
  end
  object dsNomeConsulta: TwwDataSource
    DataSet = cdsNomeConsulta
    Left = 104
    Top = 472
  end
  object cdsNomeConsulta: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 168
    Top = 556
  end
  object cdsConsultaGrid: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 244
    Top = 468
  end
  object dsConsultaGrid: TwwDataSource
    DataSet = cdsConsultaGrid
    Left = 172
    Top = 472
  end
  object cdsNomeCampo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 384
    Top = 476
  end
  object cdsCampo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 456
    Top = 476
  end
  object cdsNome: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 324
    Top = 560
  end
  object cdsNomeConsultaFiltro: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 164
    Top = 612
  end
  object ppBDEPipeline1: TppBDEPipeline
    SkipWhenNoRecords = False
    UserName = 'BDEPipeline1'
    Left = 296
    Top = 216
  end
  object ppSubConsulta5: TppBDEPipeline
    SkipWhenNoRecords = False
    UserName = 'SubConsulta5'
    Left = 128
    Top = 408
  end
  object ppSubConsulta6: TppBDEPipeline
    SkipWhenNoRecords = False
    UserName = 'SubConsulta6'
    Left = 440
    Top = 408
  end
  object dsSub5: TDataSource
    DataSet = CdsSub5
    Left = 176
    Top = 407
  end
  object dsSub6: TDataSource
    DataSet = CdsSub6
    Left = 496
    Top = 407
  end
  object cdsSub3: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 232
    Top = 360
  end
  object CdsSub5: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 236
    Top = 408
  end
  object CdsSub6: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 552
    Top = 408
  end
  object cdsFiltro: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 325
    Top = 611
  end
  object MsConsulta: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'DATAVIEW.NAME'
      'SUBSTR(DATAVIEW.DESCRIPTION,1,200)')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Consulta'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'DATAVIEW')
    CamposChave.Strings = (
      'DATAVIEW.IDDATAVIEW'
      'DATAVIEW.ORIGEMCMDV'
      'DATAVIEW.NAME')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '50'
      '200')
    OperComparador.Strings = (
      '-1'
      '-1')
    ApenasLetraENum.Strings = (
      'N'
      'N')
    ComparaMaiuscula.Strings = (
      ''
      '')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      '')
    Left = 128
    Top = 136
  end
end
