inherited FrmCadRelatorio: TFrmCadRelatorio
  Left = 424
  Top = 44
  Caption = 'Cadastro de Relatórios e Gráficos'
  ClientHeight = 656
  ClientWidth = 662
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
    Width = 662
    Height = 570
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
    object lblSubConsulta1: TLabel
      Left = 20
      Top = 300
      Width = 87
      Height = 13
      Caption = 'Sub Consulta 1'
    end
    object lblSubConsulta2: TLabel
      Left = 332
      Top = 300
      Width = 87
      Height = 13
      Caption = 'Sub Consulta 2'
    end
    object BtnSubCons2Sql: TSpeedButton
      Tag = 1
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
    object lblSubConsulta3: TLabel
      Left = 20
      Top = 348
      Width = 87
      Height = 13
      Caption = 'Sub Consulta 3'
    end
    object BtnSubCons3Sql: TSpeedButton
      Tag = 2
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
    object lblSubConsulta4: TLabel
      Left = 332
      Top = 348
      Width = 87
      Height = 13
      Caption = 'Sub Consulta 4'
    end
    object BtnSubCons4Sql: TSpeedButton
      Tag = 3
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
      Top = 312
      Width = 269
      Height = 21
      ReadOnly = True
      TabOrder = 8
    end
    object edSubConsulta2: TEdit
      Left = 332
      Top = 312
      Width = 269
      Height = 21
      ReadOnly = True
      TabOrder = 9
    end
    object edSubConsulta3: TEdit
      Left = 20
      Top = 360
      Width = 269
      Height = 21
      ReadOnly = True
      TabOrder = 10
    end
    object edSubConsulta4: TEdit
      Left = 332
      Top = 360
      Width = 269
      Height = 21
      ReadOnly = True
      TabOrder = 11
    end
    object MemDescricao: TDBMemo
      Left = 20
      Top = 184
      Width = 605
      Height = 110
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
    object pnConsulta: TPanel
      Left = 16
      Top = 392
      Width = 633
      Height = 169
      TabOrder = 14
      object Label8: TLabel
        Left = 21
        Top = 41
        Width = 104
        Height = 13
        Caption = 'Nome da Consulta'
      end
      object Label9: TLabel
        Left = 348
        Top = 41
        Width = 93
        Height = 13
        Caption = 'Nome do Campo'
      end
      object Label10: TLabel
        Left = 21
        Top = 89
        Width = 154
        Height = 13
        Caption = 'Nome da Consulta de Filtro'
      end
      object SpeedButton1: TSpeedButton
        Tag = 3
        Left = 290
        Top = 101
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
        OnClick = SpeedButton1Click
      end
      object Panel1: TPanel
        Left = 16
        Top = 4
        Width = 80
        Height = 25
        TabOrder = 0
        object sbtnInsDet: TToolbarButton97
          Left = 3
          Top = 1
          Width = 25
          Height = 22
          AllowAllUp = True
          GroupIndex = 1
          DropdownArrow = False
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
            333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
            0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
            07333337F33333337F333330FFFFFFFF07333337F33333337F333330FFFFFFFF
            07333FF7F33333337FFFBBB0FFFFFFFF0BB37777F3333333777F3BB0FFFFFFFF
            0BBB3777F3333FFF77773330FFFF000003333337F333777773333330FFFF0FF0
            33333337F3337F37F3333330FFFF0F0B33333337F3337F77FF333330FFFF003B
            B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
            3BB33773333773333773B333333B3333333B7333333733333337}
          ImageIndex = 0
          Images = ImlPadrao
          Layout = blGlyphTop
          Opaque = False
          Spacing = 0
          OnClick = sbtnInsDetClick
        end
        object sbtnAltDet: TToolbarButton97
          Left = 28
          Top = 2
          Width = 25
          Height = 21
          AllowAllUp = True
          GroupIndex = 1
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
            000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
            00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
            F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
            0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
            FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
            FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
            0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
            00333377737FFFFF773333303300000003333337337777777333}
          ImageIndex = 1
          Images = ImlPadrao
          Layout = blGlyphTop
          Opaque = False
          Spacing = 0
          OnClick = sbtnAltDetClick
        end
        object sbtnExcluiDet: TToolbarButton97
          Left = 53
          Top = 2
          Width = 25
          Height = 21
          AllowAllUp = True
          GroupIndex = 1
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
            555557777F777555F55500000000555055557777777755F75555005500055055
            555577F5777F57555555005550055555555577FF577F5FF55555500550050055
            5555577FF77577FF555555005050110555555577F757777FF555555505099910
            555555FF75777777FF555005550999910555577F5F77777775F5500505509990
            3055577F75F77777575F55005055090B030555775755777575755555555550B0
            B03055555F555757575755550555550B0B335555755555757555555555555550
            BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
            50BB555555555555575F555555555555550B5555555555555575}
          ImageIndex = 2
          Images = ImlPadrao
          Layout = blGlyphTop
          Opaque = False
          Spacing = 0
          OnClick = sbtnExcluiDetClick
        end
      end
      object cbxNomeConsulta: TwwDBLookupCombo
        Left = 18
        Top = 57
        Width = 279
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NAME'#9'30'#9'NAME'#9'F')
        DataField = 'NAME'
        DataSource = dsConsultaGrid
        LookupTable = cdsNomeConsulta
        LookupField = 'NAME'
        DragCursor = crArrow
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnChange = cbxNomeConsultaChange
        OnKeyPress = cbxNomeConsultaKeyPress
      end
      object cbxNomeCampo: TwwDBLookupCombo
        Left = 346
        Top = 57
        Width = 247
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'30'#9'NOMECAMPO'#9'F')
        DataField = 'NOMECAMPO'
        DataSource = dsConsultaGrid
        LookupTable = cdsNome
        LookupField = 'NOME'
        DragCursor = crArrow
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnClick = cbxNomeCampoClick
        OnDropDown = cbxNomeCampoDropDown
        OnKeyPress = cbxNomeCampoKeyPress
      end
      object edtNomeConsulta: TEdit
        Left = 18
        Top = 105
        Width = 269
        Height = 21
        ReadOnly = True
        TabOrder = 3
      end
      object btnOK: TBitBtn
        Left = 431
        Top = 96
        Width = 81
        Height = 33
        Caption = '&Ok'
        Default = True
        TabOrder = 4
        OnClick = btnOKClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888002222200
          88888887788888778F88887222222222088888788888888878F887A228822222
          208887F88FFF888887F887A2FFF8222220888788777FF888878F7A22FFFF8222
          22087F887777FF88887F7A22FFFFF82222087F8877777FF8887F7A22FF8FFF82
          22087F8877F777FF887F7A22FF82FFF822087F8877F8777F887F7A22FF222FF8
          220878F87788877FF87887A2222222FF208887F88888887787F887A222222222
          2088878F888888888788887AA222222208888878FF88888F788888877AAAAA77
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
      end
      object btnCancelar: TBitBtn
        Left = 515
        Top = 96
        Width = 81
        Height = 33
        Cancel = True
        Caption = '&Cancelar'
        TabOrder = 5
        OnClick = btnCancelarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888009191900
          88888887788888778F88887991919191088888788888888878F8879919191919
          108887F888F888F887F887917F919F719088878887FF87FF878F7919FFF9FFF9
          19087F88777F7778887F79919FFFFF9191087F8887777788887F791919FFF919
          19087F8888777FF8887F79919FFFFF9191087F88877777FF887F7919FFF9FFF9
          190878F877787778887887917F919F71908887F88788878887F8879919191919
          1088878F88888888878888799191919108888878FF88888F7888888779999977
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
      end
      object gridConsulta: TwwDBGrid
        Left = 16
        Top = 39
        Width = 601
        Height = 121
        Selected.Strings = (
          'NAME'#9'30'#9'Nome da Consulta'#9'F'
          'NOMECAMPO'#9'20'#9'Nome do Campo'#9'F'
          'NAMEFILTRO'#9'30'#9'Consulta por Filtro'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        DataSource = dsConsultaGrid
        TabOrder = 6
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
    end
  end
  inherited Dock972: TDock97
    Width = 662
  end
  inherited Dock971: TDock97
    Top = 617
    Width = 662
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
      2
      (
        'TDBMemo'
        'Text'
        0)
      (
        'TwwDBRichEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 168
    Top = 264
  end
  inherited ImlPadrao: TImageList
    Left = 216
    Top = 264
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 320
    Top = 24
  end
  inherited Cds: TCMClientDataSet
    Left = 168
    Top = 208
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
  object MsConsulta_old: TMontaSelect
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
    Left = 192
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
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 400
    Top = 264
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
    Left = 384
    Top = 304
  end
  object ppSubConsulta2: TppBDEPipeline
    SkipWhenNoRecords = False
    UserName = 'SubConsulta2'
    Left = 376
    Top = 280
  end
  object ppSubConsulta3: TppBDEPipeline
    SkipWhenNoRecords = False
    UserName = 'SubConsulta3'
    Left = 328
    Top = 288
  end
  object ppSubConsulta4: TppBDEPipeline
    SkipWhenNoRecords = False
    UserName = 'SubConsulta4'
    Left = 280
    Top = 288
  end
  object cdsSub1: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 360
    Top = 336
  end
  object cdsSub4: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 504
    Top = 120
  end
  object dsSub4: TwwDataSource
    DataSet = cdsSub4
    Left = 472
    Top = 304
  end
  object dsSub3: TwwDataSource
    DataSet = cdsSub3
    Left = 384
    Top = 312
  end
  object dsSub2: TwwDataSource
    DataSet = cdsSub2
    Left = 424
    Top = 72
  end
  object dsSub1: TwwDataSource
    DataSet = cdsSub1
    Left = 416
    Top = 32
  end
  object cdsSub2: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 488
    Top = 304
  end
  object cdsSub3: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 472
    Top = 288
  end
  object SqlConsulta: TCMSqlParams
    ClientDataSet = CdsConsulta
    Left = 536
    Top = 336
  end
  object dsNomeConsulta: TwwDataSource
    DataSet = cdsNomeConsulta
    Left = 376
    Top = 616
  end
  object cdsNomeConsulta: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 376
    Top = 656
  end
  object cdsConsultaGrid: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 384
    Top = 488
  end
  object dsConsultaGrid: TwwDataSource
    AutoEdit = False
    DataSet = cdsConsultaGrid
    Left = 384
    Top = 440
  end
  object cdsNomeCampo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 112
    Top = 552
  end
  object cdsCampo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 112
    Top = 496
  end
  object cdsNome: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 112
    Top = 440
  end
  object cdsNomeConsultaFiltro: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 224
    Top = 440
  end
end
