inherited frmRegistraOcorr: TfrmRegistraOcorr
  Left = 271
  Top = 192
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Registra Ocorrência na Medicina do Trabalho'
  ClientHeight = 534
  ClientWidth = 502
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 502
    Height = 495
    BorderWidth = 2
    object Label2: TLabel
      Left = 15
      Top = 11
      Width = 33
      Height = 13
      Caption = 'Nome'
    end
    object Label5: TLabel
      Left = 15
      Top = 113
      Width = 110
      Height = 13
      Caption = 'Tipo de Ocorrência'
    end
    object Label1: TLabel
      Left = 320
      Top = 65
      Width = 46
      Height = 13
      Caption = 'Licença'
    end
    object Label4: TLabel
      Left = 372
      Top = 84
      Width = 24
      Height = 13
      Caption = 'dias'
    end
    object Label7: TLabel
      Left = 396
      Top = 192
      Width = 57
      Height = 13
      Caption = 'Avaliação'
    end
    object Label8: TLabel
      Left = 15
      Top = 157
      Width = 79
      Height = 13
      Caption = 'Motivo Oficial'
    end
    object Label9: TLabel
      Left = 255
      Top = 156
      Width = 166
      Height = 13
      Caption = 'Tipo de Acidente de Trânsito'
    end
    object Label14: TLabel
      Left = 33
      Top = 402
      Width = 57
      Height = 26
      Caption = 'Alteração'#13#10'do Motivo'
    end
    object gbxDatas: TGroupBox
      Left = 15
      Top = 51
      Width = 278
      Height = 57
      Caption = 'Datas'
      TabOrder = 1
      object Label3: TLabel
        Left = 7
        Top = 16
        Width = 71
        Height = 13
        Caption = 'Afastamento'
      end
      object Label6: TLabel
        Left = 138
        Top = 16
        Width = 46
        Height = 13
        Caption = 'Retorno'
      end
      object dtedDataIni: TCMDateTimePicker
        Left = 7
        Top = 30
        Width = 121
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
      end
      object dtedDataFim: TCMDateTimePicker
        Left = 138
        Top = 29
        Width = 121
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
      end
    end
    object dblckTipoOcorr: TwwDBLookupCombo
      Left = 15
      Top = 128
      Width = 466
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRTIPOOCMED'#9'40'#9'DESCRTIPOOCMED'#9'F')
      LookupTable = CdsTipoOcorr
      LookupField = 'CODTIPOOCMED'
      Style = csDropDownList
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      UseTFields = False
      AllowClearKey = True
    end
    object redLicenca: TRealEdit
      Left = 320
      Top = 80
      Width = 46
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '0')
      TabOrder = 2
      WordWrap = False
      IntDigits = 10
      DecDigits = 0
      NumberFormat = iNumber
      Signal = False
    end
    object gbxExaminador: TGroupBox
      Left = 15
      Top = 204
      Width = 370
      Height = 129
      Caption = 'Examinador (Médico/Entidade)'
      TabOrder = 6
      object Label10: TLabel
        Left = 9
        Top = 40
        Width = 94
        Height = 13
        Caption = 'Órgão de Classe'
      end
      object Label11: TLabel
        Left = 9
        Top = 82
        Width = 150
        Height = 13
        Caption = 'Nº Inscrição (CRM / CRO)'
      end
      object Label12: TLabel
        Left = 222
        Top = 82
        Width = 117
        Height = 13
        Caption = 'Telefone de Contato'
      end
      object Label13: TLabel
        Left = 173
        Top = 82
        Width = 17
        Height = 13
        Caption = 'UF'
      end
      object edAvaliador: TEdit
        Left = 8
        Top = 16
        Width = 317
        Height = 21
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object bbtnProcMedico: TBitBtn
        Left = 334
        Top = 14
        Width = 25
        Height = 24
        Hint = 'Procura Médico ou Entidade'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = bbtnProcMedicoClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
          777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
          77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
          77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
          077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
          FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
          F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
          7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
          777777787FFF8777777777770000777777777777888877777777}
        NumGlyphs = 2
      end
      object edtNroInscrCRMExaminador: TEdit
        Left = 8
        Top = 98
        Width = 153
        Height = 21
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
      object edtTelContato: TEdit
        Left = 221
        Top = 98
        Width = 120
        Height = 21
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
      end
      object edtUFExaminador: TEdit
        Left = 172
        Top = 98
        Width = 41
        Height = 21
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
      end
      object cbbOrgaoClasse: TComboBox
        Left = 8
        Top = 56
        Width = 353
        Height = 21
        ItemHeight = 13
        TabOrder = 2
        OnChange = cbbOrgaoClasseChange
        Items.Strings = (
          'Conselho Regional de Medicina (CRM)'
          'Conselho Regional de Odontologia (CRO)')
      end
    end
    object redAvaliacao: TRealEdit
      Left = 397
      Top = 207
      Width = 84
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '0')
      TabOrder = 7
      WordWrap = False
      IntDigits = 10
      DecDigits = 0
      NumberFormat = iNumber
      Signal = False
    end
    object grpCID: TGroupBox
      Left = 15
      Top = 337
      Width = 466
      Height = 47
      Caption = 'CID'
      TabOrder = 8
      object edCODCID: TEdit
        Left = 8
        Top = 16
        Width = 65
        Height = 21
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object edCID: TEdit
        Left = 77
        Top = 16
        Width = 353
        Height = 21
        TabStop = False
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object bbtnBuscaCID: TBitBtn
        Left = 434
        Top = 14
        Width = 25
        Height = 24
        Hint = 'Busca o CID'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = bbtnBuscaCIDClick
        Glyph.Data = {
          42020000424D4202000000000000420000002800000010000000100000000100
          1000030000000002000000000000000000000000000000000000007C0000E003
          00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C104210421F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000FF7F00001F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000FF7FFF7FFF7F00001F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C00000000FF7FFF7FFF7FFF7FFF7FFF7F00001F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1042FF7FFF7FFF7FFF7FFF7F1F00FF7F00001F7C
          1F7C1F7C1F7C00401F7C1F7C1042FF7FFF7F1F001F001F00FF7FFF7FFF7F0000
          1F7C1F7C1F7C004000401F7C1F7C1042FF7FFF7FFF7FFF7FFF7F1F00FF7F0000
          1F7C1F7C1F7C0040004000401F7C1042FF7FFF7F1F001F001F00FF7FFF7FFF7F
          00001F7C1F7C1F7C0040004000400000000000000000FF7FFF7FFF7F1F00FF7F
          FF7F00001F7C1F7C1F7C00400000FF031F7CFF031F7C000010021F00FF7FFF7F
          FF7FFF7F00001F7C1F7C0000FF031F7CFF031F7CFF031F7C0000FF7FFF7FFF7F
          104210421F7C1F7C1F7C00001F7CFF031F7CFF031F7CFF030000FF7F10421042
          1F7C1F7C1F7C1F7C1F7C0000FF031F7CFF031F7CFF031F7C000010421F7C1F7C
          1F7C1F7C1F7C1F7C1F7C00001F7CFF031F7CFF031F7CFF0300001F7C1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C00001F7CFF031F7CFF0300001F7C1F7C1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000000000001F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C}
      end
    end
    object edNomePessoa: TEdit
      Left = 16
      Top = 25
      Width = 463
      Height = 21
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object dblckMotivoOficial: TwwDBLookupCombo
      Left = 15
      Top = 172
      Width = 234
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'40'#9'DESCRICAO')
      LookupTable = CdsMotivo
      LookupField = 'IDMOTIVO'
      Style = csDropDownList
      TabOrder = 4
      AutoDropDown = True
      ShowButton = True
      UseTFields = False
      AllowClearKey = True
      OnChange = dblckMotivoOficialChange
    end
    object grpVinculoAtestado: TGroupBox
      Left = 223
      Top = 395
      Width = 258
      Height = 61
      Caption = 'Vínculo'
      TabOrder = 11
      object Label15: TLabel
        Left = 8
        Top = 13
        Width = 99
        Height = 13
        Caption = 'Atestado Anterior'
      end
      object dbcbbIDATESTADOANT: TwwDBLookupCombo
        Left = 8
        Top = 32
        Width = 241
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'list_combo'#9'50'#9'Lista de Atestados')
        LookupTable = CdsAtestadoAnt
        LookupField = 'ATESTADOANT'
        DropDownWidth = 500
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnChange = dbcbbIDATESTADOANTChange
      end
    end
    object cbbTipoAcidTransito: TComboBox
      Left = 259
      Top = 171
      Width = 222
      Height = 21
      Color = clSilver
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 13
      ParentFont = False
      TabOrder = 5
      OnChange = cbbTipoAcidTransitoChange
      Items.Strings = (
        'Atropelamento'
        'Colisão'
        'Outros')
    end
    object dbchkFLGALTERAMOTIVO: TCheckBox
      Left = 14
      Top = 407
      Width = 17
      Height = 17
      Caption = 'dbchkFLGALTERAMOTIVO'
      TabOrder = 9
      OnClick = dbchkFLGALTERAMOTIVOClick
    end
    object dbrgrpFLGEFEITORETRO: TRadioGroup
      Left = 103
      Top = 395
      Width = 114
      Height = 61
      Caption = 'Efeito Retroativo'
      Enabled = False
      ItemIndex = 1
      Items.Strings = (
        'Sim'
        'Não')
      TabOrder = 10
      OnClick = dbrgrpFLGEFEITORETROClick
    end
  end
  inherited Dock971: TDock97
    Top = 495
    Width = 502
    inherited tb97Fundo: TToolbar97
      Left = 252
      inherited sep1: TToolbarSep97
        Left = 163
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 80
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 82
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 165
      end
      object bbtnConfirmar: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = '&Ok'
        Default = True
        ModalResult = 1
        TabOrder = 2
        OnClick = bbtnConfirmarClick
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
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 275
    TargetsData = (
      1
      2
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        'TRealEdit'
        'Text'
        0))
  end
  object MontaSelectCID: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona CID'
    Colunas.Strings = (
      'CODCID'
      'SUBSTR(DESCRCID,1,100) AS DESCRICAO'
      'DESCRCID')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição Abreviada'
      'Descrição Completa')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CID')
    CamposChave.Strings = (
      'CODCID'
      'DESCRCID')
    Larguras.Strings = (
      '10'
      '100'
      '1000')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 355
    Top = 9
  end
  object CdsTipoOcorr: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 440
    Top = 8
  end
  object CdsMotivo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 496
    Top = 16
  end
  object CdsAtestadoAnt: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 496
    Top = 72
  end
  object CdsResponsavel: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 496
    Top = 128
  end
  object dsAtestadoAnt: TDataSource
    DataSet = CdsAtestadoAnt
    Left = 440
    Top = 72
  end
end
