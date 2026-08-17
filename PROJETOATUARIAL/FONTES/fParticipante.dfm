inherited frmParticipante: TfrmParticipante
  Left = 156
  Top = 178
  HelpContext = 40166
  ActiveControl = DBEdit4
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  Caption = 'Participante'
  ClientHeight = 426
  ClientWidth = 769
  PrintScale = poNone
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 769
    Height = 340
    object Label7: TLabel
      Left = 218
      Top = 9
      Width = 33
      Height = 13
      Caption = 'Nome'
    end
    object Label8: TLabel
      Left = 30
      Top = 9
      Width = 55
      Height = 13
      Caption = 'Matrícula'
    end
    object Label1: TLabel
      Left = 30
      Top = 135
      Width = 68
      Height = 13
      Caption = 'Estado Civil'
    end
    object Label4: TLabel
      Left = 240
      Top = 135
      Width = 124
      Height = 13
      Caption = 'Categoria Profissional'
    end
    object Label2: TLabel
      Left = 30
      Top = 254
      Width = 99
      Height = 13
      Caption = 'Grupo de Cálculo'
    end
    object Label5: TLabel
      Left = 217
      Top = 49
      Width = 51
      Height = 13
      Caption = 'Regional'
    end
    object Label6: TLabel
      Left = 30
      Top = 49
      Width = 24
      Height = 13
      Caption = 'CPF'
    end
    object Label9: TLabel
      Left = 308
      Top = 175
      Width = 152
      Height = 13
      Caption = 'Situação na Patrocinadora'
    end
    object Label10: TLabel
      Left = 30
      Top = 175
      Width = 129
      Height = 13
      Caption = 'Situação na Fundação'
    end
    object Label3: TLabel
      Left = 30
      Top = 214
      Width = 66
      Height = 13
      Caption = 'Plano Atual'
    end
    object Label11: TLabel
      Left = 309
      Top = 214
      Width = 81
      Height = 13
      Caption = 'Plano Anterior'
    end
    object Label12: TLabel
      Left = 308
      Top = 254
      Width = 64
      Height = 13
      Caption = 'Vinculação'
    end
    object Label13: TLabel
      Left = 30
      Top = 97
      Width = 92
      Height = 13
      Caption = 'Outra Fundação'
    end
    object DBEdit2: TDBEdit
      Left = 215
      Top = 23
      Width = 361
      Height = 21
      AutoSelect = False
      DataField = 'NO_PESSOA'
      DataSource = ds
      TabOrder = 1
    end
    object DBEdit4: TDBEdit
      Left = 30
      Top = 23
      Width = 176
      Height = 21
      AutoSelect = False
      DataField = 'NR_MATRICULA'
      DataSource = ds
      TabOrder = 0
    end
    object DBRdGrpSexo: TDBRadioGroup
      Left = 584
      Top = 18
      Width = 176
      Height = 54
      Caption = 'Sexo'
      DataField = 'IR_SEXO'
      DataSource = ds
      Items.Strings = (
        'Feminino'
        'Masculino')
      TabOrder = 4
      Values.Strings = (
        'F'
        'M')
    end
    object LkcTbEstCivil: TwwDBLookupCombo
      Left = 30
      Top = 149
      Width = 188
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DS_ESTADO_CIVIL'#9'20'#9'Estado Civil')
      DataField = 'CD_ESTADO_CIVIL'
      DataSource = ds
      LookupTable = qryEstCivil
      LookupField = 'CD_ESTADO_CIVIL'
      Options = [loColLines, loRowLines]
      TabOrder = 7
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
    end
    object LkcTbCatProf: TwwDBLookupCombo
      Left = 240
      Top = 149
      Width = 336
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DS_TIPO_CAT_PROF_ESP'#9'60'#9'Tipo de Categoria Profissional')
      DataField = 'CD_TIPO_CAT_PROF_ESP'
      DataSource = ds
      LookupTable = qryCatProf
      LookupField = 'CD_TIPO_CAT_PROF_ESP'
      Options = [loColLines, loRowLines]
      TabOrder = 10
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
    end
    object LkcTbGrupoCalc: TwwDBLookupCombo
      Left = 30
      Top = 268
      Width = 268
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NO_GRUPO_PARTIC'#9'60'#9'Grupo de Cálculo')
      DataField = 'CD_GRUPO_CALCULO'
      DataSource = ds
      LookupTable = qryGrupoCalc
      LookupField = 'CD_GRUPO_PARTIC'
      Options = [loColLines, loRowLines]
      TabOrder = 14
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
    end
    object DBRadioGroup1: TDBRadioGroup
      Left = 584
      Top = 79
      Width = 176
      Height = 54
      Caption = 'Tipo Participante'
      DataField = 'TP_PARTICIPANTE'
      DataSource = ds
      Items.Strings = (
        'Ativo'
        'Beneficiário')
      TabOrder = 5
      Values.Strings = (
        'A'
        'B')
    end
    object DBEdit3: TDBEdit
      Left = 215
      Top = 63
      Width = 361
      Height = 21
      AutoSelect = False
      DataField = 'DS_REGIONAL'
      DataSource = ds
      TabOrder = 3
    end
    object DBEdit5: TDBEdit
      Left = 30
      Top = 63
      Width = 176
      Height = 21
      AutoSelect = False
      DataField = 'NR_CPF'
      DataSource = ds
      TabOrder = 2
    end
    object LkcTbSitPatroc: TwwDBLookupCombo
      Left = 308
      Top = 189
      Width = 268
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DS_SITUACAO_PATROC'#9'60'#9'Situação da Patrocinadora')
      DataField = 'CD_SITUACAO_PATROC'
      DataSource = ds
      LookupTable = qrySitPatroc
      LookupField = 'CD_SITUACAO_PATROC'
      Options = [loColLines, loRowLines]
      TabOrder = 9
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
    end
    object LkcTbSitFundacao: TwwDBLookupCombo
      Left = 30
      Top = 189
      Width = 268
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DS_SITUACAO_FUNDACAO'#9'35'#9'Situação da Fundação')
      DataField = 'CD_SITUACAO_FUNDACAO'
      DataSource = ds
      LookupTable = qrySitFundacao
      LookupField = 'CD_SITUACAO_FUNDACAO'
      Options = [loColLines, loRowLines]
      TabOrder = 8
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object Dock973: TDock97
      Left = 1
      Top = 306
      Width = 767
      Height = 33
      AllowDrag = False
      Background.Data = {
        760F0000424D760F0000000000007600000028000000800000003C0000000100
        040000000000000F000000000000000000001000000000000000000000008080
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        777777777777171717777777777777177771777777777777777077F7FF7FFFF7
        77F77F77F7F7F7F7F7F7F7F7F777777777771777177777777777777777777777
        777777777771717717777777777777777717777777777777777777777FFFFF7F
        7F7F77F7F7F7F7F7F7F7F7F77777777777777717177777777777777777777777
        77777777777777171777777777777777717777777777777777777777777FF7FF
        7F77777777F7F7FF7F7F77F77F77777777777777177777777777777777777777
        7777777777771771777777777777777771777777777777777777777777777FFF
        FF7F7777F7F7F7F7F7F77F777777777777777771717777777777777777777777
        777777777777771777777777777777777777777777777777777777777777777F
        F7F7F7F777F7F7F7F7F7F7F7F777777777777777177777777777777777777777
        7777777777777777777777777777777777777777777777777777777777777777
        FFFF7F7F7F7F7F7F7F7F777777777F7777777777777777777777777777777777
        7777777777777777777777777777777777777777777777777777777777777777
        7FF7F7F7F7F7F7FFFFF7F7F7F7F7777777777777717717177777777777777777
        7777777777777777777777777777777777777777777777777777777777777771
        77FFFFF7F7777F77F7F7F77F77777F7777777777777171777777777777777777
        7777777777777177777777777777777777777777777777777777777777777777
        777FFFFFF7F7F77F7F7FF7F7F77F777777777777777777177777777777777777
        7777777777777777771777777777777777777777777777777777777777777777
        7177FFFF7F7F77F7F7FF7FF7F7F7F77F77777777777171717777777777777777
        7777777777777717771777777777777777777777777777777777777777777777
        77777FFFFF7F7777F7F7FF7FF7F77F7777777777777777777777771777777777
        7777777777777771777777777777777777777777777777777777777777777777
        777777FFFF7F77F7F7F7F7F7F7F7F77F7F777777777771717771777177177777
        7777777777777777777777777777777777777777777777777777777777777777
        777777FFFFFF7F77F7F7F7FF7FF7F7F7777F7777777777771717717777777777
        7777777777777777177777777777777777777777777777777777777777777777
        7777777FFFF7F7F777F7F7F7F7F7F777F7777F77777777717771777777777777
        7777777777777777717777777777777777777777777777777777777777777777
        7777777F7FFF7F77F7F77F7FFF7F7F7F777F7777777777171717717777777F77
        7777777777777777777771777777777777777777777777777777777777777777
        7777777FFFF7F7777777F7F7F7F7F7F77F77F7777777777771771777777F7777
        F7F7777777777777771777777777177777777777777777777777777777777777
        77777177FFFFF7F777F77F7F7FF7F7F7F77F77F777777777171717177777F777
        777F7F7777777777777177177771717777777777777777777777777777777777
        77777777FFFF7F777777F7F7FF7F7F7F7F7F7F77777777777771717717777777
        77777F7F77777777777717771777777777777777777777777777777777777777
        777777177FFFF7F7F77F7F7FF7F7FF7F7F7F7F7F777777777717177177777777
        1777777777777777777771717717777177777777777777777777777777777777
        777777777FFFF7F77777777F7F7FF7F7F7F7F777F77777777771771717777771
        7777777777771777777777177771777777777777777777777777777777777777
        77777771777F7F7F77777F7F7F7F7F7F7F7F7F7F777777777777771717717717
        7777777777777777777771777777777777777777777777777777777777777777
        777777777777F7F7F7F77F7F7F7F7F7F7F7F7777777F77777777717717171717
        7777777777171777777717777777777777777777777777777777777777777777
        77777777777777F7F77777777F7F7F7F7F7F7F7F7F7777777777777777717777
        7777777777777177777771777777777777777777777777777777777777777777
        777777777777777F7F77777F7F7F7F7F7F7F7F777777F77F7777771777717777
        7777777777777777777771177777777777777777777777777777777777777777
        7177777777777777F7F7777777F77F7F7FF7F7F7F7F777777777777777717777
        7777777777777777777777777777777777777777777777777777777777777777
        7777777777777777777777777F77F7F7F7F7F7F77777F7777777777771777777
        7777777777777777777771717777777777777777777777777777777777777777
        777777177777771777777777777F7F7F7F7F7F7F7F7F777F7777777777717777
        7777777777777777777777171777777777777777777777777777777777777777
        71777777777777777777777777F7F7F7F7F7F7F7F7F77F777777777777177777
        7777777777777777777777177777777777777777777777777777777777777717
        77777777777777717777777777777F77F7F7F7F7F7F7F7777777777777777777
        77777777777777777777777777777777777F7777777777777777777777777171
        7171777777777777171777777777F77F7F7F7F7F7F7F7F777777777777777777
        771777777777777777777777777777777177F777777777777777777777777717
        171777177777777717771777777777F7F7F7F7FF7F7F77F77777777777777171
        7777777777777777777777777777777777777F77777777777777777777777777
        77717177777777777171717177777F77F7F7F7F7F7F7F77F7777777777777171
        7177777177777777777777777777777777777FF7F77771777777777777777777
        1717777777777777771777777777777F7F7F7F7F7F7F77F7F777777777777777
        7777777717777777777777777777777777777777777777777777777777777777
        717777777777777777777777717777F77F7F7F7F7F7F7F7F77F7777777777771
        7177777777777777777777777777777777771777777777777777777777777777
        77177777777777777777777777777777F7F77F7F7F7F7F7FF777F77777777717
        777777F777777777777777777777777777777777717177717777777777777777
        77177777777777777777777771777777777F77F7F7F7F7F777F7777777777777
        171777F7F7777777777777177777777777777777777777777777777777777777
        777777777777777777777777177177777F77F7F7F7F7F7F7F7F7F7F777777777
        7777777F77777777777777777777777777777777777777777777777777777777
        77777777777777777777777771777777777F77F7F7F7F7F7F7F77777F7777777
        7717777F77777777777777717177777777777777777777777777777777777777
        7777777777777777777777777717777777777F7F7F7F7F7F7777F7F777777777
        777777777F777777777777777717777777777777777777777777777777777777
        777777777777777777777777777777777777F7F7F7F7F7F7F7F7F77777777777
        7777777777777777777777771777777777777777777777777777777777777777
        77777777777777777777777777717771777777F7F77F7F7F7F7F77F777777777
        7777777777777777777777777717177777777771777777777777777777777777
        7777777777777777777777777777177777777F7F77F7F7F7F7F77F777F777777
        7777777777777177777777777777777777777717177777777777777777777777
        77777777777777777177777777717171777777777F7F7FF7F7F7F77F77777777
        7777777777717777777777777717177777777777777777777777777777777777
        777777777777777777177777777711717777777F7F7F7F7F7F77F7F7F7F77777
        777777777717171717777777777777777777777771777777777F777777777777
        777777777777777777777777777117117777777777F77F7F7F7F77F77777F777
        77777777171777777777777777777777777777777777777777F7F77777777777
        77777777777777777771777777771117177777777F77F7F7F777F7F7F7F77777
        7777777777171777777777777777777777777777777777777777777777777777
        777777777777777777777777777771777777777777F77F7F7F7F7F7F777F7777
        7777777717177777777777777777777777777777777777777777777777777777
        77777777777777777777777777777777777177777777F77F7F77F7F7F7F77F77
        7777777777171777777777777777777777777777777777777777777777777777
        7777777777777777777777777777777777177777777F7F7F7F7F7F7F777F7777
        77777777777777777F7F77777717777777777777777777777777777771777777
        7777777777777777777777777777777777717777777777F7F7F77F7F7F7F77F7
        77777777777777777F7F7F777777777777777777777777777777771777777777
        77777777177777777777777777771777777717777777F7F7F77F7F7F7F77F777
        777777777777777777FFF77F7777717777777777777777777777777777177777
        77777777777777777777777777771777777771777777777777F7F7F7F77F77F7
        77F7777777777777777777F77777777777777777777777777777777777777777
        77777777777777777777777777777777777777171777777F7F77F7F7F7F77F77
        F77777777777777777777777F7F7777777777777777777777777777777777777
        777777777717777777777777777777777777717777777777777F7F7F7F77F77F
        77F77777777F77777717777777F7777777777777777777777777777777777777
        77777777777177777777777777777777777777777177777777F7F7F77F7F77F7
        7F77F77777777F77777717777777777777777777777777777777777777777777
        7777777777771777777777777777777777777777777777777F77F7F7F777F777
        F77F777777777777771771777777771777777777777777777777777777777777
        777777777777777771777777777777777777777777177777777F7F7F7F7F77F7
        F7F7777777777777777717171777777777777777777777777777777777777777
        77777777777771777777777777777177777777777771777777777777F777F777
        7777777777777777777171717177771777777777777777777777777777777777
        77777777777777777777777777777777777777777777777777777F7F7F7F7777
        F77F77F777777777777771771717177777777777777777777777777777777777
        7777777777777777777777777777777777777777777177777777}
      BoundLines = [blTop, blBottom]
      FixAlign = True
      LimitToOneRow = True
      Position = dpBottom
      object Toolbar974: TToolbar97
        Left = 0
        Top = 0
        Caption = 'TB97oKCancelar'
        DockPos = 0
        TabOrder = 0
        object ToolbarSep975: TToolbarSep97
          Left = 127
          Top = 0
          Blank = True
          SizeHorz = 3
        end
        object ToolbarSep974: TToolbarSep97
          Left = 431
          Top = 0
          Blank = True
          SizeHorz = 3
        end
        object ToolbarSep976: TToolbarSep97
          Left = 343
          Top = 0
          Blank = True
          SizeHorz = 3
        end
        object ToolbarSep977: TToolbarSep97
          Left = 252
          Top = 0
          Blank = True
          SizeHorz = 3
        end
        object ToolbarSep973: TToolbarSep97
          Left = 0
          Top = 0
          Blank = True
          SizeHorz = 3
        end
        object ToolbarSep978: TToolbarSep97
          Left = 590
          Top = 0
          Blank = True
          SizeHorz = 3
        end
        object btbtnBeneficiario: TBitBtn
          Left = 130
          Top = 0
          Width = 122
          Height = 27
          Caption = '&Beneficiários >>'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = btbtnBeneficiarioClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
            555555FFFFFFFFFF5F5557777777777505555777777777757F55555555555555
            055555555555FF5575F555555550055030555555555775F7F7F55555550FB000
            005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
            B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
            305555577F555557F7F5550E0BFBFB003055557575F55577F7F550EEE0BFB0B0
            305557FF575F5757F7F5000EEE0BFBF03055777FF575FFF7F7F50000EEE00000
            30557777FF577777F7F500000E05555BB05577777F75555777F5500000555550
            3055577777555557F7F555000555555999555577755555577755}
          NumGlyphs = 2
        end
        object btbtnValores: TBitBtn
          Left = 255
          Top = 0
          Width = 88
          Height = 27
          Caption = '&Valores >>'
          Enabled = False
          TabOrder = 2
          OnClick = btbtnValoresClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
            73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
            0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
            0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
            0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
            0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
            0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
            0333337F777777737F333308888888880333337F333333337F33330888888888
            03333373FFFFFFFF733333700000000073333337777777773333}
          NumGlyphs = 2
        end
        object btbtnTempo: TBitBtn
          Left = 346
          Top = 0
          Width = 85
          Height = 27
          Caption = '&Tempo >>'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          OnClick = btbtnTempoClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
            003337777777777777F330FFFFFFFFFFF03337F333FFFFF337F330FFF70007FF
            F03337F33777773F37F330FF08FFF80FF03337F373333373F7F330F78FFFFF87
            F03337F7F3333337F7F330F0FFFFFFF0F03337F7F333FFF7F7F330F0FFF900F0
            F03337F7F3377737F7F330F0FFF0FFF0F03337F7F337F337F7F330F78FF0FF87
            F03337F73F37F33737F330FF08F0F80FF03337F373F7FF7337F330FFF70007FF
            F03337F33777773FF7F330FFFFFFFF00003337F33333337777F330FFFFFFFF0F
            F03337FFFFFFFF7F373330999999990F033337777777777F733330FFFFFFFF00
            333337FFFFFFFF77333330000000000333333777777777733333}
          NumGlyphs = 2
        end
        object btbtnGExport: TBitBtn
          Left = 434
          Top = 0
          Width = 156
          Height = 27
          Caption = '&Grupos Exportação >>'
          Enabled = False
          TabOrder = 4
          OnClick = btbtnGExportClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555550FF0559
            1950555FF75F7557F7F757000FF055591903557775F75557F77570FFFF055559
            1933575FF57F5557F7FF0F00FF05555919337F775F7F5557F7F700550F055559
            193577557F7F55F7577F07550F0555999995755575755F7FFF7F5570F0755011
            11155557F755F777777555000755033305555577755F75F77F55555555503335
            0555555FF5F75F757F5555005503335505555577FF75F7557F55505050333555
            05555757F75F75557F5505000333555505557F777FF755557F55000000355557
            07557777777F55557F5555000005555707555577777FF5557F55553000075557
            0755557F7777FFF5755555335000005555555577577777555555}
          NumGlyphs = 2
        end
        object btbtnDependente: TBitBtn
          Left = 3
          Top = 0
          Width = 124
          Height = 27
          Caption = '&Dependentes >>'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = btbtnDependenteClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
            555555FFFFFFFFFF5F5557777777777505555777777777757F55555555555555
            055555555555FF5575F555555550055030555555555775F7F7F55555550FB000
            005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
            B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
            305555577F555557F7F5550E0BFBFB003055557575F55577F7F550EEE0BFB0B0
            305557FF575F5757F7F5000EEE0BFBF03055777FF575FFF7F7F50000EEE00000
            30557777FF577777F7F500000E05555BB05577777F75555777F5500000555550
            3055577777555557F7F555000555555999555577755555577755}
          NumGlyphs = 2
        end
      end
    end
    object DBCheckBox1: TDBCheckBox
      Left = 326
      Top = 114
      Width = 127
      Height = 17
      Hint = 'Participante já pertenceu à outra Fundação'
      Caption = 'Outras Fundações'
      DataField = 'IR_FUNDACAO_ORIGEM'
      DataSource = ds
      ParentShowHint = False
      ShowHint = True
      TabOrder = 12
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object DBCheckBox2: TDBCheckBox
      Left = 326
      Top = 91
      Width = 219
      Height = 20
      Hint = 'Participante alocado na Fundação mas pertence à Patrocinadora'
      Caption = 'Participante alocado na Fundação'
      DataField = 'IR_PERTENCE_PATROCINADORA'
      DataSource = ds
      ParentShowHint = False
      ShowHint = True
      TabOrder = 13
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object DBCheckBox3: TDBCheckBox
      Left = 477
      Top = 114
      Width = 68
      Height = 17
      Hint = 'Participante migrado de Plano'
      Caption = 'Migrado'
      DataField = 'IR_MIGRACAO_PLANO'
      DataSource = ds
      ParentShowHint = False
      ShowHint = True
      TabOrder = 11
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object DBRadioGroup2: TDBRadioGroup
      Left = 584
      Top = 223
      Width = 176
      Height = 37
      Columns = 2
      DataField = 'IR_DIRETOR'
      DataSource = ds
      Items.Strings = (
        'Diretor'
        'Ex-Diretor')
      TabOrder = 16
      Values.Strings = (
        'D'
        'E')
    end
    object wwDBLookupCombo1: TwwDBLookupCombo
      Left = 30
      Top = 228
      Width = 268
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NO_PLANO'#9'60'#9'Plano Atual'#9'F')
      DataField = 'CD_PLANO'
      DataSource = ds
      LookupTable = QryPlano
      LookupField = 'CD_PLANO'
      Options = [loColLines, loRowLines]
      TabOrder = 17
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
    end
    object wwDBLookupCombo2: TwwDBLookupCombo
      Left = 308
      Top = 228
      Width = 268
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NO_PLANO'#9'60'#9'Plano Anterior'#9'F')
      DataField = 'CD_PLANO_ANTERIOR'
      DataSource = ds
      LookupTable = QryPlanoAnterior
      LookupField = 'CD_PLANO'
      Options = [loColLines, loRowLines]
      TabOrder = 18
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
    end
    object DBLkpVinculacao: TwwDBLookupCombo
      Left = 308
      Top = 268
      Width = 268
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DS_VINCULA_PARTIC'#9'60'#9'Vinculação'#9'F')
      DataField = 'CD_VINCULA_PARTIC'
      DataSource = ds
      LookupTable = QryVinculaPartic
      LookupField = 'CD_VINCULA_PARTIC'
      Options = [loColLines, loRowLines]
      TabOrder = 15
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
    end
    object wwDBLookupCombo3: TwwDBLookupCombo
      Left = 30
      Top = 111
      Width = 271
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DS_OUTRA_FUNDACAO'#9'30'#9'Outras Fundações'#9'F')
      DataField = 'CD_OUTRA_FUNDACAO'
      DataSource = ds
      LookupTable = QryOutrasFundacoes
      LookupField = 'CD_OUTRA_FUNDACAO'
      Options = [loColLines, loRowLines]
      TabOrder = 20
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
    end
    object DBRdGrpTrabalho: TDBRadioGroup
      Left = 584
      Top = 143
      Width = 176
      Height = 78
      Caption = 'Condições de Trabalho'
      DataField = 'IR_CONDICAO_TRABALHO'
      DataSource = ds
      Items.Strings = (
        'Normal'
        'Insalubre'
        'Periculosa')
      TabOrder = 6
      Values.Strings = (
        'N'
        'I'
        'P')
    end
  end
  inherited Dock972: TDock97
    Width = 769
    object Toolbar972: TToolbar97
      Left = 244
      Top = 0
      Caption = 'Toolbar971'
      CloseButton = False
      DefaultDock = Dock971
      DockPos = 244
      TabOrder = 1
      Visible = False
      object SBtnGerar: TToolbarButton97
        Left = 8
        Top = 0
        Width = 89
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        Caption = '&Gerar Ficha'
        Enabled = False
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
          8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
          8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
          8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        Spacing = 0
        OnClick = SBtnGerarClick
      end
      object ToolbarSep972: TToolbarSep97
        Left = 0
        Top = 0
        Blank = True
        SizeHorz = 8
      end
    end
  end
  inherited Dock971: TDock97
    Top = 387
    Width = 769
    inherited tb97Fundo: TToolbar97
      Left = 395
      DockPos = 395
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 226
      DockPos = 226
    end
    inherited dbnav: TDBNavigator
      Left = 39
      Hints.Strings = ()
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 501
    Top = 52
  end
  inherited ds: TwwDataSource
    DataSet = qryPrincipal
    Left = 380
    Top = 49
  end
  inherited ImlPadrao: TImageList
    Left = 473
    Top = 52
  end
  inherited srchdlgProcura: TwwSearchDialog
    Left = 444
    Top = 24
  end
  inherited seldlgProcuraQry: TcmSelectDlg
    Left = 472
    Top = 24
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 445
    Top = 80
  end
  object qryCatProf: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select *'
      'from FI_TIPO_CATEG_PROF_ESPECIAL'
      'order by DS_TIPO_CAT_PROF_ESP')
    ValidateWithMask = True
    Left = 380
    Top = 77
    object qryCatProfDS_TIPO_CAT_PROF_ESP: TStringField
      DisplayLabel = 'Tipo de Categoria Profissional'
      DisplayWidth = 60
      FieldName = 'DS_TIPO_CAT_PROF_ESP'
      Origin = 'FI_TIPO_CATEG_PROF_ESPECIAL.DS_TIPO_CAT_PROF_ESP'
      Size = 60
    end
    object qryCatProfCD_TIPO_CAT_PROF_ESP: TFloatField
      DisplayWidth = 10
      FieldName = 'CD_TIPO_CAT_PROF_ESP'
      Origin = 'FI_TIPO_CATEG_PROF_ESPECIAL.CD_TIPO_CAT_PROF_ESP'
      Visible = False
    end
  end
  object qryEstCivil: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select * from FI_ESTADO_CIVIL'
      'order by DS_ESTADO_CIVIL')
    ValidateWithMask = True
    Left = 473
    Top = 80
    object qryEstCivilCD_ESTADO_CIVIL: TStringField
      FieldName = 'CD_ESTADO_CIVIL'
      Origin = 'FI_ESTADO_CIVIL.CD_ESTADO_CIVIL'
      Size = 1
    end
    object qryEstCivilDS_ESTADO_CIVIL: TStringField
      DisplayLabel = 'Estado Civil'
      DisplayWidth = 20
      FieldName = 'DS_ESTADO_CIVIL'
      Origin = 'FI_ESTADO_CIVIL.DS_ESTADO_CIVIL'
    end
  end
  object qryGrupoCalc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select a.*, b.NO_GRUPO_PARTIC'
      'from FI_GRUPO_CALCULO a, FI_GRUPO_PARTICIPANTE b'
      'where a.CD_GRUPO_PARTIC = b.CD_GRUPO_PARTIC'
      '    and a.CD_PESSOA_PATROC = :CD_PESSOA_PATROC'
      '    and a.CD_PESSOA_ENTID = :CD_PESSOA_ENTID'
      '    and a.CD_PLANO = :CD_PLANO'
      'order by b.NO_GRUPO_PARTIC')
    ValidateWithMask = True
    Left = 501
    Top = 80
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_PESSOA_PATROC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PESSOA_ENTID'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PLANO'
        ParamType = ptUnknown
      end>
    object qryGrupoCalcNO_GRUPO_PARTIC: TStringField
      DisplayLabel = 'Grupo de Cálculo'
      DisplayWidth = 60
      FieldName = 'NO_GRUPO_PARTIC'
      Origin = 'FI_GRUPO_PARTICIPANTE.NO_GRUPO_PARTIC'
      Size = 60
    end
    object qryGrupoCalcCD_GRUPO_PARTIC: TFloatField
      FieldName = 'CD_GRUPO_PARTIC'
      Origin = 'FI_GRUPO_CALCULO.CD_GRUPO_PARTIC'
      Visible = False
    end
    object qryGrupoCalcCD_PESSOA_PATROC: TFloatField
      FieldName = 'CD_PESSOA_PATROC'
      Origin = 'FI_GRUPO_CALCULO.CD_PESSOA_PATROC'
      Visible = False
    end
    object qryGrupoCalcCD_PESSOA_ENTID: TFloatField
      FieldName = 'CD_PESSOA_ENTID'
      Origin = 'FI_GRUPO_CALCULO.CD_PESSOA_ENTID'
      Visible = False
    end
    object qryGrupoCalcCD_PLANO: TFloatField
      FieldName = 'CD_PLANO'
      Origin = 'FI_GRUPO_CALCULO.CD_PLANO'
      Visible = False
    end
    object qryGrupoCalcNR_ORDEM: TFloatField
      FieldName = 'NR_ORDEM'
      Origin = 'FI_GRUPO_CALCULO.NR_ORDEM'
      Visible = False
    end
  end
  object dsCatProf: TwwDataSource
    AutoEdit = False
    DataSet = qryCatProf
    Left = 408
    Top = 77
  end
  object qryPrincipal: TwwQuery
    CachedUpdates = True
    AfterOpen = qryPrincipalAfterOpen
    BeforePost = qryPrincipalBeforePost
    AfterPost = qryPrincipalAfterPost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select * from FI_PARTICIPANTE'
      'where CD_VERSAO = :CD_VERSAO'
      '  and CD_PARTIC = 0'
      'order by NR_MATRICULA, NO_PESSOA')
    UpdateObject = UpdtSQLPrincipal
    ValidateWithMask = True
    Left = 352
    Top = 49
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end>
    object qryPrincipalNR_MATRICULA: TStringField
      DisplayLabel = 'Matrícula'
      DisplayWidth = 15
      FieldName = 'NR_MATRICULA'
      Origin = 'FI_PARTICIPANTE.NR_MATRICULA'
      Size = 15
    end
    object qryPrincipalNO_PESSOA: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 60
      FieldName = 'NO_PESSOA'
      Origin = 'FI_PARTICIPANTE.NO_PESSOA'
      Size = 60
    end
    object qryPrincipalDS_REGIONAL: TStringField
      DisplayLabel = 'Regional'
      DisplayWidth = 60
      FieldName = 'DS_REGIONAL'
      Origin = 'FI_PARTICIPANTE.DS_REGIONAL'
      Size = 60
    end
    object qryPrincipalCD_VERSAO: TFloatField
      DisplayWidth = 10
      FieldName = 'CD_VERSAO'
      Origin = 'FI_PARTICIPANTE.CD_VERSAO'
      Visible = False
    end
    object qryPrincipalCD_PARTIC: TFloatField
      DisplayWidth = 10
      FieldName = 'CD_PARTIC'
      Origin = 'FI_PARTICIPANTE.CD_PARTIC'
      Visible = False
    end
    object qryPrincipalCD_PESSOA_PATROC: TFloatField
      DisplayWidth = 10
      FieldName = 'CD_PESSOA_PATROC'
      Origin = 'FI_PARTICIPANTE.CD_PESSOA_PATROC'
      Visible = False
    end
    object qryPrincipalCD_PESSOA_ENTID: TFloatField
      DisplayWidth = 10
      FieldName = 'CD_PESSOA_ENTID'
      Origin = 'FI_PARTICIPANTE.CD_PESSOA_ENTID'
      Visible = False
    end
    object qryPrincipalCD_PLANO: TFloatField
      DisplayWidth = 10
      FieldName = 'CD_PLANO'
      Origin = 'FI_PARTICIPANTE.CD_PLANO'
      Visible = False
    end
    object qryPrincipalCD_TIPO_CAT_PROF_ESP: TFloatField
      DisplayWidth = 10
      FieldName = 'CD_TIPO_CAT_PROF_ESP'
      Origin = 'FI_PARTICIPANTE.CD_TIPO_CAT_PROF_ESP'
      Visible = False
    end
    object qryPrincipalCD_ESTADO_CIVIL: TStringField
      DisplayWidth = 1
      FieldName = 'CD_ESTADO_CIVIL'
      Origin = 'FI_PARTICIPANTE.CD_ESTADO_CIVIL'
      Visible = False
      Size = 1
    end
    object qryPrincipalIR_SEXO: TStringField
      DisplayWidth = 1
      FieldName = 'IR_SEXO'
      Origin = 'FI_PARTICIPANTE.IR_SEXO'
      Visible = False
      Size = 1
    end
    object qryPrincipalTP_PARTICIPANTE: TStringField
      DisplayWidth = 1
      FieldName = 'TP_PARTICIPANTE'
      Origin = 'FI_PARTICIPANTE.TP_PARTICIPANTE'
      Visible = False
      Size = 1
    end
    object qryPrincipalIR_CONDICAO_TRABALHO: TStringField
      DisplayWidth = 1
      FieldName = 'IR_CONDICAO_TRABALHO'
      Origin = 'FI_PARTICIPANTE.IR_CONDICAO_TRABALHO'
      Visible = False
      Size = 1
    end
    object qryPrincipalCD_GRUPO_CALCULO: TFloatField
      DisplayWidth = 10
      FieldName = 'CD_GRUPO_CALCULO'
      Origin = 'FI_PARTICIPANTE.CD_GRUPO_CALCULO'
      Visible = False
    end
    object qryPrincipalCD_SITUACAO_PATROC: TFloatField
      DisplayWidth = 10
      FieldName = 'CD_SITUACAO_PATROC'
      Origin = 'FI_PARTICIPANTE.CD_SITUACAO_PATROC'
      Visible = False
    end
    object qryPrincipalCD_SITUACAO_FUNDACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'CD_SITUACAO_FUNDACAO'
      Origin = 'FI_PARTICIPANTE.CD_SITUACAO_FUNDACAO'
      Visible = False
    end
    object qryPrincipalNR_CPF: TStringField
      DisplayWidth = 11
      FieldName = 'NR_CPF'
      Origin = 'FI_PARTICIPANTE.NR_CPF'
      Visible = False
      Size = 11
    end
    object qryPrincipalCD_GRUPO_EXPORTACAO: TFloatField
      FieldName = 'CD_GRUPO_EXPORTACAO'
      Origin = 'BASEDADOS.FI_PARTICIPANTE.CD_GRUPO_EXPORTACAO'
    end
    object qryPrincipalIR_FUNDACAO_ORIGEM: TStringField
      FieldName = 'IR_FUNDACAO_ORIGEM'
      Origin = 'BASEDADOS.FI_PARTICIPANTE.IR_FUNDACAO_ORIGEM'
      FixedChar = True
      Size = 1
    end
    object qryPrincipalIR_PERTENCE_PATROCINADORA: TStringField
      FieldName = 'IR_PERTENCE_PATROCINADORA'
      Origin = 'BASEDADOS.FI_PARTICIPANTE.IR_PERTENCE_PATROCINADORA'
      FixedChar = True
      Size = 1
    end
    object qryPrincipalCD_PLANO_ANTERIOR: TFloatField
      FieldName = 'CD_PLANO_ANTERIOR'
      Origin = 'BASEDADOS.FI_PARTICIPANTE.CD_PLANO_ANTERIOR'
    end
    object qryPrincipalIR_MIGRACAO_PLANO: TStringField
      FieldName = 'IR_MIGRACAO_PLANO'
      Origin = 'BASEDADOS.FI_PARTICIPANTE.IR_MIGRACAO_PLANO'
      FixedChar = True
      Size = 1
    end
    object qryPrincipalIR_DIRETOR: TStringField
      FieldName = 'IR_DIRETOR'
      Origin = 'BASEDADOS.FI_PARTICIPANTE.IR_DIRETOR'
      FixedChar = True
      Size = 1
    end
    object qryPrincipalCD_VINCULA_PARTIC: TStringField
      FieldName = 'CD_VINCULA_PARTIC'
      Size = 5
    end
    object qryPrincipalCD_OUTRA_FUNDACAO: TFloatField
      FieldName = 'CD_OUTRA_FUNDACAO'
    end
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select max(CD_PARTIC) as Max_CD'
      'from FI_PARTICIPANTE'
      'where CD_VERSAO = :CD_VERSAO')
    ValidateWithMask = True
    Left = 445
    Top = 52
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end>
  end
  object UpdtSQLPrincipal: TUpdateSQL
    ModifySQL.Strings = (
      'update FI_PARTICIPANTE'
      'set'
      '  CD_PESSOA_PATROC = :CD_PESSOA_PATROC,'
      '  CD_PESSOA_ENTID = :CD_PESSOA_ENTID,'
      '  CD_PLANO = :CD_PLANO,'
      '  CD_TIPO_CAT_PROF_ESP = :CD_TIPO_CAT_PROF_ESP,'
      '  NR_MATRICULA = :NR_MATRICULA,'
      '  NO_PESSOA = :NO_PESSOA,'
      '  CD_ESTADO_CIVIL = :CD_ESTADO_CIVIL,'
      '  IR_SEXO = :IR_SEXO,'
      '  TP_PARTICIPANTE = :TP_PARTICIPANTE,'
      '  IR_CONDICAO_TRABALHO = :IR_CONDICAO_TRABALHO,'
      '  CD_GRUPO_CALCULO = :CD_GRUPO_CALCULO,'
      '  DS_REGIONAL = :DS_REGIONAL,'
      '  CD_SITUACAO_PATROC = :CD_SITUACAO_PATROC,'
      '  CD_SITUACAO_FUNDACAO = :CD_SITUACAO_FUNDACAO,'
      '  NR_CPF = :NR_CPF,'
      '  CD_VINCULA_PARTIC = CD_VINCULA_PARTIC,'
      '  CD_OUTRA_FUNDACAO = :CD_OUTRA_FUNDACAO'
      'where'
      '  CD_VERSAO = :OLD_CD_VERSAO and'
      '  CD_PARTIC = :OLD_CD_PARTIC'
      ' ')
    InsertSQL.Strings = (
      'insert into FI_PARTICIPANTE'
      
        '(CD_VERSAO, CD_PARTIC, CD_PESSOA_PATROC, CD_PESSOA_ENTID, CD_PLA' +
        'NO, CD_TIPO_CAT_PROF_ESP,'
      
        ' NR_MATRICULA, NO_PESSOA, CD_ESTADO_CIVIL, IR_SEXO, TP_PARTICIPA' +
        'NTE, IR_CONDICAO_TRABALHO,'
      
        ' CD_GRUPO_CALCULO, DS_REGIONAL, CD_SITUACAO_PATROC, CD_SITUACAO_' +
        'FUNDACAO, NR_CPF,'
      ' CD_VINCULA_PARTIC, CD_OUTRA_FUNDACAO)'
      'values'
      
        '(:CD_VERSAO, :CD_PARTIC, :CD_PESSOA_PATROC, :CD_PESSOA_ENTID, :C' +
        'D_PLANO, :CD_TIPO_CAT_PROF_ESP,'
      
        ' :NR_MATRICULA, :NO_PESSOA, :CD_ESTADO_CIVIL, :IR_SEXO, :TP_PART' +
        'ICIPANTE, :IR_CONDICAO_TRABALHO,'
      
        ' :CD_GRUPO_CALCULO, :DS_REGIONAL, :CD_SITUACAO_PATROC, :CD_SITUA' +
        'CAO_FUNDACAO, :NR_CPF,'
      ' :CD_VINCULA_PARTIC, :CD_OUTRA_FUNDACAO)'
      ' ')
    DeleteSQL.Strings = (
      'delete from FI_PARTICIPANTE'
      'where'
      '  CD_VERSAO = :OLD_CD_VERSAO and'
      '  CD_PARTIC = :OLD_CD_PARTIC')
    Left = 408
    Top = 49
  end
  object qrySitFundacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select * from FI_SITUACAO_FUNDACAO'
      'order by DS_SITUACAO_FUNDACAO')
    ValidateWithMask = True
    Left = 352
    Top = 77
    object qrySitFundacaoCD_SITUACAO_FUNDACAO: TFloatField
      FieldName = 'CD_SITUACAO_FUNDACAO'
      Origin = 'FI_SITUACAO_FUNDACAO.CD_SITUACAO_FUNDACAO'
      Visible = False
    end
    object qrySitFundacaoDS_SITUACAO_FUNDACAO: TStringField
      FieldName = 'DS_SITUACAO_FUNDACAO'
      Origin = '"CM.FI_SITUACAO_FUNDACAO".DS_SITUACAO_FUNDACAO'
      Size = 50
    end
  end
  object qrySitPatroc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select * from FI_SITUACAO_PATROC'
      'order by DS_SITUACAO_PATROC')
    ValidateWithMask = True
    Left = 380
    Top = 105
    object qrySitPatrocDS_SITUACAO_PATROC: TStringField
      DisplayLabel = 'Situação da Patrocinadora'
      DisplayWidth = 60
      FieldName = 'DS_SITUACAO_PATROC'
      Origin = 'FI_SITUACAO_PATROC.DS_SITUACAO_PATROC'
      Size = 60
    end
    object qrySitPatrocCD_SITUACAO_PATROC: TFloatField
      FieldName = 'CD_SITUACAO_PATROC'
      Origin = 'FI_SITUACAO_PATROC.CD_SITUACAO_PATROC'
      Visible = False
    end
  end
  object QryPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT CD_PLANO, NO_PLANO'
      'FROM FI_PLANO_PATRONAL'
      'ORDER BY NO_PLANO')
    ValidateWithMask = True
    Left = 352
    Top = 105
    object QryPlanoNO_PLANO: TStringField
      DisplayLabel = 'Plano Atual'
      DisplayWidth = 60
      FieldName = 'NO_PLANO'
      Origin = 'BASEDADOS.FI_PLANO_PATRONAL.NO_PLANO'
      FixedChar = True
      Size = 60
    end
    object QryPlanoCD_PLANO: TFloatField
      FieldName = 'CD_PLANO'
      Origin = 'BASEDADOS.FI_PLANO_PATRONAL.CD_PLANO'
      Visible = False
    end
  end
  object QryPlanoAnterior: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT CD_PLANO, NO_PLANO'
      'FROM FI_PLANO_PATRONAL'
      'ORDER BY NO_PLANO')
    ValidateWithMask = True
    Left = 408
    Top = 105
    object StringField1: TStringField
      DisplayLabel = 'Plano Anterior'
      DisplayWidth = 60
      FieldName = 'NO_PLANO'
      Origin = 'BASEDADOS.FI_PLANO_PATRONAL.NO_PLANO'
      FixedChar = True
      Size = 60
    end
    object FloatField1: TFloatField
      FieldName = 'CD_PLANO'
      Origin = 'BASEDADOS.FI_PLANO_PATRONAL.CD_PLANO'
      Visible = False
    end
  end
  object QryVinculaPartic: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CD_VINCULA_PARTIC, DS_VINCULA_PARTIC'
      'FROM FI_VINCULA_PARTIC'
      'ORDER BY DS_VINCULA_PARTIC')
    ValidateWithMask = True
    Left = 445
    Top = 108
    object QryVinculaParticDS_VINCULA_PARTIC: TStringField
      DisplayLabel = 'Vinculação'
      DisplayWidth = 60
      FieldName = 'DS_VINCULA_PARTIC'
      Size = 60
    end
    object QryVinculaParticCD_VINCULA_PARTIC: TStringField
      FieldName = 'CD_VINCULA_PARTIC'
      Visible = False
      Size = 5
    end
  end
  object QryOutrasFundacoes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CD_OUTRA_FUNDACAO, DS_OUTRA_FUNDACAO'
      'FROM FI_OUTRA_FUNDACAO'
      'ORDER BY DS_OUTRA_FUNDACAO')
    ValidateWithMask = True
    Left = 473
    Top = 108
    object QryOutrasFundacoesDS_OUTRA_FUNDACAO: TStringField
      DisplayLabel = 'Outras Fundações'
      DisplayWidth = 30
      FieldName = 'DS_OUTRA_FUNDACAO'
      Size = 30
    end
    object QryOutrasFundacoesCD_OUTRA_FUNDACAO: TFloatField
      FieldName = 'CD_OUTRA_FUNDACAO'
      Visible = False
    end
  end
end
