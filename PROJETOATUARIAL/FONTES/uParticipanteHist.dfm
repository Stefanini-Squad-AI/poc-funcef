inherited frmParticipanteHist: TfrmParticipanteHist
  Left = 111
  Top = 19
  HelpContext = 40247
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  Caption = 'Base de Histórico  - Participante'
  ClientHeight = 500
  ClientWidth = 607
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 607
    Height = 414
    object Label8: TLabel
      Left = 15
      Top = 6
      Width = 55
      Height = 13
      Caption = 'Matrícula'
    end
    object Label6: TLabel
      Left = 15
      Top = 46
      Width = 24
      Height = 13
      Caption = 'CPF'
    end
    object Label5: TLabel
      Left = 202
      Top = 46
      Width = 51
      Height = 13
      Caption = 'Regional'
    end
    object Label7: TLabel
      Left = 203
      Top = 6
      Width = 33
      Height = 13
      Caption = 'Nome'
    end
    object Label1: TLabel
      Left = 36
      Top = 161
      Width = 68
      Height = 13
      Caption = 'Estado Civil'
    end
    object Label4: TLabel
      Left = 246
      Top = 161
      Width = 124
      Height = 13
      Caption = 'Categoria Profissional'
    end
    object Label10: TLabel
      Left = 36
      Top = 204
      Width = 129
      Height = 13
      Caption = 'Situação na Fundação'
    end
    object Label9: TLabel
      Left = 36
      Top = 245
      Width = 152
      Height = 13
      Caption = 'Situação na Patrocinadora'
    end
    object Label2: TLabel
      Left = 36
      Top = 283
      Width = 99
      Height = 13
      Caption = 'Grupo de Cálculo'
    end
    object Label3: TLabel
      Left = 22
      Top = 323
      Width = 66
      Height = 13
      Caption = 'Plano Atual'
    end
    object Label11: TLabel
      Left = 311
      Top = 323
      Width = 81
      Height = 13
      Caption = 'Plano Anterior'
    end
    object DBEdit7: TDBEdit
      Left = 246
      Top = 175
      Width = 280
      Height = 21
      AutoSelect = False
      Color = clSilver
      DataField = 'DS_TIPO_CAT_PROF_ESP'
      DataSource = dscrCatProf
      ReadOnly = True
      TabOrder = 8
    end
    object DBEdit8: TDBEdit
      Left = 36
      Top = 297
      Width = 307
      Height = 21
      AutoSelect = False
      Color = clSilver
      DataField = 'NO_GRUPO_PARTIC'
      DataSource = dsGrupoCalc
      ReadOnly = True
      TabOrder = 9
    end
    object DBEdit6: TDBEdit
      Left = 36
      Top = 259
      Width = 307
      Height = 21
      AutoSelect = False
      Color = clSilver
      DataField = 'DS_SITUACAO_PATROC'
      DataSource = dsSitPatroc
      ReadOnly = True
      TabOrder = 10
    end
    object DBEdit10: TDBEdit
      Left = 36
      Top = 218
      Width = 307
      Height = 21
      AutoSelect = False
      Color = clSilver
      DataField = 'DS_SITUACAO_FUNDACAO'
      DataSource = dsSitFundacao
      ReadOnly = True
      TabOrder = 11
    end
    object DBEdit9: TDBEdit
      Left = 36
      Top = 175
      Width = 193
      Height = 21
      AutoSelect = False
      Color = clSilver
      DataField = 'DS_ESTADO_CIVIL'
      DataSource = dsEstCivil
      ReadOnly = True
      TabOrder = 7
    end
    object DBEdit4: TDBEdit
      Left = 15
      Top = 20
      Width = 176
      Height = 21
      AutoSelect = False
      Color = clSilver
      DataField = 'NR_MATRICULA'
      DataSource = ds
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit5: TDBEdit
      Left = 15
      Top = 60
      Width = 176
      Height = 21
      AutoSelect = False
      Color = clSilver
      DataField = 'NR_CPF'
      DataSource = ds
      ReadOnly = True
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 200
      Top = 60
      Width = 361
      Height = 21
      AutoSelect = False
      Color = clSilver
      DataField = 'DS_REGIONAL'
      DataSource = ds
      ReadOnly = True
      TabOrder = 2
    end
    object DBEdit2: TDBEdit
      Left = 200
      Top = 20
      Width = 361
      Height = 21
      AutoSelect = False
      Color = clSilver
      DataField = 'NO_PESSOA'
      DataSource = ds
      ReadOnly = True
      TabOrder = 3
    end
    object DBRdGrpSexo: TDBRadioGroup
      Left = 15
      Top = 90
      Width = 176
      Height = 66
      Caption = 'Sexo'
      Color = clBtnFace
      DataField = 'IR_SEXO'
      DataSource = ds
      Items.Strings = (
        'Feminino'
        'Masculino')
      ParentColor = False
      ReadOnly = True
      TabOrder = 4
      Values.Strings = (
        'F'
        'M')
    end
    object DBRadioGroup1: TDBRadioGroup
      Left = 200
      Top = 90
      Width = 176
      Height = 66
      Caption = 'Tipo Participante'
      Color = clBtnFace
      DataField = 'TP_PARTICIPANTE'
      DataSource = ds
      Items.Strings = (
        'Ativo'
        'Beneficiário')
      ParentColor = False
      ReadOnly = True
      TabOrder = 5
      Values.Strings = (
        'A'
        'B')
    end
    object DBRdGrpTrabalho: TDBRadioGroup
      Left = 385
      Top = 90
      Width = 176
      Height = 66
      Caption = 'Condições de Trabalho'
      Color = clBtnFace
      DataField = 'IR_CONDICAO_TRABALHO'
      DataSource = ds
      Items.Strings = (
        'Normal'
        'Insalubre'
        'Periculosa')
      ParentColor = False
      ReadOnly = True
      TabOrder = 6
      Values.Strings = (
        'N'
        'I'
        'P')
    end
    object Dock973: TDock97
      Left = 5
      Top = 365
      Width = 597
      Height = 44
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
        Left = 80
        Top = 0
        Caption = 'TB97oKCancelar'
        DockPos = 80
        TabOrder = 0
        object ToolbarSep975: TToolbarSep97
          Left = 124
          Top = 0
          Blank = True
          SizeHorz = 3
        end
        object ToolbarSep974: TToolbarSep97
          Left = 404
          Top = 0
          Blank = True
          SizeHorz = 3
        end
        object ToolbarSep976: TToolbarSep97
          Left = 320
          Top = 0
          Blank = True
          SizeHorz = 3
        end
        object ToolbarSep977: TToolbarSep97
          Left = 228
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
        object btbtnDependente: TBitBtn
          Left = 3
          Top = 0
          Width = 121
          Height = 38
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
        object btbtnBeneficios: TBitBtn
          Left = 127
          Top = 0
          Width = 101
          Height = 38
          Caption = '&Benefício >>'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = btbtnBeneficiosClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555000000
            000055555F77777777775555000FFFFFFFF0555F777F5FFFF55755000F0F0000
            FFF05F777F7F77775557000F0F0FFFFFFFF0777F7F7F5FFFFFF70F0F0F0F0000
            00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFFFFF70F0F0F0F0000
            00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFF55570F0F0F0F000F
            FFF07F7F7F7F77755FF70F0F0F0FFFFF00007F7F7F7F5FF577770F0F0F0F00FF
            0F057F7F7F7F77557F750F0F0F0FFFFF00557F7F7F7FFFFF77550F0F0F000000
            05557F7F7F77777775550F0F0000000555557F7F7777777555550F0000000555
            55557F7777777555555500000005555555557777777555555555}
          NumGlyphs = 2
        end
        object btbtnValores: TBitBtn
          Left = 231
          Top = 0
          Width = 89
          Height = 38
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
          Left = 323
          Top = 0
          Width = 81
          Height = 38
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
      end
    end
    object DBCheckBox1: TDBCheckBox
      Left = 376
      Top = 220
      Width = 128
      Height = 17
      Hint = 'Participante já pertenceu à outra Fundação'
      Caption = 'Outras Fundações'
      Color = clSilver
      DataField = 'IR_FUNDACAO_ORIGEM'
      DataSource = ds
      Enabled = False
      ParentColor = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 13
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object DBCheckBox2: TDBCheckBox
      Left = 376
      Top = 239
      Width = 219
      Height = 17
      Hint = 'Participante alocado na Fundação mas pertence à Patrocinadora'
      Caption = 'Participante alocado na Fundação'
      Color = clSilver
      DataField = 'IR_PERTENCE_PATROCINADORA'
      DataSource = ds
      Enabled = False
      ParentColor = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 14
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object DBCheckBox3: TDBCheckBox
      Left = 376
      Top = 258
      Width = 71
      Height = 17
      Hint = 'Participante migrado de Plano'
      Caption = 'Migrado'
      Color = clSilver
      DataField = 'IR_MIGRACAO_PLANO'
      DataSource = ds
      Enabled = False
      ParentColor = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 15
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object DBRadioGroup2: TDBRadioGroup
      Left = 372
      Top = 277
      Width = 190
      Height = 43
      Color = clSilver
      Columns = 2
      DataField = 'IR_DIRETOR'
      DataSource = ds
      Enabled = False
      Items.Strings = (
        'Diretor'
        'Ex-Diretor')
      ParentColor = False
      ReadOnly = True
      TabOrder = 16
      Values.Strings = (
        'D'
        'E')
    end
    object DBEdit1: TDBEdit
      Left = 22
      Top = 337
      Width = 279
      Height = 21
      AutoSelect = False
      Color = clSilver
      DataField = 'NO_PLANO'
      DataSource = dsPlano
      ReadOnly = True
      TabOrder = 17
    end
    object DBEdit11: TDBEdit
      Left = 311
      Top = 337
      Width = 279
      Height = 21
      AutoSelect = False
      Color = clSilver
      DataField = 'NO_PLANO'
      DataSource = dsPlanoAnterior
      ReadOnly = True
      TabOrder = 18
    end
  end
  inherited Dock972: TDock97
    Width = 607
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Width = 1
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Left = 1
        Width = 1
        Visible = False
      end
      inherited sbtnProcurar: TToolbarButton97
        Left = 3
      end
      inherited sbtnApagar: TToolbarButton97
        Left = 2
        Width = 1
        Visible = False
      end
    end
    object Toolbar972: TToolbar97
      Left = 67
      Top = 0
      Caption = 'Toolbar971'
      CloseButton = False
      DefaultDock = Dock971
      DockPos = 67
      TabOrder = 1
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
    Top = 461
    Width = 607
    inherited tb97Fundo: TToolbar97
      Left = 411
      DockPos = 411
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 243
      DockPos = 243
    end
    inherited dbnav: TDBNavigator
      Left = 39
      Hints.Strings = ()
    end
  end
  inherited ds: TwwDataSource
    DataSet = qryPrincipal
    Left = 269
    Top = 43
  end
  inherited srchdlgProcura: TwwSearchDialog
    Left = 348
    Top = 2
  end
  inherited seldlgProcuraQry: TcmSelectDlg
    Left = 378
    Top = 3
  end
  object qryPrincipal: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select * from FI_PARTICIPANTE'
      'where CD_VERSAO = :CD_VERSAO'
      '  and CD_PARTIC = 0'
      'order by NR_MATRICULA, NO_PESSOA')
    ValidateWithMask = True
    Left = 238
    Top = 43
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
      Origin = 'FI_PARTICIPANTE.CD_GRUPO_PARTIC'
      Size = 15
    end
    object qryPrincipalNO_PESSOA: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 60
      FieldName = 'NO_PESSOA'
      Origin = 'FI_PARTICIPANTE.FI__CD_PESSOA_PATROC'
      Size = 60
    end
    object qryPrincipalDS_REGIONAL: TStringField
      DisplayLabel = 'Regional'
      DisplayWidth = 60
      FieldName = 'DS_REGIONAL'
      Origin = 'FI_PARTICIPANTE.IR_SEXO'
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
      Origin = 'FI_PARTICIPANTE.FI__CD_PESSOA_ENTID'
      Visible = False
      Size = 1
    end
    object qryPrincipalIR_SEXO: TStringField
      DisplayWidth = 1
      FieldName = 'IR_SEXO'
      Origin = 'FI_PARTICIPANTE.FI__CD_PLANO'
      Visible = False
      Size = 1
    end
    object qryPrincipalTP_PARTICIPANTE: TStringField
      DisplayWidth = 1
      FieldName = 'TP_PARTICIPANTE'
      Origin = 'FI_PARTICIPANTE.NR_MATRICULA'
      Visible = False
      Size = 1
    end
    object qryPrincipalIR_CONDICAO_TRABALHO: TStringField
      DisplayWidth = 1
      FieldName = 'IR_CONDICAO_TRABALHO'
      Origin = 'FI_PARTICIPANTE.NO_PESSOA'
      Visible = False
      Size = 1
    end
    object qryPrincipalCD_GRUPO_CALCULO: TFloatField
      DisplayWidth = 10
      FieldName = 'CD_GRUPO_CALCULO'
      Origin = 'FI_PARTICIPANTE.CD_ESTADO_CIVIL'
      Visible = False
    end
    object qryPrincipalCD_SITUACAO_PATROC: TFloatField
      DisplayWidth = 10
      FieldName = 'CD_SITUACAO_PATROC'
      Origin = 'FI_PARTICIPANTE.TP_PARTICIPANTE'
      Visible = False
    end
    object qryPrincipalCD_SITUACAO_FUNDACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'CD_SITUACAO_FUNDACAO'
      Origin = 'FI_PARTICIPANTE.IR_CONDICAO_TRABALHO'
      Visible = False
    end
    object qryPrincipalNR_CPF: TStringField
      DisplayWidth = 11
      FieldName = 'NR_CPF'
      Origin = 'FI_PARTICIPANTE.CD_GRUPO_CALCULO'
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
  end
  object dsGrupoCalc: TwwDataSource
    AutoEdit = False
    DataSet = qrGrupoCalc
    Left = 141
    Top = 332
  end
  object qrGrupoCalc: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      'Select a.*, b.NO_GRUPO_PARTIC'
      'from FI_GRUPO_CALCULO a, FI_GRUPO_PARTICIPANTE b'
      'where a.CD_GRUPO_PARTIC = b.CD_GRUPO_PARTIC'
      '    and a.CD_GRUPO_PARTIC = :CD_GRUPO_CALCULO'
      '    and a.CD_PESSOA_PATROC = :CD_PESSOA_PATROC'
      '    and a.CD_PESSOA_ENTID = :CD_PESSOA_ENTID'
      '    and a.CD_PLANO = :CD_PLANO'
      '')
    ValidateWithMask = True
    Left = 113
    Top = 332
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_GRUPO_CALCULO'
        ParamType = ptUnknown
      end
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
    object qrGrupoCalcCD_GRUPO_PARTIC: TFloatField
      FieldName = 'CD_GRUPO_PARTIC'
      Origin = 'FI_GRUPO_CALCULO.CD_GRUPO_PARTIC'
    end
    object qrGrupoCalcCD_PESSOA_PATROC: TFloatField
      FieldName = 'CD_PESSOA_PATROC'
      Origin = 'FI_GRUPO_CALCULO.CD_PESSOA_PATROC'
    end
    object qrGrupoCalcCD_PESSOA_ENTID: TFloatField
      FieldName = 'CD_PESSOA_ENTID'
      Origin = 'FI_GRUPO_CALCULO.CD_PESSOA_ENTID'
    end
    object qrGrupoCalcCD_PLANO: TFloatField
      FieldName = 'CD_PLANO'
      Origin = 'FI_GRUPO_CALCULO.CD_PLANO'
    end
    object qrGrupoCalcNR_ORDEM: TFloatField
      FieldName = 'NR_ORDEM'
      Origin = 'FI_GRUPO_CALCULO.NR_ORDEM'
    end
    object qrGrupoCalcNO_GRUPO_PARTIC: TStringField
      FieldName = 'NO_GRUPO_PARTIC'
      Origin = 'FI_GRUPO_PARTICIPANTE.NO_GRUPO_PARTIC'
      Size = 60
    end
  end
  object qrSitPatroc: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      'Select * from FI_SITUACAO_PATROC'
      'where CD_SITUACAO_PATROC = :CD_SITUACAO_PATROC')
    ValidateWithMask = True
    Left = 168
    Top = 297
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CD_SITUACAO_PATROC'
        ParamType = ptUnknown
      end>
    object qrSitPatrocCD_SITUACAO_PATROC: TFloatField
      FieldName = 'CD_SITUACAO_PATROC'
      Origin = 'FI_SITUACAO_PATROC.CD_SITUACAO_PATROC'
    end
    object qrSitPatrocDS_SITUACAO_PATROC: TStringField
      FieldName = 'DS_SITUACAO_PATROC'
      Origin = 'FI_SITUACAO_PATROC.DS_SITUACAO_PATROC'
      Size = 60
    end
  end
  object dsSitPatroc: TwwDataSource
    AutoEdit = False
    DataSet = qrSitPatroc
    Left = 196
    Top = 297
  end
  object dsSitFundacao: TwwDataSource
    AutoEdit = False
    DataSet = qrSitFundacao
    Left = 176
    Top = 257
  end
  object qrSitFundacao: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      'Select * from FI_SITUACAO_FUNDACAO'
      'where CD_SITUACAO_FUNDACAO = :CD_SITUACAO_FUNDACAO')
    ValidateWithMask = True
    Left = 148
    Top = 257
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CD_SITUACAO_FUNDACAO'
        ParamType = ptUnknown
      end>
    object qrSitFundacaoCD_SITUACAO_FUNDACAO: TFloatField
      FieldName = 'CD_SITUACAO_FUNDACAO'
      Origin = 'FI_SITUACAO_FUNDACAO.CD_SITUACAO_FUNDACAO'
    end
    object qrSitFundacaoDS_SITUACAO_FUNDACAO: TStringField
      FieldName = 'DS_SITUACAO_FUNDACAO'
      Origin = '"CM.FI_SITUACAO_FUNDACAO".DS_SITUACAO_FUNDACAO'
      Size = 50
    end
  end
  object qrEstCivil: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      'Select * from FI_ESTADO_CIVIL'
      'where CD_ESTADO_CIVIL = :CD_ESTADO_CIVIL')
    ValidateWithMask = True
    Left = 112
    Top = 214
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_ESTADO_CIVIL'
        ParamType = ptUnknown
      end>
    object qrEstCivilCD_ESTADO_CIVIL: TStringField
      FieldName = 'CD_ESTADO_CIVIL'
      Origin = 'FI_ESTADO_CIVIL.CD_ESTADO_CIVIL'
      Size = 1
    end
    object qrEstCivilDS_ESTADO_CIVIL: TStringField
      FieldName = 'DS_ESTADO_CIVIL'
      Origin = 'FI_ESTADO_CIVIL.DS_ESTADO_CIVIL'
    end
  end
  object dsEstCivil: TwwDataSource
    AutoEdit = False
    DataSet = qrEstCivil
    Left = 143
    Top = 214
  end
  object qrCatProf: TwwQuery
    DatabaseName = 'BaseDados'
    SessionName = 'Default'
    DataSource = ds
    SQL.Strings = (
      'Select * from FI_TIPO_CATEG_PROF_ESPECIAL'
      'ORDER BY DS_TIPO_CAT_PROF_ESP')
    ValidateWithMask = True
    Left = 248
    Top = 220
    object qrCatProfCD_TIPO_CAT_PROF_ESP: TFloatField
      FieldName = 'CD_TIPO_CAT_PROF_ESP'
      Origin = '"CM.FI_TIPO_CATEG_PROF_ESPECIAL".CD_TIPO_CAT_PROF_ESP'
    end
    object qrCatProfDS_TIPO_CAT_PROF_ESP: TStringField
      FieldName = 'DS_TIPO_CAT_PROF_ESP'
      Origin = '"CM.FI_TIPO_CATEG_PROF_ESPECIAL".DS_TIPO_CAT_PROF_ESP'
      Size = 60
    end
  end
  object dscrCatProf: TwwDataSource
    AutoEdit = False
    DataSet = qrCatProf
    Left = 276
    Top = 219
  end
  object QryPlano: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      'SELECT CD_PLANO, NO_PLANO'
      'FROM FI_PLANO_PATRONAL'
      'WHERE CD_PLANO = :CD_PLANO'
      'ORDER BY NO_PLANO')
    ValidateWithMask = True
    Left = 128
    Top = 377
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_PLANO'
        ParamType = ptUnknown
      end>
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
    DataSource = ds
    SQL.Strings = (
      'SELECT DISTINCT CD_PLANO, NO_PLANO'
      'FROM FI_PLANO_PATRONAL'
      'WHERE CD_PLANO = :CD_PLANO_ANTERIOR'
      'ORDER BY NO_PLANO')
    ValidateWithMask = True
    Left = 448
    Top = 377
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_PLANO_ANTERIOR'
        ParamType = ptUnknown
      end>
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
  object dsPlano: TwwDataSource
    AutoEdit = False
    DataSet = QryPlano
    Left = 156
    Top = 377
  end
  object dsPlanoAnterior: TwwDataSource
    AutoEdit = False
    DataSet = QryPlanoAnterior
    Left = 476
    Top = 377
  end
end
